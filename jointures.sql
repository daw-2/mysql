SELECT *, u.id, u.firstname FROM users u
LEFT JOIN purchases p ON u.id = p.user_id
WHERE p.user_id IS NULL;

SELECT *, u.id, u.firstname FROM users u
RIGHT JOIN purchases p ON u.id = p.user_id
WHERE u.id IS NULL;

-- FULL OUTER JOIN simulé mais pas trop utilisé...
SELECT *, u.id, u.firstname FROM users u
LEFT JOIN purchases p ON u.id = p.user_id
-- WHERE p.user_id IS NULL
UNION
SELECT *, u.id, u.firstname FROM users u
RIGHT JOIN purchases p ON u.id = p.user_id
-- WHERE u.id IS NULL
;

-- Le union ce n'est pas que pour les jointures
SELECT MIN(birthday) FROM users
UNION
SELECT MAX(birthday) FROM users;
