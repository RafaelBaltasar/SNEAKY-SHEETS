-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2025 at 08:22 PM
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
-- Table structure for table `ordertbl`
--

CREATE TABLE `ordertbl` (
  `order_Number` varchar(20) NOT NULL,
  `order_Date` date NOT NULL,
  `customer_ID` varchar(8) NOT NULL,
  `seller_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordertbl`
--

INSERT INTO `ordertbl` (`order_Number`, `order_Date`, `customer_ID`, `seller_ID`) VALUES
('ORD-001', '0000-00-00', 'CUS-001', 'SLR-001'),
('ORD-002', '0000-00-00', 'CUS-002', 'SLR-001'),
('ORD-003', '0000-00-00', 'CUS-001', 'SLR-002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ordertbl`
--
ALTER TABLE `ordertbl`
  ADD PRIMARY KEY (`order_Number`),
  ADD KEY `customer_ID` (`customer_ID`),
  ADD KEY `seller_ID` (`seller_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ordertbl`
--
ALTER TABLE `ordertbl`
  ADD CONSTRAINT `ordertbl_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `ordertbl_ibfk_2` FOREIGN KEY (`seller_ID`) REFERENCES `seller` (`seller_ID`),
  ADD CONSTRAINT `ordertbl_ibfk_3` FOREIGN KEY (`seller_ID`) REFERENCES `seller` (`seller_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
