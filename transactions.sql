START TRANSACTION;

UPDATE movie SET title = 'DELETE' WHERE id = 1;
SELECT * FROM movie;

ROLLBACK; -- Annule la transaction et donc annule les modifications

SELECT * FROM movie;

COMMIT; -- Termine la transaction et valide la modification
