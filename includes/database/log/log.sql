
#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.022252798080444s		---22ms
	CREATE TABLE `users` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`username` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
`displayname` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
`gender` enum('male','female') DEFAULT NULL,
`title` varchar(100) DEFAULT NULL,
`password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
`mobile` varchar(15) DEFAULT NULL,
`email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
`chatid` int(20) UNSIGNED DEFAULT NULL,
`status` enum('active','awaiting','deactive','removed','filter','unreachable') DEFAULT 'awaiting',
`avatar` varchar(2000) DEFAULT NULL,
`parent` int(10) UNSIGNED DEFAULT NULL,
`permission` varchar(1000) DEFAULT NULL,
`type` varchar(100) DEFAULT NULL,
`datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
`pin` smallint(4) UNSIGNED DEFAULT NULL,
`ref` int(10) UNSIGNED DEFAULT NULL,
`twostep` bit(1) DEFAULT NULL,
`birthday` varchar(50) DEFAULT NULL,
`unit_id` smallint(5) DEFAULT NULL,
`language` char(2) DEFAULT NULL,
`meta` mediumtext CHARACTER SET utf8mb4,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.022927045822144s		---23ms
	CREATE TABLE `terms` (
  `id` int(10) UNSIGNED NOT NULL,
  `language` char(2) DEFAULT NULL,
  `type` enum('cat','tag','code','other','term') DEFAULT NULL,
  `caller` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `url` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `desc` mediumtext CHARACTER SET utf8mb4,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `parent` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('enable','disable','expired','awaiting','filtered','blocked','spam','violence','pornography','other') NOT NULL DEFAULT 'awaiting',
  `count` int(10) UNSIGNED DEFAULT NULL,
  `usercount` int(10) UNSIGNED DEFAULT NULL,
  `datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.02674412727356s		---27ms
	ALTER TABLE `terms` ADD PRIMARY KEY (`id`), ADD KEY `terms_users_id` (`user_id`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.040648937225342s		---41ms
	ALTER TABLE `terms` MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.050158023834229s		---50ms
	ALTER TABLE `terms` ADD CONSTRAINT `terms_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.013645172119141s		---14ms
	CREATE TABLE `termusages` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `related_id` bigint(20) UNSIGNED NOT NULL,
  `related` enum('posts','products','attachments','files','comments','users') DEFAULT NULL,
  `order` smallint(5) UNSIGNED DEFAULT NULL,
  `status` enum('enable','disable','expired','awaiting','filtered','blocked','spam','violence','pornography','other','deleted') NOT NULL DEFAULT 'enable',
  `datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('cat','tag','term','code','other','barcode1','barcode2','barcode3','qrcode1','qrcode2','qrcode3','rfid1','rfid2','rfid3','fingerprint1','fingerprint2','fingerprint3','fingerprint4','fingerprint5','fingerprint6','fingerprint7','fingerprint8','fingerprint9','fingerprint10') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.045846939086914s		---46ms
	ALTER TABLE `termusages` ADD KEY `term_id` (`term_id`), ADD KEY `related_id` (`related_id`), ADD KEY `related` (`related`), ADD KEY `status` (`status`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.012254953384399s		---12ms
	CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_idsender` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4,
  `url` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `read` bit(1) DEFAULT NULL,
  `star` bit(1) DEFAULT NULL,
  `status` enum('awaiting','enable','disable','expire','deleted','cancel','block') DEFAULT NULL,
  `category` smallint(5) DEFAULT NULL,
  `datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `expiredate` datetime DEFAULT NULL,
  `readdate` datetime DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb4,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `telegram` bit(1) DEFAULT NULL,
  `telegramdate` datetime DEFAULT NULL,
  `sms` bit(1) DEFAULT NULL,
  `smsdate` datetime DEFAULT NULL,
  `smsdeliverdate` datetime DEFAULT NULL,
  `email` bit(1) DEFAULT NULL,
  `emaildate` datetime DEFAULT NULL,
  `related_foreign` varchar(50) DEFAULT NULL,
  `related_id` bigint(20) UNSIGNED DEFAULT NULL,
  `needanswer` bit(1) DEFAULT NULL,
  `answer` smallint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.046369075775146s		---46ms
	ALTER TABLE `notifications` ADD PRIMARY KEY (`id`), ADD KEY `notifications_users_idsender` (`user_idsender`), ADD KEY `user_id` (`user_id`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:52
	---0.055064916610718s		---55ms
	ALTER TABLE `notifications` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.053738832473755s		---54ms
	ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_users_idsender` FOREIGN KEY (`user_idsender`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.017131090164185s		---17ms
	CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language` char(2) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `url` varchar(255) NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `type` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'post',
  `comment` enum('open','closed') DEFAULT NULL,
  `count` smallint(5) UNSIGNED DEFAULT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('publish','draft','schedule','deleted','expire') NOT NULL DEFAULT 'draft',
  `parent` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `publishdate` datetime DEFAULT NULL,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.048485040664673s		---48ms
	ALTER TABLE `posts` ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `url_unique` (`url`,`language`) USING BTREE, ADD KEY `posts_users_id` (`user_id`) USING BTREE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.056349039077759s		---56ms
	ALTER TABLE `posts` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.053363084793091s		---53ms
	ALTER TABLE `posts` ADD CONSTRAINT `posts_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.02180004119873s		---22ms
	CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `status` enum('approved','unapproved','spam','deleted') NOT NULL DEFAULT 'unapproved',
  `parent` smallint(5) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `minus` int(10) UNSIGNED DEFAULT NULL,
  `plus` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.048603057861328s		---49ms
	ALTER TABLE `comments` ADD PRIMARY KEY (`id`), ADD KEY `comments_posts_id` (`post_id`) USING BTREE, ADD KEY `comments_users_id` (`user_id`) USING BTREE, ADD KEY `comments_visitors_id` (`visitor_id`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.054764032363892s		---55ms
	ALTER TABLE `comments` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.04837703704834s		---48ms
	ALTER TABLE `comments`
  ADD CONSTRAINT `comments_posts_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.021916151046753s		---22ms
	CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cat` varchar(100) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `status` enum('enable','disable','expire') NOT NULL DEFAULT 'enable',
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.055562973022461s		---56ms
	ALTER TABLE `options` ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_cat` (`key`) USING BTREE, ADD KEY `options_users_id` (`user_id`), ADD KEY `options_posts_id` (`post_id`), ADD KEY `options_parent_id` (`parent_id`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.06987190246582s		---70ms
	ALTER TABLE `options` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.061315059661865s		---61ms
	ALTER TABLE `options`
  ADD CONSTRAINT `options_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `options` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `options_posts_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `options_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.0244460105896s		---24ms
	CREATE TABLE `logitems` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `caller` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `desc` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority` enum('critical','high','medium','low') NOT NULL DEFAULT 'medium',
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.031023025512695s		---31ms
	ALTER TABLE `logitems` ADD PRIMARY KEY (`id`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.055307865142822s		---55ms
	ALTER TABLE `logitems` MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.015146017074585s		---15ms
	CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logitem_id` smallint(5) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `data` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `status` enum('enable','disable','expire','deliver') DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.047250032424927s		---47ms
	ALTER TABLE `logs` ADD PRIMARY KEY (`id`), ADD KEY `logs_users_id` (`user_id`) USING BTREE, ADD KEY `logs_logitems_id` (`logitem_id`) USING BTREE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.058394908905029s		---58ms
	ALTER TABLE `logs` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.055171966552734s		---55ms
	ALTER TABLE `logs` ADD CONSTRAINT `logs_logitems_id` FOREIGN KEY (`logitem_id`) REFERENCES `logitems` (`id`) ON UPDATE CASCADE, ADD CONSTRAINT `logs_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.017779111862183s		---18ms
	CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `user_id_seller` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `temp` bit(1) DEFAULT NULL,
  `title` varchar(500) NOT NULL,
  `total` bigint(20) DEFAULT NULL,
  `total_discount` int(10) DEFAULT NULL,
  `status` enum('enable','disable','expire') NOT NULL DEFAULT 'enable',
  `date_pay` datetime DEFAULT NULL,
  `transaction_bank` varchar(255) DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  `vat` int(10) DEFAULT NULL,
  `vat_pay` int(10) DEFAULT NULL,
  `final_total` bigint(20) DEFAULT NULL,
  `count_detail` smallint(5) UNSIGNED DEFAULT NULL,
  `datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `desc` text CHARACTER SET utf8mb4,
  `meta` mediumtext CHARACTER SET utf8mb4
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.050649166107178s		---51ms
	ALTER TABLE `invoices` ADD PRIMARY KEY (`id`), ADD KEY `inovoices_user_id` (`user_id`), ADD KEY `inovoices_user_id_seller` (`user_id_seller`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:53
	---0.059453010559082s		---59ms
	ALTER TABLE `invoices` MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.048250913619995s		---48ms
	ALTER TABLE `invoices` ADD CONSTRAINT `inovoices_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE, ADD CONSTRAINT `inovoices_user_id_seller` FOREIGN KEY (`user_id_seller`) REFERENCES `users` (`id`) ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.019809007644653s		---20ms
	CREATE TABLE `invoice_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `price` int(10) DEFAULT NULL,
  `count` smallint(5) DEFAULT NULL,
  `total` int(10) DEFAULT NULL,
  `discount` smallint(5) DEFAULT NULL,
  `status` enum('enable','disable','expire') NOT NULL DEFAULT 'enable',
  `datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `desc` text CHARACTER SET utf8mb4,
  `meta` mediumtext CHARACTER SET utf8mb4
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.031177997589111s		---31ms
	ALTER TABLE `invoice_details` ADD PRIMARY KEY (`id`), ADD KEY `inovoices_id` (`invoice_id`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.038871049880981s		---39ms
	ALTER TABLE `invoice_details` MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.051161050796509s		---51ms
	ALTER TABLE `invoice_details` ADD CONSTRAINT `inovoices_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.024065017700195s		---24ms
	CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('active','terminate','expire','disable','changed','logout') NOT NULL DEFAULT 'active',
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `ip` int(10) UNSIGNED DEFAULT NULL,
  `count` int(10) UNSIGNED DEFAULT '1',
  `datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_seen` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.03941798210144s		---39ms
	ALTER TABLE `sessions` ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`code`) USING BTREE, ADD KEY `sessions_user_id` (`user_id`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.052972078323364s		---53ms
	ALTER TABLE `sessions` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.052788972854614s		---53ms
	ALTER TABLE `sessions` ADD CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.019291877746582s		---19ms
	CREATE TABLE `socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `social` varchar(50) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('enable','expire','disable') NOT NULL DEFAULT 'enable',
  `email` varchar(255) DEFAULT NULL,
  `verified` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `displayname` varchar(500) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `picture` varchar(1000) DEFAULT NULL,
  `hd` varchar(500) DEFAULT NULL,
  `link` varchar(1000) DEFAULT NULL,
  `desc` text,
  `meta` mediumtext,
  `datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.049134016036987s		---49ms
	ALTER TABLE `socials` ADD PRIMARY KEY (`id`), ADD KEY `social_user_id` (`user_id`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.05021595954895s		---50ms
	ALTER TABLE `socials` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.036970138549805s		---37ms
	ALTER TABLE `socials` ADD CONSTRAINT `social_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.020087003707886s		---20ms
	CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` smallint(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caller` varchar(100) DEFAULT NULL,
  `type` enum('gift','prize','transfer','promo','money') NOT NULL,
  `unit_id` smallint(3) NOT NULL,
  `amount_request` bigint(20) DEFAULT NULL,
  `amount_end` bigint(20) DEFAULT NULL,
  `plus` bigint(20) UNSIGNED DEFAULT NULL,
  `minus` bigint(20) UNSIGNED DEFAULT NULL,
  `budget_before` bigint(20) DEFAULT NULL,
  `budget` bigint(20) DEFAULT NULL,
  `status` enum('enable','disable','deleted','expired','awaiting','filtered','blocked','spam') NOT NULL DEFAULT 'enable',
  `condition` enum('request','redirect','cancel','pending','error','verify_request','verify_error','ok') DEFAULT NULL,
  `verify` bit(1) NOT NULL DEFAULT b'0',
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `related_user_id` int(10) UNSIGNED DEFAULT NULL,
  `related_foreign` varchar(50) DEFAULT NULL,
  `related_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment` varchar(50) DEFAULT NULL,
  `payment_response` text CHARACTER SET utf8mb4,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `desc` text CHARACTER SET utf8mb4,
  `dateverify` int(10) UNSIGNED NULL DEFAULT NULL,
  `datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.082959890365601s		---83ms
	ALTER TABLE `transactions` ADD PRIMARY KEY (`id`), ADD KEY `newtransactions_user_id` (`user_id`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.034334897994995s		---34ms
	ALTER TABLE `transactions` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.047346115112305s		---47ms
	ALTER TABLE `transactions` ADD CONSTRAINT `newtransactions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.023042917251587s		---23ms
	CREATE TABLE `userparents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL,
  `related_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `creator` int(10) UNSIGNED DEFAULT NULL,
  `level` smallint(5) DEFAULT NULL,
  `status` enum('enable','disable','expire','deleted') DEFAULT 'enable',
  `title` enum('father','mother','sister','brother','grandfather','grandmother','aunt','husband of the aunt','uncle','boy','girl','spouse','stepmother','stepfather','neighbor','teacher','friend','boss','supervisor','child','grandson','custom') DEFAULT NULL,
  `othertitle` varchar(255) DEFAULT NULL,
  `datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
  `datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `desc` text CHARACTER SET utf8mb4,
  `meta` mediumtext CHARACTER SET utf8mb4
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.048118114471436s		---48ms
	ALTER TABLE `userparents` ADD PRIMARY KEY (`id`), ADD KEY `userparents_users_id` (`user_id`), ADD KEY `userparents_creator` (`creator`), ADD KEY `userparents_parent` (`parent`)

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.054529905319214s		---55ms
	ALTER TABLE `userparents` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.055005073547363s		---55ms
	ALTER TABLE `userparents`
  ADD CONSTRAINT `userparents_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userparents_parent` FOREIGN KEY (`parent`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userparents_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.023920059204102s		---24ms
	CREATE TABLE `contacts` (
`id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`user_id` int(10) UNSIGNED NOT NULL,
`key` varchar(100) NOT NULL,
`value` varchar(100) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
`desc` varchar(1000) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
`login` bit(1) NULL DEFAULT NULL,
`verify` bit(1) NULL DEFAULT NULL,
`datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
CONSTRAINT `contact_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.021841049194336s		---22ms
	CREATE TABLE `agents` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`agent` text NOT NULL,
`group` varchar(50) DEFAULT NULL,
`name` varchar(50) DEFAULT NULL,
`version` varchar(50) DEFAULT NULL,
`os` varchar(50) DEFAULT NULL,
`osnum` varchar(50) DEFAULT NULL,
`robot` bit(1) DEFAULT NULL,
`meta` text,
`datecreated` timestamp DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.00089883804321289s		---1ms
	SELECT * FROM users WHERE `mobile` = '989109610912' AND `permission` = 'supervisor' LIMIT 1

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-01-13 11:38:54
	---0.00382399559021s		---4ms
	INSERT INTO users SET `mobile` = '989109610912' , `permission` = 'supervisor'

#---------------------------------------------------------------------- /enter
---2018-01-13 11:41:03
	---0.00043320655822754s		---0ms
	SELECT * FROM users WHERE users.email = '09109610612' OR users.username = '09109610612' OR users.mobile = '989109610612' LIMIT 1

#---------------------------------------------------------------------- /enter
---2018-01-13 11:41:28
	---0.00049185752868652s		---0ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter
---2018-01-13 11:42:42
	---0.00067901611328125s		---1ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter
---2018-01-13 11:45:27
	---0.00041913986206055s		---0ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter
---2018-01-13 11:49:40
	---0.00047397613525391s		---0ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter
---2018-01-13 11:49:55
	---0.00057411193847656s		---1ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter
---2018-01-13 11:50:51
	---0.00038385391235352s		---0ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter
---2018-01-13 11:51:22
	---0.00041413307189941s		---0ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter
---2018-01-13 11:56:03
	---0.00058984756469727s		---1ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter
---2018-01-13 11:56:18
	---0.00041699409484863s		---0ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:56:40
	---0.00032901763916016s		---0ms
	SELECT * FROM logitems WHERE `caller` = 'user:verification:code' LIMIT 1

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:56:40
	---0.00021791458129883s		---0ms
	SELECT * FROM logs WHERE `user_id` = '1' AND `status` = 'enable' AND logs.logitem_id IS NULL LIMIT 1

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:56:40
	---0.00014400482177734s		---0ms
	SELECT id FROM logitems WHERE logitems.caller = 'user:verification:code' LIMIT 1

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:56:40
	---0.0018818378448486s		---2ms
	INSERT INTO logitems SET `caller` = 'user:verification:code' , `title` = 'user:verification:code'

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:56:40
	---0.0002598762512207s		---0ms
	SELECT id AS `id` FROM logitems WHERE logitems.caller = 'user:verification:code' LIMIT 1

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:56:40
	---0.0018219947814941s		---2ms
	INSERT IGNORE INTO logs SET  `logitem_id` = 18 , `user_id` = '1' , `data` = 11111 , `status` = 'enable' , `meta` = '{"session":{"user_country_ir_redirect_fa":true,"session_storage":{"enter_session_check":1},"session_storage_time":{"enter_session_check":1515831978},"session_storage_time_limit":{"enter_session_check":600},"enter":{"usernameormobile":"989109610912","user_data":{"id":"1","username":null,"displayname":null,"gender":null,"title":null,"password":null,"mobile":"989109610912","email":null,"chatid":null,"status":"awaiting","avatar":null,"parent":null,"permission":"supervisor","type":null,"datecreated":"2018-01-13 11:38:54","datemodified":null,"pin":null,"ref":null,"twostep":null,"birthday":null,"unit_id":null,"language":null,"meta":null},"temp_ramz":"dhthxli","temp_ramz_hash":"$2y$07$Dn0MHkHqmfDzBl8qlhkbQ.lxrdFfzsFL.T3zQ9TCqqZORYs7ZdS9C","verify_from":"set","code_is_created":true,"verification_code":11111},"step":{"usernameormobile":true,"pass":true},"lock":{"pass\/set":false,"pass\/recovery":false,"verify":false}}}' , `datecreated` = '2018-01-13 11:56:40'

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:56:40
	---0.00063300132751465s		---1ms
	UPDATE logs SET `desc` = 'telegram' WHERE logs.id = 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:56:40
	---0.0005340576171875s		---1ms
	SELECT id FROM logitems WHERE logitems.caller = 'enter:send:sems:result' LIMIT 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:56:40
	---0.0019350051879883s		---2ms
	INSERT INTO logitems SET `caller` = 'enter:send:sems:result' , `title` = 'enter:send:sems:result'

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:56:40
	---0.00047802925109863s		---0ms
	SELECT id AS `id` FROM logitems WHERE logitems.caller = 'enter:send:sems:result' LIMIT 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:56:40
	---0.0056471824645996s		---6ms
	INSERT IGNORE INTO logs SET  `logitem_id` = 19 , `user_id` = '1' , `data` = 11111 , `status` = 'enable' , `meta` = '{"mobile":"989109610912","code":11111,"session":{"user_country_ir_redirect_fa":true,"session_storage":{"enter_session_check":1},"session_storage_time":{"enter_session_check":1515831978},"session_storage_time_limit":{"enter_session_check":600},"enter":{"usernameormobile":"989109610912","user_data":{"id":"1","username":null,"displayname":null,"gender":null,"title":null,"password":null,"mobile":"989109610912","email":null,"chatid":null,"status":"awaiting","avatar":null,"parent":null,"permission":"supervisor","type":null,"datecreated":"2018-01-13 11:38:54","datemodified":null,"pin":null,"ref":null,"twostep":null,"birthday":null,"unit_id":null,"language":null,"meta":null},"temp_ramz":"dhthxli","temp_ramz_hash":"$2y$07$Dn0MHkHqmfDzBl8qlhkbQ.lxrdFfzsFL.T3zQ9TCqqZORYs7ZdS9C","verify_from":"set","code_is_created":true,"verification_code":11111,"verification_code_time":"2018-01-13 11:56:40","verification_code_way":"telegram","verification_code_id":1,"run_send_sms_code":true},"step":{"usernameormobile":true,"pass":true},"lock":{"pass\/set":false,"pass\/recovery":false,"verify":false,"verify\/sms":false}},"response":[]}' , `datecreated` = '2018-01-13 11:56:40'

#---------------------------------------------------------------------- /enter
---2018-01-13 11:57:12
	---0.00042009353637695s		---0ms
	SELECT * FROM users WHERE users.email = '989109610912' OR users.username = '989109610912' OR users.mobile = '989109610912' LIMIT 1

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:57:17
	---0.00026416778564453s		---0ms
	SELECT * FROM logitems WHERE `caller` = 'user:verification:code' LIMIT 1

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:57:17
	---0.00037813186645508s		---0ms
	SELECT * FROM logs WHERE `user_id` = '1' AND `status` = 'enable' AND logs.logitem_id = '18' LIMIT 1

#---------------------------------------------------------------------- /enter/verify
---2018-01-13 11:57:17
	---0.0076429843902588s		---8ms
	UPDATE logs SET `desc` = 'sms' WHERE logs.id = 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:17
	---0.00034689903259277s		---0ms
	SELECT id FROM logitems WHERE logitems.caller = 'enter:send:sems:result' LIMIT 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:17
	---0.0021460056304932s		---2ms
	INSERT IGNORE INTO logs SET  `logitem_id` = '19' , `user_id` = '1' , `data` = '11111' , `status` = 'enable' , `meta` = '{"mobile":"989109610912","code":"11111","session":{"user_country_ir_redirect_fa":true,"session_storage":{"enter_session_check":1},"session_storage_time":{"enter_session_check":1515832032},"session_storage_time_limit":{"enter_session_check":600},"enter":{"usernameormobile":"989109610912","user_data":{"id":"1","username":null,"displayname":null,"gender":null,"title":null,"password":null,"mobile":"989109610912","email":null,"chatid":null,"status":"awaiting","avatar":null,"parent":null,"permission":"supervisor","type":null,"datecreated":"2018-01-13 11:38:54","datemodified":null,"pin":null,"ref":null,"twostep":null,"birthday":null,"unit_id":null,"language":null,"meta":null},"temp_ramz":"dhthxli","temp_ramz_hash":"$2y$07$mTTjHN1I6oJ6kEQ7voH3tuUya5skXkuHnC0WO.YtHdNGf9H0KHPL2","verify_from":"set","code_is_created":true,"verification_code":"11111","verification_code_time":"2018-01-13 11:56:40","verification_code_way":"sms","verification_code_id":"1","run_send_sms_code":true},"step":{"usernameormobile":true,"pass":true},"lock":{"pass\/set":false,"pass\/recovery":false,"verify":false,"verify\/sms":false}},"response":[]}' , `datecreated` = '2018-01-13 11:57:17'

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:20
	---0.0030109882354736s		---3ms
	UPDATE logs SET `status` = 'expire' WHERE logs.id = 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:20
	---0.0027091503143311s		---3ms
	UPDATE users SET `password` = '$2y$07$mTTjHN1I6oJ6kEQ7voH3tuUya5skXkuHnC0WO.YtHdNGf9H0KHPL2' WHERE users.id = 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:20
	---0.0002899169921875s		---0ms
	SELECT * FROM users WHERE `id` = '1' LIMIT 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:20
	---0.0002288818359375s		---0ms
	SELECT * FROM agents WHERE `agent` = 'Mozilla%2F5.0+%28X11%3B+Linux+x86_64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F55.0.2883.87+Safari%2F537.36' LIMIT 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:20
	---0.0019378662109375s		---2ms
	INSERT INTO agents SET  `agent` = 'Mozilla%2F5.0+%28X11%3B+Linux+x86_64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F55.0.2883.87+Safari%2F537.36' , `group` = 'webkit' , `name` = 'chrome' , `version` = '55.0.2883.87' , `os` = 'lin' , `osnum` = NULL, `meta` = '{"browser_working":"webkit","browser_number":"55.0.2883.87","ie_version":"","dom":true,"safe":true,"os":"lin","os_number":"","browser_name":"chrome","ua_type":"bro","browser_math_number":"55.0","moz_data":["","","","",""],"webkit_data":["chrome","55.0.2883.87","55.0.2883.87"],"mobile_test":"","mobile_data":"","true_ie_number":"","run_time":"0.00030494","html_type":3,"engine_data":["blink","537.36","537.36"],"trident_data":["","","537.36","55.0.2883.87"],"blink_data":["","","55.0.2883.87"]}' , `robot` = NULL

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:20
	---0.00033998489379883s		---0ms
	SELECT * FROM sessions WHERE `ip` = '2130706433' AND `agent_id` = 1 AND `user_id` = '1' AND `status` = 'active' LIMIT 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:20
	---0.0039858818054199s		---4ms
	INSERT INTO sessions SET `ip` = '2130706433' , `agent_id` = 1 , `user_id` = '1' , `status` = 'active' , `code` = '$2y$07$qfn0xD71GAKC9ea8yJ5gsePwVQc6MiK/dbAXcyd2/1MRuvc4KgIMG' , `last_seen` = '2018-01-13 11:57:20'

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:20
	---0.002086877822876s		---2ms
	UPDATE users SET `status` = 'active' WHERE users.id = 1

#---------------------------------------------------------------------- /enter/verify/sms
---2018-01-13 11:57:20
	---0.0004429817199707s		---0ms
	SELECT * FROM users WHERE `id` = '1' LIMIT 1
