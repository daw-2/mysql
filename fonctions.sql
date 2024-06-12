-- Fonctions d'aggrégation
SELECT
    COUNT(id) t, MAX(birthday) max, MIN(birthday) min,
    SUM(purchase_count) s, AVG(purchase_count) avg
FROM users u
GROUP BY country
WITH ROLLUP;

-- Fonctions chaînes de caractères
SELECT
    UPPER(CONCAT(firstname, ' ', lastname)) fullname,
    REPLACE(country, 'FR', 'France') country,
    email,
    SUBSTRING(email, 1, 10) domain,
    INSERT('Fiofio', 4, 3, 'rella')
FROM users
WHERE SUBSTRING(email, -CHAR_LENGTH('gmail.com')) = 'gmail.com';

UPDATE users SET email = REPLACE(email, 'example.com', 'gmail.com');

SELECT * FROM users;

SELECT RAND();

UPDATE users SET birthday = NOW() WHERE id = 1;

SELECT
*, CONCAT_WS(' ', firstname, 'est né en', YEAR(birthday)),
TO_DAYS(NOW()) - TO_DAYS(birthday) age_in_days,
YEAR(FROM_DAYS(TO_DAYS(NOW()) - TO_DAYS(birthday))) age,
DATE_ADD('2024-01-31', INTERVAL 1 MONTH),
PERIOD_DIFF(202412, 202106),
MD5(CONCAT(firstname, lastname, birthday))
FROM users WHERE YEAR(birthday) < 2000;

SELECT * FROM users WHERE firstname REGEXP "[a-dA-D]{2,}";

SELECT *, MIN(birthday) FROM users;
SELECT * FROM users WHERE birthday = (SELECT MIN(birthday) FROM users);

SELECT * FROM movie WHERE category_id IN (
    SELECT id FROM category WHERE name IN ('Action', 'Horreur')
);

INSERT INTO category (name) VALUES ('Test');
SELECT * FROM category c WHERE EXISTS (
    SELECT * FROM movie m WHERE m.category_id = c.id
);

UPDATE users SET firstname = 'Austin' WHERE id = 36;
SELECT * FROM users;
