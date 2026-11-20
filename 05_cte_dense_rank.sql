-- TP SQL Avancé - Question 5 : top 2 des produits les plus chers par catégorie

WITH classement AS (
    SELECT cat.nom AS categorie,
           p.nom   AS produit,
           p.prix_unitaire,
           DENSE_RANK() OVER (PARTITION BY p.categorie_id ORDER BY p.prix_unitaire DESC) AS rang
    FROM produits p
    JOIN categories cat ON cat.id = p.categorie_id
)
SELECT categorie, produit, prix_unitaire, rang
FROM classement
WHERE rang <= 2
ORDER BY categorie, rang;
