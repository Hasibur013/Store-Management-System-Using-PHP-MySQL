-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2023 at 03:01 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `category_entrydate` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_entrydate`) VALUES
(1, 'Laptop', '2023-03-08'),
(2, 'Mobile', '2023-03-07'),
(3, 'Monitor', '2023-03-07'),
(4, 'Tablet', '2023-03-08'),
(5, 'RAM', '2023-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_DOB` varchar(10) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_address`, `customer_DOB`, `customer_email`, `customer_password`) VALUES
(1, 'Abdul Karim', 'Gazipur', '1999-07-14', 'abdulkarim@gmail.com', 'karim1234'),
(2, 'Hasibur Rahman', 'Kapasia', '2001-11-12', 'hasib@gmail.com', '12345'),
(3, 'Ashik Hasan', 'Dinajpur', '1999-07-19', 'ashik@gmail.com', 'ashik123'),
(4, 'Mahmudul Hasan', 'Shariatpur', '2002-07-16', 'hasan@gmail.com', 'hasan123'),
(5, 'Ashraful Alam', 'Kapasia', '2003-07-23', 'ashraful@gmail.com', 'ashraful123'),
(6, 'Nazmul Hasan', 'Gazipur', '2007-10-17', 'nazmul@gmail.com', 'nazmul123');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `order_product_qty` int(11) NOT NULL,
  `order_product_price` float(9,2) NOT NULL,
  `order_customer_id` int(11) NOT NULL,
  `order_product_entrydate` varchar(10) NOT NULL,
  `order_status` varchar(12) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_product_id`, `order_product_qty`, `order_product_price`, `order_customer_id`, `order_product_entrydate`, `order_status`) VALUES
(1, 2, 6, 16380.00, 2, '2023-06-21', 'approved'),
(2, 2, 5, 16380.00, 3, '2023-06-21', 'approved'),
(3, 5, 3, 17325.00, 2, '2023-06-21', 'approved'),
(4, 2, 10, 16380.00, 2, '2023-06-21', 'approved'),
(6, 1, 20, 36750.00, 4, '2023-06-22', 'approved'),
(7, 1, 50, 36750.00, 5, '2023-06-23', 'approved'),
(8, 4, 5, 33600.00, 6, '2023-06-22', 'rejected'),
(9, 5, 2, 17325.00, 6, '2023-06-23', 'pending'),
(10, 1, 5, 36750.00, 2, '2023-06-23', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_category` int(3) NOT NULL,
  `product_code` varchar(10) NOT NULL,
  `product_entrydate` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_category`, `product_code`, `product_entrydate`) VALUES
(1, 'Hp 840 g1', 1, 'hp0001', '2023-05-23'),
(2, 'Infinix Hot 11S', 2, 'infinix001', '2023-05-23'),
(3, 'Hp 840 g5', 1, 'hp0002', '2023-05-30'),
(4, 'Oppo A1', 2, 'opp001', '2023-06-07'),
(5, 'SAMSUNG C24F390FHW', 3, 'sm0001', '2023-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `store_product`
--

CREATE TABLE `store_product` (
  `store_product_id` int(11) NOT NULL,
  `store_product_name` int(10) NOT NULL,
  `store_product_qty` int(11) NOT NULL,
  `store_product_entrydate` varchar(10) NOT NULL,
  `store_product_price` float(9,2) NOT NULL,
  `available_qty` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_product`
--

INSERT INTO `store_product` (`store_product_id`, `store_product_name`, `store_product_qty`, `store_product_entrydate`, `store_product_price`, `available_qty`) VALUES
(1, 2, 110, '2023-05-17', 15600.00, 89),
(2, 1, 5, '2023-05-23', 25000.00, 5),
(3, 3, 10, '2023-05-30', 35000.00, 10),
(4, 1, 200, '2023-05-30', 35000.00, 125),
(5, 4, 20, '2023-06-07', 32000.00, 20),
(6, 5, 20, '2023-06-07', 16500.00, 15);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(30) NOT NULL,
  `user_last_name` varchar(30) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_first_name`, `user_last_name`, `user_email`, `user_password`) VALUES
(1, 'Md. Hasibur ', 'Rahman', 'hasib12345@gmail.com', '123'),
(2, 'Mahmudul ', 'Hasan', 'hasan@gmail.com', '12345'),
(3, 'Michel', 'Jack', 'micheljack@gmail.com', '1234'),
(4, 'Kose', 'Mihal', 'kosemihal@gmail.com', '4567');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `store_product`
--
ALTER TABLE `store_product`
  ADD PRIMARY KEY (`store_product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `store_product`
--
ALTER TABLE `store_product`
  MODIFY `store_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
