
-- Практическая работа. Семинар 2.

-------------------------------------------------------------------------------------
-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными:
-------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS seminar_2;
USE seminar_2;
CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
--------------------------------------------------------------------------------------
-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300:
--------------------------------------------------------------------------------------
SELECT id, order_date, count_product,
CASE
    WHEN count_product < 100
        THEN "Маленький заказ"
    WHEN count_product >= 100 AND count_product <= 300
        THEN "Средний заказ"
    WHEN count_product > 300
        THEN "Большой заказ"
END as type_order
FROM sales
--------------------------------------------------------------------------------------
-- 3.1 Создайте таблицу “orders”, заполните ее значениями:
--------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS orders
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10),
    amount FLOAT,
    order_status VARCHAR(20)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
    ("e03", 15.00, "OPEN"),
    ("e01", 25.50, "OPEN"),
    ("e05", 100.70, "CLOSED"),
    ("e02", 22.18, "OPEN"),
    ("e04", 9.50, "CANCELLED");
--------------------------------------------------------------------------------------
-- 3.2 Покажите “полный” статус заказа, используя оператор CASE:
--------------------------------------------------------------------------------------
SELECT id, employee_id, amount, 
CASE
    WHEN order_status = "OPEN"
        THEN "Order is in open state"
    WHEN order_status = "CLOSED"
        THEN "Order is closed"
    WHEN order_status = "CANCELLED"
        THEN "Order is cancelled"
END as full_order_status
FROM orders;