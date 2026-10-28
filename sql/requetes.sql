=

CREATE TABLE IF NOT EXISTS categories (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    nom         TEXT NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE IF NOT EXISTS produits (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    nom          TEXT NOT NULL,
    prix         REAL NOT NULL CHECK (prix >= 0),
    quantite     INTEGER NOT NULL DEFAULT 0 CHECK (quantite >= 0),
    disponible   INTEGER NOT NULL DEFAULT 1,
    date_ajout   TEXT NOT NULL,
    categorie_id INTEGER NOT NULL,
    FOREIGN KEY (categorie_id)
        REFERENCES categories(id) ON DELETE RESTRICT
);


-- =========================================================

PRAGMA foreign_keys = ON;



PRAGMA foreign_keys;

SELECT * FROM produits;

SELECT * FROM produits
WHERE quantite = 0;

SELECT * FROM produits
ORDER BY prix DESC;

SELECT p.nom AS produit, c.nom AS categorie
FROM produits AS p
INNER JOIN categories AS c ON p.categorie_id = c.id;

SELECT c.nom AS categorie, COUNT(p.id) AS nombre_produits
FROM categories AS c
LEFT JOIN produits AS p ON p.categorie_id = c.id
GROUP BY c.id, c.nom;

SELECT SUM(prix * quantite) AS valeur_totale_stock
FROM produits;

INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test prix', -5, 1, '2026-10-05T08:00:00', 1);


INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test catégorie', 1, 1, '2026-10-05T08:00:00', 99);

DELETE FROM categories WHERE id = 1;

