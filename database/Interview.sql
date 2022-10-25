-- Adminer 4.8.1 MySQL 10.1.37-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `interview`;
CREATE DATABASE `interview` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `interview`;

DROP TABLE IF EXISTS `acl_rules`;
CREATE TABLE `acl_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `disk` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `access` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acl_rules_user_id_foreign` (`user_id`),
  CONSTRAINT `acl_rules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cms_categories`;
CREATE TABLE `cms_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cms_categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1,	'Omena',	'omena',	1,	'2022-10-24 16:47:58',	'2022-10-24 16:47:58');

DROP TABLE IF EXISTS `cms_pages`;
CREATE TABLE `cms_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text,
  `cms_category_id` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_pages_slug_unique` (`slug`),
  KEY `cms_pages_cms_category_id_foreign` (`cms_category_id`),
  CONSTRAINT `cms_pages_cms_category_id_foreign` FOREIGN KEY (`cms_category_id`) REFERENCES `cms_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `symbol` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `status`, `created_at`, `updated_at`) VALUES
(1,	'Bangladeshi Taka',	'BDT',	'৳',	1,	'2022-10-24 13:05:01',	'2022-10-24 13:05:01');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `log_date` datetime NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `log_type` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `logs` (`id`, `user_id`, `log_date`, `table_name`, `log_type`, `data`) VALUES
(1,	1,	'2022-10-24 16:07:13',	'',	'login',	'{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko\\/20100101 Firefox\\/105.0\"}'),
(3,	1,	'2022-10-24 16:09:45',	'users',	'edit',	'{\"id\":2,\"name\":\"Edwin Ombego\",\"email\":\"eombego@xetova.com\",\"email_verified_at\":null,\"password\":\"$2y$10$loksHKQJIf9pslgaBM4Iwu4weXtJqaLDTkktpR62m0JmZOwI7NH9q\",\"mobile\":\"071477227127\",\"user_type\":null,\"image\":null,\"status\":0,\"remember_token\":null,\"created_at\":\"2022-10-24 16:09:40\",\"updated_at\":\"2022-10-24 16:09:40\"}'),
(5,	2,	'2022-10-24 19:46:55',	'',	'login',	'{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko\\/20100101 Firefox\\/105.0\"}'),
(6,	2,	'2022-10-24 20:05:48',	'',	'login',	'{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko\\/20100101 Firefox\\/105.0\"}'),
(7,	2,	'2022-10-25 05:28:32',	'',	'login',	'{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko\\/20100101 Firefox\\/105.0\"}'),
(8,	2,	'2022-10-25 12:50:36',	'',	'login',	'{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko\\/20100101 Firefox\\/106.0\"}');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2016_06_01_000001_create_oauth_auth_codes_table',	1),
(4,	'2016_06_01_000002_create_oauth_access_tokens_table',	1),
(5,	'2016_06_01_000003_create_oauth_refresh_tokens_table',	1),
(6,	'2016_06_01_000004_create_oauth_clients_table',	1),
(7,	'2016_06_01_000005_create_oauth_personal_access_clients_table',	1),
(8,	'2019_02_06_174631_make_acl_rules_table',	1),
(9,	'2019_08_19_000000_create_failed_jobs_table',	1),
(10,	'2020_10_09_181405_create_permission_tables',	1),
(11,	'2020_11_20_100001_create_log_table',	1),
(12,	'2021_07_05_141612_create_cms_categories_table',	1),
(13,	'2021_07_21_000000_create_currencies_table',	1),
(14,	'2021_07_21_000000_create_settings_table',	1),
(15,	'2021_07_23_0000011_create_cms_pages_table',	1);

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1,	'App\\Models\\User',	2);

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1,	'user-list',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(2,	'user-create',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(3,	'user-edit',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(4,	'user-delete',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(5,	'profile-index',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(6,	'role-list',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(7,	'role-create',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(8,	'role-edit',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(9,	'role-delete',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(10,	'permission-list',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(11,	'permission-create',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(12,	'permission-edit',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(13,	'permission-delete',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(23,	'currency-create',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(25,	'currency-delete',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(28,	'user-activity',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(29,	'log-view',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01');

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `roles` (`id`, `code`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'Admin',	'web',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01'),
(2,	'002',	'Manager',	'web',	'2022-10-25 09:51:28',	'2022-10-25 09:51:28'),
(3,	'003',	'Supervisor',	'web',	'2022-10-25 09:51:48',	'2022-10-25 09:51:48');

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1,	1),
(1,	2),
(1,	3),
(2,	1),
(2,	2),
(2,	3),
(3,	1),
(3,	2),
(3,	3),
(4,	1),
(4,	2),
(5,	1),
(5,	2),
(6,	1),
(6,	2),
(7,	1),
(7,	2),
(8,	1),
(8,	2),
(9,	1),
(9,	2),
(10,	1),
(11,	1),
(12,	1),
(13,	1),
(23,	1),
(25,	1),
(28,	1),
(28,	2),
(29,	1),
(29,	2);

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `website_title` varchar(191) DEFAULT NULL,
  `website_logo_dark` text,
  `website_logo_light` text,
  `website_logo_small` text,
  `website_favicon` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_tag` varchar(191) DEFAULT NULL,
  `currency_id` bigint(20) unsigned DEFAULT NULL,
  `address` text,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `instagram` varchar(191) DEFAULT NULL,
  `github` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_currency_id_foreign` (`currency_id`),
  CONSTRAINT `settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `settings` (`id`, `website_title`, `website_logo_dark`, `website_logo_light`, `website_logo_small`, `website_favicon`, `meta_title`, `meta_description`, `meta_tag`, `currency_id`, `address`, `phone`, `email`, `facebook`, `twitter`, `linkedin`, `instagram`, `github`, `created_at`, `updated_at`) VALUES
(1,	'Code Eazy',	'',	'',	'',	'',	'',	'',	'',	1,	'Dhaka, Bangladesh',	'+8801689201370',	'soumik.ahammed.9@gmail.com',	'https://www.facebook.com/soumik.ahammed.9/',	'www.twitter.com/soumik9',	'https://www.linkedin.com/in/soumik-ahammed-a41915171/',	'https://www.instagram.com/soumik.ahammed.9/',	'https://github.com/soumik9',	'2022-10-24 13:05:01',	'2022-10-24 13:05:01');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `user_type` varchar(191) DEFAULT NULL,
  `image` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `mobile`, `user_type`, `image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2,	'Alphonce Ochieng',	'admin@admin.com',	NULL,	'$2y$10$hqw7DHogFzpC/ucXOzxHQOkojDhEWjtw9ACN9PnQCYTuooOj3O3xW',	'071477227127',	NULL,	NULL,	1,	NULL,	'2022-10-24 13:09:40',	'2022-10-24 13:09:45');

-- 2022-10-25 12:55:56
