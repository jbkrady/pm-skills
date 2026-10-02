#!/usr/bin/env bash
# =============================================================================
# Hook UserPromptSubmit : si le message touche au front, au design ou à un
# parcours, rappeler la boucle /dev-front et le skill frontend-design.
# Branché dans .claude/settings.json. Sans dépendance. Ne bloque jamais.
# =============================================================================
input=$(cat)

PATTERN="design|front[- ]?end|\\bfront\\b|\\bUI\\b|\\bUX\\b|interface|maquette|wireframe|prototype|landing|responsive|typograph|palette|couleur|\\bCSS\\b|composant|écran|mise en page|\\blayout\\b|animation|vidéo|\\bvideo\\b|visuel|bouton|\\bbutton\\b|parcours|onboarding|routing|navigation|\\bflow\\b|\\bCTA\\b|lien mort|\\b404\\b"

if printf '%s' "$input" | grep -qiE "$PATTERN"; then
  cat <<'MSG'
🎨 Sujet FRONT / DESIGN / PARCOURS détecté. Règles du projet :

0) Boucle `/dev-front` par défaut : MAX cadre sur les VRAIES maquettes, l'humain et SAM figent l'US, ALEX code avec `frontend-design` et des captures mobile comparées à la maquette, CHRIS recette (fidélité = item BLOQUANT), l'humain seul merge. Ne jamais coder un écran hors de cette boucle.

1) Avant toute action, charger le skill `frontend-design` (outil Skill) et suivre son process : plan des tokens, auto-critique contre les défauts génériques, construction, capture de vérification. ALEX et MAX l'ont préchargé : le rappeler dans la consigne.

2) Parcours, routing, lien mort : réflexe MAX → SAM. MAX cadre (existant, US du backlog, parcours cible) et livre une préco ; SAM rédige les US.

3) Après le travail : CLAUDE.md, définitions d'agents, mémoire et backlog synchronisés. Si une faille de process apparaît, proposer de la corriger (hook, skill, doc) : l'outillage des agents s'améliore lui-même.
MSG
fi
exit 0
