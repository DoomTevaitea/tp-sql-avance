-- TP SQL Avancé - Question 1 : audit EXPLAIN ANALYZE

EXPLAIN ANALYZE
SELECT *
FROM commandes
WHERE YEAR(date_commande) = 2026
  AND statut = 'LIVREE'
ORDER BY montant_total DESC
LIMIT 10;

-- Plan obtenu : Limit -> Sort (montant_total DESC) -> Seq Scan sur commandes (240 lignes)
-- Coût total : 74.16 - Temps : 8.53 ms

-- Défaut 1 : Seq Scan complet sur commandes, car YEAR(date_commande) = 2026 n'est pas SARGable
-- (la fonction sur la colonne empêche d'utiliser un index).

-- Défaut 2 : aucun index sur date_commande, donc le moteur lit tout puis fait un Sort coûteux.
-- En plus, SELECT * lit toutes les colonnes inutilement.
