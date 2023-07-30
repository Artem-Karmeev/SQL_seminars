--------------------------------------------------------------------------------------
-- Создать процедуру, которая решает следующую задачу
-- Выбрать для одного пользователя 5 пользователей в случайной комбинации,
-- которые удовлетворяют хотя бы одному критерию:
-- из одного города
-- состоят в одной группе                    
-- друзья друзей           
--------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS get_friend;
DELIMITER //
CREATE PROCEDURE get_friend(IN for_user_id INT)
BEGIN
	SELECT `possible option`
	FROM 
		(
		SELECT
			u.id as 'possible option'
		FROM users u
		JOIN `profiles` p
		ON u.id = p.user_id
		WHERE p.hometown = 
			(
			SELECT hometown 
			FROM `profiles`
			WHERE user_id = for_user_id --
			)
		UNION -- -------------------------------------
		SELECT
		u.id
		FROM users u
		JOIN users_communities c
		ON u.id = c.user_id
		WHERE c.community_id IN 
			(
			SELECT community_id
			FROM users_communities
			WHERE user_id = for_user_id --
			)
		UNION -- -------------------------------------
		SELECT initiator_user_id 
		FROM friend_requests
		WHERE target_user_id IN
			(
			SELECT initiator_user_id
			FROM friend_requests
			WHERE `status` = 'approved' AND target_user_id = for_user_id --
			UNION
			SELECT target_user_id
			FROM friend_requests
			WHERE `status` = 'approved' AND initiator_user_id = for_user_id --
			)
		UNION
		SELECT target_user_id
		FROM friend_requests
		WHERE initiator_user_id IN
			(
			SELECT initiator_user_id
			FROM friend_requests
			WHERE `status` = 'approved' AND target_user_id = for_user_id --
			UNION
			SELECT target_user_id
			FROM friend_requests
			WHERE `status` = 'approved' AND initiator_user_id = for_user_id --
			)
		) as temp_table
	WHERE `possible option` <> for_user_id --
	ORDER BY rand()
	LIMIT 5;

END //
DELIMITER ;
--------------------------------------------------------------------------------------
-- Создать функцию, вычисляющей коэффициент популярности пользователя 
-- (по количеству друзей)
--------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS popularity_coef;
DELIMITER //
CREATE FUNCTION popularity_coef(u_id INT)
RETURNS VARCHAR(20)
DETERMINISTIC 
BEGIN 
	DECLARE count_friends INT;
    DECLARE result VARCHAR (20);
    SET count_friends = 
		(SELECT 
			COUNT(t.user_id) as total
		FROM users u JOIN (SELECT initiator_user_id as user_id
					FROM friend_requests 
					WHERE `status` = 'approved'
					UNION ALL
					SELECT target_user_id
					FROM friend_requests 
					WHERE `status` = 'approved') as t
		ON u.id = t.user_id
		WHERE u.id = u_id);
        
	SET result = 
		CASE
			WHEN count_friends = 1
				THEN 'Не популярен'
			WHEN count_friends = 2
				THEN 'Средне популярен'
			WHEN count_friends = 3
				THEN 'Селеба'
		END;
                
    RETURN result;
END //

DELIMITER ;
--------------------------------------------------------------------------------------
-- Создайте хранимую функцию hello(),
-- которая будет возвращать приветствие, в зависимости от текущего времени суток:
-- c 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
--------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS hello;

DELIMITER $$
CREATE FUNCTION hello()
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
    DECLARE result VARCHAR(20);
    DECLARE now_time TIME DEFAULT CURTIME();
    SET result =
        CASE 
            WHEN now_time >= '06:00:00' AND now_time < '12:00:00' 
                THEN "Доброе утро"
            WHEN now_time >= '12:00:00' AND now_time < '18:00:00' 
                THEN "Добрый день"
            WHEN now_time >= '18:00:00' AND now_time < '23:59:59' 
                THEN "Добрый вечер"    
            WHEN now_time > '00:00:00' AND now_time < '06:00:00' 
                THEN "Доброй ночи" 
        END;
    RETURN result;
END$$

DELIMITER ;

SELECT hello();
--------------------------------------------------------------------------------------
-- Создайте таблицу logs типа Archive.
-- Пусть при каждом создании записи в таблицах users,
-- communities и messages в таблицу logs помещается время и дата создания записи,
-- название таблицы, идентификатор первичного ключа. (Триггеры)
--------------------------------------------------------------------------------------
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
    log_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50) NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW()
) ENGINE=ARCHIVE;

DELIMITER //
CREATE TRIGGER users_after_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, user_id)
    VALUES ('users', NEW.id);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER communities_after_insert
AFTER INSERT ON communities
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, user_id)
    VALUES ('communities', NEW.id);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER messages_after_insert
AFTER INSERT ON messages
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, user_id)
    VALUES ('messages', NEW.id);
END //
DELIMITER ;