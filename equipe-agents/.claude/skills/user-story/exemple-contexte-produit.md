# Contexte produit : Atelier Vélo (exemple fictif)

> Exemple de fichier à fournir au skill `user-story`. Produit inventé : à remplacer par le vôtre.

## Le produit

Application web mobile-first pour réserver une réparation de vélo dans un atelier de quartier. Le produit, c'est le créneau garanti : on ne fait pas la queue, l'atelier sait d'avance ce qu'il va réparer.

## Personas

- `Cycliste` : 25-45 ans, en ville, vélo quotidien pour aller travailler. Réserve depuis son téléphone, souvent dans les transports.
- `Atelier` : réparateur indépendant, 1 à 3 mécaniciens, gère son planning sur une tablette au comptoir.
- `Admin` : back-office de la plateforme.
- `Transversal` : concerne plusieurs personas.

## Épics

Réservation · Diagnostic en ligne · Planning atelier · Paiement · Avis · Notifications · Admin.

## Contraintes structurantes

- **Mobile d'abord** : écrans de 360 à 414 px, une main, en mouvement.
- **Paiement** : carte bancaire au moment de la réservation, acompte de 10 €, solde payé à l'atelier.
- **Notifications** : e-mail et notification web. Pas de SMS (coût).
- **Atelier** : jamais plus de 2 réservations par créneau d'une heure, fixé par l'atelier.
- **Langue** : français.

## Priorités

`P0` = MVP (mois 1 à 3, un seul quartier) · `P1` = mois 4 à 6 · `P2` = plus tard.

## Backlog

Base Notion « Backlog Atelier Vélo » : la seule source pour les numéros d'US et leur état.
