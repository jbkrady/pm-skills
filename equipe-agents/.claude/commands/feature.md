---
description: Implémente une fonctionnalité de bout en bout (explorer → cadrer → coder → tester → commit), avec un point de contrôle humain avant tout commit.
argument-hint: <description de la fonctionnalité>
---

Objectif : implémenter de bout en bout la fonctionnalité suivante :

**$ARGUMENTS**

Déroule ces étapes, avec un **point de contrôle humain avant tout commit** :

1. **Explorer** : le sous-agent **Explore** (lecture seule) comprend le code existant concerné. Résume en quelques lignes ce qui sera touché.
2. **Cadrer** : 3 à 5 puces de plan, **périmètre minimal**, dans le respect de `CLAUDE.md`. Si l'US n'est pas cadrée, passer d'abord par SAM.
3. **Implémenter** : confier le code à **alex**. Changements minimaux, code commenté, migration si nécessaire. S'il touche un domaine couvert par un skill à la demande, lui rappeler de l'invoquer.
4. **Tester** : confier la validation à **chris** : tests unitaires et de bout en bout du parcours critique, en mobile et réseau lent. Verdict **GO / NO-GO**.
5. **Commit** : si **GO** et après validation explicite de l'humain, proposer un commit conventionnel : `feat(scope): description`.

Ne déploie **jamais** en production sans validation humaine explicite. Pour un écran ou un parcours, utiliser plutôt `/dev-front`.
