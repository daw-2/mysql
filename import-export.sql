-- Indexes
EXPLAIN SELECT * FROM users WHERE purchase_count >= 2;

DROP INDEX my_index ON users;
CREATE INDEX my_index ON users (purchase_count);

EXPLAIN SELECT * FROM users WHERE purchase_count >= 2;

-- Import / Export
SELECT 'id', 'name', 'date', 'desc', 'duration', 'cover', 'category'
UNION
SELECT * FROM movie INTO OUTFILE '/tmp/data3.txt' FIELDS TERMINATED BY ',';

-- Rappel UNION unit le résultat de 2 requêtes SQL (Il faut le même nombre de colonnes)
SELECT id, title FROM movie
UNION
SELECT id, firstname FROM actor;

SELECT * FROM movie WHERE id IN (13, 14, 15)
UNION
SELECT * FROM movie WHERE id NOT IN (13, 14, 15);
