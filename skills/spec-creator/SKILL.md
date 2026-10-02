---
name: spec-creator
description: "Rédiger, compléter ou découper une spec de fonctionnalité (format inspiré de la formation Product Manager de Noé) : cadrage, user stories, acceptance criteria Given/When/Then, management rules, edge cases, tracking, releases, rollout, testing. Déclenche sur « rédige une spec », « spec-creator », « écris l'US »."
---

# Spec Creator

Produit une spec de fonctionnalité exploitable par une équipe de développement, dans un format inspiré de la formation Product Manager de Noé. Fonctionne pour n'importe quel produit : le contexte est demandé à chaque usage, jamais supposé.

Langue de travail et de sortie : **français**. Les noms de sections restent en anglais (Context & User Persona, User Stories, Acceptance Criteria, Management Rules, Edge Cases, Designs & Workflow Diagrams, Tracking, Releases, Rollout Plan, Testing Plan) : c'est la convention courante des équipes produit.

---

## Les cinq règles d'or

1. **Une fonctionnalité, une spec.** Même quand plusieurs fonctionnalités répondent au même problème, on écrit une spec par fonctionnalité.
2. **Le quoi et le pourquoi, jamais le comment.** La spec est fonctionnelle. Elle ne dit pas comment coder : pas de composants frontend, pas d'endpoints, pas de schéma de base, pas de tech tasks. C'est une exclusion de principe, pas de concision.
3. **Document vivant.** Il se met à jour au fil de la fonctionnalité.
4. **Lisible par un agent.** Explicite, structuré, contraintes et edge cases sans ambiguïté. Une spec floue produit un output flou.
5. **N'invente jamais de contexte.** Tout doit s'ancrer dans les sources fournies : PRD, discovery, maquettes, specs sœurs. Ce qui manque devient une question ou un point ouvert — jamais une invention plausible.

---

## Étape 1 — Lire les sources avant de parler

Avant toute question, prendre connaissance de ce qui existe déjà : documents du projet, PRD, synthèse de discovery, maquettes, specs sœurs (Notion, Jira, Linear), tracking plan. Ne jamais poser une question dont la réponse est dans une source disponible.

---

## Étape 2 — Poser TOUTES les questions en une fois

Poser l'ensemble des questions manquantes **en un seul bloc**, puis attendre les réponses avant d'écrire une ligne de spec. Ne pas produire de brouillon intermédiaire, ne pas avancer à moitié.

Utiliser un outil de questions à choix multiples s'il est disponible, sinon une liste numérotée. Retirer de la liste toute question déjà couverte par les sources.

**Batterie de cadrage :**

1. **Fonctionnalité** — quelle fonctionnalité, quel problème utilisateur elle résout, et d'où vient ce problème (PRD ? discovery ? donnée ?).
2. **Acteur et bénéficiaire** — qui agit à l'écran, et qui en tire le bénéfice. Ce sont souvent deux personnes différentes ; la spec doit les distinguer.
3. **Utilisateurs internes** — ops, back-office, modération, support : sont-ils impactés ? Les oublier est l'erreur la plus fréquente.
4. **KPI** — métrique principale et secondaire, avec leur valeur actuelle si elle existe.
5. **Surfaces** — quels écrans, quels parcours. Liens Figma ou captures.
6. **Existant contre nouveau** — *question critique* : sur ces écrans, qu'est-ce qui existe déjà dans le produit et qu'est-ce que cette fonctionnalité crée réellement ? Spécifier un composant existant gonfle le périmètre et s'approprie le travail d'un autre.
7. **Règles métier connues** — seuils, limites, formats acceptés, permissions, calculs, conditions d'éligibilité.
8. **Dépendances** — autres specs ou US du même chantier, et définitions partagées avec elles.
9. **Releases** — tout en une fois, ou un MVP puis des incréments ? Quelle contrainte de délai ?
10. **Destination** — fichier seul, ou aussi Notion, Jira, Linear ? (À reposer à la fin si la réponse était « on verra ».)

---

## Étape 3 — Verrouiller le périmètre, et découper si besoin

**Avant d'écrire**, formuler le périmètre en **une seule phrase** : « Cette spec couvre X, et rien d'autre. »

**Test du « et »** : si cette phrase a besoin d'un « et » pour relier deux mécanismes distincts, il y a deux specs. « Afficher un badge **et** remonter les profils en haut de liste » = un affichage et un algorithme de tri = deux specs.

**Signaux de découpage — un seul suffit :**

- Une user story demande **plus de 5 acceptance criteria** pour être couverte.
- Deux acteurs poursuivent chacun leur propre objectif.
- Deux KPI principaux différents.
- Un edge case exige un développement significatif — il devient sa propre user story, voire sa propre spec.
- Deux mécanismes produit distincts : affichage contre algorithme, lecture contre écriture, front contre traitement asynchrone.

**Quand il faut découper** : le dire immédiatement, proposer le découpage nommé (spec A / spec B), dire laquelle on rédige maintenant, et ne pas en rédiger deux sans accord.

**Écrire un bloc « Hors périmètre » explicite**, avec pour chaque élément son propriétaire : « l'encart lui-même appartient à l'US1 », « la note et les avis existent déjà ». Une exclusion nommée vaut infiniment mieux qu'un silence : ce qui n'est écrit nulle part tombe entre deux specs.

---

## Étape 4 — Rédiger

Toutes les sections ci-dessous sont couvertes par défaut. Une section sans matière se remplit avec ce qui reste à décider, jamais avec du texte de remplissage. Les **Tech Tasks ne sont jamais rédigées** (règle d'or n°2).

### 1. Context & User Persona
Court. Le problème, pour qui, pourquoi c'est important, le KPI visé. Distinguer **acteur** et **bénéficiaire**. Chiffrer le poids business quand la donnée existe. Terminer par le périmètre et le hors-périmètre.

### 2. User Stories
Format : **« En tant que [utilisateur], quand je [situation], je veux [objectif], afin de [bénéfice]. »**
Niveau macro. Le « afin de » doit nommer un bénéfice observable — « réserver en toute confiance » ne se teste pas, « réserver malgré l'absence d'avis » se teste. Penser aux utilisateurs internes. Regrouper les stories sous une Feature ou un Epic.

### 3. Releases
Découper en releases fonctionnelles ou techniques. Livrer le maximum de valeur dès la première. Un MVP doit être un vrai minimum. Justifier le découpage en une ligne par release. Une seule release est une réponse valable pour un quick win.

### 4. Acceptance Criteria
Format : **« GIVEN [contexte], WHEN [action], THEN [résultat]. »**, avec des **AND** pour les conditions supplémentaires.

- **5 maximum par user story.** Au-delà, le périmètre est trop large : revenir à l'étape 3.
- Couvrir le happy path **et** les scénarios d'erreur. Une spec sans AC d'erreur est incomplète.
- Chacun doit être assez précis pour qu'un QA en tire un test sans poser de question.
- Spécifique au produit, jamais générique.
- Un détail qui ne mérite pas son propre critère (accord singulier/pluriel, troncature d'un compteur) descend en Management Rule. Un cas limite descend en Edge Case. Rien ne se perd, tout se range.

### 5. Management Rules
La logique invisible que le système doit appliquer : éligibilité, seuils, limites, formats supportés, permissions, calculs, libellés et bornes d'affichage, performance.
Y placer aussi les **exclusions nommées** : « ce composant existe déjà, cette spec ne le modifie pas ».

### 6. Edge Cases
Les 5 % de cas hors du flow principal, formulés en « si X alors Y ». Balayer systématiquement : l'utilisateur fait quelque chose d'inhabituel, il oublie une étape, il recommence deux fois, il agit dans le désordre, la donnée est absente, le service est lent ou tombe, l'état change en cours de session, la valeur est extrême (zéro, un, très grand).
Préciser le comportement dégradé attendu et le message d'erreur éventuel. Un edge case qui demande un développement significatif devient une user story.

### 7. Designs & Workflow Diagrams
Liens vers les maquettes ou le prototype, et description de ce qu'elles montrent état par état. Signaler les écrans **non dessinés** que la spec suppose. Diagramme de flux seulement si la logique le justifie (rôles, permissions, modération).

### 8. Tracking
Tableau : **Event (snake_case) | Trigger | Propriétés clés | Métrique servie**.

- **3 à 4 métriques maximum** par fonctionnalité. Trop de métriques brouillent la définition du succès, coûtent en maintenance et en facture d'analytics.
- Ne pas créer un event qui double un event existant d'une spec sœur : y ajouter une propriété et signaler la dépendance.
- Reprendre les conventions de nommage des specs sœurs du même chantier.
- **Contrôle de mesurabilité** : quand une métrique compare deux populations, vérifier qu'elles ne diffèrent pas déjà par autre chose. Si oui, exiger un groupe témoin — sinon la métrique ne mesure rien.

### 9. Rollout Plan
Alpha, Beta, Stable. Pour chaque phase : audience, timing, état de la fonctionnalité, et ce qu'on cherche à valider. Nommer la condition de passage à la phase suivante.

### 10. Testing Plan
Cœur fonctionnel sans bug bloquant, déclenchement correct des events et de leurs propriétés, UX fluide. Nommer explicitement les **flows critiques pour le business** à tester avant chaque release — une panne sur une fonctionnalité secondaire ne doit jamais casser un parcours de conversion.

### 11. Points ouverts
Tout arbitrage que la spec ne peut pas trancher seule. Pour chacun : le constat, les options, la conséquence concrète si personne ne tranche, et la recommandation par défaut. Cette section est un signe de rigueur, pas de travail inachevé.

---

## Trois pièges à vérifier avant de rendre

**L'existant pris pour du nouveau.** Avant de spécifier un élément vu sur une maquette, vérifier qu'il n'existe pas déjà ailleurs dans le produit. S'il apparaît sur d'autres écrans que ceux de la fonctionnalité, c'est un composant existant : l'exclure nommément.

**Les définitions divergentes entre specs sœurs.** Une notion partagée par plusieurs specs — le moment où un utilisateur change de statut, ce qui compte comme un succès — doit être écrite une fois et recopiée à l'identique. Comparer avec les specs sœurs et signaler tout écart, en disant ce qu'il produit concrètement.

**La source contredite.** Quand une maquette contredit le PRD, la maquette validée fait foi, mais l'écart se dit explicitement plutôt que de disparaître en silence.

---

## Checklist qualité

- Le périmètre tient en une phrase, sans « et » reliant deux mécanismes.
- Le hors-périmètre est écrit, avec un propriétaire par élément.
- Context : explique le pourquoi, pas seulement le quoi. Concis.
- Personas : assez spécifiques (nouvel hôte contre hôte existant, pas « hôte »). Acteur et bénéficiaire distingués. Utilisateurs internes couverts.
- User stories : bon format, niveau macro, « afin de » observable.
- Releases : réalistes, priorisées, MVP vraiment minimal.
- AC : 5 maximum par US, testables, happy path et erreurs, spécifiques au produit.
- Management rules : seuils, limites, permissions, libellés et exclusions capturés.
- Edge cases : valeurs extrêmes, panne, lenteur, changement d'état en session.
- Tracking : 3 à 4 métriques, events mesurables, pas de doublon avec les specs sœurs, métriques comparatives réellement mesurables.
- Aucun élément d'implémentation technique. Aucune tech task.
- Aucun fait inventé : tout est tracé à une source ou listé en point ouvert.
- Cohérence avec le prototype, le PRD et les specs sœurs. Pas de contradiction entre user stories et management rules.

---

## Étape 5 — Livrer

Sortie par défaut : **un fichier markdown**, livré dans la conversation et sauvegardé dans les documents du projet quand il y en a un.

Puis, systématiquement, **demander la destination** : faut-il pousser la spec vers Notion, Jira ou Linear ? Ne jamais écrire dans un espace d'équipe sans accord explicite.

- **Notion** : reprendre la mise en forme des pages sœurs (titres avec emoji, callouts, tableaux) plutôt que d'imposer un format. Modifier par remplacement ciblé section par section — jamais d'écrasement global, qui détruirait les embeds Figma et les images déjà posés. Retirer les consignes d'atelier résiduelles (durées entre parenthèses, exemples génériques, renvois à la formation).
- **Jira / Linear** : une issue par user story, les acceptance criteria dans la description, les management rules et edge cases en commentaire ou en sous-section. Respecter les conventions du board existant.

Terminer par un résumé court : ce que la spec couvre, ce qu'elle exclut, et les points ouverts qui attendent un arbitrage.