-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Jun 2024 um 10:22
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `weinhandel`
--
CREATE DATABASE IF NOT EXISTS `weinhandel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `weinhandel`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts_customer`
--

CREATE TABLE IF NOT EXISTS `accounts_customer` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `accounts_customer`
--

INSERT INTO `accounts_customer` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `address`) VALUES
(1, 'pbkdf2_sha256$720000$HAHOZiTVIMbvrhsXVdkLxa$hmAYw89Q1Agzd4k2KEt8Q98klBnKExhBAXaCGRvbaLM=', '2024-05-29 16:55:55.368641', 0, 'Johnny', 'John', 'Doe', 'jon.doe@john.doe', 0, 1, '2024-05-08 12:16:36.380427', 'Home Lane'),
(2, 'pbkdf2_sha256$720000$sByODjrCkOVkCpHSvNQz1I$xvOLM+TYPaHctua1rFNnCt8SCr95L8VBMzEbi90asvg=', '2024-05-29 16:56:40.154929', 1, 'admin', '', '', '', 1, 1, '2024-05-10 07:48:32.416348', ''),
(3, 'pbkdf2_sha256$720000$wB9YdVDtiUbJk6W5FTNhTb$ml/Wg7Br0+ttLz96O/c4efb/t4EFAIZyErY/bD32xuM=', '2024-06-05 09:17:59.718334', 0, 'Staffy', 'Chleo', 'Clue', 'cleo@cl.ue', 1, 1, '2024-05-10 08:19:39.000000', 'Private Lane'),
(4, 'pbkdf2_sha256$720000$jae62jHP38xQW6klz9qXgO$nDH1JihYiSH5cyEy+5C9YxXsxOq6/ixLDlcHOuUrEwE=', '2024-05-21 07:08:16.869449', 0, 'Joy', 'Joy', 'Deboy', 'Joy@deb.oy', 0, 1, '2024-05-10 14:07:34.841326', 'Home'),
(5, 'pbkdf2_sha256$720000$6mRk4HDCfDsahFU01nd0OH$oVmJc2s7yPIYP1/mYi7mlXMm2LmLRjFIhdc0rnwpFjU=', '2024-06-05 09:16:53.948926', 0, 'LordLamber', 'Hoganuyan', 'Humbley', 'hogan@ui.an', 0, 1, '2024-05-13 12:31:02.884631', 'Private Lane Hamburg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts_customer_groups`
--

CREATE TABLE IF NOT EXISTS `accounts_customer_groups` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts_customer_user_permissions`
--

CREATE TABLE IF NOT EXISTS `accounts_customer_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add product', 6, 'add_product'),
(22, 'Can change product', 6, 'change_product'),
(23, 'Can delete product', 6, 'delete_product'),
(24, 'Can view product', 6, 'view_product'),
(25, 'Can add order', 7, 'add_order'),
(26, 'Can change order', 7, 'change_order'),
(27, 'Can delete order', 7, 'delete_order'),
(28, 'Can view order', 7, 'view_order'),
(29, 'Can add user', 8, 'add_customer'),
(30, 'Can change user', 8, 'change_customer'),
(31, 'Can delete user', 8, 'delete_customer'),
(32, 'Can view user', 8, 'view_customer'),
(33, 'Can add purchase', 9, 'add_purchase'),
(34, 'Can change purchase', 9, 'change_purchase'),
(35, 'Can delete purchase', 9, 'delete_purchase'),
(36, 'Can view purchase', 9, 'view_purchase'),
(37, 'Can add reserved order', 10, 'add_reservedorder'),
(38, 'Can change reserved order', 10, 'change_reservedorder'),
(39, 'Can delete reserved order', 10, 'delete_reservedorder'),
(40, 'Can view reserved order', 10, 'view_reservedorder'),
(41, 'Can add product vintage', 11, 'add_productvintage'),
(42, 'Can change product vintage', 11, 'change_productvintage'),
(43, 'Can delete product vintage', 11, 'delete_productvintage'),
(44, 'Can view product vintage', 11, 'view_productvintage');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-05-10 08:30:10.586898', '3', 'Staffy', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 8, 2),
(2, '2024-05-10 11:12:33.304647', '1', 'Château Grand Crux: 1000, 0', 3, '', 7, 2),
(3, '2024-05-10 11:44:46.142849', '2', 'None: 7, 0', 3, '', 7, 2),
(4, '2024-05-10 11:46:02.381767', '3', 'Estate Platinum Selection: 2, 0', 3, '', 7, 2),
(5, '2024-05-10 13:14:52.819549', '7', 'Vineyard Gold Reserve: 2, None', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 7, 2),
(6, '2024-05-10 13:23:04.570322', '7', 'Vineyard Gold Reserve: 2, 2', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 7, 2),
(7, '2024-05-10 13:23:11.338521', '7', 'Vineyard Gold Reserve: 2, 1', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 7, 2),
(8, '2024-05-14 08:34:24.628004', '1', 'Château Grand Crux - 2009', 1, '[{\"added\": {}}]', 11, 2),
(9, '2024-05-14 11:17:29.404568', '2', 'Château Grand Crux - 2005', 1, '[{\"added\": {}}]', 11, 2),
(10, '2024-05-14 11:17:46.064858', '2', 'Château Grand Crux - 2005', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 11, 2),
(11, '2024-05-14 11:21:27.033961', '3', 'Vineyard Gold Reserve - 2005', 1, '[{\"added\": {}}]', 11, 2),
(12, '2024-05-14 11:22:00.903577', '4', 'Vineyard Gold Reserve - 2007', 1, '[{\"added\": {}}]', 11, 2),
(13, '2024-05-14 11:22:27.555012', '5', 'Vineyard Gold Reserve - 2009', 1, '[{\"added\": {}}]', 11, 2),
(14, '2024-05-14 11:22:57.863644', '6', 'Vineyard Gold Reserve - 2011', 1, '[{\"added\": {}}]', 11, 2),
(15, '2024-05-14 11:23:37.384480', '7', 'Vineyard Gold Reserve - 2015', 1, '[{\"added\": {}}]', 11, 2),
(16, '2024-05-14 11:24:04.198087', '8', 'Vineyard Gold Reserve - 2019', 1, '[{\"added\": {}}]', 11, 2),
(17, '2024-05-14 11:34:47.828628', '2', 'Château Grand Crux - 2006', 2, '[{\"changed\": {\"fields\": [\"Vintage\"]}}]', 11, 2),
(18, '2024-05-14 11:35:08.125114', '1', 'Château Grand Crux - 2008', 2, '[{\"changed\": {\"fields\": [\"Vintage\"]}}]', 11, 2),
(19, '2024-05-14 19:52:37.552247', '1', 'Château Grand Crux - 2006: Amount: 1, State: Whishlist', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(20, '2024-05-14 20:45:29.962278', '1', 'Château Grand Crux - 2006: Amount: 1, State: Whishlist', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(21, '2024-05-14 21:19:32.746529', '2', 'Château Grand Crux - 2006: Amount: 1, State: Whishlist', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(22, '2024-05-14 21:20:10.356677', '1', 'Vineyard Gold Reserve - 2019: Amount: 1, State: Pending', 2, '[{\"changed\": {\"fields\": [\"Product\", \"State\"]}}]', 10, 2),
(23, '2024-05-14 21:20:24.450401', '3', 'Vineyard Gold Reserve - 2007: Amount: 12, State: Pending', 1, '[{\"added\": {}}]', 10, 2),
(24, '2024-05-14 21:22:06.430082', '4', 'Vineyard Gold Reserve - 2011: Amount: 17, State: Pending', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 10, 2),
(25, '2024-05-15 08:36:19.483499', '2', 'Vineyard Gold Reserve - 2009: Amount: 2, State: Whishlist', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 10, 2),
(26, '2024-05-15 09:18:24.701378', '2', 'Vineyard Gold Reserve - 2009: Amount: 2, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(27, '2024-05-15 09:18:32.073317', '7', 'Vineyard Gold Reserve - 2011: Amount: 1, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(28, '2024-05-15 09:33:40.087541', '7', 'Vineyard Gold Reserve - 2011: Amount: 1, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(29, '2024-05-15 09:33:46.833135', '2', 'Vineyard Gold Reserve - 2009: Amount: 2, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(30, '2024-05-15 09:35:19.508184', '7', 'Vineyard Gold Reserve - 2011: Amount: 1, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(31, '2024-05-15 09:35:22.778661', '2', 'Vineyard Gold Reserve - 2009: Amount: 2, State: Purchased', 2, '[]', 10, 2),
(32, '2024-05-15 09:35:32.339968', '2', 'Vineyard Gold Reserve - 2009: Amount: 2, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(33, '2024-05-15 09:40:59.625804', '7', 'Vineyard Gold Reserve - 2011: Amount: 1, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(34, '2024-05-15 09:41:07.001662', '2', 'Vineyard Gold Reserve - 2009: Amount: 2, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(35, '2024-05-15 09:44:46.754348', '7', 'Vineyard Gold Reserve - 2011: Amount: 1, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(36, '2024-05-15 09:44:53.499058', '2', 'Vineyard Gold Reserve - 2009: Amount: 2, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(37, '2024-05-15 09:50:48.288333', '7', 'Vineyard Gold Reserve - 2011: Amount: 1, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(38, '2024-05-15 09:51:00.947835', '2', 'Vineyard Gold Reserve - 2009: Amount: 2, State: Pending', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(39, '2024-05-16 11:59:50.539507', '2', 'Château Grand Crux - 2006', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 11, 2),
(40, '2024-05-16 12:44:23.824850', '16', 'Château Grand Crux - 2006, Amount: 2, Price: 581.00 €, Total: 1162.00 €', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(41, '2024-05-16 12:45:24.438099', '16', 'Château Grand Crux - 2006, Amount: 2, Price: 581.00 €, Total: 1162.00 €', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(42, '2024-05-16 12:47:22.859736', '16', 'Château Grand Crux - 2006, Amount: 2, Price: 581.00 €, Total: 1162.00 €', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2),
(43, '2024-05-16 12:48:07.518815', '16', 'Château Grand Crux - 2006, Amount: 2, Price: 581.00 €, Total: 1162.00 €', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 10, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'accounts', 'customer'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(7, 'shop', 'order'),
(6, 'shop', 'product'),
(11, 'shop', 'productvintage'),
(9, 'shop', 'purchase'),
(10, 'shop', 'reservedorder');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-08 09:43:47.154713'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-05-08 09:43:47.199937'),
(3, 'auth', '0001_initial', '2024-05-08 09:43:47.400446'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-05-08 09:43:47.441672'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-05-08 09:43:47.445567'),
(6, 'auth', '0004_alter_user_username_opts', '2024-05-08 09:43:47.450564'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-05-08 09:43:47.454571'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-05-08 09:43:47.456562'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-05-08 09:43:47.460562'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-05-08 09:43:47.465841'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-05-08 09:43:47.470842'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-05-08 09:43:47.490267'),
(13, 'auth', '0011_update_proxy_permissions', '2024-05-08 09:43:47.513266'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-05-08 09:43:47.518266'),
(15, 'accounts', '0001_initial', '2024-05-08 09:43:47.772587'),
(16, 'admin', '0001_initial', '2024-05-08 09:43:47.868617'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-05-08 09:43:47.873618'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-08 09:43:47.880619'),
(19, 'sessions', '0001_initial', '2024-05-08 09:43:47.915686'),
(20, 'shop', '0001_initial', '2024-05-08 09:43:48.090702'),
(21, 'shop', '0002_remove_order_products_order_products', '2024-05-10 09:57:42.907043'),
(22, 'shop', '0003_rename_products_order_product', '2024-05-10 11:05:15.302553'),
(23, 'shop', '0004_reservedorder_purchase_delete_order', '2024-05-14 07:24:35.227885'),
(24, 'shop', '0005_remove_product_price_remove_product_stock_and_more', '2024-05-14 07:57:54.828380'),
(25, 'shop', '0006_alter_reservedorder_product', '2024-05-14 08:38:58.700124'),
(26, 'shop', '0007_alter_reservedorder_customer', '2024-05-15 12:52:40.996780'),
(27, 'shop', '0008_alter_purchase_total_price_and_more', '2024-05-16 08:13:08.768357');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('kq58icfj4iusa7748udblmq75zgifyig', 'e30:1s4gGR:SYbn1rtmbfPPohSz-3pCmcbI0kbgPB_-vT6JO4NFuOI', '2024-05-22 12:19:15.798215'),
('ro68up7ldvd9rj5gc6dims5fk1w8t97b', '.eJxVjEEOgjAQRe_StWnagQHq0r1nIDPM1KKmTSisjHdXEha6_e-9_zIjbWsat6rLOIs5GzCn341pemjegdwp34qdSl6Xme2u2INWey2iz8vh_h0kqulbIxAjiY_QN9ygx8H5QA60g2lQYRiAXR84eO8xYtPFVigqtT2hsLB5fwDUvzga:1s7E3T:40el3TyBjbkLeYvPMla-mhE_SFjz1HtVh6uf5phRGAc', '2024-05-29 12:48:23.416246');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shop_product`
--

CREATE TABLE IF NOT EXISTS `shop_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `shop_product`
--

INSERT INTO `shop_product` (`id`, `name`, `description`) VALUES
(1, 'Château Grand Crux', 'A full-bodied, rich and velvety wine with notes of blackcurrant, plum, and chocolate. Aged in oak barrels for 15 years, it pairs well with red meat, game, and strong cheeses.'),
(2, 'Vineyard Gold Reserve', 'An elegant and complex wine with a bouquet of honey, green apple, and a hint of vanilla. Perfect for seafood, poultry, and light pasta dishes.'),
(3, 'Estate Platinum Selection', 'A sophisticated and intense wine with flavors of dark cherry, raspberry, and mocha. Excellent with grilled meats, hearty stews, and dark chocolate.'),
(4, 'Orchard Silver Label', 'A light and crisp wine with flavors of pear, peach, and a hint of honeydew. Ideal for salads, light pasta dishes, and seafood.'),
(5, 'Villa Ruby Reserve', 'A vibrant and fruity wine with notes of strawberry, cherry, and a hint of rose. Perfect for poultry, pork, and vegetarian dishes.'),
(7, 'Sunset Valley Merlot', 'A smooth and medium-bodied wine with notes of black cherry, plum, and a hint of chocolate. Perfect for red meat, poultry, and cheese.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shop_productvintage`
--

CREATE TABLE IF NOT EXISTS `shop_productvintage` (
  `id` bigint(20) NOT NULL,
  `vintage` int(11) NOT NULL,
  `vintage_description` longtext NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL CHECK (`stock` >= 0),
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `shop_productvintage`
--

INSERT INTO `shop_productvintage` (`id`, `vintage`, `vintage_description`, `price`, `stock`, `product_id`) VALUES
(1, 2008, 'The 2009 vintage of Château Grand Crux is a remarkable expression of an exceptional year, distinguished by its full-bodied, rich, and velvety character. This vintage offers an exquisite blend of blackcurrant, plum, and chocolate notes, each sip unfolding with luxurious depth. The wine\'s 15-year aging in oak barrels has bestowed it with a refined complexity and a smooth, elegant finish. The 2009 harvest, celebrated for its ideal growing conditions, has produced a wine that pairs perfectly with red meat, game, and strong cheeses. The Château Grand Crux 2009 stands out as a quintessential vintage, capturing the essence of its year with grace and opulence.', 847.00, 87, 1),
(2, 2006, 'The 2005 vintage of Château Grand Crux is a shining example of an exceptional year, marked by its remarkable depth and richness. This full-bodied wine captivates with its velvety texture, unveiling intricate layers of blackcurrant, plum, and a hint of luscious chocolate. Aged to perfection over 15 years in oak barrels, it has developed a nuanced complexity and a refined, smooth finish. The distinctive character of the 2005 vintage pairs exquisitely with red meat, game, and strong cheeses, making it a standout choice for discerning palates. This vintage is celebrated for its harmonious balance and the unique expression of its terroir, offering a truly unforgettable wine experience.', 581.00, 41, 1),
(3, 2005, 'The 2005 vintage of Vineyard Gold Reserve is a testament to a year of unparalleled elegance. This wine offers a harmonious bouquet of honey and green apple, with a delicate hint of vanilla that lingers on the palate. Perfectly suited for pairing with seafood, poultry, and light pasta dishes, the 2005 vintage stands out for its refined complexity and sophisticated charm.', 37.00, 311, 2),
(4, 2007, 'The 2007 vintage of Vineyard Gold Reserve shines with a distinctive vibrancy. The elegant notes of honey and green apple are beautifully complemented by a subtle touch of vanilla. This year’s unique climatic conditions have imparted an extra layer of freshness, making it an ideal companion for seafood, poultry, and light pasta dishes.', 41.00, 209, 2),
(5, 2010, 'Vineyard Gold Reserve\'s 2010 vintage is celebrated for its remarkable balance and depth. The wine’s bouquet of honey and green apple is enhanced by a whisper of vanilla, creating a complex and elegant profile. This vintage is particularly noted for its smooth finish, making it an exquisite match for seafood, poultry, and light pasta dishes.', 45.00, 298, 2),
(6, 2011, 'The 2011 vintage of Vineyard Gold Reserve is marked by its exquisite finesse. With a bouquet featuring honey and green apple, underscored by a hint of vanilla, this vintage offers a beautifully layered experience. The year’s optimal growing conditions have yielded a wine of exceptional clarity and elegance, perfect for seafood, poultry, and light pasta dishes.', 37.00, 275, 2),
(7, 2015, 'In the 2015 vintage of Vineyard Gold Reserve, elegance and complexity are at their peak. The wine’s bouquet of honey and green apple is enriched by a hint of vanilla, resulting in a sophisticated profile. This vintage is distinguished by its exceptional smoothness and balance, making it a perfect pairing for seafood, poultry, and light pasta dishes.', 35.00, 179, 2),
(8, 2019, 'Vineyard Gold Reserve\'s 2019 vintage is a celebration of elegance and complexity. The harmonious blend of honey and green apple, accented by a touch of vanilla, offers a rich and layered bouquet. This vintage is particularly noted for its crisp and clean finish, making it an excellent choice for seafood, poultry, and light pasta dishes.', 41.00, 228, 2),
(9, 2012, '\"Introducing the Sunset Valley Merlot, a timeless testament to the impeccable craftsmanship of the 2012 vintage. Crafted with meticulous care and attention, this vintage embodies the essence of elegance and sophistication.\r\n\r\n2012 bestowed upon this Merlot a character uniquely its own, marked by a sublime harmony of flavors. With each sip, one is transported to a bygone era, where the vines soaked in the sun\'s golden hues, nurturing grapes that would eventually yield this masterpiece.\r\n\r\nA symphony of sensations awaits within each bottle - a smooth, medium-bodied allure that gracefully dances on the palate. Delicate whispers of black cherry and plum intertwine, complemented by a subtle embrace of chocolate, reminiscent of a decadent dessert.\r\n\r\nThis vintage holds within its depths a narrative of the land, the weather, and the hands that tenderly nurtured it. It\'s a tribute to the artistry of winemaking and the unyielding spirit of the 2012 harvest.\r\n\r\nIndulge in this timeless creation, an ode to tradition and the enduring legacy of Sunset Valley. Perfectly paired with red meat, poultry, or a selection of artisanal cheeses, it promises an experience that transcends time.\"', 53.00, 211, 7),
(11, 2014, '\"Presenting the Sunset Valley Merlot, a distinguished creation from the exceptional 2014 vintage. This year, renowned for its ideal growing conditions, has imparted a distinctive charm and richness to our beloved Merlot.\r\n\r\nThe 2014 vintage stands as a testament to the perfect balance of nature’s gifts and meticulous winemaking. The season blessed the vines with optimal sunshine and cool nights, resulting in grapes of unparalleled quality. This harmonious climate is vividly captured in every bottle, delivering a wine that is both vibrant and nuanced.\r\n\r\nIndulge in the smooth, medium-bodied elegance of this Merlot, where the lush flavors of black cherry and plum take center stage. These ripe fruit notes are artfully balanced by a hint of chocolate, adding depth and sophistication to each sip.\r\n\r\nEvery glass of the 2014 Sunset Valley Merlot is a celebration of this remarkable vintage, reflecting the passion and dedication that went into its creation. It’s a wine that effortlessly complements red meat, poultry, and a variety of cheeses, making it a versatile choice for any dining experience.\r\n\r\nSavor the essence of the 2014 harvest with Sunset Valley Merlot, where each taste tells the story of a year that was nothing short of extraordinary.\"', 59.00, 237, 7),
(12, 2016, '\"Introducing the Sunset Valley Merlot, a distinguished expression of the superb 2016 vintage. This year, characterized by its exceptional growing conditions, has imbued this Merlot with a remarkable depth and complexity that truly stands out.\r\n\r\nThe 2016 vintage is celebrated for its perfect blend of warm days and cool nights, fostering grapes that matured with an ideal balance of sugars and acidity. This equilibrium is masterfully captured in each bottle, presenting a wine that is as refined as it is flavorful.\r\n\r\nDelight in the smooth, medium-bodied character of this Merlot, where the luscious notes of black cherry and plum shine brightly. These vibrant fruit flavors are seamlessly intertwined with a subtle hint of chocolate, creating a harmonious and lingering finish.\r\n\r\nEvery sip of the 2016 Sunset Valley Merlot reveals the meticulous craftsmanship and dedication that define this vintage. It\'s a wine that pairs exquisitely with red meat, poultry, and a diverse array of cheeses, making it an elegant addition to any meal.\r\n\r\nExperience the 2016 Sunset Valley Merlot, where each glass is a tribute to a year of viticultural excellence and the enduring legacy of Sunset Valley.\"', 53.00, 243, 7),
(13, 2018, '\"Introducing the Sunset Valley Merlot, a remarkable creation from the distinguished 2018 vintage. This year is celebrated for its ideal weather patterns, resulting in a wine that is both vibrant and deeply expressive.\r\n\r\nThe 2018 vintage benefited from a perfect balance of warm days and cool nights, allowing the grapes to ripen slowly and evenly. This ideal maturation process is beautifully reflected in the wine, showcasing a depth of flavor and complexity that is truly exceptional.\r\n\r\nExperience the smooth, medium-bodied allure of this Merlot, where rich notes of black cherry and plum take center stage. These luscious fruit flavors are elegantly complemented by a hint of chocolate, adding a layer of sophistication and a lingering finish that delights the palate.\r\n\r\nEach bottle of the 2018 Sunset Valley Merlot is a testament to the meticulous care and craftsmanship that went into its creation. It pairs exquisitely with red meat, poultry, and a variety of cheeses, making it a versatile choice for any dining occasion.\r\n\r\nSavor the excellence of the 2018 harvest with Sunset Valley Merlot, where every sip tells the story of a vintage marked by harmony, balance, and extraordinary quality.\"', 61.00, 207, 7),
(14, 2020, '\"Introducing the Sunset Valley Merlot, an exquisite gem from the notable 2020 vintage. This year, despite its challenges, has produced a wine that stands out for its exceptional quality and character.\r\n\r\nThe 2020 vintage faced unique weather conditions, with a blend of warm days and cooler evenings that allowed the grapes to develop a rich and concentrated flavor profile. This meticulous balance of nature\'s elements is artfully captured in each bottle, delivering a wine that is robust yet elegantly nuanced.\r\n\r\nIndulge in the smooth, medium-bodied charm of this Merlot, where the prominent notes of black cherry and plum are beautifully highlighted. These vibrant fruit flavors are gracefully intertwined with a subtle hint of chocolate, creating a harmonious and sophisticated finish that lingers on the palate.\r\n\r\nEvery bottle of the 2020 Sunset Valley Merlot reflects the dedication and resilience of the winemakers. It is a perfect companion for red meat, poultry, and an assortment of fine cheeses, making it an ideal choice for any occasion.\r\n\r\nExperience the unique essence of the 2020 harvest with Sunset Valley Merlot, where each sip reveals a story of perseverance, passion, and outstanding winemaking.\"', 58.00, 214, 7),
(15, 2022, '\"Introducing the Sunset Valley Merlot, an exquisite expression of the exceptional 2022 vintage. This year, marked by its near-perfect growing conditions, has yielded a wine that is both vibrant and elegantly balanced.\r\n\r\nThe 2022 vintage enjoyed an optimal climate, with warm, sunny days and cool, crisp nights that allowed the grapes to mature slowly and evenly. This harmonious environment is beautifully encapsulated in each bottle, delivering a Merlot that is both richly flavorful and finely structured.\r\n\r\nDelight in the smooth, medium-bodied allure of this Merlot, where luscious notes of black cherry and plum come to life. These ripe fruit flavors are seamlessly complemented by a delicate hint of chocolate, adding depth and a sophisticated finish that lingers gracefully on the palate.\r\n\r\nEvery sip of the 2022 Sunset Valley Merlot is a testament to the meticulous care and dedication of our winemakers. It pairs perfectly with red meat, poultry, and a variety of fine cheeses, making it a versatile choice for any dining experience.\r\n\r\nSavor the essence of the 2022 harvest with Sunset Valley Merlot, where each glass reflects a year of extraordinary viticulture and unparalleled craftsmanship.\"', 54.00, 207, 7),
(16, 2012, '\"Experience the elegance of the Estate Platinum Selection from the celebrated 2012 vintage. This year, marked by its perfect balance of sun-kissed days and cool nights, has yielded a wine of unparalleled sophistication.\r\n\r\nThe 2012 Estate Platinum Selection captivates the palate with its intense flavors of dark cherry, raspberry, and mocha. Each sip is a journey through layers of complexity and refinement.\r\n\r\nSavor this sophisticated vintage alongside grilled meats, hearty stews, or a decadent slice of dark chocolate, and let its rich flavors transport you to a realm of indulgence and pleasure.\"', 374.00, 109, 3),
(17, 2014, '\"Introducing the Estate Platinum Selection, a pinnacle of excellence from the illustrious 2014 vintage. This year, renowned for its optimal growing conditions, has produced a wine of remarkable depth and character.\r\n\r\nThe 2014 Estate Platinum Selection exudes sophistication with its intense flavors of dark cherry, raspberry, and mocha. Each sip is a symphony of sensations, harmoniously balanced and intricately layered.\r\n\r\nPair this extraordinary vintage with grilled meats, hearty stews, or a velvety piece of dark chocolate for a dining experience that is truly unforgettable.\"', 312.00, 140, 3),
(18, 2010, 'Introducing the 2010 Orchard Silver Label, a wine that perfectly captures the essence of a remarkable year. Celebrated for its light and crisp profile, this vintage offers flavors of fresh pear, ripe peach, and a hint of honeydew melon. Its enticing pear aroma leads to lush peach notes and a subtle touch of honeydew, culminating in a refreshing, crisp finish.\r\n\r\nIdeal for pairing with salads, light pasta dishes, and seafood, the 2010 Orchard Silver Label enhances the delicate flavors of these dishes without overpowering them. The optimal conditions of the 2010 growing season, with warm days and cool nights, allowed the grapes to mature slowly and develop their full flavor potential. This vintage reflects the unique terroir and expert craftsmanship behind every bottle.\r\n\r\nExperience the 2010 Orchard Silver Label, a wine that delights the senses and tells the story of an exceptional year in winemaking.', 21.00, 356, 4),
(19, 2009, 'Introducing the 2009 Orchard Silver Label, a wine that beautifully embodies the essence of a stellar year. Renowned for its light and crisp profile, this vintage presents flavors of fresh pear, juicy peach, and a whisper of honeydew melon. The delightful pear aroma transitions smoothly into lush peach notes, finishing with a subtle hint of honeydew for a refreshing taste experience.\r\n\r\nPerfectly suited for pairing with salads, light pasta dishes, and seafood, the 2009 Orchard Silver Label enhances the delicate flavors of these meals without overshadowing them. The 2009 growing season was characterized by favorable weather conditions, with a balance of sunny days and cool nights, allowing the grapes to achieve optimal ripeness and full flavor development. This vintage showcases the distinctive terroir and the dedicated craftsmanship behind each bottle.\r\n\r\nIndulge in the 2009 Orchard Silver Label, a wine that captivates the palate and tells the story of a remarkable year in winemaking.', 27.00, 347, 4),
(20, 2009, 'Introducing the 2009 Villa Ruby Reserve, a vibrant and fruity wine that captures the essence of a remarkable year. This vintage offers delightful notes of fresh strawberry, juicy cherry, and a subtle hint of rose. The lively strawberry aroma leads into rich cherry flavors, finishing with a delicate rose undertone.\r\n\r\nPerfect for pairing with poultry, pork, and vegetarian dishes, the 2009 Villa Ruby Reserve enhances the flavors of these meals with its balanced and refreshing profile. The 2009 growing season provided ideal conditions, with warm days and cool nights, allowing the grapes to develop their full potential. This vintage reflects the unique terroir and expert craftsmanship behind every bottle.\r\n\r\nExperience the 2009 Villa Ruby Reserve, a wine that delights the senses and tells the story of an exceptional year in winemaking.', 31.00, 180, 5),
(21, 2008, 'Introducing the 2008 Villa Ruby Reserve, a wine that embodies vibrancy and fruitiness. This vintage features notes of ripe strawberry, succulent cherry, and a whisper of rose. The fragrant strawberry aroma blends seamlessly into the rich cherry flavors, with a subtle rose finish adding a touch of elegance.\r\n\r\nIdeal for pairing with poultry, pork, and vegetarian dishes, the 2008 Villa Ruby Reserve enhances the natural flavors of these foods. The 2008 growing season was marked by favorable weather, allowing the grapes to mature perfectly and produce a wine of outstanding quality. This vintage showcases the dedicated craftsmanship and unique terroir of our vineyard.\r\n\r\nEnjoy the 2008 Villa Ruby Reserve, a wine that captivates the palate and narrates the story of an outstanding year.', 34.00, 197, 5),
(22, 2005, 'Experience the 2005 Villa Ruby Reserve, a vibrant and fruity wine that captures the character of an exceptional year. This vintage delights with notes of fresh strawberry, luscious cherry, and a subtle hint of rose. The enticing bouquet of strawberries transitions seamlessly into rich cherry flavors, with a delicate rose finish adding an elegant touch.\r\n\r\nThis versatile wine pairs beautifully with poultry, pork, and vegetarian dishes, enhancing their flavors without overpowering them. The 2005 growing season was marked by ideal conditions, with warm days and cool nights allowing the grapes to achieve perfect ripeness and depth of flavor. The result is a wine that reflects the unique terroir and the meticulous craftsmanship behind every bottle.\r\n\r\nSavor the 2005 Villa Ruby Reserve, a wine that delights the senses and tells the story of a truly remarkable year in winemaking.', 36.00, 172, 5),
(23, 2006, 'Discover the 2006 Villa Ruby Reserve, a vibrant and fruity wine that embodies the essence of a memorable year. This vintage offers delightful notes of strawberry, ripe cherry, and a delicate hint of rose. The fragrant strawberry aroma leads to a palate rich with cherry flavors, complemented by a subtle rose finish that adds sophistication.\r\n\r\nIdeal for pairing with poultry, pork, and vegetarian dishes, the 2006 Villa Ruby Reserve enhances these meals with its refreshing profile. The 2006 growing season featured balanced weather conditions, ensuring the grapes developed full, rich flavors and optimal ripeness. This vintage showcases the distinctive terroir and dedicated winemaking that define each bottle.\r\n\r\nEnjoy the 2006 Villa Ruby Reserve, a wine that captivates the palate and reflects the story of an outstanding year in winemaking.', 35.00, 185, 5),
(24, 2007, 'Introducing the 2007 Villa Ruby Reserve, a vibrant and fruity wine that epitomizes the excellence of its vintage. This year’s wine bursts with notes of strawberry, succulent cherry, and a whisper of rose. The inviting strawberry aroma gives way to lush cherry flavors, finishing with a delicate hint of rose that adds an elegant flourish.\r\n\r\nPerfect for pairing with poultry, pork, and vegetarian dishes, the 2007 Villa Ruby Reserve brings out the best in these foods with its balanced and refreshing character. The 2007 growing season offered optimal weather, allowing the grapes to mature with exceptional flavor and complexity. This vintage is a testament to the unique terroir and the precise craftsmanship involved in its creation.\r\n\r\nRelish the 2007 Villa Ruby Reserve, a wine that enchants the senses and tells the story of a remarkable year in winemaking.', 32.00, 163, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shop_purchase`
--

CREATE TABLE `shop_purchase` (
  `id` bigint(20) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `purchased_at` datetime(6) NOT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `shop_purchase`
--

INSERT INTO `shop_purchase` (`id`, `total_price`, `purchased_at`, `state`) VALUES
(1, 368.00, '2024-05-15 09:49:37.836903', 1),
(2, 20041.00, '2024-05-15 12:25:12.828131', 4),
(3, 123.00, '2024-05-16 12:07:21.173278', 3),
(4, 1162.00, '2024-05-16 12:48:30.379329', 2),
(5, 444.00, '2024-06-05 09:17:33.874652', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shop_purchase_orders`
--

CREATE TABLE `shop_purchase_orders` (
  `id` bigint(20) NOT NULL,
  `purchase_id` bigint(20) NOT NULL,
  `reservedorder_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `shop_purchase_orders`
--

INSERT INTO `shop_purchase_orders` (`id`, `purchase_id`, `reservedorder_id`) VALUES
(1, 1, 1),
(2, 1, 6),
(3, 2, 8),
(4, 2, 9),
(5, 3, 10),
(6, 4, 16),
(7, 5, 22);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shop_reservedorder`
--

CREATE TABLE `shop_reservedorder` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `ordered_at` datetime(6) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `shop_reservedorder`
--

INSERT INTO `shop_reservedorder` (`id`, `quantity`, `ordered_at`, `state`, `customer_id`, `product_id`) VALUES
(1, 3, '2024-05-14 11:48:46.994013', 2, 1, 8),
(6, 7, '2024-05-15 08:43:32.038431', 2, 1, 7),
(7, 1, '2024-05-15 08:44:39.361129', 0, 1, 6),
(8, 12, '2024-05-15 12:23:11.986811', 2, 5, 1),
(9, 17, '2024-05-15 12:24:58.281926', 2, 5, 2),
(10, 3, '2024-05-15 12:46:35.961937', 2, 4, 8),
(11, 10, '2024-05-15 13:00:01.157763', 1, 1, 7),
(16, 2, '2024-05-16 12:42:14.212361', 2, 5, 2),
(20, 6, '2024-05-21 07:08:39.716322', 0, 4, 22),
(21, 6, '2024-05-21 07:09:14.258427', 1, 4, 18),
(22, 12, '2024-06-05 09:17:05.160595', 2, 5, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accounts_customer`
--
ALTER TABLE `accounts_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indizes für die Tabelle `accounts_customer_groups`
--
ALTER TABLE `accounts_customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_customer_groups_customer_id_group_id_5d65b72b_uniq` (`customer_id`,`group_id`),
  ADD KEY `accounts_customer_groups_group_id_7c230d03_fk_auth_group_id` (`group_id`);

--
-- Indizes für die Tabelle `accounts_customer_user_permissions`
--
ALTER TABLE `accounts_customer_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_customer_user_p_customer_id_permission_i_927fe894_uniq` (`customer_id`,`permission_id`),
  ADD KEY `accounts_customer_us_permission_id_9c8a5ef6_fk_auth_perm` (`permission_id`);

--
-- Indizes für die Tabelle `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indizes für die Tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indizes für die Tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indizes für die Tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_customer_id` (`user_id`);

--
-- Indizes für die Tabelle `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indizes für die Tabelle `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indizes für die Tabelle `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `shop_productvintage`
--
ALTER TABLE `shop_productvintage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_productvintage_product_id_d33389ac_fk_shop_product_id` (`product_id`);

--
-- Indizes für die Tabelle `shop_purchase`
--
ALTER TABLE `shop_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `shop_purchase_orders`
--
ALTER TABLE `shop_purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_purchase_orders_purchase_id_reservedorder_id_0cd79519_uniq` (`purchase_id`,`reservedorder_id`),
  ADD KEY `shop_purchase_orders_reservedorder_id_fe708dde_fk_shop_rese` (`reservedorder_id`);

--
-- Indizes für die Tabelle `shop_reservedorder`
--
ALTER TABLE `shop_reservedorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_reservedorder_customer_id_5542fb79_fk_accounts_customer_id` (`customer_id`),
  ADD KEY `shop_reservedorder_product_id_a1fb5760_fk_shop_productvintage_id` (`product_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `accounts_customer`
--
ALTER TABLE `accounts_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `accounts_customer_groups`
--
ALTER TABLE `accounts_customer_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `accounts_customer_user_permissions`
--
ALTER TABLE `accounts_customer_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT für Tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT für Tabelle `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT für Tabelle `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `shop_productvintage`
--
ALTER TABLE `shop_productvintage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `shop_purchase`
--
ALTER TABLE `shop_purchase`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `shop_purchase_orders`
--
ALTER TABLE `shop_purchase_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `shop_reservedorder`
--
ALTER TABLE `shop_reservedorder`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `accounts_customer_groups`
--
ALTER TABLE `accounts_customer_groups`
  ADD CONSTRAINT `accounts_customer_gr_customer_id_c2d5e358_fk_accounts_` FOREIGN KEY (`customer_id`) REFERENCES `accounts_customer` (`id`),
  ADD CONSTRAINT `accounts_customer_groups_group_id_7c230d03_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints der Tabelle `accounts_customer_user_permissions`
--
ALTER TABLE `accounts_customer_user_permissions`
  ADD CONSTRAINT `accounts_customer_us_customer_id_701aa82b_fk_accounts_` FOREIGN KEY (`customer_id`) REFERENCES `accounts_customer` (`id`),
  ADD CONSTRAINT `accounts_customer_us_permission_id_9c8a5ef6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints der Tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints der Tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints der Tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customer_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customer` (`id`);

--
-- Constraints der Tabelle `shop_productvintage`
--
ALTER TABLE `shop_productvintage`
  ADD CONSTRAINT `shop_productvintage_product_id_d33389ac_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`);

--
-- Constraints der Tabelle `shop_purchase_orders`
--
ALTER TABLE `shop_purchase_orders`
  ADD CONSTRAINT `shop_purchase_orders_purchase_id_42483c6c_fk_shop_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `shop_purchase` (`id`),
  ADD CONSTRAINT `shop_purchase_orders_reservedorder_id_fe708dde_fk_shop_rese` FOREIGN KEY (`reservedorder_id`) REFERENCES `shop_reservedorder` (`id`);

--
-- Constraints der Tabelle `shop_reservedorder`
--
ALTER TABLE `shop_reservedorder`
  ADD CONSTRAINT `shop_reservedorder_customer_id_5542fb79_fk_accounts_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `accounts_customer` (`id`),
  ADD CONSTRAINT `shop_reservedorder_product_id_a1fb5760_fk_shop_productvintage_id` FOREIGN KEY (`product_id`) REFERENCES `shop_productvintage` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
