-- Afficher les films avec leur catégorie
SELECT * FROM movie m INNER JOIN category c ON m.category_id = c.id;

-- Afficher les films même ceux n'ayant pas de catégorie
UPDATE movie SET category_id = NULL WHERE id = 19;
SELECT * FROM movie m LEFT JOIN category c ON m.category_id = c.id;

-- Afficher les acteurs du film Les Affranchis en partant de la table movie bien entendu. Les jointures peuvent se faire indéfiniment
SELECT * FROM movie m
INNER JOIN movie_has_actor mha ON m.id = mha.movie_id
INNER JOIN actor a ON a.id = mha.actor_id
WHERE title = 'Les Affranchis';

select a.name from movie_has_actor m_a
inner join actor a on m_a.actor_id = a.id
inner join movie m on m.id = m_a.movie_id
where m.title = 'Les Affranchis';

-- Afficher les films joués par Al Pacino en partant de la table actor
SELECT * FROM actor a
INNER JOIN movie_has_actor mha ON a.id = mha.actor_id
INNER JOIN movie m ON m.id = mha.movie_id
WHERE CONCAT(a.firstname, ' ', a.name) = 'Al Pacino';

-- Afficher les acteurs qui ont joués dans la catégorie Action
-- SELECT DISTINCT a.id, a.name, a.firstname, a.birthday FROM actor a --
SELECT * FROM actor a
INNER JOIN movie_has_actor mha ON a.id = mha.actor_id
INNER JOIN movie m ON m.id = mha.movie_id
INNER JOIN category c ON c.id = m.category_id
WHERE c.name = 'Action' GROUP BY a.id; -- Le groupe peut aussi servir à dédoublonner puisqu'il fusionne les lignes avec une même valeur

-- Afficher toutes les commandes d'un utilisateur
SELECT name, price, CONCAT(firstname, ' ', lastname) as fullname FROM purchases p
INNER JOIN users u ON u.id = p.user_id
WHERE CONCAT(firstname, ' ', lastname) = 'Marina Dodic';

-- Afficher le CA de chaque utilisateur
SELECT SUM(p.price) AS CA, CONCAT(u.firstname, ' ', u.lastname) AS `user` FROM purchases p
INNER JOIN users u ON u.id = p.user_id
GROUP BY p.user_id;

-- Afficher les utilisateurs dont le CA est supérieur à 2000
SELECT SUM(p.price) AS CA, CONCAT(u.firstname, ' ', u.lastname) AS `user` FROM purchases p
INNER JOIN users u ON u.id = p.user_id
GROUP BY p.user_id
HAVING CA > 2000;

-- Afficher le nombre de produits commandés pour chaque utilisateur
SELECT COUNT(p.id) AS count, CONCAT(u.firstname, ' ', u.lastname) AS `user` FROM purchases p
INNER JOIN users u ON u.id = p.user_id
GROUP BY p.user_id;

-- Mettre à jour le champ purchase_count avec ce nombre
SELECT COUNT(p.id) FROM purchases p INNER JOIN users u ON u.id = p.user_id WHERE u.id = 3;

-- Mettre à jour le champ purchase_count avec ce nombre
UPDATE users SET purchase_count = (
    SELECT COUNT(p.id) FROM purchases p INNER JOIN users u ON u.id = p.user_id WHERE u.firstname = 'Marina'
) WHERE firstname = 'Marina';

-- Dans la sous requête, on a accès aux données de chaque ligne dans le UPDATE (comme une boucle)
UPDATE users SET purchase_count = (
    SELECT COUNT(p.id) FROM purchases p INNER JOIN users u ON u.id = p.user_id WHERE u.id = users.id
);
