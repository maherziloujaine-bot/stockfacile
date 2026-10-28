 Q1.3 — Structure de la base de données

- **`disponible`** est stocké en `INTEGER` : `1` pour vrai et `0` pour faux.
- **`date_ajout`** est stockée en `TEXT`, au format ISO 8601, par exemple `2026-10-28T15:30:00`.

- **`AUTOINCREMENT`** : associé à `INTEGER PRIMARY KEY`, il génère automatiquement un identifiant et empêche la réutilisation des identifiants déjà utilisés par des lignes précédemment enregistrées, même après leur suppression.
- **`UNIQUE` sur `categories.nom`** : empêche deux catégories d’avoir le même nom.
- **`CHECK (prix >= 0)`** : interdit l’insertion ou la modification d’un produit avec un prix négatif.

- **`ON DELETE RESTRICT`** : empêche de supprimer une catégorie tant qu’au moins un produit y fait référence. Il faut d’abord supprimer ces produits ou les rattacher à une autre catégorie. Les clés étrangères doivent être activées avec `PRAGMA foreign_keys = ON;` pour chaque connexion.

Q1.6 -
### Tests des contraintes

**a) prix négatif
- Erreur  : `CHECK constraint failed: prix >= 0`
- Explication : la contrainte `CHECK (prix >= 0)` interdit les prix négatifs.

**b)  catégorie qui n'existe pas
- Erreur  : `FOREIGN KEY constraint failed`
- Explication : si la catégorie 99 n’existe pas, la clé étrangère empêche l’insertion du produit.

**c) supprimer une catégorie qui contient des produits
- Erreur  : `FOREIGN KEY constraint failed`
- Explication : si des produits appartiennent à la catégorie 1, `ON DELETE RESTRICT` empêche sa suppression.
-Q2.4
Il permet d’effectuer les conversions des données puis de retourner un objet créé avec le constructeur principal

### Q3.2 — DatabaseHelper

**(1)** Deux appels à `DatabaseHelper()` renvoient le même objet grâce au singleton. Le constructeur `factory` retourne l’instance existante.

**(2)** `??=` affecte une valeur uniquement si la variable vaut `null`.

**(3)** `onConfigure` active les clés étrangères à chaque ouverture de la base, tandis que `onCreate` s’exécute seulement à sa création.

**(4)** `onCreate` est appelé une fois par création de la base, puis à nouveau si elle est supprimée et recréée.