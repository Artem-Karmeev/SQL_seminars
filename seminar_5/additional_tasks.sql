--------------------------------------------------------------------------------------
-- Получите друзей пользователя с id=1
-- (решение задачи с помощью представления “друзья”)
--------------------------------------------------------------------------------------
CREATE VIEW friends 
AS
SELECT initiator_user_id as `friend id`
FROM friend_requests
WHERE target_user_id = 1 AND `status` = 'approved'
UNION
SELECT target_user_id
FROM friend_requests
WHERE  initiator_user_id = 1 AND `status` = 'approved';
--------------------------------------------------------------------------------------
-- Создайте представление, в котором будут выводится все сообщения, 
-- в которых принимал участие пользователь с id = 1.
--------------------------------------------------------------------------------------
CREATE VIEW mess
AS
SELECT id
FROM messages
WHERE from_user_id = 1 OR to_user_id = 1;
--------------------------------------------------------------------------------------
-- Получите список медиа файлов пользователя 
-- с количеством лайков
--------------------------------------------------------------------------------------
SELECT 
	m.user_id,
	m.media_type_id as media_id,
	COUNT(l.media_id) as total_likes
FROM media m
JOIN likes l ON m.media_type_id = l.media_id
GROUP BY m.user_id, m.media_type_id
ORDER BY user_id, total_likes;

--------------------------------------------------------------------------------------
-- Получите количество групп у пользователей
--------------------------------------------------------------------------------------
SELECT user_id, COUNT(community_id)
FROM users_communities
GROUP BY user_id;
--------------------------------------------------------------------------------------
-- Создайте представление, 
-- в которое попадет информация о пользователях 
-- (имя, фамилия, город и пол), которые не старше 20 лет.
--------------------------------------------------------------------------------------
CREATE VIEW buzzers
AS 
	SELECT u.firstname, u.lastname, p.hometown, p.gender
    FROM users u 
    JOIN `profiles` p
    ON u.id = p.user_id
    WHERE TIMESTAMPDIFF(YEAR, p.birthday, DATE(NOW())) < 21;
--------------------------------------------------------------------------------------
-- Найдите кол-во, отправленных сообщений каждым пользователем 
-- и выведите ранжированный список пользователей, указав имя и фамилию пользователя, 
-- количество отправленных сообщений и место в рейтинге 
-- (первое место у пользователя с максимальным количеством сообщений)
--------------------------------------------------------------------------------------
WITH top AS (
  SELECT from_user_id, COUNT(from_user_id) AS total_mes
  FROM messages
  GROUP BY from_user_id
)
SELECT from_user_id, total_mes, DENSE_RANK() OVER (ORDER BY total_mes DESC) AS user_rank
FROM top;
--------------------------------------------------------------------------------------
-- Выберите все сообщения, отсортируйте сообщения 
-- по возрастанию даты отправления (created_at) 
-- и найдите разницу дат отправления между соседними сообщениями, 
-- получившегося списка. (используйте LEAD или LAG)
--------------------------------------------------------------------------------------
SELECT 
	id,
	from_user_id as `from`,
    to_user_id as `to`,
    created_at as `date`,
	LEAD(created_at) OVER (ORDER BY created_at) as difference,
	TIMEDIFF(LEAD(created_at) OVER (ORDER BY created_at), created_at) AS time_difference
FROM messages;