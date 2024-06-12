SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE category;
TRUNCATE movie;
TRUNCATE actor;
TRUNCATE movie_has_actor;
SET FOREIGN_KEY_CHECKS = 1;

-- Insérer la catégorie "Films de gangsters" avec une requête SQL
INSERT INTO category (name) VALUES ('Films de gangsters');

-- Insérer ces catégories avec une requête SQL : Action, Horreur, Science-fiction, Thriller
INSERT INTO category (name) VALUES ('Action'),
('Horreur'),
('Science-fiction'),
('Thriller');

SELECT * FROM category;

-- Insérer 5 films de votre choix en les liant à une de vos catégories
INSERT INTO movie (title, released_at, description, duration, cover, category_id) VALUES
('Le Parrain', '1972-01-01', '"Lorem" ip\'sum', 186, 'le-parrain.jpg', 1),
('Scarface', '1983-01-01', 'Lorem ipsum', 120, 'scarface.jpg', 1),
('Les Affranchis', '1990-01-01', 'Lorem ipsum', 145, 'les-affranchis.jpg', 1),
('Heat', '1995-01-01', 'Lorem ipsum', 146, 'heat.jpg', 1),
('Die Hard', '1988-01-01', 'Lorem ipsum', 124, 'die-hard.jpg', 2),
('Demolition Man', '1993-01-01', 'Lorem ipsum', 89, 'demolition-man.jpg', 2),
('Taken', '2008-01-01', 'Lorem ipsum', 96, 'taken.jpg', 2),
('Deadpool', '2016-01-01', 'Lorem ipsum', 97, 'deadpool.jpg', 2),
('The Expandables', '2010-01-01', 'Lorem ipsum', 132, 'the-expandables.jpg', 2),
('Scream', '1996-01-01', 'Lorem ipsum', 78, 'scream.jpg', 3),
('Vendredi 13', '1980-01-01', 'Lorem ipsum', 97, 'vendredi-13.jpg', 3),
('Saw', '2005-01-01', 'Lorem ipsum', 102, 'saw.jpg', 3),
('Scary Movie', '2000-01-01', 'Lorem ipsum', 79, 'scary-movie.jpg', 3),
('Star Wars IV Un nouvel espoir', '1977-01-01', 'Lorem ipsum', 160, 'star-wars-iv-un-nouvel-espoir.jpg', 4),
('Alien', '1979-01-01', 'Lorem ipsum', 145, 'alien.jpg', 4),
('ET', '1982-01-01', 'Lorem ipsum', 95, 'et.jpg', 4),
('Robocop', '1987-01-01', 'Lorem ipsum', 98, 'robocop.jpg', 4),
('The Game', '1997-01-01', 'Lorem ipsum', 96, 'the-game.jpg', 5),
('Sixième Sens', '1999-01-01', 'Lorem ipsum', 120, 'sixieme-sens.jpg', 5),
('Usual Suspects', '1995-01-01', 'Lorem ipsum', 114, 'usual-suspects.jpg', 5),
('Fight Club', '1999-01-01', 'Lorem ipsum', 108, 'fight-club.jpg', 5),
('Inception', '2010-01-01', 'Lorem ipsum', 107, 'inception.jpg', 5),
('Deadpool 2', '2019-02-19', 'Lorem ipsum', 93, 'deadpool-2.jpg', 2);

SELECT * FROM movie;

-- Insérer maintenant quelques acteurs de vos films insérés
INSERT INTO actor (name, firstname, birthday) VALUES
('Pacino', 'Al', '1940-04-25'),
('Brando', 'Marlon', '1924-04-03'),
('de Niro', 'Robert', '1943-08-17'),
('Willis', 'Bruce', '1955-03-19'),
('Liotta', 'Ray', '1954-12-18'),
('Snipes', 'Wesley', '1962-07-31'),
('Stalone', 'Sylvester', '1946-07-06'),
('Norton', 'Edward', '1969-08-18'),
('Spacey', 'Kevin', '1959-07-26'),
('Kilmer', 'Val', '1959-12-31');

SELECT * FROM actor;

-- Insérer un acteur nommé "Tintin Milou"
INSERT INTO actor (name, firstname, birthday) VALUES ('Milou', 'Tintin', '1999-12-25');

-- Insérer le film Avengers Endgame en indiquant une date de sortie en 2009
INSERT INTO movie (title, released_at, description, duration, cover, category_id) VALUES
('Avengers Endgame', '2009-01-01', 'Lorem ipsum', 220, 'endgame.jpg', 2);

-- Ecrire la requête pour supprimer l'acteur Tintin Milou qui n'existe pas
DELETE FROM actor WHERE firstname = 'Tintin' AND name = 'Milou';

-- Ecrire la requête permettant de corriger la date de sortie du film Endgame
UPDATE movie SET released_at = '2019-04-24' WHERE title = 'Avengers Endgame';

-- Insérer un utilisateur avec vos informations dans la base de données
INSERT INTO users (firstname, lastname, email) VALUES ('Matthieu', 'Mota', 'matthieu@boxydev.com');

SELECT * FROM users;

-- Modifier cet utilisateur pour qu'il soit abonné avec 3 achats.
UPDATE users SET purchase_count = 3, subscribed = 1 WHERE email = 'matthieu@boxydev.com';

-- Supprimer cet utilisateur avec une condition sur l'email, le nom et le prénom.
DELETE FROM users WHERE email = 'matthieu@boxydev.com' AND lastname = 'Mota' AND firstname = 'Matthieu';
