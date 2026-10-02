---
name: cours-augmente
description: "Transforme un support de cours (PDF) + des notes ou un transcript (Fireflies) en cours augmenté et interactif : fil principal, bonus repliable, exercices et quiz corrigés, livré en .md + HTML à onglets."
---

# Cours augmenté à partir d'un support + notes ou transcript

## Quand se déclencher
L'utilisateur fournit le support d'un cours (PDF, éventuellement scanné) et un second document — soit ses notes de séance, soit un transcript brut (Fireflies ou équivalent) — et veut en tirer un cours structuré et interactif, pas un simple résumé.

## Entrées requises
1. Le PDF du support. Si l'extraction de texte classique renvoie vide ou clairsemé, traiter comme un scan (charger le skill `pdf-ocr`).
2. Un second document, dont la nature change tout le traitement en aval :
   - **Notes** : déjà triées et condensées par l'utilisateur, à lire telles quelles.
   - **Transcript** : chronologique, verbeux, avec horodatages/locuteurs, rien n'y est trié — nécessite un traitement dédié (étape 1).

Si l'un des deux documents manque, le demander avant de commencer. Ne jamais fabriquer un exemple, un chiffre ou une citation absent des deux sources.

## Étape 1 — Extraction
- PDF : extraire le texte intégral en conservant l'ordre des slides/sections.
- Notes : lire telles quelles.
- Transcript : le caler sur l'ordre des slides pour repérer les bascules de sujet ; dédupliquer répétitions et tics de langage ; isoler les échanges questions-réponses du reste ; convertir l'oral en phrases écrites propres sans reformuler au point de perdre une nuance ou un chiffre exact.

## Étape 2 — Croisement support / vécu
Classer chaque élément du support en trois catégories, jamais mélangées :
- **Fil principal** — confirmé/développé dans les notes ou le transcript : à détailler en entier avec l'exemple complet (hypothèses, chiffres, résultats).
- **Bonus support** — présent seulement dans le PDF, jamais mentionné en direct : conservé mais dans un bloc repliable clairement étiqueté (« pas dans tes notes » / « pas mentionné en séance »).
- **Ajout formateur** — dit en direct mais absent du PDF : intégré et étiqueté explicitement comme tel, jamais présenté comme faisant partie du support officiel.

Pour un transcript, toute affirmation classée « ajout formateur » doit être traçable à un horodatage précis — ne pas l'inclure si elle ne peut pas être sourcée.

## Étape 3 — Clarifier avant de construire
Poser en une seule fois, avant de générer quoi que ce soit :
- Profondeur voulue : cours complet + exercices, cours sans exercices, ou fiche de révision condensée ?
- Que faire du « bonus support » : le garder replié, le couper entièrement, ou le développer au même niveau que le fil principal ?
- Où livrer : un dossier connecté sur l'ordinateur, un projet Claude, ou seulement dans la conversation ?

## Étape 4 — Construire le contenu pédagogique
- Développer chaque concept avec son exemple concret tiré des sources — jamais un exemple générique inventé pour combler un vide.
- Nommer explicitement le motif réutilisable derrière chaque méthode (ex. « Parmi [population homogène], la métrique est-elle meilleure pour ceux qui ont fait X ? »).
- Définir en français simple tout terme métier non trivial (KPI, churn, tipping point, variable de confusion, etc.) — aucun jargon non expliqué.
- Ajouter des exercices d'application originaux (jamais des redites du cours), chacun avec un corrigé modèle, présenté replié par défaut.
- Ajouter un quiz de 8 à 12 questions couvrant l'ensemble du cours, réponse repliée sous chaque question.
- Pour tout concept quantitatif qui s'y prête (moyenne/distribution, calcul de significativité, dispersion...), construire un petit widget interactif en JS natif (l'utilisateur manipule une variable et voit le résultat changer) plutôt qu'une image statique.

## Étape 5 — Mise en forme HTML
- Charger le skill `artifact-design` avant d'écrire la page.
- Structurer en **navigation par onglets horizontaux, avec défilement aux flèches du clavier** — jamais une page à scroll long avec simple sommaire latéral. C'est le format commun des livrables HTML de cette bibliothèque (`analyse-entretien-user-journey`, `conseil-5-voix`).
- Choisir une palette et une typographie spécifiques au sujet du cours — jamais un thème visuel recyclé à l'identique d'un cours à l'autre.
- Donner un traitement visuel distinct à chaque structure de sens différent (une séquence d'étapes, une liste d'erreurs indépendantes, une liste de définitions, une comparaison ne se dessinent pas pareil) — ne jamais réutiliser le même composant visuel pour deux structures différentes dans la même page.
- Garder chaque affirmation tirée du live traçable (numéro de slide ou horodatage) si l'utilisateur la questionne.

## Étape 6 — Livraison
- Toujours deux formats : un `.md` (prêt pour Notion, corrections en clair) et une page HTML interactive publiée en artifact.
- Écrire le `.md` à l'emplacement indiqué à l'étape 3 — jamais une hypothèse de dossier fixe.
- Conclure par un résumé d'une phrase de ce qui a été livré, jamais une récapitulation détaillée puisque l'utilisateur peut ouvrir les fichiers lui-même.