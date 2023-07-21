------------------------------------------------------
-- Создайте представление, 
-- в которое попадут автомобили стоимостью до 25000 $
------------------------------------------------------
CREATE VIEW `quarter`
AS 
SELECT *
FROM cars
WHERE cost < 25000;
------------------------------------------------------
-- Изменить в существующем представлении порог для стоимости: 
-- пусть цена будет до 30 000 долларов 
--(используя оператор OR REPLACE)
------------------------------------------------------
CREATE OR REPLACE VIEW `quarter`
AS 
SELECT *
FROM cars
WHERE cost < 30000;
------------------------------------------------------
-- Создайте представление, 
-- в котором будут только автомобили марки “Шкода” и “Ауди”
------------------------------------------------------
CREATE VIEW skoudi
AS 
SELECT *
FROM cars
WHERE name = 'Audi' OR name = 'Skoda';
------------------------------------------------------
-- Добавьте новый столбец под названием 
-- «время до следующей станции».
------------------------------------------------------
SELECT
    train_id,
    station,
    station_time,
    TIMEDIFF(
        LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time),
        station_time
    ) AS time_to_next_station
FROM task_4;
