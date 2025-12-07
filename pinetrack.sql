-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2025 at 01:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pinetrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT 'General',
  `details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `seller_id`, `title`, `type`, `details`, `created_at`, `expiry_date`) VALUES
(6, 5, 'Big Nenas Sale', 'Promotion', 'Kebun A Pengeluaran Besar', '2025-12-05 04:59:43', '2025-12-13'),
(7, 5, 'New Announcement', 'General', 'Attention everyone: Please take note of the latest update from Nenas. Stay informed and act accordingly.', '2025-12-05 07:44:25', '2025-12-09'),
(8, 5, 'New Big Announcemnt Nenas', 'General', '📢 Nenas Update: Don’t miss the latest news—check it out now!', '2025-12-07 04:57:22', '2025-12-12'),
(9, 5, 'Currently Nenas For Sale', 'General', 'Nenas harvest today! Come check out the fresh fruits', '2025-12-07 08:01:37', '2025-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `profile_picture` varchar(500) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `profile_picture`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Jonathan Michael', 'john21@gmail.com', '01111407244', 'Tanjung Rambutan', NULL, '$2y$10$AFrSrdfY8GYdsm9lMimdxesrLkc7viSxmGtpWuXZheVlYNFNCCrIK', '2025-12-05 06:29:29', '2025-12-05 07:18:27'),
(2, 'John Doe', 'john@email.com', '0123456789', 'Kuala Lumpur, Malaysia', NULL, '$2y$10$hashedpassword', '2025-12-05 06:29:29', NULL),
(3, 'Jane Smith', 'jane@email.com', '0112233445', 'Johor Bahru, Malaysia', NULL, '$2y$10$hashedpassword', '2025-12-05 06:29:29', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_purchase_history`
-- (See below for the actual view)
--
CREATE TABLE `customer_purchase_history` (
`transaction_id` int(11)
,`customer_id` int(11)
,`product_name` varchar(255)
,`category` varchar(100)
,`seller_name` varchar(100)
,`quantity` int(11)
,`unit_price` decimal(10,2)
,`total_price` decimal(10,2)
,`payment_method` varchar(50)
,`transaction_date` timestamp
,`status` enum('pending','completed','cancelled')
,`notes` text
,`image_url` varchar(500)
);

-- --------------------------------------------------------

--
-- Table structure for table `entrepreneurs`
--

CREATE TABLE `entrepreneurs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `farm_location` varchar(255) DEFAULT NULL,
  `shop_info` varchar(255) DEFAULT NULL,
  `social_media` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entrepreneurs`
--

INSERT INTO `entrepreneurs` (`id`, `name`, `email`, `password`, `phone`, `farm_location`, `shop_info`, `social_media`, `created_at`) VALUES
(4, 'John', 'john21@gmail.com', '$2y$10$SLfPh0CmKSHDY7A6Agjbz.TbP7WiCHcp2dNXbx2WvdAQNd4dM8wEu', NULL, NULL, NULL, NULL, '2025-12-05 04:20:42'),
(5, 'Kessigan Arasu', 'kessigan@gmail.com', '$2y$10$fj5Wmqalp2yLfPN4OY20eeMbMpGku2lCrplYudPMZkJQMVyLzT/fq', '01111407223', '48000 Rawang, Sleangor', 'Kedai Mamak Nenas', 'https://www.facebook.com/groups/PenanamNanasMalaysia/\nhttps://www.instagram.com/p/DJdQOHFyAQM/\nhttps://sites.google.com/view/nanasxchange/home\nhttps://x.com/PPKKlang/status/984673702515109888', '2025-12-05 04:27:45'),
(6, 'Wong', 'wong21@gmail.com', '$2y$10$7FRqRzt8VH7OQH60e55Wcez/WYazXbRzAff6ikTRmBaMcFb2HM.uS', NULL, NULL, NULL, NULL, '2025-12-07 06:53:41'),
(7, 'Rohaizad', 'rohaizad@gmail.com', '$2y$10$llwct63f88p9U5B8hqdtWe0x3FKiqLF8vEOZcWdU5haWRCGbUnwoS', NULL, NULL, NULL, NULL, '2025-12-07 08:05:56'),
(8, 'Ijad', 'ijad@gmail.com', '$2y$10$MPlpSozjm/29Oh.eUD.9HOzMK9WbY.04jQvfXonojFX..B2U8xM9G', NULL, NULL, NULL, NULL, '2025-12-07 09:14:10'),
(10, 'shomes', 'shomes@gmail.com', '$2y$10$vxD2qgo1lbT4uJgruF0nUO9R5zVdEJuPreN2KNlcOJqs/amLkyvL2', NULL, NULL, NULL, NULL, '2025-12-07 09:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `promotion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_type` enum('pineapple','other') DEFAULT 'other',
  `weight_kg` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `image_url` varchar(500) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `harvest_date` date DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `unit` varchar(50) DEFAULT 'kg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `seller_id`, `name`, `price`, `promotion`, `created_at`, `product_type`, `weight_kg`, `description`, `contact_info`, `stock_quantity`, `image_url`, `category`, `harvest_date`, `is_available`, `unit`) VALUES
(8, 5, 'Nenas Fruit', 15.00, 'Nenas Sedap', '2025-12-07 06:15:09', 'other', NULL, 'sadadad', '01326374238', 20, 'https://images.unsplash.com/photo-1550258987-190a2d41a8ba', 'Fresh', '2025-12-07', 1, 'kg'),
(9, 5, 'Nenas Yogurt Sedap', 15.00, 'Yogurt Nenas', '2025-12-07 06:26:24', 'other', NULL, 'Nenas Yogurt made from nenas fruit flavour extracted from nenas', '01111407244', 17, 'https://www.delishknowledge.com/wp-content/uploads/carmalizedpineappleyogurtbowls3.jpg', 'Processed', '2025-12-07', 1, 'piece'),
(12, 5, 'Nenas Bundle', 120.00, 'Nenas Bundle', '2025-12-07 06:50:49', 'pineapple', 50.00, 'Nenas dijual dalam satu bundle', '011111407244', 20, 'https://images.unsplash.com/photo-1550828520-4cb496926fc9?q=80&w=1333&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Fresh', '2025-12-08', 1, 'box'),
(13, 6, 'Coffee Nenas', 20.00, 'Coffee Nenas Sedap', '2025-12-07 06:55:40', 'other', NULL, 'Coffee Flavour Nenas', '0126478212', 99, 'https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Processed', '2025-12-07', 1, 'kg'),
(14, 5, 'Pineapple Grade B', 10.00, 'Nenas Sedap Grade B', '2025-12-07 08:03:23', 'other', NULL, 'Pineapple Quality', '01324234324', 8, 'https://images.unsplash.com/photo-1572859704906-ab0716da285f?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Fresh', '2025-12-09', 1, 'kg'),
(15, 5, 'Nenas Gred A', 11.22, 'Nenas Berkualiti', '2025-12-07 09:56:01', 'pineapple', 5.00, 'Freshly harvested premium-grade pineapples (Nenas Gred A) with vibrant golden flesh and naturally sweet flavor. Perfect for juices, desserts, or enjoying fresh. Handpicked to ensure top quality and freshness straight from the farm to your table', '01111417234', 50, 'https://images.unsplash.com/photo-1562522513-a22a63a0e21e?q=80&w=536&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Fresh', '2025-12-16', 1, 'kg');

-- --------------------------------------------------------

--
-- Table structure for table `sales_transactions`
--

CREATE TABLE `sales_transactions` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_method` varchar(50) DEFAULT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'completed',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_transactions`
--

INSERT INTO `sales_transactions` (`id`, `product_id`, `seller_id`, `customer_id`, `quantity`, `unit_price`, `total_price`, `transaction_date`, `payment_method`, `status`, `notes`) VALUES
(15, 9, 5, 1, 3, 15.00, 45.00, '2025-12-07 06:31:09', 'online', 'completed', ''),
(16, 12, 5, 1, 1, 120.00, 120.00, '2025-12-06 02:30:00', 'cash', 'completed', 'Direct purchase from farm'),
(17, 8, 5, 1, 3, 15.00, 45.00, '2025-12-05 06:20:00', 'online', 'completed', 'Weekend special purchase'),
(18, 9, 5, 1, 2, 15.00, 30.00, '2025-12-04 03:15:00', 'online', 'completed', 'For family gathering'),
(19, 12, 5, 1, 1, 120.00, 120.00, '2025-12-03 01:45:00', 'cash', 'completed', 'Restocking business'),
(20, 8, 5, 1, 5, 15.00, 75.00, '2025-12-02 08:30:00', 'online', 'completed', 'Bulk order for restaurant'),
(21, 8, 5, 2, 2, 15.00, 30.00, '2025-12-06 05:45:00', 'online', 'completed', 'John Doe purchase'),
(22, 9, 5, 2, 1, 15.00, 15.00, '2025-12-05 02:20:00', 'cash', 'completed', 'Personal consumption'),
(23, 12, 5, 3, 1, 120.00, 120.00, '2025-12-06 07:10:00', 'online', 'completed', 'Jane Smith first purchase'),
(24, 8, 5, 3, 4, 15.00, 60.00, '2025-12-04 04:30:00', 'cash', 'completed', 'For event catering'),
(25, 9, 5, 1, 2, 15.00, 30.00, '2025-12-07 00:00:00', 'online', 'pending', 'Awaiting payment confirmation'),
(26, 8, 5, 2, 3, 15.00, 45.00, '2025-12-06 09:20:00', 'online', 'cancelled', 'Customer requested cancellation'),
(27, 13, 6, 1, 1, 20.00, 20.00, '2025-12-07 07:02:18', 'online', 'completed', ''),
(28, 14, 5, 1, 2, 10.00, 20.00, '2025-12-07 08:04:50', 'cash', 'completed', '');

-- --------------------------------------------------------

--
-- Structure for view `customer_purchase_history`
--
DROP TABLE IF EXISTS `customer_purchase_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_purchase_history`  AS SELECT `st`.`id` AS `transaction_id`, `st`.`customer_id` AS `customer_id`, `p`.`name` AS `product_name`, `p`.`category` AS `category`, `e`.`name` AS `seller_name`, `st`.`quantity` AS `quantity`, `st`.`unit_price` AS `unit_price`, `st`.`total_price` AS `total_price`, `st`.`payment_method` AS `payment_method`, `st`.`transaction_date` AS `transaction_date`, `st`.`status` AS `status`, `st`.`notes` AS `notes`, `p`.`image_url` AS `image_url` FROM ((`sales_transactions` `st` join `products` `p` on(`st`.`product_id` = `p`.`id`)) join `entrepreneurs` `e` on(`st`.`seller_id` = `e`.`id`)) WHERE `st`.`customer_id` is not null ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `entrepreneurs`
--
ALTER TABLE `entrepreneurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `sales_transactions`
--
ALTER TABLE `sales_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `entrepreneurs`
--
ALTER TABLE `entrepreneurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sales_transactions`
--
ALTER TABLE `sales_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `entrepreneurs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `entrepreneurs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_transactions`
--
ALTER TABLE `sales_transactions`
  ADD CONSTRAINT `fk_sales_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sales_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sales_seller` FOREIGN KEY (`seller_id`) REFERENCES `entrepreneurs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
