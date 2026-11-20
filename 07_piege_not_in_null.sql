-- TP SQL Avancé - Question 7 : piège du NOT IN

-- Requête piégée : renvoie 0 ligne
SELECT id, nom FROM employes WHERE id NOT IN (SELECT manager_id FROM employes);

-- Explication : la CTO a manager_id = NULL. "id <> NULL" vaut UNKNOWN,
-- donc la condition NOT IN n'est jamais vraie et aucune ligne n'est renvoyée.

-- Correction avec NOT EXISTS
SELECT e.id, e.nom
FROM employes e
WHERE NOT EXISTS (SELECT 1 FROM employes s WHERE s.manager_id = e.id);
