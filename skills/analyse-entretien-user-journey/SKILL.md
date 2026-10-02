---
name: analyse-entretien-user-journey
description: "Analyser un entretien utilisateur enregistré (Fireflies ou transcript fourni) et produire sa fiche User Journey : page HTML à onglets, post-its prêts pour Miro, transcript markdown, chaque post-it portant sa source."
---

# Analyser un entretien et produire sa fiche User Journey

Déclenche ce skill quand l'utilisateur fournit un entretien utilisateur — nom d'enregistrement Fireflies, transcript collé, notes de binôme — et demande une user journey, une synthèse d'entretien, des verbatims ou des post-its.

**Une journey = un rôle. Une planche par entretien, jamais deux.** Le rôle se détermine avant de commencer, et il commande tout le reste : les colonnes, le vocabulaire, ce qui entre dans la planche et ce qui n'y entre pas.

## Étape 1 — Récupérer le matériau brut

Si l'entretien est dans Fireflies : `fireflies_search` avec `scope:title` pour trouver l'id, puis `fireflies_get_transcript`.

**Si `Sentences: No sentences` alors qu'un résumé existe ou que l'enregistrement est récent, la transcription est encore en cours.** Attendre 60-90 s et relancer `fireflies_get_transcript` avant de conclure qu'il n'y a rien.

### Règle absolue : le résumé automatique n'est pas une source

**Ne jamais rédiger à partir du résumé Fireflies. Toujours travailler sur le transcript intégral.** Le résumé est une reformulation par un modèle : il condense, il interprète, et il se trompe — y compris sur des faits structurants comme le rôle du participant. Une erreur du résumé se propage ensuite dans tous les livrables.

Le résumé sert uniquement à décider si un enregistrement mérite d'être ouvert.

### Les notes du binôme comblent les trous, elles n'établissent pas les faits

Quand des notes prises pendant l'appel sont fournies, les recouper **ligne par ligne** avec le transcript. Elles ont deux usages, et un seul est fiable :

- **Combler ce que l'enregistrement n'a pas capté** — un silence, une coupure, un passage inaudible. C'est là qu'elles sont irremplaçables. Le fait est alors marqué `[notes]` dans la fiche.
- **Établir un fait déjà présent dans l'enregistrement** — non. **Quand les notes et le transcript divergent, le transcript tranche.** Une note est une reformulation écrite à la volée : elle inverse parfois le sens d'un mot, arrondit un chiffre, ou ajoute un élément que personne n'a dit.

Produire une section **« recoupement avec les notes »** dans la fiche : ce que les notes ajoutent, ce qu'elles contredisent, ce qui reste à vérifier. Ce n'est pas un reproche au binôme — c'est ce que la prise de notes en double est censée révéler, dans les deux sens.

## Étape 2 — Étape préalable bloquante : déterminer le rôle

**Ne commencer aucun travail de journey avant d'avoir tranché le rôle du participant.** C'est le pivot : deux rôles donnent deux jeux de colonnes, deux vocabulaires, deux définitions du succès. Se tromper de rôle, c'est refaire la fiche.

Procéder ainsi :

1. **Lire le transcript en entier** avant de rédiger quoi que ce soit.
2. **Relever chaque épisode raconté** et lui attribuer un rôle, en s'appuyant sur les marqueurs de langue — pas sur la case de recrutement, pas sur le résumé automatique, pas sur les notes.
3. **Compter.** Le rôle dominant est celui qui porte la matière : le récit détaillé, le test d'application, les objectifs de recherche visés.
4. **Annoncer le rôle retenu à l'utilisateur** en une phrase, avec le verbatim qui le prouve, avant de produire la fiche.

Marqueurs de langue (exemple covoiturage, à transposer au domaine) :

| Indice | Rôle |
|---|---|
| « j'ai **pris** quelqu'un », « je l'ai **déposé** », « j'avais deux passagers », « je **publie** » | conducteur |
| « j'ai pris **un** covoiturage », « j'ai **réservé** », « le conducteur était… », « il m'a **déposé** » | passager |
| Il **juge** la personne qui monte (« il m'a semblé habitué ») | conducteur |
| Il **juge** celui qui conduit (« il était très aimable ») | ambigu — regarder qui a pris qui |

Attention au piège du pronom : « je **l'**ai pris de X à Y », avec un complément d'objet qui désigne une personne, veut dire *je l'ai fait monter* — c'est le verbe du conducteur. « J'ai pris **un** covoiturage », avec un objet inanimé, est celui du passager.

**Si le rôle dominant reste indécidable après lecture, demander à l'utilisateur avant de produire la fiche.** C'est une décision coûteuse à refaire ; une question de dix secondes vaut mieux qu'une planche à réécrire.

### La matière de l'autre rôle n'est pas jetée, elle est mise de côté

Un participant peut raconter quelques épisodes dans l'autre rôle. Ces éléments **n'entrent pas dans les colonnes de la journey** — ils fausseraient la lecture — mais ils ne se perdent pas : les regrouper dans une section à part, intitulée par le rôle concerné, avec leurs verbatims. Ils alimenteront la planche de l'autre rôle au moment de la synthèse. Le même traitement vaut pour ce qui se passe **hors du produit** étudié.

Cas particulier à traiter avec soin : un élément qui **fait le pont** entre les deux rôles — par exemple un passé de passager qui sert d'actif au démarrage comme conducteur. Il reste dans la journey du rôle dominant, parce qu'il décrit ce rôle-là, et mérite d'être signalé comme un pont.

### Le reste du profil

Toujours établir depuis le transcript : ancienneté, volume et fréquence, statut actuel (actif / inactif). Et **signaler d'emblée si le participant n'appartient pas à la population cible** — c'est souvent le fait le plus important de l'entretien.

## Étape 3 — Remplir la journey du rôle retenu

Les deux rôles partagent la même colonne vertébrale, en miroir, pour que les douleurs se fassent face au moment de la synthèse. Exemple covoiturage, à transposer :

| | Côté offre (conducteur) | Côté demande (passager) |
|---|---|---|
| M0 | Compte & profil | Compte & profil |
| M1 | Publier | Chercher |
| M2 | Être vu | Comparer et se décider |
| M3 | Être rempli · accepter | Réserver |
| M4 | Tenir jusqu'au départ | Tenir jusqu'au départ |
| M5 | Le trajet | Le trajet |
| M6 | Après — recommencer ou pas | Après — recommencer ou pas |

Les colonnes restent identiques d'un entretien à l'autre pour un même rôle, sinon les planches ne se comparent plus. Lignes : Actions / Touchpoints / Pains / Gain points, plus les Key learnings.

### Chaque post-it porte sa source

Cinq statuts, jamais autre chose :

| Marqueur | Sens |
|---|---|
| `« … » (00:00)` | verbatim, avec sa minute dans l'enregistrement |
| `[observé]` | ce qu'il a **fait** pendant le test, sans le dire |
| `[déduit]` | notre lecture — aucune source dans l'entretien |
| `[lacune]` | la question n'a pas été posée |
| `[notes]` | vient des notes du binôme, absent de l'enregistrement |

Un post-it sans source est une affirmation intraçable. Compter les `[déduit]` et les signaler à l'utilisateur : ce sont les seules affirmations que rien ne soutient.

### Ne pas trancher ce que le participant n'a pas tranché

Quand quelqu'un se reprend en cours de phrase, ou hiérarchise puis se contredit, **écrire l'hésitation, pas la conclusion**. « Deux motivations, l'ordre reste incertain » est un résultat ; « motivation écologique d'abord », sur une phrase où il s'est repris, est une invention. Une hésitation notée comme telle devient une question à poser au participant suivant.

### Une colonne vide n'est jamais « pas de problème »

Distinguer et nommer : `[lacune]` (question non posée), « non couvert » (sujet non abordé), et **bloqué par le produit** — l'exercice n'a pas pu avoir lieu, ce qui est un **résultat**, pas un vide.

## Étape 4 — Toujours produire la section « qualité de l'entretien »

Elle vaut souvent plus que la journey, parce qu'elle corrige les entretiens suivants. Relever, avec minutage :
- questions fermées, orientées (celles qui contiennent leur réponse), doubles ;
- questions **non posées** alors que l'occasion s'est présentée — surtout quand le participant énonce spontanément le sujet d'un objectif de recherche ;
- questions dont le **rôle n'a pas été précisé**, qui rendent la réponse inexploitable ;
- reformulations de l'intervieweur qui prêtent une intention au participant sans qu'il la confirme : elles ne valent pas verbatim ;
- consignes de test données trop tard, exercices abandonnés ;
- erreurs manifestes de reconnaissance vocale à vérifier avant citation, et attributions de locuteurs douteuses ;
- silences et passages inaudibles, qui sont parfois eux-mêmes la donnée.

Signaler aussi ce qui **s'est amélioré** depuis l'entretien précédent : c'est ce qui donne envie de continuer à corriger.

## Étape 5 — Livrables

Le titre de la fiche et de la planche **nomme le rôle** : « User Journey conducteur », pas « User Journey ».

1. **Page HTML à onglets** (artifact) : synthèse d'abord, puis journey, verbatims minutés, qualité de l'entretien, post-its, transcript. Navigation par onglets et flèches du clavier, pas de longue page à scroller. Les horodatages des verbatims sont des liens `https://app.fireflies.ai/view/{id}?t={secondes}`. Ajouter la section « matière de l'autre rôle » et le « recoupement avec les notes » quand ils existent.
2. **Fichier post-its** — une ligne = un post-it, rangé par colonne et par ligne de couleur, chaque ligne portant sa source. Se colle directement dans Miro ou FigJam.
3. **Transcript markdown** — pseudonymisé (`P1`, `P2`…), nettoyage minimal (hésitations retirées, aucune reformulation), silences et inaudibles signalés à leur place, tableau des corrections de reconnaissance vocale en fin de document.
4. **Fiche markdown** dans le dossier ou le projet, pour la synthèse ultérieure.

À partir du deuxième entretien, ajouter un **onglet de comparaison** avec les précédents : ce qui converge, ce qui diverge, ce qui reste non concluant. Ne comparer que des entretiens **du même rôle** ; entre rôles différents, on ne compare pas, on met en vis-à-vis colonne par colonne.

Suivre aussi la répartition des rôles et des niveaux d'expérience au fil des entretiens, et la signaler quand elle dérive du plan de recrutement : une étude qui n'interroge qu'un seul côté du marché, ou qu'un seul niveau d'expérience, ne répondra pas aux objectifs portant sur l'autre.

## Publication dans Notion

Pour intégrer la page dans Notion, **attacher le fichier HTML**, pas le lien de l'artifact : un artifact est privé et n'afficherait rien pour le reste de l'équipe.

1. `notion-create-file-upload` avec le nom de fichier, puis `POST` multipart vers l'`upload_url` avec les `upload_headers` retournés ;
2. insérer `<embed src="file-upload://{id}">légende</embed>` avec `notion-update-page` / `update_content`.

À la mise à jour, Notion a réécrit le `src` en une URL `file://%7B…%7D` : il faut relire la page pour récupérer le `src` exact avant de le remplacer. Le fichier attaché est une **copie figée** — prévenir l'utilisateur qu'une correction de la page implique un nouvel envoi.