-- Практическая работа. Семинар 1.

-- Создайте таблицу с мобильными телефонами, используя графический интерфейс:
CREATE DATABASE IF NOT EXISTS product;
USE product;
CREATE TABLE IF NOT EXISTS phone
(
id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(45),
manufacturer VARCHAR(45),
product_count INT,
prise INT
);

-- Заполните БД данными:
INSERT phone(product_name, manufacturer, product_count, prise)
VALUES
	("iPhone X", "Apple", 3, 76000),
	("iPhone 8", "Apple", 2, 51000),
    ("Galaxy S9", "Samsung", 2, 56000),
    ("Galaxy S8", "Samsung", 1, 41000),
    ("P20 Pro", "Huawei", 5, 36000);

-- Выведите название, производителя и цену для товаров, количество которых превышает 2:
SELECT product_name, manufacturer, prise
FROM phone
WHERE product_count > 2;

-- Выведите весь ассортимент товаров марки “Samsung”:
SELECT id, product_name, manufacturer, product_count, prise
FROM phone
WHERE manufacturer = "Samsung";

-- Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000:
SELECT id, product_name, manufacturer, product_count, prise
FROM phone
WHERE product_count * prise > 100000
AND product_count * prise < 145000;

-- Товары, в которых есть упоминание "Iphone":
SELECT product_name
FROM phone
WHERE product_name LIKE "%iPhone%";

-- Товары, в которых есть упоминание "Galaxy":
SELECT  product_name
FROM phone
WHERE product_name LIKE "%Galaxy%";

-- Товары, в которых есть ЦИФРЫ:
SELECT product_name
FROM phone
WHERE product_name RLIKE "[0-9]";

-- Товары, в которых есть ЦИФРА "8":
SELECT product_name
FROM phone
WHERE product_name RLIKE "8";
