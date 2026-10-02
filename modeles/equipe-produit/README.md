# Modèle : une équipe d'agents produit

Quatre agents Claude Code spécialisés et une chaîne de validation, pour construire un produit sans laisser l'IA décider seule. À copier dans un projet, pas à installer tel quel : chaque produit a ses propres règles.

## Pourquoi des spécialistes plutôt qu'un agent généraliste

Un agent qui cadre, code et teste son propre travail valide ce qu'il vient d'écrire. Séparer les rôles crée des points de contrôle : celui qui écrit le code n'est pas celui qui le recette, et rien n'est codé avant que le besoin soit cadré.

## L'équipe

| Agent | Rôle | Ce qu'il ne fait jamais |
|---|---|---|
| `pm` | Cadre le besoin : problème, user stories, critères d'acceptation, hors périmètre | Écrire du code |
| `ux` | Propose le parcours et les états de l'écran (vide, chargement, erreur, succès) | Trancher seul un arbitrage produit |
| `dev` | Code ce qui a été cadré, rien de plus | Commencer sans cadrage validé |
| `qa` | Recette contre les critères d'acceptation, rend un go ou un no-go argumenté | Modifier le code : il n'en a pas les outils |

## La chaîne de validation

```
besoin → pm (cadrage) → humain valide → ux (parcours) → dev (code) → qa (recette) → humain décide
```

- **Rien ne part en code sans le cadrage du `pm` et l'accord de l'humain.**
- La `qa` ne corrige pas : elle constate, l'humain arbitre, le `dev` corrige.
- L'humain garde les deux décisions qui comptent : ce qu'on construit, et ce qu'on livre.

## Chaque échec devient une règle

Quand un agent se trompe (un périmètre débordé, un test oublié, une régression), on ne corrige pas seulement le résultat : on ajoute une ligne au fichier `.claude/decisions.md`. Ce journal est injecté au début de chaque session (voir `.claude/settings.json`) : l'erreur ne se reproduit pas.

## Installer dans un projet

1. Copier le dossier `.claude/` de ce modèle à la racine du projet.
2. Adapter les quatre fichiers de `.claude/agents/` au produit (vocabulaire, conventions, commandes de test).
3. Écrire les premières décisions dans `.claude/decisions.md`.
4. Lancer une fonctionnalité : « Demande au pm de cadrer… », puis suivre la chaîne.
