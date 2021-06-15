-- user_aspects 
CREATE OR REPLACE
VIEW user_aspects (username,
aspect,
email,
last_seen) AS
SELECT
	users.username,
	name,
	users.email,
	users.last_seen
FROM
	aspects
INNER JOIN users ON
	aspects.user_id = users.id
ORDER BY
	users.username;



-- people activity
CREATE OR REPLACE
VIEW people_activity AS
SELECT
	people.id,
	users.username AS name,
	users.email,
	(
	SELECT
		COUNT(*)
	FROM
		messages
	WHERE
		messages.author_id = people.id) AS total_messages,
	(
	SELECT
		COUNT(*)
	FROM
		comments
	WHERE
		comments.author_id = people.id) AS total_comments,
	(
	SELECT
		COUNT(*)
	FROM
		likes
	WHERE
		likes.author_id = people.id) AS total_likes,
	(
	SELECT
		COUNT(*)
	FROM
		posts
	WHERE
		posts.author_id = people.id) AS total_posts
FROM
	people
INNER JOIN users ON
	users.id = people.owner_id;




	

