--------------------------------------------------------------------------------------
-- Создайте функцию, которая принимает кол-во сек 
-- и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 -> '1 days 10 hours 17 minutes 36 seconds'
--------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS hw6;
USE hw6;
DROP FUNCTION IF EXISTS format_seconds;
DELIMITER $$


CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(300)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(300);
    
    SET days = seconds div 86400;
    SET seconds = seconds % 86400;
    
    SET hours = seconds div 3600;
    SET seconds = seconds % 3600;
    
    SET minutes = seconds div 60;
    SET seconds = seconds % 60;
    
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    
    RETURN result;
END $$
DELIMITER ;
 SELECT format_seconds(123456)

 --------------------------------------------------------------------------------------
-- Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10
---------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS hw6;
USE hw6;
DROP FUNCTION IF EXISTS show_even;
DELIMITER $$

CREATE PROCEDURE show_even()
BEGIN
    DECLARE counter INT DEFAULT 1;
    
    WHILE counter <= 10 DO
        IF counter % 2 = 0 THEN
            SELECT counter;
        END IF;
        
        SET counter = counter + 1;
    END WHILE;
END $$
DELIMITER ;
CALL show_even();
