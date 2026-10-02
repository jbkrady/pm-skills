# Une équipe d'agents produit

Quatre agents Claude Code spécialisés, deux boucles de travail et des garde-fous qui transforment chaque erreur en règle. Issu d'un vrai projet produit, rendu générique : à copier dans votre dépôt, puis à adapter.

**L'idée :** un agent qui cadre, code et teste son propre travail valide ce qu'il vient d'écrire. Séparer les rôles crée des points de contrôle. Rien n'est codé avant d'être cadré, celui qui code n'est pas celui qui recette, et l'humain garde les deux décisions qui comptent : ce qu'on construit, et ce qu'on livre.

## L'équipe

| Agent | Rôle | Ce qu'il ne fait jamais |
|---|---|---|
| **SAM** · Product Manager | User stories, roadmap, priorisation, Definition of Done. Propriétaire de la documentation produit. | Coder, chiffrer l'effort |
| **MAX** · UX, Communication & Growth | Cadre les parcours sur les vraies maquettes et livre une préco à SAM ; inspecte le rendu ; messaging et acquisition. | Coder, rédiger les US finales |
| **ALEX** · Lead Developer | Architecture, code, intégrations, chiffrage de l'effort. | S'auto-valider, merger |
| **CHRIS** · QA | Plan de test, bout en bout, conditions dégradées, verdict GO / NO-GO. | Modifier le code : un hook le bloque |

La session principale joue l'**orchestrateur** : elle délègue et relaie, sans jamais rendre de verdict produit ni QA.

## Les deux boucles

**`/dev-front`** : pour tout écran ou parcours.

```
MAX cadre sur les vraies maquettes → l'humain et SAM figent l'US → ALEX code
→ captures mobile comparées à la maquette → CHRIS recette (fidélité = bloquant) → l'humain merge
```

**`/feature`** : pour le reste.

```
explorer → cadrer (périmètre minimal) → ALEX code → CHRIS teste → GO → l'humain valide le commit
```

## Loop engineering : chaque échec devient une règle

Corriger le résultat ne suffit pas : on corrige ce qui a permis l'erreur.

1. Un agent se trompe : un rendu à côté de la maquette, un faux vert, une décision oubliée.
2. Le piège entre dans la **mémoire de l'agent** (`.claude/agent-memory/<agent>/`), avec sa parade.
3. S'il peut revenir, il devient une **règle** : dans `CLAUDE.md`, dans la fiche de l'agent, ou mieux, dans un **hook** qui l'applique sans qu'on y pense.
4. Les décisions sont **injectées à chaque démarrage** (`DECISIONS.md`), pour qu'aucune session ne reparte de zéro.

Quelques règles nées ainsi :

- **Une règle écrite ne protège rien.** Une consigne à dix lignes du code a été violée deux fois. Ce qui compte doit être appliqué par un hook, un test ou un réglage serveur.
- **Un test qui n'a jamais été rouge ne prouve rien.** Avant de croire un vert, on sabote la condition et on le regarde échouer.
- **L'amnésie se soigne par l'injection d'état, pas par l'exhortation.** D'où le journal des décisions injecté au démarrage.
- **Un filet redondant qu'on croit protecteur est pire qu'un filet absent.** Un hook anti-merge, contournable par l'interface web, a été retiré au profit de la protection de `main` côté GitHub, qui couvre tous les chemins.
- **« Outil introuvable » est d'abord un problème de nom.** Un nom d'outil erroné a fait cadrer les agents à l'aveugle pendant des semaines, chacun concluant à un défaut d'accès.
- **Une décision différée s'écrit à deux endroits** : dans la liste des points ouverts **et** dans l'US concernée, sinon celui qui code ne la voit jamais.
- **On recette une plage de largeurs, pas deux tailles** : des défauts invisibles à 360 et à 1 440 px apparaissent entre les deux.

## Les garde-fous

| Fichier | Déclencheur | Effet |
|---|---|---|
| `scripts/chris-guard.sh` | Avant chaque écriture de CHRIS | **Bloque** toute modification du code applicatif (et bloque aussi s'il plante : sécurité par défaut) |
| `scripts/session-start.sh` | Démarrage de session | Rappelle les sources, **injecte les 10 dernières décisions**, sonde la protection de `main` |
| `scripts/detect-front.sh` | Chaque message | Si le sujet touche au front : rappelle `/dev-front` et `frontend-design` |
| `scripts/detect-fin-session.sh` | Chaque message | « fin de session » → lance le skill `fin-de-session` |

## Les skills de l'équipe

Chaque agent précharge les skills de son métier (`skills:` dans sa fiche). Ceux de ce dépôt sont signalés ; les autres viennent de dépôts publics d'Anthropic.

| Agent | Skills | Origine |
|---|---|---|
| SAM | `user-story`, `spec-creator` | **Ce dépôt** ([skills/](../skills/)) |
| SAM, ALEX, MAX | `frontend-design` | Anthropic, [anthropics/skills](https://github.com/anthropics/skills/tree/main/skills/frontend-design) (Apache 2.0) |
| SAM, ALEX | `documentation` | Anthropic, plugin [engineering](https://github.com/anthropics/knowledge-work-plugins/tree/main/engineering) (Apache 2.0) |
| ALEX | `system-design`, `architecture`, `code-review`, `debug` ; à la demande : `deploy-checklist`, `tech-debt` | Anthropic, plugin [engineering](https://github.com/anthropics/knowledge-work-plugins/tree/main/engineering) (Apache 2.0) |
| CHRIS | `testing-strategy`, `debug`, `incident-response` | Anthropic, plugin [engineering](https://github.com/anthropics/knowledge-work-plugins/tree/main/engineering) (Apache 2.0) |
| MAX | `campaign-plan`, `content-creation`, `draft-content`, `competitive-brief`, `email-sequence`, `brand-review`, `performance-report`, `seo-audit` | Anthropic, plugin [marketing](https://github.com/anthropics/knowledge-work-plugins/tree/main/marketing) (Apache 2.0) |
| MAX | `discover-brand`, `guideline-generation`, `brand-voice-enforcement` | Tribe AI, plugin partenaire [brand-voice](https://github.com/anthropics/knowledge-work-plugins/tree/main/partner-built/brand-voice) publié par Anthropic (MIT) |
| Tous | `business-analysis`, `conseil-5-voix` | **Ce dépôt**, pour les décisions structurantes |
| Orchestrateur | `fin-de-session` | **Ce modèle** (`.claude/skills/`) |

## Installer dans un projet

1. Copier le contenu de ce dossier à la racine du projet : `.claude/`, `CLAUDE.md`, `DECISIONS.md`.
2. Remplir `CLAUDE.md` : produit, sources de vérité, périmètre, Definition of Done, contraintes, règles de rédaction.
3. **Skills préchargés** : le champ `skills:` d'une fiche lit les skills du dossier `.claude/skills/` du projet. Copier-y les dossiers listés ci-dessus depuis leurs dépôts sources, avec leur fichier de licence.
4. Ajouter aux fiches les outils de vos connecteurs (backlog, maquettes, navigateur), par exemple `mcp__playwright__*`.
5. Adapter `chris-guard.sh` (les dossiers de code) et `session-start.sh` (le nom du check obligatoire sur `main`).
6. Lancer une fonctionnalité : `/feature …` ou `/dev-front …`.
