-- Юзер логинится в систему
SELECT
	`users` .*
FROM
	`users`
WHERE
	`users`.`username` = 'tyashin'
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
		AND taggings.context = 'tags'
		AND taggings.tagger_id IS NULL;	
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
		AND taggings.context = 'tags'
		AND taggings.tagger_id IS NULL;
	
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
JOIN `people` ON
	`people`.`id` = `contacts`.`person_id`
JOIN `profiles` ON
	`profiles`.`person_id` = `people`.`id`
WHERE
	`contacts`.`user_id` = 1
	AND `contacts`.`receiving` = TRUE
ORDER BY
	profiles.first_name ASC,
	profiles.last_name ASC,
	profiles.diaspora_handle ASC
LIMIT 25 OFFSET 0;