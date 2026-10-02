#!/usr/bin/env bash
# =============================================================================
# Garde-fou CHRIS (QA) : hook PreToolUse déclaré dans le frontmatter de
# .claude/agents/chris.md, donc actif SEULEMENT quand CHRIS travaille.
#
# Rôle : empêcher CHRIS de modifier le code applicatif. Il garde le droit
# d'écrire ses tests, ses rapports et sa mémoire.
#
# Dans un hook PreToolUse, SEUL `exit 2` bloque (le message sur stderr est
# montré à l'agent). Tout autre code non nul laisse passer : un garde-fou qui
# plante doit donc sortir en 2, jamais en 1 (fail-closed).
#
# À ADAPTER : les dossiers de code applicatif, dans le bloc 2.
# =============================================================================
set -uo pipefail
trap 'echo "⛔ chris-guard : erreur interne, écriture bloquée par prudence." >&2; exit 2' ERR

INPUT=$(cat)
FILE=$(printf '%s' "$INPUT" | jq -r '.tool_input.file_path // empty')

# Pas de chemin de fichier : outil non concerné.
[ -z "$FILE" ] && exit 0

# 1) Toujours autorisé : les fichiers de test, où qu'ils soient.
case "$FILE" in
  *.test.*|*.spec.*|*/__tests__/*|*/tests/*|*/e2e/*) exit 0 ;;
esac

# 2) Bloqué : le code applicatif.
case "$FILE" in
  */src/*|*/app/*|*/apps/*|*/packages/*|*/lib/*)
    echo "⛔ CHRIS (QA) ne modifie pas le code applicatif : $FILE" >&2
    echo "   Écris un test, un rapport ou ta mémoire. Pour corriger : verdict NO-GO + localisation, à ALEX." >&2
    exit 2 ;;
esac

# 3) Le reste (docs, rapports, .claude/agent-memory/chris) : autorisé.
exit 0
