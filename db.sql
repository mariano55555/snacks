-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.19 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para snacks
DROP DATABASE IF EXISTS `snacks`;
CREATE DATABASE IF NOT EXISTS `snacks` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `snacks`;

-- Volcando estructura para tabla snacks.inventories
DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventories_invoices_product_id_index` (`product_id`),
  CONSTRAINT `fk_invoices_to_inventories_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.inventories: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
INSERT INTO `inventories` (`id`, `product_id`, `quantity`, `stock`, `active`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
	(1, 1, 10000, 10000, 0, '2017-11-19 12:12:02', '2017-11-19 12:12:03', NULL, NULL, NULL, NULL),
	(2, 2, 10000, 10000, 1, '2017-11-19 12:12:02', '2017-11-19 12:12:03', NULL, NULL, NULL, NULL),
	(3, 3, 10000, 10000, 1, '2017-11-19 12:12:02', '2017-11-19 12:12:03', NULL, NULL, NULL, NULL),
	(4, 4, 10000, 10000, 1, '2017-11-19 12:12:02', '2017-11-19 12:12:03', NULL, NULL, NULL, NULL),
	(5, 5, 10000, 10000, 1, '2017-11-19 12:12:02', '2017-11-19 12:12:03', NULL, NULL, NULL, NULL),
	(6, 6, 10000, 10000, 1, '2017-11-19 12:12:02', '2017-11-19 12:12:03', NULL, NULL, NULL, NULL),
	(7, 7, 10000, 10000, 1, '2017-11-19 12:12:02', '2017-11-19 12:12:03', NULL, NULL, NULL, NULL),
	(8, 8, 10000, 10000, 1, '2017-11-19 12:12:02', '2017-11-19 12:12:03', NULL, NULL, NULL, NULL),
	(9, 9, 10000, 10000, 1, '2017-11-19 12:12:02', '2017-11-19 12:12:03', NULL, NULL, NULL, NULL),
	(10, 10, 10000, 10000, 0, '2017-11-19 12:12:02', '2017-11-20 20:27:07', NULL, NULL, NULL, NULL),
	(12, 1, 5, 9995, 1, '2017-11-19 12:39:54', '2017-11-19 12:39:54', NULL, NULL, NULL, NULL),
	(13, 1, 2, 9993, 1, '2017-11-19 20:14:12', '2017-11-19 20:14:12', NULL, 2, 2, NULL),
	(14, 1, 2, 9991, 1, '2017-11-19 20:15:56', '2017-11-19 20:15:56', NULL, 2, 2, NULL),
	(15, 1, 2, 9989, 1, '2017-11-19 20:16:18', '2017-11-19 20:16:18', NULL, 2, 2, NULL),
	(16, 1, 2, 9987, 1, '2017-11-19 20:16:35', '2017-11-19 20:16:35', NULL, 2, 2, NULL),
	(17, 1, 2, 9985, 1, '2017-11-19 20:16:53', '2017-11-19 20:16:53', NULL, 2, 2, NULL),
	(18, 2, 2, 9998, 1, '2017-11-19 20:35:44', '2017-11-19 20:35:44', NULL, 2, 2, NULL),
	(19, 2, 2, 9996, 1, '2017-11-19 20:36:26', '2017-11-19 20:36:26', NULL, 2, 2, NULL),
	(20, 2, 2, 9994, 1, '2017-11-19 20:38:01', '2017-11-19 20:38:01', NULL, 2, 2, NULL),
	(21, 2, 2, 9992, 1, '2017-11-19 20:40:40', '2017-11-19 20:40:40', NULL, 2, 2, NULL),
	(22, 13, 2, 2, 1, '2017-11-20 05:03:45', '2017-11-20 05:03:45', NULL, 1, 1, NULL),
	(23, 5, 1, 9999, 1, '2017-11-20 15:39:37', '2017-11-20 15:39:37', NULL, 1, 1, NULL),
	(24, 14, 12, 12, 0, '2017-11-20 16:08:29', '2017-11-20 19:46:05', NULL, 1, 1, NULL),
	(25, 14, 13, 13, 0, '2017-11-20 19:43:14', '2017-11-20 19:46:05', NULL, 1, 1, NULL),
	(26, 14, 14, 14, 0, '2017-11-20 19:44:38', '2017-11-20 19:46:05', NULL, 1, 1, NULL),
	(27, 14, 15, 15, 1, '2017-11-20 19:46:05', '2017-11-20 19:46:05', NULL, 1, 1, NULL),
	(28, 10, 15, 15, 1, '2017-11-20 20:27:07', '2017-11-20 20:27:07', NULL, 1, 1, NULL);
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.invoices
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_user_id_index` (`user_id`),
  CONSTRAINT `fk_user_to_invoice_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.invoices: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` (`id`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
	(1, 2, '2017-11-19 12:10:22', '2017-11-19 12:10:23', NULL, NULL, NULL, NULL),
	(5, 2, '2017-11-19 20:14:11', '2017-11-19 20:14:11', NULL, 2, 2, NULL),
	(6, 2, '2017-11-19 20:15:56', '2017-11-19 20:15:56', NULL, 2, 2, NULL),
	(7, 2, '2017-11-19 20:16:18', '2017-11-19 20:16:18', NULL, 2, 2, NULL),
	(8, 2, '2017-11-19 20:16:35', '2017-11-19 20:16:35', NULL, 2, 2, NULL),
	(9, 2, '2017-11-19 20:16:53', '2017-11-19 20:16:53', NULL, 2, 2, NULL),
	(10, 2, '2017-11-19 20:22:35', '2017-11-19 20:22:35', NULL, 2, 2, NULL),
	(11, 2, '2017-11-19 20:23:38', '2017-11-19 20:23:38', NULL, 2, 2, NULL),
	(12, 2, '2017-11-19 20:23:54', '2017-11-19 20:23:54', NULL, 2, 2, NULL),
	(13, 2, '2017-11-19 20:24:36', '2017-11-19 20:24:36', NULL, 2, 2, NULL),
	(14, 2, '2017-11-19 20:25:31', '2017-11-19 20:25:31', NULL, 2, 2, NULL),
	(15, 2, '2017-11-19 20:25:53', '2017-11-19 20:25:53', NULL, 2, 2, NULL),
	(16, 2, '2017-11-19 20:35:44', '2017-11-19 20:35:44', NULL, 2, 2, NULL),
	(17, 2, '2017-11-19 20:36:26', '2017-11-19 20:36:26', NULL, 2, 2, NULL),
	(18, 2, '2017-11-19 20:38:01', '2017-11-19 20:38:01', NULL, 2, 2, NULL),
	(19, 2, '2017-11-19 20:39:32', '2017-11-19 20:39:32', NULL, 2, 2, NULL),
	(20, 2, '2017-11-19 20:40:16', '2017-11-19 20:40:16', NULL, 2, 2, NULL),
	(21, 2, '2017-11-19 20:40:27', '2017-11-19 20:40:27', NULL, 2, 2, NULL),
	(22, 2, '2017-11-19 20:40:40', '2017-11-19 20:40:40', NULL, 2, 2, NULL),
	(23, 1, '2017-11-20 15:30:39', '2017-11-20 15:30:39', NULL, 1, 1, NULL),
	(24, 1, '2017-11-20 15:39:36', '2017-11-20 15:39:36', NULL, 1, 1, NULL);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.invoices_products
DROP TABLE IF EXISTS `invoices_products`;
CREATE TABLE IF NOT EXISTS `invoices_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `unit_price` decimal(10,2) unsigned NOT NULL,
  `total_price` decimal(10,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_products_product_id_index` (`product_id`),
  KEY `invoices_products_invoice_id_index` (`invoice_id`),
  CONSTRAINT `fk_invoice_to_product_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_to_invoice_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.invoices_products: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `invoices_products` DISABLE KEYS */;
INSERT INTO `invoices_products` (`id`, `product_id`, `invoice_id`, `quantity`, `unit_price`, `total_price`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
	(1, 1, 1, 1, 1.00, 1.00, '2017-11-19 12:10:52', '2017-11-19 12:10:54', NULL, NULL, NULL, NULL),
	(6, 1, 5, 2, 1.00, 2.00, '2017-11-19 20:14:12', '2017-11-19 20:14:12', NULL, 2, 2, NULL),
	(7, 1, 6, 2, 1.00, 2.00, '2017-11-19 20:15:56', '2017-11-19 20:15:56', NULL, 2, 2, NULL),
	(8, 1, 7, 2, 1.00, 2.00, '2017-11-19 20:16:18', '2017-11-19 20:16:18', NULL, 2, 2, NULL),
	(9, 1, 8, 2, 1.00, 2.00, '2017-11-19 20:16:35', '2017-11-19 20:16:35', NULL, 2, 2, NULL),
	(10, 1, 9, 2, 1.00, 2.00, '2017-11-19 20:16:53', '2017-11-19 20:16:53', NULL, 2, 2, NULL),
	(11, 2, 16, 2, 1.25, 2.50, '2017-11-19 20:35:44', '2017-11-19 20:35:44', NULL, 2, 2, NULL),
	(12, 2, 17, 2, 1.25, 2.50, '2017-11-19 20:36:26', '2017-11-19 20:36:26', NULL, 2, 2, NULL),
	(13, 2, 18, 2, 1.25, 2.50, '2017-11-19 20:38:01', '2017-11-19 20:38:01', NULL, 2, 2, NULL),
	(14, 2, 22, 2, 1.25, 2.50, '2017-11-19 20:40:40', '2017-11-19 20:40:40', NULL, 2, 2, NULL),
	(15, 5, 24, 1, 2.00, 2.00, '2017-11-20 15:39:37', '2017-11-20 15:39:37', NULL, 1, 1, NULL);
/*!40000 ALTER TABLE `invoices_products` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.likes
DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_index` (`user_id`),
  KEY `likes_product_id_index` (`product_id`),
  CONSTRAINT `fk_product_to_user_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_to_product_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.likes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
	(5, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 1, 14, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.migrations: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2017_11_15_021528_create_roles_table', 1),
	(4, '2017_11_15_021627_create_roles_users_table', 1),
	(5, '2017_11_15_022219_create_invoices_table', 1),
	(6, '2017_11_15_022242_create_products_table', 1),
	(7, '2017_11_15_022312_create_invoices_products_table', 1),
	(8, '2017_11_15_050107_create_likes_table', 1),
	(9, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
	(10, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
	(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
	(12, '2016_06_01_000004_create_oauth_clients_table', 2),
	(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
	(14, '2017_11_19_142408_create_inventories_table', 3),
	(15, '2017_11_19_142645_create_products_prices_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.oauth_access_tokens
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.oauth_access_tokens: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('097749489f26a87077aeae026e405079971718aafd044b7e48a5c8c3dc5c7780cbef518679922433', NULL, 6, NULL, '[]', 1, '2017-11-20 04:48:40', '2017-11-20 04:48:40', '2017-11-20 05:18:40'),
	('1132343f9088a135339892177306eb1c1c25a3e7f73ec1d0e5d8e7fca131af9daaba7085131de0ec', NULL, 6, NULL, '[]', 1, '2017-11-20 15:00:02', '2017-11-20 15:00:02', '2017-11-20 15:30:01'),
	('27596621f73ea4c2e94d26d8269bf4b20b17b99af3e0142ad7da73e8d02124a1619591cc4b773067', 2, 4, NULL, '[]', 0, '2017-11-19 20:05:30', '2017-11-19 20:05:30', '2017-11-19 20:35:30'),
	('2e0db7402ef741209148302400f0165d2be4ca549e35ff75f628e99e5eaf292c0183b2f0b879c295', NULL, 6, NULL, '[]', 1, '2017-11-20 00:53:16', '2017-11-20 00:53:16', '2017-11-20 01:23:16'),
	('303c90479e7372c73bb66d0fbc487d98b426893752bf63bcfd85e7b483b8f70bbb8161b1409f675d', NULL, 6, NULL, '[]', 1, '2017-11-20 01:56:40', '2017-11-20 01:56:40', '2017-11-20 02:26:40'),
	('3181bea9ae44ddd1857f0397ee6d4309cc20de9e6c59dc72a0e3dda86b0b19bcb7019dcd762b9144', 1, 4, NULL, '[]', 0, '2017-11-20 04:51:51', '2017-11-20 04:51:51', '2017-11-20 05:21:51'),
	('331f892146f64d723f1f3987d70425d7db5bd244c1e238b559951b4dea2aed2fba055a1c58ed8097', 2, 4, NULL, '[]', 0, '2017-11-19 20:27:47', '2017-11-19 20:27:47', '2017-11-19 20:57:47'),
	('33e02f372c885b2b04093accd21b87c92dbb207bd096fc1ad9d33a7b827b9272802ebdfbbcef654b', NULL, 6, NULL, '[]', 1, '2017-11-20 01:35:57', '2017-11-20 01:35:57', '2017-11-20 02:05:57'),
	('3cc9b71d1fc52f23a5740a1bcce0d290d0436744883a91d2742a1a039a6d212046e82f953d070e77', NULL, 6, NULL, '[]', 1, '2017-11-20 01:56:44', '2017-11-20 01:56:44', '2017-11-20 02:26:44'),
	('4602e1787b5f3661727470a0ff4801b87050aadea5101f12a28abdf65aa7714af016a067541c205a', NULL, 6, NULL, '[]', 1, '2017-11-19 19:03:30', '2017-11-19 19:03:30', '2017-11-19 19:33:30'),
	('461f7d893544940688f5564106815bd741032f43a88487f8110812f38e243a0152ab95cfb4275ec9', NULL, 6, NULL, '[]', 1, '2017-11-20 02:29:22', '2017-11-20 02:29:22', '2017-11-20 02:59:22'),
	('4eb9c54aa5176833564bd67c2a9edae14c0328d0c1e07bbcb34e403ccc40498cd38afab851bc968a', 1, 4, NULL, '[]', 0, '2017-11-19 19:54:28', '2017-11-19 19:54:28', '2017-11-19 20:24:28'),
	('59de83be679484b6a7adfe0a400e7200dcce033a1b1af1d0ff1e33ffdb86ce495890a28f656ec6f2', 1, 4, NULL, '["manage-products"]', 0, '2017-11-20 04:53:49', '2017-11-20 04:53:49', '2017-11-20 05:23:49'),
	('6606d33133c9e935ce2e361809820a43910822a0522f765d0b0c213ca4638accbdf740847498e16d', NULL, 6, NULL, '[]', 1, '2017-11-20 00:43:43', '2017-11-20 00:43:43', '2017-11-20 01:13:43'),
	('75fecd4b1ee9ae585a507658559701957cd64a65109bd3114c7f1b2bbec7977c71b0a09c55cff136', 1, 4, NULL, '["manage-products"]', 0, '2017-11-20 05:09:03', '2017-11-20 05:09:03', '2017-11-20 05:39:03'),
	('7842304b07b4eec4738eebf4aeb73ed20e51d019fbfcc6332d86495316a6a76c1c3e47e7fa87caf4', NULL, 6, NULL, '[]', 1, '2017-11-19 18:31:36', '2017-11-19 18:31:36', '2017-11-19 19:01:35'),
	('7ad58413e3892b03e8cb9b140bb385cc459206476d9a890ca6bf5820529d4ee8a69bc9c30cfbf754', 7, 4, NULL, '[]', 0, '2017-11-20 01:57:56', '2017-11-20 01:57:56', '2017-11-20 02:27:56'),
	('7c24718de000727e30e1dee191922ca8d9224280497794cbd7f3d8c39245878b7cc9ae3355fa0173', 1, 4, NULL, '[]', 0, '2017-11-20 03:38:59', '2017-11-20 03:38:59', '2017-11-20 04:08:59'),
	('7cb396aca70e359b32c2f6c01fc82ef948e1be35bbfad9409e25aa0341d0a6cd74f8df273f9dc2e0', 1, 4, NULL, '[]', 0, '2017-11-19 01:10:40', '2017-11-19 01:10:40', '2017-11-19 01:40:40'),
	('8467b3c9497397fc1ccd4388b224b16129e7a363587d1372c2750d18c4eaee716d714bbdf6d9735f', 1, 5, 'Test', '[]', 1, '2017-11-19 01:51:25', '2017-11-19 01:51:25', '2018-11-19 01:51:25'),
	('900f2046fad624b4ee4df3dd0499690749c4b193fbff15c90db5e9bfb6ccf2d41764dcf62eda84b3', 11, 4, NULL, '[]', 0, '2017-11-20 01:58:27', '2017-11-20 01:58:27', '2017-11-20 02:28:27'),
	('93f31a9f900a7615945c8dc3dfdc199eff387b62a0225ff4f9c88eee2b3090aebb642d0fb5850c73', 2, 4, NULL, '[]', 0, '2017-11-20 00:53:39', '2017-11-20 00:53:39', '2017-11-20 01:23:39'),
	('9c665759f16a45eea988a77f427f5f3412bfc5af9d7c777ecf6a894bca0d58a596435c495ab943ba', 2, 4, NULL, '[]', 0, '2017-11-20 00:23:00', '2017-11-20 00:23:00', '2017-11-20 00:53:00'),
	('b8b1584de3c1c6cfd5d9917b2b90a9dd6e0994b6951e1d29249ce77f699f258cae0b18cc64d5bcec', 1, 4, NULL, '[]', 0, '2017-11-20 03:39:59', '2017-11-20 03:39:59', '2017-11-20 04:09:59'),
	('bf7000940dfbc9c59749a5c8c7939fc80b75751428d90ff7a7839826f943585152d9714efb30d22f', NULL, 6, NULL, '[]', 1, '2017-11-20 15:06:17', '2017-11-20 15:06:17', '2017-11-20 15:36:17'),
	('c0d8a5efe39b22de0c1d340ff9385941fb9bc76d848c5f3bfb3cda1720db893a0ea91b6143eab0fd', 1, 5, 'MyToken', '["purchase-product","manage-products","manage-account","read-general"]', 1, '2017-11-19 19:49:10', '2017-11-19 19:49:10', '2018-11-19 19:49:10'),
	('c9ccdf53fafe45dd1fcdf812e5bbfd755cbbf340544cf8349c47574b74fc7f0ee805ac0665a8d881', NULL, 3, NULL, '[]', 0, '2017-11-19 00:51:51', '2017-11-19 00:51:51', '2017-11-19 01:21:51'),
	('ce5f2ec7d57d084984fa5a5451a46f79ac488ba335c9dab2fee1f2e3eddcf7496f6fba3da930aa1f', 1, 4, NULL, '[]', 0, '2017-11-20 02:29:29', '2017-11-20 02:29:29', '2017-11-20 02:59:29'),
	('d6273999a7a6d1f8188715b1ef493f0df70d84339d1d835b8aed79c75c5900791f5fe7c1dbc3374f', NULL, 6, NULL, '[]', 1, '2017-11-19 19:39:58', '2017-11-19 19:39:58', '2017-11-19 20:09:58'),
	('d67103b42380f1c7dc380ab266483b46ead3e0a1213f6d7f62bf3cb30f2910b422d30b31a107fd8e', NULL, 6, NULL, '["purchase-product"]', 1, '2017-11-20 15:02:31', '2017-11-20 15:02:31', '2017-11-20 15:32:31'),
	('d8bb2a261f19e21ec343374439f04f325d18d8cd9a37967d69a6f0c24d79d53064f16a754dea481c', 1, 5, 'MyToken', '["purchase-product","manage-products","manage-account","read-general"]', 0, '2017-11-20 15:17:47', '2017-11-20 15:17:47', '2018-11-20 15:17:47'),
	('dba7e254504e8c21c0dafa01776f0abf2a527be62fc46ea76c475ad29373f69344dc6aa103d5e7d7', NULL, 3, NULL, '[]', 0, '2017-11-19 00:52:36', '2017-11-19 00:52:36', '2017-11-19 01:22:36'),
	('dcc0f664b4ac9125dc447072e8eed3adfe1ece8c5ba7c9642d9c6113a4e7281425463ab7fcd7e059', 2, 4, NULL, '[]', 0, '2017-11-20 01:10:31', '2017-11-20 01:10:31', '2017-11-20 01:40:31'),
	('ddf18f2f57fbdbb61ceac0528a7bc5313158634d1bd22dfc2ff7c4efb5aaa7e7d2a37f6a868e1d39', NULL, 6, NULL, '[]', 1, '2017-11-19 19:03:21', '2017-11-19 19:03:21', '2017-11-19 19:33:21'),
	('e17f4edee2adb20634ddd8c2cc68a4b6703459d283f270c2e61fa337ab56e8f6bb8d103de53e8305', 1, 4, NULL, '[]', 0, '2017-11-20 01:58:56', '2017-11-20 01:58:56', '2017-11-20 02:28:56'),
	('e541d4c98cc81887bcf0be7ff0bf5fb5fe92e54fe2cdfdf153e671be29e33f65fa905fd2699f1a25', NULL, 6, NULL, '[]', 1, '2017-11-19 19:44:06', '2017-11-19 19:44:06', '2017-11-19 20:14:06'),
	('e7aa90f9cbaabce0e3e6b803f65771f88c2c56528e62e6fbbf879edee34343029ddd61d0dd917d23', 1, 4, NULL, '[]', 0, '2017-11-20 01:36:20', '2017-11-20 01:36:20', '2017-11-20 02:06:20'),
	('e8678dfc4635f1936d00e7329152f999c27ec11078b53a89a2eb06c9dc5acb9695e500cc104e03ea', 1, 4, NULL, '[]', 0, '2017-11-20 04:48:20', '2017-11-20 04:48:20', '2017-11-20 05:18:20'),
	('f1e554685b61a9f94c150643aa7a598f8bec48b536aa44512f68af1c5965626838620b1907a3a1aa', 1, 4, NULL, '[]', 0, '2017-11-20 01:18:33', '2017-11-20 01:18:33', '2017-11-20 01:48:33'),
	('ff70ef326e168d0af9de8f04b5905d69c5d9cab154324e7af1a36018e7a5b8f3badd53575bb180f9', NULL, 6, NULL, '[]', 1, '2017-11-19 19:42:46', '2017-11-19 19:42:46', '2017-11-19 20:12:46');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.oauth_auth_codes
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.oauth_auth_codes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.oauth_clients
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.oauth_clients: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'SnacksApp Personal Access Client', 'Yr0CD7sq0YAHgvYlCwEr4N0wjc1oI9RxBflr7Oee', 'http://localhost', 1, 0, 0, '2017-11-19 00:00:06', '2017-11-19 00:00:06'),
	(2, NULL, 'SnacksApp Password Grant Client', 'ylbfBXlhAljm64LrHOjgVuGg9tMq5qyquUIiMdaJ', 'http://localhost', 0, 1, 0, '2017-11-19 00:00:06', '2017-11-19 00:00:06'),
	(3, 0, 'Client', 'he9INsiHfSIf4oJo4DtkTn965RlisLsOIov1YB0u', 'http://localhost/auth/callback', 0, 0, 0, '2017-11-19 00:49:23', '2017-11-19 00:49:23'),
	(4, NULL, 'password', 'NPX17ifm75kLoJlDIlczb2zkFfHRSKICfrzR7iyB', 'http://localhost', 0, 1, 0, '2017-11-19 01:08:38', '2017-11-19 01:08:38'),
	(5, NULL, 'SnacksApp Personal Access Client', 'iqbLi0pgobHOQxmpoqZFiIiIMLPj0cgP8pLR5Pp6', 'http://localhost', 1, 0, 0, '2017-11-19 01:41:42', '2017-11-19 01:41:42'),
	(6, 1, 'My client', 'M2AD36L5rskAdXGkymZ7FFSLXcGRusBNAvibtHlZ', 'http://localhost', 0, 0, 1, '2017-11-19 02:13:40', '2017-11-20 15:17:06'),
	(7, 1, 'Test', '6e3opyayXPcMM9uzh4ek2GFKxCbYjTzigz9sfMcg', 'http://localhost', 0, 0, 0, '2017-11-20 15:17:17', '2017-11-20 15:17:17');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.oauth_personal_access_clients
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.oauth_personal_access_clients: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2017-11-19 00:00:06', '2017-11-19 00:00:06'),
	(2, 5, '2017-11-19 01:41:42', '2017-11-19 01:41:42');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.oauth_refresh_tokens
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.oauth_refresh_tokens: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
	('03b017fd4e54244aa89224a160230cbeab3958685c3cfe8ac084419ddabfd3c0575bbca2a36bcd0b', '7ad58413e3892b03e8cb9b140bb385cc459206476d9a890ca6bf5820529d4ee8a69bc9c30cfbf754', 0, '2017-12-20 01:57:56'),
	('32f40b0595ea96e1c39bf4a3564f6e8e0b8e3b6296fef2952cff05673de873955e0f2169afc8aa6c', '59de83be679484b6a7adfe0a400e7200dcce033a1b1af1d0ff1e33ffdb86ce495890a28f656ec6f2', 0, '2017-12-20 04:53:49'),
	('363b3f6e4e78d1dfcd87eda349db7fa04ab8fe2df52c876d7ecaf50f05f3d2d5e5d2e0ea3614ee6c', '7c24718de000727e30e1dee191922ca8d9224280497794cbd7f3d8c39245878b7cc9ae3355fa0173', 0, '2017-12-20 03:38:59'),
	('381d0d673c16cf096a782e6cb06ea8ed61965431386a0753a25cfcdec3cbec07fc1787ac223406ea', '900f2046fad624b4ee4df3dd0499690749c4b193fbff15c90db5e9bfb6ccf2d41764dcf62eda84b3', 0, '2017-12-20 01:58:27'),
	('381f20a55aaae9ff498c53c1b19cd873f7bf3b0d10ba30970423715202646933761d19408ccada05', '9c665759f16a45eea988a77f427f5f3412bfc5af9d7c777ecf6a894bca0d58a596435c495ab943ba', 0, '2017-12-20 00:23:00'),
	('4259e5803d2420d931aecad7cd8b016ad0630f5ff9a8a0069194b93a4dc9c2aa477b4a52ac7d1d67', '4eb9c54aa5176833564bd67c2a9edae14c0328d0c1e07bbcb34e403ccc40498cd38afab851bc968a', 0, '2017-12-19 19:54:28'),
	('46e24a43fe724c67f99d4e4074b4321b251d68126d10b7e6580488305a8d6c1ead5491c039c0bc8e', 'e17f4edee2adb20634ddd8c2cc68a4b6703459d283f270c2e61fa337ab56e8f6bb8d103de53e8305', 0, '2017-12-20 01:58:56'),
	('60ed26fd5edcc2e35d7a8b168d5a2faeb8cc00867ecf08e5d857897792cbea0b15cae3dc05ef43e3', '27596621f73ea4c2e94d26d8269bf4b20b17b99af3e0142ad7da73e8d02124a1619591cc4b773067', 0, '2017-12-19 20:05:30'),
	('75a215da3f4265bb0c483b42fec87b1e175d2caabbe560acde51acce1e14ac45acff75c2d344bd27', '3181bea9ae44ddd1857f0397ee6d4309cc20de9e6c59dc72a0e3dda86b0b19bcb7019dcd762b9144', 0, '2017-12-20 04:51:51'),
	('961a6849464b9312389db5a9714692007d8bf1c139a6c6202e7e7d4a6e6fc1f5a617a0647c515a36', 'dcc0f664b4ac9125dc447072e8eed3adfe1ece8c5ba7c9642d9c6113a4e7281425463ab7fcd7e059', 0, '2017-12-20 01:10:31'),
	('99030e10a5e82fd9aa9d04b0f59b38e1a04806eca6f8ca9572a025496853b45dc63896f797a3e531', '93f31a9f900a7615945c8dc3dfdc199eff387b62a0225ff4f9c88eee2b3090aebb642d0fb5850c73', 0, '2017-12-20 00:53:39'),
	('9a820120ab40ca1f1c79fda78a1babefe477caaaa8bd09a2e3c970766c9ed54e56b6c69643d375e9', '75fecd4b1ee9ae585a507658559701957cd64a65109bd3114c7f1b2bbec7977c71b0a09c55cff136', 0, '2017-12-20 05:09:03'),
	('bffe77f74df54492ab8770a7750b1f5660de8dd7515123c9400880c9631c44b19d8142b0b0170375', 'f1e554685b61a9f94c150643aa7a598f8bec48b536aa44512f68af1c5965626838620b1907a3a1aa', 0, '2017-12-20 01:18:33'),
	('cf0bdbfbe3474cc62ee408c992286a80a6329a29b1e3a1db76edfec62d128230257f5ad96747b6d5', '331f892146f64d723f1f3987d70425d7db5bd244c1e238b559951b4dea2aed2fba055a1c58ed8097', 0, '2017-12-19 20:27:47'),
	('d01d0fb4292bdfae1023a9b89b19380f303515db27ab48c8a2639826a1c022d9dc5188c57c00a6a4', 'e7aa90f9cbaabce0e3e6b803f65771f88c2c56528e62e6fbbf879edee34343029ddd61d0dd917d23', 0, '2017-12-20 01:36:20'),
	('d750b4f81899062e4e154d655f028a6fd782edcd55c5495258b67d3ffe774d2a98e57f4b2ab74798', 'e8678dfc4635f1936d00e7329152f999c27ec11078b53a89a2eb06c9dc5acb9695e500cc104e03ea', 0, '2017-12-20 04:48:20'),
	('d8378434f305d839c391d802bbc81e4031c89c9e31fc6290fa41e1abd9d1d8ebce9c5391dd4d1473', '7cb396aca70e359b32c2f6c01fc82ef948e1be35bbfad9409e25aa0341d0a6cd74f8df273f9dc2e0', 0, '2017-12-19 01:10:40'),
	('eca8e128abba67ac8e381dee647db4a1e58ae8f652a7729a0f29d6d37355e1728c1407c87f0d2ff5', 'ce5f2ec7d57d084984fa5a5451a46f79ac488ba335c9dab2fee1f2e3eddcf7496f6fba3da930aa1f', 0, '2017-12-20 02:29:29'),
	('eca9bd80756c56202344a65112dcd7562c57a5d97a9781831a762f5807d945871c690d7fcfe02b39', 'b8b1584de3c1c6cfd5d9917b2b90a9dd6e0994b6951e1d29249ce77f699f258cae0b18cc64d5bcec', 0, '2017-12-20 03:39:59');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.products: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `description`, `active`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
	(1, 'Bubblegum', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(2, 'Candy', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(3, 'Chocolate', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(4, 'Fudge', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(5, 'Marshmallow', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(6, 'Toffee', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(7, 'Pudding', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(8, 'Cookie', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(9, 'Pastry', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(10, 'Churros', NULL, 1, '2017-11-15 20:47:46', '2017-11-15 20:47:46', NULL, 1, 1, NULL),
	(11, 'algo nuevo', NULL, 1, '2017-11-20 04:56:28', '2017-11-20 04:56:28', NULL, 1, 1, NULL),
	(12, 'algo nuevo3', NULL, 1, '2017-11-20 05:02:53', '2017-11-20 05:02:53', NULL, 1, 1, NULL),
	(13, 'algo nuevo31', NULL, 1, '2017-11-20 05:03:44', '2017-11-20 05:03:44', NULL, 1, 1, NULL),
	(14, 'Mariano Paz1', NULL, 1, '2017-11-20 16:08:29', '2017-11-20 19:48:18', '2017-11-20 19:48:18', 1, 1, 1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.products_prices
DROP TABLE IF EXISTS `products_prices`;
CREATE TABLE IF NOT EXISTS `products_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `unit_price` decimal(10,2) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_prices_product_id_index` (`product_id`),
  CONSTRAINT `fk_prices_to_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.products_prices: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `products_prices` DISABLE KEYS */;
INSERT INTO `products_prices` (`id`, `product_id`, `unit_price`, `active`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
	(1, 1, 1.00, 1, '2017-11-19 12:08:19', '2017-11-19 12:08:19', NULL, NULL, NULL, NULL),
	(2, 2, 1.25, 1, '2017-11-19 12:08:19', '2017-11-19 12:08:19', NULL, NULL, NULL, NULL),
	(3, 3, 1.50, 1, '2017-11-19 12:08:19', '2017-11-19 12:08:19', NULL, NULL, NULL, NULL),
	(4, 4, 1.75, 1, '2017-11-19 12:08:19', '2017-11-19 12:08:19', NULL, NULL, NULL, NULL),
	(5, 5, 2.00, 1, '2017-11-19 12:08:19', '2017-11-19 12:08:19', NULL, NULL, NULL, NULL),
	(6, 6, 2.25, 1, '2017-11-19 12:08:19', '2017-11-19 12:08:19', NULL, NULL, NULL, NULL),
	(7, 7, 2.50, 1, '2017-11-19 12:08:19', '2017-11-19 12:08:19', NULL, NULL, NULL, NULL),
	(8, 8, 2.75, 1, '2017-11-19 12:08:19', '2017-11-19 12:08:19', NULL, NULL, NULL, NULL),
	(9, 9, 3.00, 1, '2017-11-19 12:08:19', '2017-11-19 12:08:19', NULL, NULL, NULL, NULL),
	(10, 10, 3.25, 0, '2017-11-19 12:08:19', '2017-11-20 20:27:33', NULL, NULL, NULL, NULL),
	(11, 13, 3.25, 1, '2017-11-20 05:03:44', '2017-11-20 05:03:44', NULL, 1, 1, NULL),
	(12, 14, 1.25, 0, '2017-11-20 16:08:29', '2017-11-20 19:21:57', NULL, 1, 1, NULL),
	(13, 14, 1.50, 0, '2017-11-20 19:22:25', '2017-11-20 19:22:33', NULL, 1, 1, NULL),
	(14, 14, 1.55, 0, '2017-11-20 19:22:33', '2017-11-20 19:22:56', NULL, 1, 1, NULL),
	(15, 14, 1.75, 0, '2017-11-20 19:22:56', '2017-11-20 19:46:05', NULL, 1, 1, NULL),
	(16, 14, 1.10, 1, '2017-11-20 19:46:05', '2017-11-20 19:46:05', NULL, 1, 1, NULL),
	(17, 10, 1.10, 1, '2017-11-20 20:27:34', '2017-11-20 20:27:34', NULL, 1, 1, NULL);
/*!40000 ALTER TABLE `products_prices` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.roles: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `active`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
	(1, 'Admin', 1, '2017-11-15 00:40:12', '2017-11-15 00:40:12', NULL, NULL, NULL, NULL),
	(2, 'User', 1, '2017-11-15 00:40:18', '2017-11-15 00:40:19', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.roles_users
DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE IF NOT EXISTS `roles_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_users_user_id_index` (`user_id`),
  KEY `roles_users_role_id_index` (`role_id`),
  CONSTRAINT `fk_role_to_user_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.roles_users: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
	(1, 1, 1, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL),
	(2, 2, 2, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL),
	(3, 3, 2, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL),
	(4, 4, 2, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL),
	(5, 5, 2, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL),
	(6, 6, 2, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL),
	(7, 7, 2, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL),
	(8, 8, 2, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL),
	(9, 9, 2, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL),
	(10, 10, 2, '2017-11-19 12:05:56', '2017-11-19 12:05:56', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;

-- Volcando estructura para tabla snacks.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `verification_token` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla snacks.users: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `active`, `verification_token`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
	(1, 'Cleora Mayer II', 'luis.breitenberg@example.net', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'cJWDpRxeSy1z9XwiyDrjsS4akOjwjwhe56zsMFQef2Iu6VKktHI5MLZjgGsQ', '2017-11-15 06:55:13', '2017-11-15 06:55:13', NULL, NULL, 1, NULL),
	(2, 'Jedidiah Legros', 'janiya37@example.net', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'ao3QWTcuV3', '2017-11-15 06:55:13', '2017-11-15 06:55:13', NULL, NULL, NULL, NULL),
	(3, 'Prof. Adriel Conroy PhD', 'nbartoletti@example.com', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'eicUJQCBJ0', '2017-11-15 06:55:13', '2017-11-15 06:55:13', NULL, NULL, NULL, NULL),
	(4, 'Prof. Mackenzie Schaden MD', 'abbey.smitham@example.org', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'Jji2UvRXSR', '2017-11-15 06:55:14', '2017-11-15 06:55:14', NULL, NULL, NULL, NULL),
	(5, 'Faustino Zboncak', 'gloria.baumbach@example.com', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'UcfLxGeJUj', '2017-11-15 06:55:14', '2017-11-15 06:55:14', NULL, NULL, NULL, NULL),
	(6, 'Destany Rolfson I', 'ijacobson@example.net', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'nRn0EAqGYy', '2017-11-15 06:55:14', '2017-11-15 06:55:14', NULL, NULL, NULL, NULL),
	(7, 'Shaun Gutkowski', 'gulgowski.ottilie@example.net', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'N1MGRdaeji', '2017-11-15 06:55:14', '2017-11-15 06:55:14', NULL, NULL, NULL, NULL),
	(8, 'Carson Roob', 'cristobal.kerluke@example.org', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'IT5PMICL4S', '2017-11-15 06:55:14', '2017-11-15 06:55:14', NULL, NULL, NULL, NULL),
	(9, 'Carson Harber', 'xbins@example.net', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'F9bLl6Lgn9', '2017-11-15 06:55:14', '2017-11-15 06:55:14', NULL, NULL, NULL, NULL),
	(10, 'Harry O\'Kon', 'samantha55@example.net', '$2y$10$LMXSaI4x41XqZOFG7eZ.buo7y81G9QreB0dZMrKwpL0zNjR2/ByPG', 1, NULL, 'SB9tHKsqJO', '2017-11-15 06:55:14', '2017-11-15 06:55:14', NULL, NULL, NULL, NULL),
	(12, 'Mariano Paz', 'mariano.paz.flores@gmail.com', '$2y$10$Xt1/Co5yDyrqfRUeJ.ms9eVmxlE.NC3Y/isyRtoqv1UZEKqHVyhmW', 1, NULL, NULL, '2017-11-20 02:44:52', '2017-11-20 03:44:30', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
