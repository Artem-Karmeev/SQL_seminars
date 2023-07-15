--------------------------------------------------------------------------------------
-- 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
--------------------------------------------------------------------------------------
SELECT COUNT(l.user_id) as `total likes` 
FROM likes l JOIN profiles p
ON l.user_id = p.user_id
WHERE TIMESTAMPDIFF(YEAR, p.birthday, DATE(NOW())) < 12;
--------------------------------------------------------------------------------------
-- Определить кто больше поставил лайков (всего): мужчины или женщины.
--------------------------------------------------------------------------------------
SELECT p.gender, COUNT(l.user_id) as `total likes`
FROM likes l JOIN profiles p
ON l.user_id = p.user_id
GROUP BY p.gender
--------------------------------------------------------------------------------------
-- Вывести всех пользователей, которые не отправляли сообщения.
--------------------------------------------------------------------------------------
SELECT id, CONCAT(firstname, ' ', lastname)  as full_name
FROM users
WHERE id NOT IN(
	SELECT from_user_id
    FROM messages);
--------------------------------------------------------------------------------------
-- Пусть задан некоторый пользователь(выбираете сами, к примеру, Reuben). 
-- Из всех друзей этого пользователя найдите человека, 
-- который больше всех написал ему сообщений.
--------------------------------------------------------------------------------------
SELECT from_user_id as frend_id,
CONCAT(u.firstname, ' ', u.lastname) as full_name,
COUNT(from_user_id) as total_messages 
FROM messages m JOIN users u
ON m.from_user_id = u.id
WHERE from_user_id in (
	SELECT target_user_id
	FROM friend_requests
	WHERE `status` = 'approved'AND initiator_user_id = (
		SELECT id 
		FROM users
		WHERE firstname = 'Reuben'
        ) 
	UNION
	SELECT initiator_user_id
	FROM friend_requests
	WHERE `status` = 'approved' AND target_user_id = (
		SELECT id 
		FROM users
		WHERE firstname = 'Reuben'
        )
	)
AND to_user_id = (
	SELECT id 
	FROM users
	WHERE firstname = 'Reuben'
	)
GROUP BY from_user_id
ORDER BY total_messages DESC
LIMIT 1;
