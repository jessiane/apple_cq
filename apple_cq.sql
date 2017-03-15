-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 15, 2017 at 07:34 PM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apple_cq`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2017-03-01 06:13:52', '2017-03-01 06:13:52'),
(2, NULL, 1, 'Category 2', 'category-2', '2017-03-01 06:13:52', '2017-03-01 06:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`) VALUES
(1, 1, 'id', 'PRI', 'ID', 1, 0, 0, 0, 0, 0, ''),
(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, ''),
(3, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, ''),
(4, 1, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, ''),
(5, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, ''),
(6, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '\n{\n    "resize": {\n        "width": "1000",\n        "height": "null"\n    },\n    "quality": "70%",\n    "upsize": true,\n    "thumbnails": [\n        {\n            "name": "medium",\n            "scale": "50%"\n        },\n        {\n            "name": "small",\n            "scale": "25%"\n        },\n        {\n            "name": "cropped",\n            "crop": {\n                "width": "300",\n                "height": "250"\n            }\n        }\n    ]\n}'),
(7, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '\n{\n    "slugify": {\n        "origin": "title",\n        "forceUpdate": true\n    }\n}'),
(8, 1, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, ''),
(9, 1, 'meta_keywords', 'text_area', 'meta_keywords', 1, 0, 1, 1, 1, 1, ''),
(10, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '\n{\n    "default": "DRAFT",\n    "options": {\n        "PUBLISHED": "published",\n        "DRAFT": "draft",\n        "PENDING": "pending"\n    }\n}'),
(11, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, ''),
(12, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, ''),
(13, 2, 'id', 'PRI', 'id', 1, 0, 0, 0, 0, 0, ''),
(14, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, ''),
(15, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, ''),
(16, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, ''),
(17, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, ''),
(18, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '\n{\n    "slugify": {\n        "origin": "title"\n    }\n}'),
(19, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, ''),
(20, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, ''),
(21, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '\n{\n    "default": "INACTIVE",\n    "options": {\n        "INACTIVE": "INACTIVE",\n        "ACTIVE": "ACTIVE"\n    }\n}'),
(22, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, ''),
(23, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, ''),
(24, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, ''),
(25, 3, 'id', 'PRI', 'id', 1, 0, 0, 0, 0, 0, ''),
(26, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, ''),
(27, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, ''),
(28, 3, 'password', 'password', 'password', 1, 0, 0, 1, 1, 0, ''),
(29, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, ''),
(30, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, ''),
(31, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, ''),
(32, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, ''),
(33, 5, 'id', 'PRI', 'id', 1, 0, 0, 0, 0, 0, ''),
(34, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, ''),
(35, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, ''),
(36, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, ''),
(37, 4, 'id', 'PRI', 'id', 1, 0, 0, 0, 0, 0, ''),
(38, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '\n{\n    "default": "__null__",\n    "null": "__null__",\n    "options": {\n        "__null__": "NULL"\n    },\n    "relationship": {\n        "key": "id",\n        "label": "name"\n    }\n}'),
(39, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '\n{\n    "default": 1\n}'),
(40, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, ''),
(41, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, ''),
(42, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, ''),
(43, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, ''),
(44, 6, 'id', 'PRI', 'id', 1, 0, 0, 0, 0, 0, ''),
(45, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, ''),
(46, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, ''),
(47, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, ''),
(48, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, ''),
(49, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, ''),
(50, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, ''),
(51, 3, 'role_id', 'text', 'role_id', 1, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`) VALUES
(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', '', 1, 0, '2017-03-01 06:00:22', '2017-03-01 06:00:22'),
(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', '', 1, 0, '2017-03-01 06:00:22', '2017-03-01 06:00:22'),
(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', '', 1, 0, '2017-03-01 06:00:22', '2017-03-01 06:00:22'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', '', 1, 0, '2017-03-01 06:00:22', '2017-03-01 06:00:22'),
(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', '', 1, 0, '2017-03-01 06:00:22', '2017-03-01 06:00:22'),
(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', '', 1, 0, '2017-03-01 06:00:22', '2017-03-01 06:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2017-03-01 06:00:23', '2017-03-01 06:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '/admin', '_self', 'voyager-boat', NULL, NULL, 2, '2017-03-01 06:00:23', '2017-03-14 05:39:47', NULL, NULL),
(2, 1, 'Media', '/admin/media', '_self', 'voyager-images', NULL, NULL, 5, '2017-03-01 06:00:23', '2017-03-14 05:39:45', NULL, NULL),
(3, 1, 'Posts', '/admin/posts', '_self', 'voyager-news', NULL, NULL, 6, '2017-03-01 06:00:23', '2017-03-14 05:39:45', NULL, NULL),
(4, 1, 'Users', '/admin/users', '_self', 'voyager-person', NULL, NULL, 4, '2017-03-01 06:00:23', '2017-03-14 05:39:45', NULL, NULL),
(5, 1, 'Categories', '/admin/categories', '_self', 'voyager-categories', NULL, NULL, 8, '2017-03-01 06:00:23', '2017-03-14 05:39:45', NULL, NULL),
(6, 1, 'Pages', '/admin/pages', '_self', 'voyager-file-text', NULL, NULL, 7, '2017-03-01 06:00:23', '2017-03-14 05:39:45', NULL, NULL),
(7, 1, 'Roles', '/admin/roles', '_self', 'voyager-lock', NULL, NULL, 3, '2017-03-01 06:00:23', '2017-03-14 05:39:45', NULL, NULL),
(8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2017-03-01 06:00:23', '2017-03-14 05:39:45', NULL, NULL),
(9, 1, 'Menu Builder', '/admin/menus', '_self', 'voyager-list', NULL, 8, 1, '2017-03-01 06:00:23', '2017-03-02 04:21:09', NULL, NULL),
(10, 1, 'Database', '/admin/database', '_self', 'voyager-data', NULL, 8, 2, '2017-03-01 06:00:23', '2017-03-14 05:37:41', NULL, NULL),
(11, 1, 'Settings', '/admin/settings', '_self', 'voyager-settings', NULL, NULL, 10, '2017-03-01 06:00:23', '2017-03-14 05:39:45', NULL, NULL),
(13, 1, '打印', '/admin/printer', '_self', 'voyager-laptop', '#4348b4', NULL, 1, '2017-03-02 05:30:46', '2017-03-14 05:39:47', NULL, ''),
(14, 1, '机型', '/admin/model', '_self', 'voyager-phone', '#000000', 8, 3, '2017-03-14 05:36:21', '2017-03-14 05:39:20', NULL, ''),
(15, 1, '顏色', '/admin/color', '_self', 'voyager-leaf', '#000000', 8, 4, '2017-03-14 05:38:53', '2017-03-14 05:38:59', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_ add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1),
(16, '2017_01_15_000000_create_permission_groups_table', 1),
(17, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Scurvy Page', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/AAgCCnqHfLlRub9syUdw.jpg', 'scurvy-page', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2017-03-01 06:13:52', '2017-03-01 06:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'browse_admin', NULL, '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(2, 'browse_database', NULL, '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(3, 'browse_media', NULL, '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(4, 'browse_settings', NULL, '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(5, 'browse_menus', 'menus', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(6, 'read_menus', 'menus', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(7, 'edit_menus', 'menus', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(8, 'add_menus', 'menus', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(9, 'delete_menus', 'menus', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(10, 'browse_pages', 'pages', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(11, 'read_pages', 'pages', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(12, 'edit_pages', 'pages', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(13, 'add_pages', 'pages', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(14, 'delete_pages', 'pages', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(15, 'browse_roles', 'roles', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(16, 'read_roles', 'roles', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(17, 'edit_roles', 'roles', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(18, 'add_roles', 'roles', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(19, 'delete_roles', 'roles', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(20, 'browse_users', 'users', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(21, 'read_users', 'users', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(22, 'edit_users', 'users', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(23, 'add_users', 'users', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(24, 'delete_users', 'users', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(25, 'browse_posts', 'posts', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(26, 'read_posts', 'posts', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(27, 'edit_posts', 'posts', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(28, 'add_posts', 'posts', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(29, 'delete_posts', 'posts', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(30, 'browse_categories', 'categories', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(31, 'read_categories', 'categories', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(32, 'edit_categories', 'categories', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(33, 'add_categories', 'categories', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL),
(34, 'delete_categories', 'categories', '2017-03-01 06:00:23', '2017-03-01 06:00:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/nlje9NZQ7bTMYOUG4lF1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-03-01 06:13:52', '2017-03-01 06:13:52'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/7uelXHi85YOfZKsoS6Tq.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-03-01 06:13:52', '2017-03-01 06:13:52'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/9txUSY6wb7LTBSbDPrD9.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-03-01 06:13:52', '2017-03-01 06:13:52'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/yuk1fBwmKKZdY2qR1ZKM.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-03-01 06:13:52', '2017-03-01 06:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2017-03-01 06:00:23', '2017-03-01 06:00:23'),
(2, 'user', 'Normal User', '2017-03-01 06:00:23', '2017-03-01 06:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`) VALUES
(1, 'title', 'Site Title', 'apple_cq', '', 'text', 1),
(2, 'description', 'Site Description', 'Site Description', '', 'text', 2),
(3, 'logo', 'Site Logo', '', '', 'image', 3),
(4, 'admin_bg_image', 'Admin Background Image', '', '', 'image', 9),
(5, 'admin_title', 'Admin Title', 'Voyager', '', 'text', 4),
(6, 'admin_description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 5),
(7, 'admin_loader', 'Admin Loader', '', '', 'image', 6),
(8, 'admin_icon_image', 'Admin Icon Image', '', '', 'image', 7),
(9, 'google_analytics_client_id', 'Google Analytics Client ID', '', '', 'text', 9);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$bT1cO.cM6eJ3T7tjvqxp8u72qbaAl3GHuBci0zTu/PsBwB297Amh2', 'KIt3FvNED3G5jLxt0RVd5ECkSJ07gqJgaMb5Fvi7iDTbc2RiDgDVs7KsnPeN', '2017-03-01 06:13:52', '2017-03-01 06:13:52'),
(2, NULL, 'qskane', 'qskane1@gmail.com', 'users/default.png', '$2y$10$c5ozowDDMohkYkw.mb6w0OgbQwc5PPSm5.xvEjPT3xVY4WOFZ6lXW', NULL, '2017-03-02 04:26:29', '2017-03-02 04:26:29');

-- --------------------------------------------------------

--
-- Table structure for table `v_orders`
--

CREATE TABLE `v_orders` (
  `id` int(11) NOT NULL,
  `order_number_prefix` varbinary(10) NOT NULL,
  `order_number` int(11) NOT NULL,
  `name` varbinary(32) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `tel` varbinary(24) NOT NULL,
  `service_user` varbinary(10) NOT NULL,
  `model_name` varbinary(24) NOT NULL,
  `color` varbinary(12) NOT NULL,
  `IMEI` varbinary(24) NOT NULL,
  `surface` varbinary(32) DEFAULT '',
  `attachment` varbinary(32) DEFAULT '',
  `password` varbinary(32) DEFAULT '',
  `symptom` varbinary(255) DEFAULT '',
  `guarantee_type` int(11) DEFAULT '0',
  `statement` varbinary(255) DEFAULT '',
  `repair_plan` varbinary(255) DEFAULT '',
  `guarantee_time` varbinary(32) DEFAULT '',
  `spend` varbinary(32) DEFAULT '',
  `sign` varbinary(12) DEFAULT '',
  `retrieve_time` varbinary(14) DEFAULT '',
  `is_delete` tinyint(1) DEFAULT '0',
  `is_repaired` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `v_orders`
--

INSERT INTO `v_orders` (`id`, `order_number_prefix`, `order_number`, `name`, `sex`, `tel`, `service_user`, `model_name`, `color`, `IMEI`, `surface`, `attachment`, `password`, `symptom`, `guarantee_type`, `statement`, `repair_plan`, `guarantee_time`, `spend`, `sign`, `retrieve_time`, `is_delete`, `is_repaired`, `created_at`, `updated_at`) VALUES
(1, 0x313730313031, 1234, 0xe5aea2, 1, 0x3135383831383831393235, 0x31, 0x415346445745, 0xe58f91e98081, 0x3132333441534446, 0x31323433, 0xe4b889e59cb0e696b9, 0x3132333435, 0x31323334e7acace4b889e696b9, 2, 0x31323334e5958ae4b889e59cb0e696b9e69292e697a6, 0xe6b094e591b3e584bf323334e4b889e59cb0e696b9, 0x3230, 0x3130, 0x31, 0x323031372d30313031, 0, 1, '2017-03-14 12:11:47', '2017-03-14 12:11:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_groups_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `v_orders`
--
ALTER TABLE `v_orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `v_orders`
--
ALTER TABLE `v_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
