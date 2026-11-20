-- TP SQL Avancé - Question 6 : organigramme récursif

WITH RECURSIVE organigramme AS (
    SELECT id, nom, 1 AS niveau, nom AS chemin
    FROM employes
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.id, e.nom, o.niveau + 1 AS niveau, o.chemin || ' > ' || e.nom AS chemin
    FROM employes e
    JOIN organigramme o ON e.manager_id = o.id
)
SELECT id, nom, niveau, chemin
FROM organigramme
ORDER BY niveau, id;
