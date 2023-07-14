-----------------------------------------------------------------------------------------
-- Посчитать количество документов у каждого пользователя(doc, docx, html):
-----------------------------------------------------------------------------------------
SELECT user_id, COUNT(filename) as `number of files`
FROM media 
WHERE filename LIKE "%.doc" 
OR filename LIKE "%.docx" 
OR filename LIKE "%.html"
GROUP BY user_id
-----------------------------------------------------------------------------------------
-- Посчитать лайки для документов, которые выложил каждый пользователь:
-----------------------------------------------------------------------------------------
SELECT media.user_id AS `user id`, 
    media.id AS `media id`, 
    COUNT(likes.id) AS `number of likes`
FROM media
LEFT JOIN likes ON media.id = likes.media_id
GROUP BY media.user_id, media.id;



