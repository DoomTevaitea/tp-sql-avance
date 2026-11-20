A corriger

# TP SQL Avancé & Bases NoSQL

**Nom :** DOOM
**Prénom :** Tevaitea

Bachelor Développeur Full-Stack, 2e année, CODA Orléans. Rendu du vendredi 20 novembre 2026.

## Environnement

Simulateur DataLab B2 : https://sql-avance.webdevoo.com/

## Scripts

| Fichier | Question |
| --- | --- |
| `01_audit_explain_analyze.sql` | A.1 : audit EXPLAIN ANALYZE avec `YEAR(date_commande) = 2026`, les 2 défauts du plan |
| `02_index_partitionnement_sargable.sql` | A.2 : partitionnement RANGE, index composite couvrant, requête SARGable, Partition Pruning |
| `03_vue_materialisee.sql` | A.3 : vue matérialisée `mv_synthese_segments`, constat stale, REFRESH |
| `04_normalisation_3fn.sql` | B.4 : passage de `affectations_brutes` en 3FN (DF, PK, FK, migration) |
| `05_cte_dense_rank.sql` | B.5 : CTE + `DENSE_RANK`, top 2 des produits les plus chers par catégorie |
| `06_recursive_organigramme.sql` | B.6 : `WITH RECURSIVE`, organigramme avec `niveau` et `chemin` |
| `07_piege_not_in_null.sql` | C.7 : piège `NOT IN` avec NULL, correction `NOT EXISTS` |
| `08_transactions_isolation_wal.sql` | C.8 : Non-Repeatable Read en READ COMMITTED, REPEATABLE READ, rôle du WAL |
| `09_architecture_polyglotte.sql` | C.9 : architecture polyglotte justifiée par CAP / PACELC et la grille de décision |

## Ordre d'exécution

Les scripts s'exécutent dans l'éditeur SQL du simulateur, dans l'ordre des numéros. Le partitionnement (02) s'active avec le bouton « Activer ». Le script 08 correspond au simulateur ACID du module 06.
