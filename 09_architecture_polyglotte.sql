-- TP SQL Avancé - Question 9 : architecture polyglotte (covoiturage)

-- (a) GPS de 30 000 véhicules toutes les 3 s (10 000 écritures/s) : Cassandra
--     Un petit retard est acceptable, écritures massives, séries temporelles.
--     CAP : AP - PACELC : PA/EL

-- (b) Facturation bancaire : PostgreSQL
--     Aucune erreur tolérée sur l'argent, transactions ACID, données relationnelles.
--     CAP : CP - PACELC : PC/EC

-- (c) Amis communs et itinéraires à 3 degrés : Neo4j
--     Réseau de relations, parcours sur 3 niveaux sans jointures lourdes.
--     CAP : CP - PACELC : PC/EC

-- Les 4 critères : cohérence, scalabilité, structure des données, nature des accès.
-- Chaque besoin a sa base adaptée : c'est une architecture polyglotte.
