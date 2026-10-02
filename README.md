# PM Skills

Des skills Claude pour Product Managers, nés de vrais projets : la discovery, les specs et la décision. Pour les PM qui veulent un assistant qui suit une méthode, pas un assistant qui improvise.

Chaque skill applique la même règle : **aucun fait inventé**. Ce qui manque devient une question ou un point ouvert.

## Installer (Claude Code)

```
/plugin marketplace add jbkrady/pm-skills
/plugin install pm-skills@jbkrady
```

Puis `/reload-plugins`. Les skills se déclenchent seuls quand la demande s'y prête, ou s'appellent par leur nom : `/pm-skills:spec-creator`.

## Les skills

| Étape | Skill | Ce qu'il produit |
|---|---|---|
| Discovery | [interview-guide-interactif](skills/interview-guide-interactif/) | Une grille d'entretien interactive : cases à cocher, notes, historique, export Markdown |
| Discovery | [analyse-entretien-user-journey](skills/analyse-entretien-user-journey/) | La user journey d'un entretien, chaque post-it relié à sa source |
| Discovery | [feature-benchmark](skills/feature-benchmark/) | Comment d'autres produits, d'autres secteurs compris, résolvent le même problème |
| Cadrage | [spec-creator](skills/spec-creator/) | Une spec en 11 sections, périmètre verrouillé, découpée si besoin |
| Cadrage | [user-story](skills/user-story/) | Des user stories au format Scrum enrichi, à partir du contexte produit et du backlog réel |
| Décision | [conseil-5-voix](skills/conseil-5-voix/) | Un verdict sur une décision, après 5 points de vue qui ne se mélangent jamais |
| Apprendre | [cours-augmente](skills/cours-augmente/) | Un cours interactif à partir d'un support et des notes de séance |

Chaque dossier contient un README avec un exemple, sur un produit fictif.

## Modèle : une équipe d'agents produit

[modeles/equipe-produit](modeles/equipe-produit/) : quatre agents Claude Code (PM, UX, dev, QA) et une chaîne de validation. Rien ne part en code sans cadrage validé, la QA ne peut pas modifier le code, et chaque erreur devient une règle relue à chaque session.

## Pour aller plus loin

- Le guide [Créer ses agents Claude](https://claude.ai/artifact/UajBJqGYpvHyuVtZgM8KQ5), pour non-développeurs, et son [projet exemple](https://github.com/jbkrady/agent-guide-test).
- [Prisme](https://github.com/jbkrady/prisme) : un agent et son skill en production, chaque matin.

## Auteur

Jean-Baptiste Krady, Product Manager · AI & Data Builder · [krady.fr](https://krady.fr)

Licence MIT.
