#!/usr/bin/env bash
# =============================================================================
# Hook SessionStart : à chaque démarrage de session, rappeler les sources de
# vérité, INJECTER les dernières décisions actées, et SONDER la protection de
# `main`. Branché dans .claude/settings.json.
#
# Ne bloque JAMAIS la session : sort toujours en 0.
#
# À ADAPTER : CHECKS_ATTENDUS (le nom exact du check obligatoire sur `main`,
# ou vide pour désactiver la sonde).
# =============================================================================
set -uo pipefail

ROOT="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}"
CHECKS_ATTENDUS='CI complète'

cat <<'MSG'
👋 Avant d'agir, imprègne-toi des sources de vérité :
   1. CLAUDE.md : le produit, ses contraintes, la Definition of Done, les règles de rédaction.
   2. DECISIONS.md : le journal des décisions (les dernières sont ci-dessous).
   3. Le dossier de cadrage et le backlog cités dans CLAUDE.md (le fond AVANT la liste des US).
   → L'orchestrateur délègue : cadrage produit → SAM ; parcours et écrans → MAX ; code → ALEX ;
     recette et verdict → CHRIS. Il relaie, il ne rend ni verdict produit ni verdict QA.
MSG

# -----------------------------------------------------------------------------
# INJECTION D'ÉTAT : les dernières décisions actées.
#
# Pourquoi : un orchestrateur a déjà proposé une option CONTREDITE par une
# décision prise la veille. Ce n'est pas un défaut de rigueur, c'est une
# amnésie d'état. Aucune exhortation ne soigne l'amnésie ; l'injection d'état,
# si. Un hook n'a de valeur que s'il ÉCHOUE ou s'il INJECTE UN ÉTAT : celui-ci
# injecte des faits, il ne fait pas la morale.
# -----------------------------------------------------------------------------
if [ -f "$ROOT/DECISIONS.md" ]; then
  echo ""
  echo "📌 Dernières décisions ACTÉES (DECISIONS.md, on ajoute, on ne réécrit pas) :"
  grep -E '^\| 20[0-9]{2}-' "$ROOT/DECISIONS.md" | tail -10 | cut -c1-150
  echo "   → Avant toute proposition sur une surface, CITER la dernière décision qui la concerne."
fi

# -----------------------------------------------------------------------------
# SONDE : la protection de `main` tient-elle toujours ?
#
# Le vrai filet contre un merge sur CI rouge est côté SERVEUR (règle de
# protection GitHub : un check obligatoire, push direct interdit), parce qu'il
# couvre TOUS les chemins (terminal, interface web, API, agent). Mais un filet
# dont on dépend et qu'on ne regarde plus tombe en silence : abonnement expiré,
# règle supprimée, check renommé. On le vérifie une fois par session.
#
# On distingue TOMBÉE (GitHub dit que `main` n'est pas protégé) de
# INVÉRIFIABLE (hors ligne, `gh` absent) : une sonde qui crie au loup dans le
# train est une sonde qu'on ignore au bout de trois jours.
#
# Pour la tester, mentez-lui : un faux `gh` dans le PATH qui répond
# « Branch not protected » doit la faire HURLER. Un instrument qui ne peut pas
# échouer ne prouve rien.
# -----------------------------------------------------------------------------
[ -z "$CHECKS_ATTENDUS" ] && exit 0
echo ""
if ! command -v gh >/dev/null 2>&1; then
  echo "🔎 Protection de \`main\` : INVÉRIFIABLE (\`gh\` introuvable). Aucune alerte, aucune garantie non plus."
  exit 0
fi

REPO="$(cd "$ROOT" && gh repo view --json nameWithOwner --jq .nameWithOwner 2>/dev/null)"
if [ -z "$REPO" ]; then
  echo "🔎 Protection de \`main\` : INVÉRIFIABLE (aucun dépôt GitHub relié, ou \`gh\` non authentifié)."
  exit 0
fi
TMP="$(mktemp)"
gh api "repos/$REPO/branches/main/protection" \
  --jq '.required_status_checks.contexts // [] | .[]' >"$TMP" 2>"$TMP.err" &
SONDE=$!
# Délai maison de 3 s : macOS n'a pas de commande `timeout`.
ATTENTE=0
while kill -0 "$SONDE" 2>/dev/null && [ "$ATTENTE" -lt 30 ]; do sleep 0.1; ATTENTE=$((ATTENTE + 1)); done

if kill -0 "$SONDE" 2>/dev/null; then
  kill "$SONDE" 2>/dev/null; wait "$SONDE" 2>/dev/null
  echo "🔎 Protection de \`main\` : INVÉRIFIABLE (plus de 3 s, réseau lent ou coupé)."
else
  wait "$SONDE"; CODE=$?
  ERREUR="$(tr '\n' ' ' <"$TMP.err" | cut -c1-160)"
  if [ "$CODE" -ne 0 ]; then
    case "$ERREUR" in
      *"Branch not protected"*|*"HTTP 404"*|*"HTTP 403"*|*"Upgrade to GitHub Pro"*)
        echo "⚠️  La protection de \`main\` est TOMBÉE : un merge sur CI rouge redevient possible."
        echo "    GitHub répond : $ERREUR"
        echo "    → Rétablir : Settings › Branches › règle sur \`main\`. Le nom du check se CHOISIT dans la liste, il ne se tape pas."
        ;;
      *) echo "🔎 Protection de \`main\` : INVÉRIFIABLE (hors ligne ou \`gh\` non authentifié)." ;;
    esac
  elif [ "$(LC_ALL=C sort <"$TMP")" = "$CHECKS_ATTENDUS" ]; then
    echo "🔒 Protection de \`main\` : OK."
  else
    echo "⚠️  La protection de \`main\` a DÉRIVÉ. Attendu : $CHECKS_ATTENDUS. Trouvé : $(tr '\n' '|' <"$TMP")"
    echo "    → Un check retiré de la liste, c'est un test qui ne bloque plus rien."
  fi
fi
rm -f "$TMP" "$TMP.err"
exit 0
