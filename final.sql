CREATE DATABASE Final;
USE Final;

/*Task_01: Создайте функцию, которая принимает количество секунд и форматирует их в количество дней, часов, минут и секунд.
Пример: 123456 -> '1 days 10 hours 17 minutes 36 seconds'*/

DELIMITER $$
CREATE PROCEDURE time(secs INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    WHILE secs >= 84600 DO
    SET days = secs / 84600;
    SET secs = secs % 84600;
    END WHILE;

    WHILE secs >= 3600 DO
    SET hours = secs / 3600;
    SET secs = secs % 3600;
    END WHILE;

    WHILE secs >= 60 DO
    SET minutes = secs / 60;
    SET secs = secs % 60;
    END WHILE;

SELECT days, hours, minutes, secs;
END $$
DELIMITER ;

CALL time(123456);


/*Task_02: Выведите только четные числа от 1 до 10.
Пример: 2, 4, 6, 8, 10*/

DELIMITER $$
CREATE PROCEDURE numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT);

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO nums VALUES(n);
    END WHILE;

SELECT * FROM nums;
END $$
DELIMITER ;

CALL numbers();
