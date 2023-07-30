_____________________________________________
## Задачи семинара 1:
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс;  
Заполните БД данными;
2. Выведите название, производителя и цену для товаров, количество которых превышает 2;
3. Выведите весь ассортимент товаров марки “Samsung”;
4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000;
5. Товары, в которых есть упоминание "Iphone";
6. Товары, в которых есть упоминание "Galaxy";
7. Товары, в которых есть ЦИФРЫ;
8. Товары, в которых есть ЦИФРА "8".
_____________________________________________
## Задачи семинара 2:
1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
4. Используя оператор ALTER TABLE, установите внешний ключ в одной из таблиц (clients-posts)
5. Без оператора JOIN, верните заголовок публикации, текст с описанием, идентификатор клиента, опубликовавшего публикацию и логин данного клиента.
6. Выполните поиск по публикациям, автором которых является клиент "Mikle".
_________________________________________________
## Задачи семинара 3:
1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
2. Выведите 5 максимальных заработных плат (salary)
3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
5. Найдите количество специальностей
6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно
### Дополнительно:
1. Посчитать количество документов у каждого пользователя (doc, docx, html)
2. Посчитать лайки для документов, которые выложил каждый пользователь (моих медиа)  
 
[Данные](https://pollen-attempt-4ac.notion.site/c448e32ae1344f22b1deae7f42c8b57f) к дополнительным задачам.
____________________________________________
## Задачи семинара 4:
Используя JOIN-ы, выполните следующие операции:
1. Вывести всех котиков по магазинам
2. Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
3. Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
### Дополнительно:

1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
2. Определить кто больше поставил лайков (всего): мужчины или женщины.
3. Вывести всех пользователей, которые не отправляли сообщения.
4. Пусть задан некоторый пользователь(выбираете сами, к примеру, Reuben). Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.

[Данные](https://pollen-attempt-4ac.notion.site/c448e32ae1344f22b1deae7f42c8b57f) к дополнительным задачам.
____________________________________________
## Задачи семинара 5:
1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор OR REPLACE)
3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
4. Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
  Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD. Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
### Дополнительно:
Для скрипта, представленного на прошлом уроке.
1. Получите друзей пользователя с id=1
2. (решение задачи с помощью представления “друзья”)
3. Создайте представление, в котором будут выводится все сообщения, 
в которых принимал участие пользователь с id = 1.
4. Получите список медиафайлов пользователя с количеством лайков(media m, likes l ,users u)
5. Получите количество групп у пользователей
6. Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет.
7. Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей, указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге (первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)
8. Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at) и найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)
____________________________________________
# Итоговая практическая работа.
## Задачи:
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.  
Пример: 123456 -> '1 days 10 hours 17 minutes 36 seconds'
2. Выведите только четные числа от 1 до 10 (Через цикл).  
Пример: 2,4,6,8,10
### Дополнительно: 
1. Создать процедуру, которая решает следующую задачу  
Выбрать для одного пользователя 5 пользователей в случайной комбинации,   которые удовлетворяют хотя бы одному критерию:  
    * из одного города   
    * состоят в одной группе 
    * друзья друзей
2. Создать функцию, вычисляющей коэффициент популярности пользователя (по количеству друзей)
3. Создайте хранимую функцию hello(),  
которая будет возвращать приветствие, в зависимости от текущего времени суток:  
    * c 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",  
    * с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",  
    * с 18:00 до 00:00 — "Добрый вечер", 
    * с 00:00 до 6:00 — "Доброй ночи".
4. Создайте таблицу logs типа Archive.  
Пусть при каждом создании записи в таблицах users,  
communities и messages в таблицу logs помещается время и дата создания записи,  
название таблицы, идентификатор первичного ключа. (Триггеры)