# user-story

**Le problème :** des user stories écrites vite, sans risque identifié, sans cas d'erreur, et numérotées de mémoire.

**Ce que fait le skill :** une interview en 4 étapes (descriptif, intitulé, UX et technique, critères d'acceptation), puis une US au format Scrum enrichi : contexte, story, règles de gestion, contraintes produit, critères Given / When / Then, risque et mitigation, dépendances.

**Ce qui le rend réutilisable :** il ne contient aucun contexte produit. On lui donne un fichier `contexte-produit.md` (voir [l'exemple fictif](exemple-contexte-produit.md)), et il lit les US existantes dans le backlog au lieu d'une liste figée.

**Exemple (fictif) :**
> « Crée une US pour que l'atelier puisse refuser une réservation. »

Le skill vérifie le backlog, propose « US-018 | Refus de réservation | P1 | Persona : Atelier », puis déroule les 4 étapes.
