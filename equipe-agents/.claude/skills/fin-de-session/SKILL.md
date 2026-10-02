---
name: fin-de-session
description: "Clôture propre d'une session de travail. Déclenché quand l'utilisateur dit « fin de session » (hook UserPromptSubmit) ou par /fin-de-session. Fait l'état des lieux git, propose le merge des PR ouvertes (jamais sans son go), nettoie les branches, aligne main local sur origin, met à jour le backlog et la documentation, puis confirme qu'il peut quitter."
---

# Fin de session

Clôturer la session pour que l'utilisateur puisse quitter en laissant le dépôt **propre et aligné : local = GitHub**.

## Déroulé

1. **État des lieux**
   - `gh pr list --state open`, `git status`, `git branch -a`.
   - Résumer en clair : branche courante, travail non commité, PR ouvertes.

2. **Travail non commité**
   - Le signaler et proposer un commit au format conventionnel **avant** de partir.
   - Ne jamais commiter en douce : attendre le go.

3. **Merges : proposer, jamais décider**
   - Lister chaque PR ouverte et proposer son merge.
   - S'il répond « ok » : merge (ou auto-merge si la CI tourne encore). S'il répond « c'est fait » : ne pas re-merger, continuer.
   - Le vrai filet est côté serveur : la protection de `main` refuse tout merge sur CI rouge, quel que soit le chemin.

4. **Nettoyage**
   - Supprimer les branches mergées, distantes puis locales.
   - `git fetch --prune`.

5. **Alignement**
   - `git checkout main && git pull`. Arbre propre.

6. **Documentation**
   - Backlog : les US livrées passent à « Terminé », avec une note de merge.
   - `CLAUDE.md`, README : corriger toute dérive introduite pendant la session.
   - `DECISIONS.md` : ajouter les décisions prises aujourd'hui.

7. **Confirmation**
   - « ✅ Tout est aligné (local = GitHub). Tu peux quitter. »
   - Si un point reste ouvert, le dire au lieu de confirmer.
