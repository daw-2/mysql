-- Compter le nombre de films (avec un alias)
SELECT COUNT(id) AS total FROM movie;

-- Avoir la moyenne des années de sortie des films
SELECT ROUND(AVG(YEAR(released_at))) AS released_avg FROM movie;

-- Récupérer le film le plus récent et le plus ancien (Sous requête)
SELECT * FROM movie WHERE released_at = (
    SELECT MIN(released_at) FROM movie
) OR released_at = (
    SELECT MAX(released_at) FROM movie
);

SELECT * FROM movie WHERE released_at IN (
    SELECT MIN(released_at) FROM movie
    UNION
    SELECT MAX(released_at) FROM movie
);

-- Compter le nombre d'utilisateurs majeurs
SELECT CONCAT_WS('-', YEAR(NOW()) - 18, LPAD(MONTH(NOW()), 2, 0), DAYOFMONTH(NOW())); -- 2006-06-11
SELECT COUNT(id) FROM users WHERE birthday < CONCAT_WS('-', YEAR(NOW()) - 18, LPAD(MONTH(NOW()), 2, 0), DAYOFMONTH(NOW()));

-- Trouver les utilisateurs dans la région 62
UPDATE users SET zip = 62410 WHERE id = 14;
SELECT * FROM users WHERE zip LIKE '62%';

-- Récupérer l'utilisateur le plus âgé
SELECT * FROM users WHERE birthday = (SELECT MIN(birthday) FROM users);

-- Obtenir la durée totale des films
SELECT SUM(duration) sum, FLOOR(SUM(duration) / 60) hours, LPAD(SUM(duration) % 60, 2, 0) minutes FROM movie;

-- Calculer l'âge des acteurs
SELECT *, YEAR(FROM_DAYS(TO_DAYS(NOW()) - TO_DAYS(birthday))) age FROM actor;

-- Trouver les acteurs les plus jeunes
SELECT * FROM actor WHERE YEAR(FROM_DAYS(TO_DAYS(NOW()) - TO_DAYS(birthday))) = (
    SELECT MIN(YEAR(FROM_DAYS(TO_DAYS(NOW()) - TO_DAYS(birthday)))) FROM actor
);

-- Calculer l'âge moyen des films
SELECT ROUND(AVG(YEAR(FROM_DAYS(TO_DAYS(NOW()) - TO_DAYS(released_at))))) FROM movie;

-- Présenter les acteurs "Je suis Al Pacino, j'ai X ans."
SELECT
    CONCAT('Je suis ', firstname, ' ', name, ', j\'ai ', YEAR(FROM_DAYS(TO_DAYS(NOW()) - TO_DAYS(birthday))), ' ans.')
FROM actor;

-- Présenter les films "Scarface est sorti en 1983."
SELECT
    CONCAT(title, ' est sorti en ', YEAR(released_at))
FROM movie;

-- Afficher la liste des films en remplaçant les voyelles par des _
SELECT
    title,
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(title, 'u', '_'), 'o', '_'), 'i', '_'), 'e', '_'), 'a', '_') guess
FROM movie;
