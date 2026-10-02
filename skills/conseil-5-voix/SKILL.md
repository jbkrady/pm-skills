---
name: conseil-5-voix
description: "Restitution en page HTML à onglets épurée (verdict en premier, lexique), verdict adapté au type de décision, pré-mortem, vote chiffré et checklist des données — sans orientation produit."
---

# Trigger

- Proactif : dès que l'utilisateur décrit une décision où il hésite à s'engager, quel que soit le domaine (une feature, un choix de priorisation, un pivot, un investissement, un recrutement, un go/no-go, un choix de prestataire ou d'orientation). Toujours demander confirmation avant de lancer le conseil complet, vu le coût en agents — sauf s'il le nomme explicitement.
- Explicite : "conseil des 5 voix", "5 voix", "challenge cette décision", "lance le conseil", ou variantes.

# Étapes

0. Checklist des données : avant de convoquer le conseil, inventorier les données clés que le dossier fournit et celles qui manquent (chiffres invérifiés, segments absents, estimations non challengées). Ne jamais combler un manque par une invention : les manques sont listés tels quels dans le cadrage envoyé aux voix, et rappelés dans la synthèse. Si un manque paraît bloquant, le signaler à l'utilisateur avant de lancer — il fournit la donnée ou assume de lancer sans.
1. Cadrer le sujet en une ou deux phrases neutres, envoyées identiquement aux 5 voix — aucun biais de cadrage initial, aucune indication de ce que l'utilisateur penche à faire, aucune mention du dispositif (ni "conseil", ni rôles, ni méthode).
2. Phase 1 — Rapports indépendants, en parallèle : chacun des 5 conseillers reçoit le sujet + son mandat + ses interdits (voir tableau) et produit un rapport de ~150-250 mots. Le Chasseur de failles travaille en pré-mortem : « la décision a été prise, nous sommes six mois plus tard et c'est un échec — raconte pourquoi », classé Probabilité × Impact. Chaque voix peut chercher des sources externes réelles si ça sert son mandat propre. Le Regard naïf le fait par défaut, en jugeant lui-même si le sujet a quelque chose à benchmarker (pas de recherche forcée sur un sujet purement interne sans équivalent marché).
3. Phase 2 — Un tour de réaction, en parallèle : chaque conseiller reçoit les 4 autres rapports (jamais le sien) et écrit UNE réaction courte (~80-120 mots) : ce qu'il maintient, ce qu'il nuance, ce qu'il conteste chez les autres. Il reste strictement dans son couloir. Chaque réaction se termine par un vote chiffré : une note de 0 à 10 par option en jeu (ou pour la décision unique), depuis le seul point de vue de son mandat. Le Recadreur peut voter « question mal posée » au lieu de noter.
4. Phase 3 — Synthèse : un rôle de synthèse neutre lit les 5 rapports + les 5 réactions + les votes, pèse les 5 voix à égalité (pas de veto automatique), et rend un verdict adapté au type de décision : pour un go/no-go, exactement OUI / NON / OUI SOUS CONDITION (avec conditions explicites à lever) ; pour un choix entre plusieurs options, OPTION(S) RETENUE(S) classées + conditions, avec les écartées et leurs raisons. La synthèse dit explicitement ce qu'elle retient ou écarte de chacune des 5 voix — jamais de voix ignorée en silence — et cite les votes quand ils éclairent une divergence.
5. Livrer en deux temps :
   - En conversation : le verdict et l'essentiel en quelques phrases — pas le délibéré complet.
   - En artifact HTML (le livrable standard du skill) : une page à onglets, sobre et professionnelle, adaptée au domaine du sujet (jamais un habillage « produit » par défaut).

# Standard de restitution (la page HTML)

- Verdict en bandeau compact tout en haut, avant toute navigation — jamais d'emoji, jamais de méta-commentaire sur la méthode ou le nombre d'agents.
- Menu horizontal d'onglets sous le verdict, navigable au clic et aux flèches ← → du clavier ; ne pas afficher d'aide de navigation sur la page.
- Ordre des onglets : Contexte (la situation et les chiffres clés en langage simple) → Décision (l'option ou les options retenues, avec le séquencement si pertinent) → Conditions → Écartées → Les 5 voix (résumé de chaque voix, rapport complet et réaction repliés par défaut) → Critères de vérification (comment savoir plus tard que la décision était la bonne) → Lexique.
- Aucun terme de jargon sans définition : tooltip au survol dans le texte ET entrée dans l'onglet Lexique ; tout calcul implicite y est explicité (taux cumulés, capacités, pondérations…).
- Sources externes du Regard naïf cliquables dans son rapport complet.
- Thèmes clair et sombre soignés ; design épuré, hiérarchie typographique nette, sections tenant à peu près dans un écran.

# Les 5 mandats — ne jamais les mélanger

| Conseiller | Sa seule obsession | Ce qu'il ne fait jamais |
|---|---|---|
| Le Chasseur de failles | Pourquoi ça va échouer, en pré-mortem, classé par gravité (Probabilité × Impact) | Proposer une solution — il détecte, il ne corrige pas |
| Le Recadreur | Remettre en cause la question elle-même, pas seulement la réponse | Accepter le cadrage du problème tel qu'il est posé |
| Le Détecteur d'angles morts | Ce que personne n'a mentionné, les opportunités croisées | Répéter ce que les autres ont déjà dit |
| Le Regard naïf | Benchmarker avec de vraies sources externes, sans connaître le secteur | Inventer un chiffre, ou conclure par un classement ou une recommandation |
| L'Exécutant | Le chemin le plus rapide et faisable, avec un vrai séquençage | Discuter de la pertinence de l'idée — il part du principe qu'on avance |

# Garde-fous anti-débordement (à rappeler dans CHAQUE prompt individuel, pas seulement en principe général)

- Le Chasseur de failles ne propose jamais de solution, même en passant — il s'arrête à la détection et au classement de gravité.
- Le Recadreur ne débat jamais à l'intérieur du cadre posé — s'il n'a rien à redire au cadrage, il le dit et s'arrête là plutôt que de glisser vers un avis sur le fond.
- Le Détecteur d'angles morts vérifie activement, avant d'écrire, qu'aucun des 4 autres rôles n'a déjà couvert son point.
- Le Regard naïf ne cite jamais un chiffre, une tendance ou un exemple sans source vérifiable à l'appui — et ne conclut jamais son rapport par une priorisation ou une recommandation : il livre des faits sourcés, la hiérarchisation appartient à la synthèse (son vote chiffré de phase 2 est le seul endroit où il classe).
- L'Exécutant ne remet jamais en cause si on doit avancer — seulement comment, et dans quel ordre.
- La synthèse n'est pas une 6e opinion libre : elle doit être traçable jusqu'aux 5 voix, jamais un avis nouveau non ancré dans leurs rapports.

# Orchestration technique

Utiliser le Workflow tool : phase 1 en agents parallèles, phase 2 en agents parallèles ayant chacun accès aux 4 rapports des autres (réaction + vote dans le même appel), phase 3 en agent de synthèse séquentiel après la phase 2. Attention aux schémas de sortie structurée : clés ASCII uniquement (pas d'accents dans les noms de propriétés). L'invocation de ce skill vaut opt-in explicite à l'orchestration multi-agents pour cette exécution.

# Vérification

Avant de livrer : relire les 5 rapports et les 5 réactions pour confirmer qu'aucune voix n'a débordé de son couloir (ex : Chasseur qui propose une solution, Regard naïf qui classe, Exécutant qui juge la pertinence) ; confirmer que le verdict correspond au mode de décision (3 valeurs pour un go/no-go, options classées pour un choix) et que chacune des 5 voix est explicitement mentionnée dans la synthèse. Puis vérifier la page : verdict en premier, aucun terme de jargon sans définition, aucun méta-texte sur la méthode ou le dispositif, aucune aide de navigation affichée, onglets navigables aux flèches, thèmes clair/sombre lisibles.