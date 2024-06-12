-- Récupérer tous les films
SELECT * FROM movie;

-- Récupérer tous les films dans la catégorie "Films de gangster"
SELECT * FROM movie WHERE category_id = 1;

-- Récupérer tous les films dans la catégorie "Films de gangster" qui sont sortis avant 1990
SELECT * FROM movie WHERE category_id = 1 AND released_at < '1990-01-01';

-- Récupérer tous les films du plus récent au plus vieux
SELECT * FROM movie ORDER BY released_at DESC;

-- Récupérer les films dans l'ordre aléatoire
SELECT * FROM movie ORDER BY RAND();

-- Récupérer les 5 premiers films à partir du 4ème
SELECT * FROM movie LIMIT 3, 5;

-- Récupérer le film le plus récent
SELECT * FROM movie ORDER BY released_at DESC LIMIT 1;

-- Récupérer le film le plus ancien
SELECT * FROM movie ORDER BY released_at LIMIT 1;

-- Récupérer les acteurs nés avant 1960
SELECT * FROM actor WHERE birthday < '1960-01-01';

-- Récupérer les films qui durent plus de 3h
SELECT * FROM movie WHERE duration >= 180;

-- Récupérer les films des années 80
SELECT * FROM movie WHERE released_at >= '1980-01-01' AND released_at < '1990-01-01';
SELECT * FROM movie WHERE released_at BETWEEN '1980-01-01' AND '1989-12-31';

-- Trier les films du plus long au plus court
SELECT * FROM movie ORDER BY duration DESC;

-- Récupérer quatre films aléatoires
SELECT * FROM movie ORDER BY RAND() LIMIT 4;

-- Trier tous les films d'avant 2000 par ordre alphabétique
SELECT * FROM movie WHERE released_at < '2000-01-01' ORDER BY title;

-- Simuler une pagination pour les films (avec 5 films par page)
SELECT * FROM movie LIMIT 0, 5; -- OFFSET 0 LIMIT 5 (Page 1)
SELECT * FROM movie LIMIT 5, 5; -- (Page 2)
SELECT * FROM movie LIMIT 10, 5; -- (Page 3)
SELECT * FROM movie LIMIT 15, 5;
SELECT * FROM movie LIMIT 20, 5; -- FIN
SELECT * FROM movie LIMIT 25, 5;

-- Récupérer les utilisateurs en France
SELECT * FROM users WHERE country = 'FR';

-- Récupérer deux utilisateurs majeurs aléatoires
SELECT * FROM users WHERE birthday < '2005-01-01' ORDER BY RAND() LIMIT 2;

-- Récupérer les utilisateurs abonnés
SELECT * FROM users WHERE subscribed = 1;

-- Récupérer les utilisateurs ayant commandé entre 3 et 5 produits
SELECT * FROM users WHERE purchase_count BETWEEN 3 AND 5;

-- Récupérer les utilisateurs sans pays, sans ville et sans code postal
UPDATE users SET country = NULL, city = NULL, zip = NULL WHERE id = 2;
SELECT * FROM users WHERE country IS NULL AND city IS NULL AND zip IS NULL;

-- Récupérer les utilisateurs dont le nom de famille commence par un M
SELECT * FROM users WHERE lastname LIKE 'M%';
