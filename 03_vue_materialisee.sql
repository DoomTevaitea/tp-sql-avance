-- TP SQL Avancé - Question 3 : vue matérialisée

CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT cl.segment,
       COUNT(c.id)                    AS nb_commandes,
       ROUND(SUM(c.montant_total), 2) AS ca_total
FROM commandes c
JOIN clients cl ON cl.id = c.client_id
GROUP BY cl.segment;

SELECT segment, nb_commandes, ca_total FROM mv_synthese_segments;
-- PME : 70 commandes - 325875.7 €

-- Commande test pour le client 24 (segment PME)
INSERT INTO commandes (id, client_id, date_commande, statut, canal, montant_total)
VALUES (241, 24, '2026-11-20', 'LIVREE', 'WEB', 1500.00);

SELECT segment, nb_commandes, ca_total FROM mv_synthese_segments;
-- La vue est marquée obsolète (stale) : PME est toujours à 70 commandes

REFRESH MATERIALIZED VIEW mv_synthese_segments;

SELECT segment, nb_commandes, ca_total FROM mv_synthese_segments;
-- Après le refresh : PME passe à 71 commandes - 327375.7 €
