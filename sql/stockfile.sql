-- Q1.5.1 : Tous les produits
SELECT * FROM produits;
-- Q1.5.2 : Produits en rupture de stock
SELECT * FROM produits
WHERE quantite = 0;
-- Q1.5.3 : Produits du plus cher au moins cher
SELECT * FROM produits
ORDER BY prix DESC;
-- Q1.5.4 : Nom de chaque produit et de sa catégorie
SELECT p.nom AS produit, c.nom AS categorie
FROM produits AS p
INNER JOIN categories AS c ON p.categorie_id = c.id;
-- Q1.5.5 : Nombre de produits par catégorie (y compris celles sans produit)
SELECT c.nom AS categorie, COUNT(p.id) AS nombre_produits
FROM categories AS c
LEFT JOIN produits AS p ON p.categorie_id = c.id
GROUP BY c.id, c.nom;
-- Q1.5.6 : Valeur totale du stock
SELECT SUM(prix * quantite) AS valeur_totale_stock
FROM produits;