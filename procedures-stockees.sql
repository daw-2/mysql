-- Procédures stockées DANS UN FICHIER A PART
DROP PROCEDURE IF EXISTS addUser;
DELIMITER $$

CREATE PROCEDURE addUser(
    IN firstname VARCHAR(255),
    IN lastname VARCHAR(255),
    IN email VARCHAR(255),
    OUT user VARCHAR(255)
)
leave_proc: BEGIN
    DECLARE result INT;
    DECLARE my_cursor CURSOR FOR SELECT id FROM users;

    OPEN my_cursor;

    LOOP
        FETCH my_cursor INTO result;
        SELECT result;
    END LOOP;

    CLOSE my_cursor;

    -- LEAVE leave_proc;

    IF firstname = 'Toto' THEN
        SELECT 'Erreur';

        SET @out = '';

        FOR i IN 1..3
        DO
            SET @out = CONCAT(@out, i);
        END FOR;
        SELECT @out;

        SET @x = 0;
        SET @p1 = 3;
        REPEAT
            SET @x = @x + 1;
            SELECT @x;
        UNTIL @x >= @p1
        END REPEAT;

        LEAVE leave_proc;
    ELSE
        SELECT 'Ok';
    END IF;

    INSERT INTO users (firstname, lastname, email)
    VALUES (firstname, lastname, email);

    SELECT CONCAT(firstname, ' ', lastname) INTO user FROM users WHERE id = LAST_INSERT_ID();
    SELECT * FROM users;

    -- SET user = firstname;
END $$

DELIMITER ;

-- On peut créer des vues (des tables virtuelles)
CREATE OR REPLACE VIEW old_users AS
SELECT * FROM users WHERE birthday IS NOT NULL ORDER BY birthday ASC;

CREATE OR REPLACE VIEW customers AS
SELECT * FROM users WHERE id IN (SELECT user_id FROM purchases);

UPDATE users SET birthday = NOW() WHERE id = 4;
SELECT * FROM old_users WHERE purchase_count >= 0;
SELECT * FROM customers;

-- TON APPLICATION
SET @a = 10;
SET @dateToBeMajor = CONCAT_WS('-', YEAR(NOW()) - 18, LPAD(MONTH(NOW()), 2, 0), DAYOFMONTH(NOW()));
SET @firstname = 'Fiorella';
SELECT @total := COUNT(id) FROM users;

SELECT *, @dateToBeMajor FROM users WHERE firstname = @firstname;

CALL addUser('Toto', 'Mota', 'fiorella@boxydev.com', @user);
-- CALL addUser('Marina', 'Dodic', 'marina@boxydev.com');

SELECT @user;
