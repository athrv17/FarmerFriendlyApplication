-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2023 at 04:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(8, 'Akhilesh Mali', 'akhilesh.mali23@gmail.com', '$2y$10$1kZvZt1P31Jk0unG7rCjfeNaxYl2bypLv.u7GqvMFlSzjq5k4jVVG', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(2, 'John Deer'),
(3, 'JCB'),
(4, 'Case Hi'),
(5, 'FenDT'),
(6, 'Others'),
(7, 'Pottinger');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(1, 1, '::1', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Fertilizers'),
(3, 'Tractors'),
(4, 'Harvesters'),
(5, 'Miscellenious'),
(6, 'Grass Maintenance');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(8, 2, 6, 'Corteva Solid Fertilizer', 1000, 2000, 'Solid Fertilizers for boosting Production.', '1683812009_1670778291_Corteva-Solid-Fertilizer.png', 'Fertilizer, solid, corteva'),
(9, 2, 6, 'Lizard Lime Fertilizer', 1500, 1500, 'Lime Fertilizer for Boosting Crop Production!', '1683812077_1670778362_Lizard-Lime-Fertilizer.png', 'Fertilizer, lime fertilizer, lizard'),
(10, 3, 2, 'John Deer 7R series (per/hour)', 400, 100, 'Tractors for Rent! Best and Affordable!', '1683812165_1670778421_John-Deer-7R-series.png', 'tractor, john deer, 7r'),
(11, 3, 2, 'John Deer 8XR series (per/hour)', 600, 100, 'Tractors for Rent! Best and Affordable!', '1683812313_1670778460_John-Deer-8XR-series.png', 'john deer, 8xr, tractor'),
(12, 3, 4, 'Case Hi Steiger Wheeled AFS Connect Series (per/hour)', 600, 100, 'Tractors for Rent! Best and Affordable!', '1683812380_1670778497_Case-Hi-Steiger-Wheeled-AFS-Connect-Series.png', 'Case Hi, Steiger, wheeled, tractor'),
(13, 3, 3, 'JCB Fastrac 8330 (per/hour)', 700, 100, 'Tractors for Rent! Best and Affordable!', '1683812479_1670778667_JCB-Fastrac-8330.png', 'JCB, fastrac, tractor'),
(14, 3, 3, 'JCB 541-70 Agri Pro (per/hour)', 750, 100, 'Tractors for Rent! Best and Affordable!', '1683812518_1670778703_JCB-541-70-Agri-Pro.png', 'JCB, fastrac, Agri, pro, tractor'),
(15, 6, 4, 'Case Hi LB436 HD Grass/Crop Baler', 1250, 150, 'Create Bales to easily Move the Grass from Farms!', '1683812821_1670778548_Case-Hi-LB436-HD-Grass.Crop Baler.png', 'grass, mover, baler, Case Hi, lb436'),
(16, 6, 6, 'MAN TGS 18.500 4x4 (per/hour)', 2500, 150, 'Trucks for Rent! No Trailers.', '1683812911_1670778633_MAN-TGS-18.500-4x4.png', 'man, truck, rent, TGS, 18.500'),
(17, 4, 5, 'FenDT Ideal Crop Harvester (per/hour)', 1800, 150, 'FenDT is a Crop Harvester mainly for Corn, Wheat, Flowers and a few more!', '1683813078_1670778870_FenDT-Ideal.png', 'fendt, Ideal, harvester, rent, crop'),
(18, 6, 7, 'Pottinger Novacat 810 Cross Flow', 400, 100, 'Got a Big Backyard? Running a Business? \r\nThis Grass Mover can do Double the Work!', '1683814295_1670778994_Novacat-810-Cross-Flow.png', 'Pottinger, field equiment, mover, grass'),
(19, 6, 7, 'Pottinger Novacat 301 AM Ed Pro', 300, 100, 'Grass Mover prefect for Small Scale Usage!', '1683815023_1670778960_Novacat-301-AM-ED-Pro.png', 'Pottinger, field equiment, mover, grass'),
(20, 6, 6, 'Aebi CC 66 Hand Mover', 150, 100, 'Have a Backyard? Need to Move some Grass?\r\nThis HandHeld Grass Mover loves you!!', '1683815247_1670779169_Aebi-CC-66-Hand-Mover.png', 'Hand, Mover, home, appliances'),
(21, 6, 7, 'Jumbo 10020 D Combiline Grass Collector', 1500, 100, 'Grass Collector', '1683815600_Jumbo-10020-D-Combiline-Grass-Collector.png', 'Pottinger, field, grass, collector'),
(22, 6, 7, 'Hit 16.18 T Wind Rower', 700, 100, 'Wind Rower. Dry your Grass within Seconds!!', '1683815648_Hit-16.18-T-Wind-Rower.png', 'Pottinger, field, grass, wind, rower'),
(23, 5, 2, 'John Deer Pickup 1150 Load Weight', 150, 100, 'Weight Add-ons for your Tractor. A Perfect Balanced weight is a MUST!!!', '1683815727_Pickup-1150.png', 'weight, john, deer, load, misc');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(3, 'Akhilesh', 'Mali', 'akhilesh.mali23@gmail.com', '526db1beb3db97a203dc1468f5d8db02', '0886790664', '23/1, Huttaleshwari Temple Road, Milk Colony', 'Malleshwara');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
