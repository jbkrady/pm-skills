---
description: Boucle de développement front fidèle à la maquette (MAX cadre → humain et SAM figent → ALEX code → CHRIS recette → humain merge). À utiliser pour tout écran, interface ou parcours.
argument-hint: <écran ou parcours à construire (ex. "écran de réservation US-012")>
---

Objectif : construire l'élément front suivant **dans le bon ordre**, pour ne jamais livrer un rendu « à côté » de la maquette :

**$ARGUMENTS**

> Pourquoi cette boucle existe : un écran a déjà été livré non fidèle à la maquette. Deux causes : un périmètre rétréci, et une boucle de fidélité jamais fermée (le rendu avait été paraphrasé depuis du texte au lieu d'être comparé aux vrais écrans). Ne pas rejouer ces causes.

Déroule ces étapes **dans l'ordre**, avec un **point de contrôle humain avant tout code et avant tout merge**. L'orchestrateur (la session principale) délègue et relaie ; il ne rend jamais de verdict de conformité, c'est le rôle de CHRIS.

## 1. Cadrage sur la maquette (MAX)
- MAX **ouvre et regarde les vrais écrans** de la maquette, à la source. **Interdiction de paraphraser depuis du texte.**
- Il cartographie l'existant face à la maquette, vérifie les US dans le backlog, et propose les écrans cibles **fidèles à la maquette**.
- Ne pas rétrécir le périmètre au point de perdre des écrans. Si on n'en prend qu'une partie, elle doit **ressembler aux écrans sources**.
- Livrable : une préco complète à SAM. MAX ne code pas.

> Si l'outil de maquette n'est pas disponible pour un agent en arrière-plan : lancer MAX au premier plan, ou récupérer les écrans sur disque et lui passer les chemins. **Jamais de cadrage sans les écrans.**

## 2. Arbitrage (l'humain, avec SAM)
- L'humain donne ses recommandations sur les écrans ; SAM tranche **avec lui**. Rien ne part en code avant.

## 3. US figée (SAM)
- SAM aligne les critères écrits de l'US sur la maquette et le design system (plus aucun écart entre le texte et l'écran), trace la DoD, met le backlog à jour.

## 4. Implémentation (ALEX)
- `frontend-design` préchargé, **suivre son process** : plan des tokens (couleur, typographie, mise en page, signature), auto-critique contre les défauts génériques, construction, **capture de vérification**.
- **Reproduire fidèlement** les écrans, avec des **captures mobile comparées écran par écran à la maquette** : c'est ce qui ferme la boucle de fidélité.
- Respecter les contraintes et les règles de rédaction de `CLAUDE.md`. Ne pas simplifier en silence les détails visuels.
- Branche dédiée `feat/*`, jamais `main`. ALEX ne s'auto-valide pas et ne merge pas.

## 5. Recette (CHRIS)
- Chrome **et** vrai Safari, mobile, réseau lent.
- Fonctionnel **et fidélité visuelle à la maquette (item bloquant)**, contraste AA, focus clavier, `prefers-reduced-motion`, règles de rédaction vérifiées par recherche.
- Verdict **GO / NO-GO**, anomalies bloquantes ou mineures, avec la reproduction.

## 6. Merge (l'humain uniquement)
- Après le GO de CHRIS et la validation explicite de l'humain. **Seul l'humain merge.**

Si une décision sort du périmètre MVP ou touche un nouveau flux, arrête-toi et repasse par le cadrage MAX → SAM → humain.
