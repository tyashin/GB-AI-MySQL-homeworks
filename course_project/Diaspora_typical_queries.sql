-- Далее приводятся запросы для основных юзкейсов Diaspora.
-- Я не привожу примерно 80% запросов, выполняющихся в системе, поскольку они слишком просты, однотипны и многочисленны. 
-- Приведенные запросы позволяют, по моему мнению, составить представление о бизнес-логике приложения.

-- Юзер логинится в систему
SELECT
	`users` .*
FROM
	`users`
WHERE
	`users`.`username` = 'tyashin'
ORDER BY
	`users`.`id` ASC
LIMIT 1;

BEGIN;
	UPDATE `users` SET `remember_created_at` = '2021-06-04 15:15:24', `updated_at` = '2021-06-04 15:15:24' WHERE `users`.`id` = 1;
COMMIT;

BEGIN;
	UPDATE
	`users`
SET
	`sign_in_count` = 4,
	`current_sign_in_at` = '2021-06-04 15:15:24',
	`last_sign_in_at` = '2021-06-04 15:13:23'
WHERE
	`users`.`id` = 1;
COMMIT;

BEGIN;
	UPDATE
	`users`
SET
	`authentication_token` = '9YRDKS-btDsvaLcLsPbmy_HRAr6gDg'
WHERE
	`users`.`id` = 1;
COMMIT;

-- Юзер выходит из системы
 SELECT
	`users` .*
FROM
	`users`
WHERE
	`users`.`id` = 1
ORDER BY
	`users`.`id` ASC
LIMIT 1;


BEGIN;
	UPDATE
		`users`
	SET
		`last_seen` = '2021-06-04 16:45:34',
		`updated_at` = '2021-06-04 16:45:34'
	WHERE
		`users`.`id` = 1;
COMMIT;

BEGIN;
	UPDATE
	`users`
SET
	`authentication_token` = 'YNr-V7q7A851kHYfDU_mby6URxUQmA',
	`updated_at` = '2021-06-04 16:45:50'
WHERE
	`users`.`id` = 1;
COMMIT;

-- Юзер публикует Пост ("Статус")
 BEGIN;
	INSERT
		INTO
		`posts` (`author_id`,
		`guid`,
		`type`,
		`text`,
		`created_at`,
		`updated_at`)
	VALUES (1,
	'cee18320a776013926c0000c29c74624',
	'StatusMessage',
	'Hi there!',
	'2021-06-04 15:23:59',
	'2021-06-04 15:23:59');

	UPDATE
		`posts`
	SET
		`updated_at` = '2021-06-04 15:23:59',
		`interacted_at` = '2021-06-04 15:23:59'
	WHERE
		`posts`.`id` = 73;

	SELECT
		`tags` .*
	FROM
		`tags`
	INNER JOIN `taggings` ON
		`tags`.`id` = `taggings`.`tag_id`
	WHERE
		`taggings`.`taggable_id` = 73
		AND `taggings`.`taggable_type` = 'Post'
		AND (taggings.context = 'tags'
			AND taggings.tagger_id IS NULL);	
COMMIT;

-- Юзер лайкает пост другого юзера
BEGIN;
	INSERT
		INTO
		`likes` (`target_id`,
		`author_id`,
		`guid`,
		`created_at`,
		`updated_at`,
		`target_type`)
	VALUES (72,
	1,
	'c07c75e0a779013926c8000c29c74624',
	'2021-06-04 15:45:03',
	'2021-06-04 15:45:03',
	'Post');
COMMIT;

-- Юзер добавляет комментарий к чужому посту
BEGIN;	
	INSERT
		INTO
		`comments` (`text`,
		`commentable_id`,
		`author_id`,
		`guid`,
		`created_at`,
		`updated_at`)
	VALUES ('Adding my new comment!!!',
	72,
	1,
	'24f6f830a77b013926c6000c29c74624',
	'2021-06-04 15:55:01',
	'2021-06-04 15:55:01');
	
	SELECT
		`tags` .*
	FROM
		`tags`
	INNER JOIN `taggings` ON
		`tags`.`id` = `taggings`.`tag_id`
	WHERE
		`taggings`.`taggable_id` = 60
		AND `taggings`.`taggable_type` = 'Comment'
		AND (taggings.context = 'tags'
			AND taggings.tagger_id IS NULL);
	
	UPDATE
		`posts`
	SET
		`updated_at` = '2021-06-04 15:55:01'
	WHERE
		`posts`.`id` = 72;
COMMIT;

SELECT
	COUNT(*)
FROM
	`comments`
WHERE
	`comments`.`commentable_id` = 72
	AND `comments`.`commentable_type` = 'Post';

BEGIN;
	UPDATE
		`posts`
	SET
		`posts`.`comments_count` = 1
	WHERE
		`posts`.`type` IN ('Reshare')
		AND `posts`.`id` = 72;

	UPDATE
		`posts`
	SET
		`updated_at` = '2021-06-04 15:55:01',
		`interacted_at` = '2021-06-04 15:55:01'
	WHERE
		`posts`.`id` = 72;
COMMIT;

-- Юзер расшаривает чужой пост на своей страничке
BEGIN;
	INSERT
		INTO
		`posts` (`author_id`,
		`public`,
		`guid`,
		`type`,
		`text`,
		`created_at`,
		`updated_at`,
		`root_guid`)
	VALUES (1,
	TRUE,
	'4a9205f0a77c013926c6000c29c74624',
	'Reshare',
	'm fringilla. Vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Morbi tristique senectus et netus et malesuada fames. Id consectetur purus ut faucibus. Vitae suscipit tellus mauris a diam maecenas. Enim facilisis gravida neque convallis a cras semper. Feugiat sed lectus vestibulum mattis. Vulputate dignissim suspendisse in est ante in.\r\n\r\nCursus euismod quis viverra nibh cras pulvinar. Aenean euismod elementum nisi quis eleifend quam. Adipiscing enim eu turpis egestas pretium aenean pharetra. Feugiat vivamus at augue e',
	'2021-06-04 16:03:14',
	'2021-06-04 16:03:14',
	'7a106e20a76f013983b8000c29c74624');
	
	UPDATE
		`posts`
	SET
		`updated_at` = '2021-06-04 16:03:14',
		`interacted_at` = '2021-06-04 16:03:14'
	WHERE
		`posts`.`id` = 75;

COMMIT;

-- Показать все посты, которые я лайкнул (группами по 15 постов)
SELECT
	`posts` .*
FROM
	`posts`
INNER JOIN `likes` ON
	`likes`.`target_id` = `posts`.`id`
	AND `likes`.`target_type` = 'Post'
	AND `likes`.`positive` = TRUE
WHERE
	`likes`.`author_id` = 1
	AND (posts.created_at < '2021-06-04 16:18:14')
	AND `posts`.`type` IN ('StatusMessage', 'Reshare')
ORDER BY
	posts.created_at DESC,
	posts.id DESC
LIMIT 15;

SELECT
	`likes` .*
FROM
	`likes`
WHERE
	`likes`.`author_id` = 1
	AND `likes`.`target_id` IN (73, 72, 60, 59, 58, 57, 52, 51, 49, 48, 47, 40, 39, 34, 33)
	AND `likes`.`target_type` = 'Post';

-- Показать всю мою публичную активность (группами по 15 элементов)
SELECT
	`posts` .*
FROM
	`posts`
WHERE
	`posts`.`public` = TRUE
	AND (posts.created_at < '2021-06-04 16:23:16')
	AND `posts`.`type` IN ('StatusMessage', 'Reshare')
ORDER BY
	posts.created_at DESC,
	posts.id DESC
LIMIT 15;

-- Показать мой профиль в системе
 SELECT
	`profiles` .*
FROM
	`profiles`
WHERE
	`profiles`.`person_id` = 1
LIMIT 1;

SELECT
	`tags`.`name`
FROM
	`tags`
INNER JOIN `taggings` ON
	`tags`.`id` = `taggings`.`tag_id`
WHERE
	`taggings`.`taggable_id` = 1
	AND `taggings`.`taggable_type` = 'Profile'
	AND `taggings`.`context` = 'tags'
ORDER BY
	taggings.id;

SELECT
	COUNT(*)
FROM
	`photos`
WHERE
	`photos`.`author_id` = 1
	AND (photos.created_at < '2021-06-04 16:25:38.411154')
	AND `photos`.`pending` = FALSE;

SELECT
	`photos` .*
FROM
	`photos`
WHERE
	`photos`.`status_message_guid` = '25c6f8d0a767013983b6000c29c74624';


-- Показать мои контакты
SELECT
	COUNT(*)
FROM
	`contacts`
WHERE
	`contacts`.`user_id` = 1;

SELECT
	`contacts`.`id` AS t0_r0,
	`contacts`.`user_id` AS t0_r1,
	`contacts`.`person_id` AS t0_r2,
	`contacts`.`created_at` AS t0_r3,
	`contacts`.`updated_at` AS t0_r4,
	`contacts`.`sharing` AS t0_r5,
	`contacts`.`receiving` AS t0_r6,
	`people`.`id` AS t1_r0,
	`people`.`guid` AS t1_r1,
	`people`.`diaspora_handle` AS t1_r2,
	`people`.`serialized_public_key` AS t1_r3,
	`people`.`owner_id` AS t1_r4,
	`people`.`created_at` AS t1_r5,
	`people`.`updated_at` AS t1_r6,
	`people`.`closed_account` AS t1_r7,
	`people`.`fetch_status` AS t1_r8,
	`people`.`pod_id` AS t1_r9,
	`profiles`.`id` AS t2_r0,
	`profiles`.`diaspora_handle` AS t2_r1,
	`profiles`.`first_name` AS t2_r2,
	`profiles`.`last_name` AS t2_r3,
	`profiles`.`image_url` AS t2_r4,
	`profiles`.`image_url_small` AS t2_r5,
	`profiles`.`image_url_medium` AS t2_r6,
	`profiles`.`birthday` AS t2_r7,
	`profiles`.`gender` AS t2_r8,
	`profiles`.`bio` AS t2_r9,
	`profiles`.`searchable` AS t2_r10,
	`profiles`.`person_id` AS t2_r11,
	`profiles`.`created_at` AS t2_r12,
	`profiles`.`updated_at` AS t2_r13,
	`profiles`.`location` AS t2_r14,
	`profiles`.`full_name` AS t2_r15,
	`profiles`.`nsfw` AS t2_r16,
	`profiles`.`public_details` AS t2_r17
FROM
	`contacts`
LEFT OUTER JOIN `people` ON
	`people`.`id` = `contacts`.`person_id`
LEFT OUTER JOIN `profiles` ON
	`profiles`.`person_id` = `people`.`id`
WHERE
	`contacts`.`user_id` = 1
	AND `contacts`.`receiving` = TRUE
ORDER BY
	profiles.first_name ASC,
	profiles.last_name ASC,
	profiles.diaspora_handle ASC
LIMIT 25 OFFSET 0;


-- Показать мои уведомления
 SELECT
	COUNT(*)
FROM
	`notifications`
WHERE
	`notifications`.`recipient_id` = 1;

SELECT
	`notifications` .*
FROM
	`notifications`
WHERE
	`notifications`.`recipient_id` = 1
ORDER BY
	updated_at desc
LIMIT 10 OFFSET 0;

SELECT
	`notifications` .*
FROM
	`notifications`
WHERE
	`notifications`.`recipient_id` = 1
	AND `notifications`.`unread` = TRUE;


-- Добавить новый Аспект (аналог группы в FB)
BEGIN;
	SELECT
		`users` .*
	FROM
		`users`
	WHERE
		`users`.`id` = 1
	LIMIT 1;
	
	SELECT
		1 AS one
	FROM
		`aspects`
	WHERE
		LOWER(`aspects`.`name`) = LOWER('test group')
		AND `aspects`.`user_id` = 1
	LIMIT 1;
	
	SELECT
		MAX(`aspects`.`order_id`)
	FROM
		`aspects`
	WHERE
		`aspects`.`user_id` = 1;
	
	INSERT
		INTO
		`aspects` (`name`,
		`user_id`,
		`created_at`,
		`updated_at`,
		`order_id`)
	VALUES ('test group',
	1,
	'2021-06-04 16:56:51',
	'2021-06-04 16:56:51',
	6);
COMMIT;

-- Добавить другого пользователя в мой Аспект (в мою группу)
SELECT `aspects`.* FROM `aspects` WHERE `aspects`.`user_id` = 1 ORDER BY order_id ASC;

SELECT
	COUNT(*)
FROM
	`contacts`
INNER JOIN `aspect_memberships` ON
	`contacts`.`id` = `aspect_memberships`.`contact_id`
WHERE
	`aspect_memberships`.`aspect_id` = 1;

BEGIN;
	INSERT
	INTO
	`aspect_memberships` (`aspect_id`,
	`contact_id`,
	`created_at`,
	`updated_at`)
VALUES (1,
3,
'2021-06-04 16:40:48',
'2021-06-04 16:40:48');
COMMIT;


-- Искать пользователя по имени
SELECT
	`people` .*
FROM
	`people`
INNER JOIN `profiles` ON
	`profiles`.`person_id` = `people`.`id`
LEFT OUTER JOIN contacts ON
	contacts.user_id = 1
	AND contacts.person_id = people.id
WHERE
	( profiles.full_name LIKE '%pyotr%'
		OR people.diaspora_handle LIKE 'pyotr%' )
	AND (profiles.searchable = true
		OR contacts.user_id = 1)
	AND `people`.`closed_account` = FALSE
ORDER BY
	contacts.user_id IS NULL,
	profiles.last_name ASC,
	profiles.first_name ASC
LIMIT 15;


-- Послать приватное сообщение пользователю
BEGIN;
	 INSERT
		INTO
		`conversations` (`subject`,
		`guid`,
		`author_id`,
		`created_at`,
		`updated_at`)
	VALUES ('How are you',
	'e674bb40a782013926c6000c29c74624',
	1,
	'2021-06-04 16:50:32',
	'2021-06-04 16:50:32');
	
	INSERT
		INTO
		`messages` (`conversation_id`,
		`author_id`,
		`guid`,
		`text`,
		`created_at`,
		`updated_at`)
	VALUES (2,
	1,
	'e674b980a782013926c6000c29c74624',
	'Lorem ipsum dolor sit amet.',
	'2021-06-04 16:50:32',
	'2021-06-04 16:50:32');
	
	UPDATE
		`conversations`
	SET
		`updated_at` = '2021-06-04 16:50:32'
	WHERE
		`conversations`.`id` = 2;
COMMIT;


-- Удалить (закрыть) мой аккаунт
BEGIN;	
	UPDATE
		`people`
	SET
		`closed_account` = TRUE,
		`updated_at` = '2021-06-04 17:02:18'
	WHERE
		`people`.`id` = 1;
	
	UPDATE
		`users`
	SET
		`locked_at` = '2021-06-04 17:02:18',
		`updated_at` = '2021-06-04 17:02:18'
	WHERE
		`users`.`id` = 1;
COMMIT;

BEGIN;
	DELETE
	FROM
		`likes`
	WHERE
		`likes`.`target_id` = 1
		AND `likes`.`target_type` = 'Post'
		AND `likes`.`positive` = TRUE;
	
	DELETE
	FROM
		`aspect_visibilities`
	WHERE
		`aspect_visibilities`.`shareable_id` = 1
		AND `aspect_visibilities`.`shareable_type` = 'Post';
	
	DELETE
	FROM
		`participations`
	WHERE
		`participations`.`target_id` = 1
		AND `participations`.`target_type` = 'Post';

-- удаление пользовательского контента из множества таблиц...
COMMIT;

