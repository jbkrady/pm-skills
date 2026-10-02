---
name: business-analysis
description: "Analyse de Business Analyst quand une question produit touche un angle mort : un cas d'usage jamais tranché, une contradiction entre le code et les specs, un choix structurant avant de construire. Déclencheurs : « et si l'utilisateur ne fait pas X ? », « on n'a pas pensé à ce cas », « il y a des angles qu'on n'a pas pris en compte », « fais un plan définitif », ou toute décision qui engage l'architecture avant la première ligne de code. Produit une analyse sourcée (réalité du code, vérité produit, patterns de marché), sépare ce qui est DÉJÀ décidé de ce qui ne l'a JAMAIS été, remonte les contradictions, et présente les décisions sans jamais les prendre à la place de l'utilisateur."
---

# Business Analysis

Une méthode pour **cadrer une décision structurante avant de construire**, quand la question posée révèle un angle mort.

> **Principe cardinal : ne jamais combler un trou soi-même.** Un trou dans les specs est une **information**, pas une gêne. Le nommer vaut mieux que le boucher avec une hypothèse. La décision revient à l'utilisateur.

---

## 1. Trois explorations, en parallèle

Ne jamais répondre de mémoire. Lancer trois agents `Explore` (lecture seule) en une fois :

**a. La réalité du code.** Qu'est-ce qui existe vraiment dans le dépôt aujourd'hui : fichiers, routes, composants, gardes ? Ce qui **bloque** contre ce qui est seulement **inachevé**. Ce qui est **absent** se dit comme tel.

**b. La vérité produit.** Que disent le backlog, les spécifications, la note de cadrage, les personas, `CLAUDE.md`, les ADR et les journaux de décisions ? Séparer en deux listes :
- **ce qui est DÉJÀ décidé**, avec la citation exacte et sa source ;
- **ce qui n'a JAMAIS été décidé** : les trous.

**c. Les patterns de marché.** Comment font les produits comparables : concurrents directs, acteurs mondiaux du secteur, produits qui résolvent le même problème d'interaction ? **Sourcer chaque affirmation.** Chercher aussi les conséquences documentées (conversion, rétention, référencement) et la documentation technique de référence quand un fait technique est en jeu.

Si un site est cité comme modèle, **aller le voir**. Ne pas se contenter d'articles qui le décrivent.

---

## 2. Chercher la contradiction

C'est le cœur du métier. Une analyse utile ne se contente pas d'additionner des faits : elle trouve **là où le produit se contredit**.

- Le **code** fait-il ce que disent les **specs** ?
- Une décision récente en **remplace**-t-elle une plus ancienne sans que personne l'ait écrit ?
- Une consigne d'agent ou de skill contredit-elle une décision de l'utilisateur ? (Une erreur qui revient vient d'une source : la trouver.)

Quand une contradiction apparaît, la **nommer sans détour** et dire laquelle des deux sources fait foi.

---

## 3. Vérifier avant d'affirmer, et corriger les faits, y compris les siens

**La discipline est en amont.** Ne jamais énoncer un fait **vérifiable** comme acquis sans l'avoir vérifié cette fois-ci. Quand l'outil existe (lire le code, chercher, ouvrir le vrai site, lire la doc officielle), **vérifier d'abord**, puis affirmer. Sinon, le formuler comme hypothèse (« je crois, à vérifier ») et **ne pas en faire la base d'une décision**.

Une affirmation ferme puis démentie coûte deux fois. Corriger après coup vaut mieux que persister, mais **ne pas produire le fait faux** vaut encore mieux.

Si un agent, un document ou **soi-même** a écrit une contre-vérité, **le dire**, avec la source qui corrige. Un plan bâti sur un fait faux est un plan faux.

---

## 4. Présenter la décision, ne pas la prendre

1. **La synthèse** : ce que disent les faits, ce qui est décidé, ce qui ne l'est pas, où est la contradiction.
2. **Les décisions qui reviennent à l'utilisateur**, posées comme de vrais choix (2 ou 3 options), avec les **conséquences de chacune** et une **recommandation argumentée**. Montrer un aperçu concret quand le choix est visuel ou structurel.
3. **Ce qui reste à trancher plus tard**, listé, pour que rien ne se perde.

**Ne jamais** trancher un arbitrage produit à la place de l'utilisateur. **Toujours** recommander : « je ne sais pas » n'est pas une réponse quand on a fait le travail.

---

## 5. Puis le plan, et l'affinage technique

Une fois la décision prise :
- **Écrire le plan** : contexte, décisions, principe directeur, ce qui change dans le code (chemins exacts), ce qui ne change pas, les trous de specs à combler, le séquencement et la vérification.
- **Le faire affiner techniquement** par le développeur ou un agent `Plan` : prérequis (dépendances, ADR, variables d'environnement), **chiffrage**, **graphe de blocage** entre US, adaptation de la roadmap.
- **Distinguer** ce qui est faisable tout de suite de ce qui attend une brique manquante.

---

## 6. Erreurs à ne pas commettre

- **Raisonner depuis son biais** plutôt que depuis la contrainte donnée. Si l'utilisateur fournit un fait qui invalide une hypothèse, **l'abandonner**, ne pas la défendre.
- **Combler un trou** par une supposition présentée comme un acquis.
- **Décrire un site de référence sans l'avoir ouvert.**
- **Corriger le symptôme** d'une erreur qui revient, au lieu de sa source.
- **Étendre une décision au-delà de ce qui a été dit.** Un titre d'écran rejeté n'est pas un positionnement abandonné, sauf si l'utilisateur le dit.
- Oublier que **priorité et version sont découplées**.
