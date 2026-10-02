---
name: interview-guide-interactif
description: "Génère une grille d'entretien interactive (HTML) à partir de questions déjà validées : fiches par persona, cases à cocher, notes, sauvegarde par entretien + historique, export Markdown vers Notion."
---

# Grille d'entretien interactive

## Quand utiliser ce skill

L'utilisateur a déjà ses questions d'entretien validées (par un pair, un mentor ou son équipe) et veut un outil de terrain pour les mener : une page que lui et son équipe ouvrent pendant chaque entretien, où cocher les questions abordées, prendre des notes, enregistrer chaque entretien séparément, et exporter vers Notion. Ce skill couvre la transformation "questions validées → outil interactif", pas la construction du script lui-même.

## Étape 0 — toujours valider la structure avant de générer

Ne JAMAIS partir directement sur la page HTML. Avant de générer quoi que ce soit :

1. Récupérer les questions brutes fournies (texte collé, notes, etc.).
2. Proposer en texte la structure envisagée : liste des personas/fiches, et pour chaque persona la liste des blocs de questions avec leur objectif de recherche associé (goal). Si des blocs sont mutualisés entre plusieurs personas (ex. "Intermédiaire & Ambassadeurs" dans une seule fiche avec des sous-blocs tagués), le signaler explicitement.
3. Attendre la validation ou les ajustements de l'utilisateur avant de construire le HTML. Ne pas construire en parallèle "au cas où".

Si le contexte recherche (business challenge, existing knowledge/data, research goals) est disponible dans la conversation ou la mémoire, le proposer aussi pour le panneau de rappel — sans jamais inventer des chiffres non fournis.

## Étape 1 — construire la page HTML

Une fois la structure validée, générer un artefact HTML autonome (charger le skill `artifact-design` avant d'écrire le code, comme pour tout artefact). Utiliser ce gabarit visuel par défaut, et le garder d'un projet à l'autre plutôt que d'improviser un nouveau design à chaque fois :

- **Typographie** : IBM Plex Sans (texte/UI) + IBM Plex Mono (chiffres, compteurs, dates) via Google Fonts.
- **Palette** : ton sauge/teal neutre (fond clair `#F4F7F5`, accent teal `#1B6B63`, surbrillance ambre discrète `#8A5A1E` pour les stats) avec variante sombre cohérente (voir règles `artifact-design` sur les trois états de thème).
- **Layout** : rail de navigation à gauche (onglets = personas, avec barre de progression et compteur par fiche) + contenu principal à droite ; sur mobile le rail passe en onglets horizontaux scrollables.
- **Panneau de rappel** ("Rappel — objectifs de la recherche") en haut de page, repliable : business challenge, existing knowledge (stats si connues), research goals numérotés. Optionnel si pas de contexte fourni.

Pour chaque fiche persona, générer dans cet ordre :
1. En-tête : nom de la fiche, barre de progression globale, bouton "Réinitialiser cette fiche".
2. Ligne "participant" : champ pseudo/prénom (obligatoire pour sauvegarder), champ date (pré-rempli à aujourd'hui), et si la fiche mutualise plusieurs sous-profils (ex. Intermédiaire/Ambassadeur), un sélecteur pour préciser lequel — plus le bouton "Enregistrer l'entretien".
3. Script d'introduction (bloc repliable, ton "speech" complet fourni par l'utilisateur ou à défaut un gabarit générique à adapter — jamais inventer un discours définitif sans le signaler comme brouillon).
4. Chaque bloc de questions : titre, tag persona si le bloc est spécifique à un sous-profil dans une fiche mutualisée, référence à l'objectif de recherche concerné, liste de questions à cocher (avec relances affichées en italique sous la question), et un encart notes (textarea) en bas de bloc.
5. Script de conclusion (bloc repliable).
6. Bloc "Historique des entretiens" : liste des entretiens déjà enregistrés pour cette fiche, chacun avec nom/date/sous-profil, compte de questions abordées par bloc, notes, un bouton "Copier" (export Markdown de cet entretien) ; et en haut du bloc historique un bouton "Copier tout en Markdown".

## Étape 2 — stockage : toujours en local + export par défaut

Par défaut, ne PAS proposer la base de données partagée (`db` capability) sans demande explicite. Cette option a une limite structurelle : `db` ne fonctionne qu'entre membres d'une même organisation Claude, ce qui ne couvre presque jamais une équipe projet dont chacun a son propre compte individuel. Le mode par défaut est donc :

- Sauvegarde des cases/notes en cours via `localStorage`, propre à chaque navigateur.
- "Enregistrer l'entretien" archive l'entretien courant (participant + cases cochées + notes) dans un historique local, puis réinitialise la fiche de travail pour l'entretien suivant.
- Boutons de copie Markdown (par entretien et "tout l'historique") pour que chacun ramène ses données dans leur outil commun (Notion, etc.) après chaque session.

Si l'utilisateur demande explicitement une base partagée entre plusieurs personnes, rappeler d'abord la contrainte organisation avant de l'activer (charger `artifact-capabilities`), et vérifier que la page n'est pas en partage public avant de déclarer `capabilities: {db: {}}` (le déploiement échoue sinon avec un message explicite — dans ce cas, demander à l'utilisateur de désactiver le partage public depuis le menu de partage de la page : lui seul peut le faire).

## Étape 3 — publication

Cet outil est fait pour être réouvert à chaque entretien : toujours le persister via l'outil Artifact (jamais un simple envoi de fichier en pièce jointe). Redéployer sur la même URL à chaque itération/correction demandée plutôt que créer un nouvel artefact, sauf s'il s'agit clairement d'un nouveau projet de recherche distinct.

## Ce qu'il ne faut pas faire

- Ne jamais générer le HTML avant que l'utilisateur ait validé la structure blocs/personas/objectifs proposée en texte.
- Ne pas réinventer un nouveau design à chaque projet — réutiliser le gabarit établi (voir Étape 1), sauf si l'utilisateur demande explicitement un style différent.
- Ne pas activer la base partagée (`db`) par défaut — c'est une option à la demande, avec rappel de la contrainte d'organisation.
- Ne pas inventer de chiffres d'existing knowledge ou d'objectifs non fournis dans le panneau de rappel.