---
name: user-story
description: "Générer, enrichir ou réviser des user stories au format Scrum enrichi, pour n'importe quel produit. Conduit une interview en 4 étapes (descriptif, intitulé, UX/fonctionnel/technique, critères d'acceptation), s'appuie sur le contexte produit fourni et sur le backlog réel, jamais sur une liste figée. Déclencheurs : « crée une US », « génère une user story », « rédige une US pour », « enrichis l'US-XXX », « j'ai une idée de feature », ou quand l'utilisateur décrit une fonctionnalité sans dire « user story »."
---

# User Story Generator

Ce skill produit des user stories au format Scrum enrichi, prêtes à entrer dans un backlog. Il conduit une interview structurée en 4 étapes, puis rédige l'US complète.

> **Principe directeur : ne jamais figer ce qui bouge.** Le périmètre, la liste des US et leurs priorités évoluent. Le skill ne contient aucun contexte produit : il lit le **contexte stable** (marché, personas, contraintes) dans un fichier fourni par l'utilisateur, et l'**état réel** (US existantes, numérotation, priorités) dans le backlog au moment de l'usage. Si une consigne de ce skill contredit ces sources, **la source gagne** : signaler l'écart à l'utilisateur.

---

## 1. Sources à consulter AVANT de générer

- **Contexte produit** : un fichier `contexte-produit.md` (ou équivalent) fourni par l'utilisateur. Il fixe le positionnement, les personas, les épics, les contraintes structurantes et les niveaux de priorité. Voir `exemple-contexte-produit.md` pour la forme attendue. **S'il n'existe pas, le demander** avant la première US, ou proposer de le construire ensemble en 5 questions (produit, personas, épics, contraintes, priorités).
- **Backlog** : l'outil où vivent les US (Notion, Jira, Linear, fichier). C'est la **seule** source pour savoir quelles US existent, leur numéro, leur priorité et leur état. **Ne jamais présupposer le nombre d'US** : le lire.
- **Recherche utilisateur**, si elle existe : personas détaillés, parcours, « moments de vérité ». Une US qui sert un moment de vérité est un signal de priorité fort.

Si le backlog n'est pas accessible dans la session, le dire et travailler à partir de ce que l'utilisateur fournit, en marquant les hypothèses.

---

## 2. Format de sortie : US complète

```
────────────────────────────────────────────────────────
US-[XXX] | [Intitulé court] | [Priorité] | Persona : [Persona]
────────────────────────────────────────────────────────

CONTEXTE
Pourquoi cette fonctionnalité existe, quel problème elle résout,
et comment elle s'inscrit dans la roadmap. Si elle sert un
« moment de vérité » d'un parcours utilisateur, le dire.

USER STORY
En tant que [persona], je souhaite [action] afin de [bénéfice].

ÉLÉMENTS UX ET FONCTIONNELS
• [Élément 1] : comportement visible, sans jargon technique
• [Élément 2]
• RG : règles de gestion, limites, états vide / chargement / erreur / succès

ÉLÉMENTS TECHNIQUES (si fournis)
• Contraintes et intégrations identifiées, gardées séparées de l'UX
• Contraintes de performance

CONTRAINTES PRODUIT
• Les contraintes structurantes du contexte produit qui s'appliquent ici
  (support, connectivité, canaux, paiement, langue, accessibilité…)

CRITÈRES D'ACCEPTATION
1. Étant donné que… lorsque… alors…
2. …
3. … (inclure un cas limite ou d'erreur, et un cas propre au contexte produit)

RISQUE IDENTIFIÉ
• [Risque principal] → Mitigation : [action]

DÉPENDANCES
• US liées : [US-XXX] · Bloquant / Bloqué par : [préciser]

NOTES
• Estimation : [XS / S / M / L / XL], à valider par l'équipe de développement
• Épic : [Nom de l'épic]
• Version : [nouvelle US / enrichissement de US-XXX]
────────────────────────────────────────────────────────
```

Les niveaux de priorité sont ceux du contexte produit (par exemple `P0` = MVP, `P1` = version suivante, `P2` = plus tard).

---

## 3. Protocole d'interview : 4 étapes séquentielles

Une étape par échange, dans cet ordre.

**Étape 1 : descriptif.** Poser en une fois : (1) quelle fonctionnalité ? (2) quel persona ? (3) quel problème concret ? (4) enrichit une US existante ou nouvelle ? *(vérifier dans le backlog)* (5) quelle priorité envisagée ? Si la réponse est vague, proposer 2 ou 3 exemples pour cadrer.

**Étape 2 : intitulé.** Proposer 3 formulations : un format court (3 à 6 mots) pour l'identifiant, et la forme « En tant que… je souhaite… afin de… ». Demander validation.

**Étape 3 : UX, fonctionnel, technique.** Recueillir l'écran ou le parcours et ses composants, les règles fonctionnelles et les états, les contraintes techniques, et les contraintes du contexte produit. Si l'utilisateur n'en parle pas, les signaler et proposer de les intégrer.

**Étape 4 : critères d'acceptation.** Recueillir 3 à 5 scénarios Given / When / Then : un cas nominal, un cas limite ou d'erreur, un cas propre au contexte produit. Proposer des suggestions s'il en manque.

---

## 4. Génération

Après les 4 étapes, rédiger l'US au format §2.

**Formats :** affichage dans la conversation (par défaut) ; document Word si demandé ; écriture dans le backlog si l'utilisateur veut l'y ajouter (jamais sans son accord).

**Numérotation :** lire l'identifiant le plus élevé dans le backlog et **incrémenter**. Pour l'enrichissement d'une US existante, garder son identifiant et écrire « enrichissement ».

---

## 5. Règles qualité

1. **Pas de jargon technique dans l'UX** : décrire le comportement visible, garder la technique à part.
2. **Toujours intégrer les contraintes du contexte produit**, au moins les mentionner.
3. **Toujours un risque identifié**, avec sa mitigation.
4. **Critères d'acceptation testables** par un QA ou une personne non technique.
5. **Cohérence avec le backlog réel** : vérifier dépendances et doublons dans le backlog, pas dans une liste figée.
6. **Vocabulaire du contexte produit** : reprendre ses termes (noms des personas, des moyens de paiement, des canaux), éviter ceux qu'il exclut.
7. **Le contexte produit prime** sur une vieille note ; signaler l'écart plutôt que de trancher en silence.

---

## 6. Exemples de déclenchement

| Demande | Action |
|---|---|
| « J'ai une idée pour les rappels de rendez-vous » | Lancer l'étape 1 |
| « Crée une US pour le paiement en ligne » | Lancer l'étape 1 |
| « Enrichis l'US-005 » | Lire US-005 dans le backlog, passer à l'étape 3 |
| « Génère les US manquantes de l'épic Réservation » | Conduire l'interview pour chaque fonctionnalité |

---

## 7. Maintenance

Le skill ne contient volontairement aucun état figé (pas de liste d'US, pas de priorités gelées) : c'est ce qui le rendait obsolète à chaque pivot. Quand le produit change, mettre à jour **uniquement le fichier de contexte produit** ; la liste des US se relit dans le backlog.
