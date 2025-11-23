-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2025 at 06:39 PM
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
-- Database: `gamestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 5),
(5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 1, 7, 1),
(2, 2, 10, 3),
(3, 2, 12, 2),
(4, 3, 2, 1),
(5, 4, 3, 3),
(6, 4, 15, 2),
(7, 5, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `category_name`) VALUES
(1, 'Consoles'),
(2, 'PC Gaming'),
(3, 'Peripherals'),
(4, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `total_amount` int(5) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `total_amount`, `status`) VALUES
(1, 3, '2025-03-13 11:01:50.000000', 27990, 'paid'),
(2, 1, '2025-03-17 10:07:25.000000', 29980, 'paid'),
(3, 4, '2025-03-27 07:10:59.000000', 59949, 'pending'),
(4, 2, '2025-03-29 12:59:07.000000', 20000, 'paid'),
(5, 5, '2025-04-02 09:11:25.000000', 89918, 'paid'),
(6, 10, '2025-04-09 07:29:13.000000', 89850, 'paid'),
(7, 6, '2025-04-15 11:11:28.000000', 14990, 'paid'),
(8, 9, '2025-04-28 01:57:11.000000', 2500, 'paid'),
(9, 7, '2025-04-29 12:37:58.000000', 44970, 'paid'),
(10, 8, '2025-05-01 03:33:27.000000', 5000, 'paid'),
(11, 3, '2025-05-05 03:53:24.000000', 55700, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 2, 1, 27990),
(2, 2, 3, 2, 29980),
(3, 3, 3, 1, 14990),
(4, 3, 4, 1, 44959),
(5, 4, 1, 1, 20000),
(6, 5, 4, 2, 89918),
(7, 6, 5, 3, 89850),
(8, 7, 3, 1, 14990),
(9, 8, 11, 1, 2500),
(10, 9, 7, 1, 50000),
(11, 10, 15, 1, 5000),
(12, 11, 15, 1, 5000),
(13, 11, 8, 1, 2000),
(14, 11, 9, 1, 500),
(15, 11, 7, 1, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `price` float(10,0) NOT NULL,
  `description` text DEFAULT NULL,
  `categories_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`, `description`, `categories_id`) VALUES
(1, 'XBOX', 20000, 'Xbox is a video gaming brand that consists of four main home video game console lines, as well as applications (video games), the streaming service Xbox Cloud Gaming, and online services such as the Xbox network and Xbox Game Pass. The brand is owned by Microsoft Gaming, a division of Microsoft.', 1),
(2, 'PlayStation 5 Console', 27990, 'The PS5 console unleashes new gaming possibilities that you never anticipated. ', 1),
(3, 'Nintendo Switch V2', 14990, ' Bring games to life with a larger 1080p screen—or connect to a TV and play in up to 4K resolution', 1),
(4, 'Xbox Series X 1TB', 44959, 'Make the most of every gaming minute with Quick Resume, lightning-fast load times, and gameplay of up to 120 FPS', 1),
(5, 'Moza FSR Formula Steering Wheel [RS21]', 29950, 'The 𝐌𝐨𝐳𝐚 𝐑𝐚𝐜𝐢𝐧𝐠 𝐅𝐒𝐑 𝐅𝐨𝐫𝐦𝐮𝐥𝐚 𝐖𝐡𝐞𝐞𝐥 (𝐑𝐒𝟐𝟏) delivers 𝐩𝐫𝐞𝐜𝐢𝐬𝐢𝐨𝐧, 𝐫𝐞𝐬𝐩𝐨𝐧𝐬𝐢𝐯𝐞𝐧𝐞𝐬𝐬, 𝐚𝐧𝐝 𝐫𝐞𝐚𝐥𝐢𝐬𝐭𝐢𝐜 𝐜𝐨𝐧𝐭𝐫𝐨𝐥 for serious sim racers', 1),
(6, 'PC games', 500, 'PC games are video games that are designed to be played on personal computers. They can range from simple puzzle games to complex and immersive multiplayer experiences.', 2),
(7, 'Gaming laptops', 50000, 'For a smooth gaming experience, look for a display with a high refresh rate (at least 120Hz) and a fast response time (less than 5ms). A resolution of 1080p or 1440p is a good starting point, but 4K displays are also available if you want the sharpest visuals.', 2),
(8, 'Keyboard', 2000, 'A keyboard is an input device that allows you to type letters, numbers, and symbols into your computer or other electronic device. It usually has a set of keys arranged in a specific layout, such as QWERTY or DVORAK.', 3),
(9, 'Mouse', 500, 'A gaming mouse is a mouse that\'s specifically designed for computer (PC ) gaming. These high performance mice are built to give you added speed and precision, as well as additional mappable buttons that you can use to your advantage in game.', 3),
(10, 'Headset', 1000, 'Gaming headsets are an all-in-one solution to immerse yourself in games while chatting with friends and teammates. They\'re over-the-ear headphones equipped with a clear microphone. You can usually distinguish these headsets as they have a bulky build and come with RGB lighting.', 3),
(11, 'Controller', 2500, 'A gamepad, also known as a controller, is a handheld input device used to interact with video games. It typically consists of buttons, triggers, thumbsticks, and sometimes a directional pad (D-pad).', 3),
(12, 'Microphone', 900, 'A microphone is a device that converts sound waves into an electrical signal. It allows you to capture audio and transmit it to various devices, such as computers, amplifiers, or recording equipmen', 3),
(13, 'Speaker', 1000, 'A speaker is a device that converts electrical signals into sound waves. It allows you to hear audio output from various devices such as computers, smartphones, televisions, and music players.', 3),
(14, 'Webcam', 1500, 'A webcam is a digital camera that captures video and audio data and transmits it in real-time over the internet. It is commonly used for video conferencing, live streaming, online meetings, and recording videos.', 3),
(15, 'Gaming chair\r\n', 5000, 'A gaming chair is a type of chair marketed towards gamers. They differ from most office chairs in having high backrest designed to support the upper back and shoulders. Like many office chairs, they are customizable: the armrests, back, lumbar support and headrest can all be adjusted for comfort and efficiency.', 4),
(16, 'Gaming Mousepad', 250, 'They often have a low friction surface for quick mouse movements, precise tracking, and sometimes come with extra features like red green blue (RGB) lighting.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` varchar(10) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `review_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `product_id`, `rating`, `comment`, `review_date`) VALUES
(1, 3, 2, '5', 'good', '2025-03-17 09:11:50.000000'),
(2, 1, 3, '3', 'average', '2025-03-20 11:09:37.000000'),
(3, 4, 3, '5', 'quite good', '2025-03-28 09:11:25.000000'),
(4, 4, 4, '5', 'good', '2025-03-28 09:11:25.000000'),
(5, 2, 1, '4', 'not that good', '2025-04-01 11:35:12.000000'),
(6, 5, 4, '5', 'what you see is what you get', '2025-04-05 03:26:11.000000'),
(7, 10, 5, '4', 'good', '2025-04-15 09:23:59.000000'),
(8, 6, 3, '3', 'not that good', '2025-04-18 12:53:28.000000'),
(9, 9, 2, '4', 'good', '2025-05-02 03:11:23.000000'),
(10, 7, 3, '4', 'quite good', '2025-05-03 01:25:00.000000'),
(11, 8, 1, '5', 'good', '2025-05-07 04:59:27.000000'),
(12, 3, 15, '5', 'good', '2025-05-09 08:59:57.000000'),
(13, 3, 8, '4', 'quite good', '2025-05-09 09:00:37.000000'),
(14, 3, 9, '4', 'good', '2025-05-09 09:02:01.000000'),
(15, 3, 7, '5', 'good performance', '2025-05-09 09:04:15.000000');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `product_id` int(11) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`product_id`, `quantity`) VALUES
(1, 100),
(2, 25),
(3, 15),
(4, 50),
(5, 50),
(6, 75),
(7, 100),
(8, 75),
(9, 125),
(10, 75),
(11, 75),
(12, 50),
(13, 50),
(14, 100),
(15, 100),
(16, 100);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `date_registered` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `contact_no`, `address`, `date_registered`) VALUES
(1, 'hinatashoyo@gmail.com', 'hinatashoyo', '9153264121', 'Polangui, Albay', '2025-03-16 09:03:21.000000'),
(2, 'aidencruz@gmail.com', 'aidencruz', '9586632582', 'Polangui, Albay', '2025-03-28 09:39:37.000000'),
(3, 'lara@gmail.com', 'laralara', '9366321503', 'Legazpi City, Albay', '2025-05-05 01:03:26.000000'),
(4, 'jaxon@gmail.com', 'jaxonreyes', '9116345004', 'Daraga, Albay', '2025-03-26 11:36:17.000000'),
(5, 'mira@gmail.com', 'mirasantos1', '9932044155', 'Daraga, Albay', '2025-04-02 01:36:54.000000'),
(6, 'dylannavarro@gmail.com', 'dylannavarro111', '9705632076', 'Legazpi City, Albay', '2025-04-14 10:59:28.000000'),
(7, 'kylie@gmail.com', 'kylieeee', '9930711507', 'Naga City, Camarines Sur', '2025-04-28 06:32:57.000000'),
(8, 'evandelgado01@gmail.com', 'delgadoevan', '9163947518', 'Libon, Albay', '2025-05-01 01:13:27.000000'),
(9, 'sienna@gmail.com', 'siennarubio', '9160880159', 'Tiwi, Albay', '2025-04-27 06:36:52.000000'),
(10, 'noahvillanueva@gmail.com', 'noahvillanueva111', '9152260750', 'Camalig, Albay', '2025-04-08 03:58:36.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_ibfk_1` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `cart_items_ibfk_1` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_ibfk_1` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_items_ibfk_1` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `products_ibfk_1` (`categories_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviews_ibfk_1` (`user_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`categories_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
