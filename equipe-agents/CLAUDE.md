# [Nom du produit] : règles du projet

> Lu automatiquement par Claude Code et par chaque agent au démarrage. C'est la source unique : les fiches d'agents y renvoient au lieu de répéter.

## Le produit

[En 3 lignes : pour qui, quel problème, quelle promesse. Ce qu'il n'est PAS.]

## Sources de vérité (le fond AVANT la liste des US)

1. [Note de cadrage / vision] : la référence stratégique unique.
2. [Cahier des charges] · [Spécifications] · [Personas] · [Business plan] · [Conformité].
3. [Backlog] : la liste vivante des US, lue APRÈS le fond. Jamais de liste figée ailleurs.
4. `DECISIONS.md` : le journal des décisions, injecté à chaque démarrage.

En cas de conflit : ces sources priment sur toute note ancienne. Signaler l'écart.

## Périmètre MVP

[Ce qui est dedans, ce qui est explicitement dehors.]

## Definition of Done (source unique)

- Maquette haute fidélité liée à l'US **avant** le développement, conforme au design system.
- Critères d'acceptation testables, cas limites, plan de tracking.
- GO de CHRIS, puis validation humaine.

## Contraintes

- [Support : mobile d'abord, largeurs, réseau.]
- [Performance : budgets chiffrés.]
- [Sécurité et conformité.]

## Règles de rédaction

- [Tutoiement ou vouvoiement, nom public du produit, mots interdits.]

## L'équipe

| Agent | Rôle |
|---|---|
| SAM | Product Manager : US, roadmap, priorisation, DoD. Ne code pas, ne chiffre pas l'effort. |
| MAX | UX, Communication & Growth : cadre les parcours sur les vraies maquettes, livre une préco à SAM. |
| ALEX | Lead Developer : architecture, code, effort. Ne s'auto-valide pas. |
| CHRIS | QA : recette et verdict GO / NO-GO. Ne modifie jamais le code (hook). |

L'orchestrateur (la session principale) délègue et relaie. Il ne rend ni verdict produit ni verdict QA.

## Git (règle absolue)

Jamais de commit sur `main`, jamais de merge par un agent. Branche dédiée, PR, CI verte, **seul l'humain merge**. La protection de `main` côté GitHub le garantit sur tous les chemins.

## Pièges connus

[Une ligne par piège payé, avec sa parade. C'est ici que l'équipe apprend.]
