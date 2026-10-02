# PM Skills

Ce qu'un Product Manager peut construire avec Claude quand il le traite comme une équipe, pas comme un assistant : **une équipe d'agents produit** qui apprend de ses erreurs, et **des skills** qui appliquent une méthode au lieu d'improviser.

Une règle commune : **aucun fait inventé.** Ce qui manque devient une question ou un point ouvert.

---

## 1. Une équipe d'agents produit

**[equipe-agents/](equipe-agents/)** : quatre agents Claude Code et les boucles qui les font travailler ensemble. Issu d'un vrai projet produit, rendu générique.

| | |
|---|---|
| **SAM** · Product Manager | user stories, roadmap, Definition of Done |
| **MAX** · UX & Growth | cadre les parcours sur les vraies maquettes |
| **ALEX** · Lead Developer | code, architecture, effort |
| **CHRIS** · QA | recette et verdict GO / NO-GO, sans jamais pouvoir toucher au code |

- **Deux boucles** : `/dev-front` (maquette → US figée → code → captures comparées à la maquette → recette → merge humain) et `/feature`.
- **Loop engineering** : chaque échec entre dans la mémoire de l'agent, puis devient une règle, idéalement appliquée par un hook. Les décisions sont réinjectées à chaque démarrage de session.
- **Des garde-fous qui bloquent vraiment** : la QA ne peut pas modifier le code, l'humain seul merge, la protection de `main` est vérifiée à chaque session.

→ [Voir l'équipe, ses boucles et les règles nées de ses erreurs](equipe-agents/)

---

## 2. Les skills

| Étape | Skill | Ce qu'il produit |
|---|---|---|
| Discovery | [interview-guide-interactif](skills/interview-guide-interactif/) | Une grille d'entretien interactive : cases à cocher, notes, historique, export Markdown |
| Discovery | [analyse-entretien-user-journey](skills/analyse-entretien-user-journey/) | La user journey d'un entretien, chaque post-it relié à sa source |
| Discovery | [feature-benchmark](skills/feature-benchmark/) | Comment d'autres produits, d'autres secteurs compris, résolvent le même problème |
| Cadrage | [business-analysis](skills/business-analysis/) | Ce qui est décidé, ce qui ne l'a jamais été, les contradictions, et les options à trancher |
| Cadrage | [spec-creator](skills/spec-creator/) | La spec d'**une fonctionnalité entière**, en 11 sections, avant le développement |
| Cadrage | [user-story](skills/user-story/) | **Un ticket du backlog**, prêt pour un sprint, numéroté d'après le backlog réel |
| Décision | [conseil-5-voix](skills/conseil-5-voix/) | Un verdict sur une décision, après 5 points de vue qui ne se mélangent jamais |
| Apprendre | [cours-augmente](skills/cours-augmente/) | Un cours interactif à partir d'un support et des notes de séance |

Spec ou user story ? Une spec décrit toute une fonctionnalité et sert de référence à l'équipe ; elle donne souvent plusieurs user stories, qui sont les tickets du sprint.

Chaque dossier contient un README avec un exemple, sur un produit fictif.

### Installer (Claude Code)

```
/plugin marketplace add jbkrady/pm-skills
/plugin install pm-skills@jbkrady
```

Puis `/reload-plugins`. Les skills se déclenchent seuls quand la demande s'y prête, ou s'appellent par leur nom : `/pm-skills:spec-creator`. L'équipe d'agents, elle, se copie dans le projet (voir [equipe-agents/](equipe-agents/)).

---

## Pour aller plus loin

- Le guide [Créer ses agents Claude](https://claude.ai/artifact/UajBJqGYpvHyuVtZgM8KQ5), pour non-développeurs, et son [projet exemple](https://github.com/jbkrady/agent-guide-test).
- [Prisme](https://github.com/jbkrady/prisme) : un agent et son skill en production, chaque matin.

## Auteur

Jean-Baptiste Krady, Product Manager · AI & Data Builder · [krady.fr](https://krady.fr)

Licence MIT pour les contenus de ce dépôt. Les skills d'Anthropic et de ses partenaires copiés dans `equipe-agents/.claude/skills/` restent sous leur propre licence (voir le fichier `ORIGINE.md` de chacun).
