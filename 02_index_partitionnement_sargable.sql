-- TP SQL Avancé - Question 2 : index, partitionnement et requête SARGable

-- 1. Index sur la date de commande
CREATE INDEX idx_cmd_date ON commandes(date_commande);

-- 2. Partitionnement RANGE (2024 / 2025 / 2026) : activé avec le bouton "Activer" du simulateur

-- 3. Requête réécrite (SARGable, sans SELECT *)
EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total
FROM commandes
WHERE statut = 'LIVREE'
  AND date_commande >= '2026-01-01'
  AND date_commande <  '2027-01-01'
ORDER BY montant_total DESC
LIMIT 10;

-- Comparaison du coût total :
--   Avant (Seq Scan)                 : 74.16 - 8.53 ms
--   Avec l'index (Index Scan)        : 16.95 - 0.83 ms
--   Index + partitionnement          : 14.73 - 0.83 ms

-- Partition Pruning : le filtre porte directement sur date_commande, donc le moteur
-- ne lit que la partition commandes_2026 (1/3 des données au lieu de 3/3).
-- Avec YEAR(date_commande), il ne pourrait pas éliminer les autres partitions.
