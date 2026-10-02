# spec-creator

**Le problème :** une spec floue produit un développement flou, et deux mécanismes mélangés dans une même spec tombent entre deux chaises.

**Ce que fait le skill :** il lit les sources existantes, pose toutes les questions manquantes en une fois, verrouille le périmètre en une phrase (et propose de découper si besoin), puis rédige la spec en 11 sections : contexte, user stories, releases, critères d'acceptation, règles de gestion, cas limites, designs, tracking, rollout, tests, points ouverts.

**Exemple (fictif) :**
> « Rédige la spec du rappel de rendez-vous d'Atelier Vélo. »

Le skill pose ses questions (acteur et bénéficiaire, KPI, existant contre nouveau…), puis signale : « La phrase de périmètre a besoin d'un "et" (rappel + replanification) : je propose deux specs. »

**Principe :** le quoi et le pourquoi, jamais le comment. Aucun fait inventé : ce qui manque devient un point ouvert.
