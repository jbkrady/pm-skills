#!/usr/bin/env bash
# =============================================================================
# Hook UserPromptSubmit : si le message contient « fin de session », injecter
# l'ordre de lancer le skill fin-de-session. Sans dépendance. Ne bloque jamais.
# =============================================================================
input=$(cat)

if printf '%s' "$input" | grep -qiE "fin de session"; then
  cat <<'MSG'
🔚 FIN DE SESSION détectée. Exécute le skill fin-de-session (.claude/skills/fin-de-session/SKILL.md) :
1. État des lieux : git status, branches, PR ouvertes.
2. Proposer le merge des PR ouvertes, jamais sans le « ok » explicite de l'humain.
3. Supprimer les branches mergées (distantes et locales), puis git fetch --prune.
4. Aligner main local sur origin, arbre propre ; backlog et documentation à jour.
5. Confirmer : « ✅ Tout est aligné (local = GitHub). Tu peux quitter. »
MSG
fi
exit 0
