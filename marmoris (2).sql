-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2024 at 05:35 PM
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
-- Database: `marmoris`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookinghotel`
--

CREATE TABLE `bookinghotel` (
  `booking_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(225) NOT NULL,
  `phoneNo` varchar(100) NOT NULL,
  `roomNum` varchar(255) NOT NULL,
  `CheckIn` date NOT NULL,
  `CheckOut` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookinghotel`
--

INSERT INTO `bookinghotel` (`booking_id`, `name`, `email`, `phoneNo`, `roomNum`, `CheckIn`, `CheckOut`) VALUES
(2, 'Amin', 'amxn0201@gmail.com', '0134548824', 'Deluxe Queen-201', '2024-07-03', '2024-07-05'),
(3, 'Amin', 'amxn0201@gmail.com', '0134548824', 'Deluxe Triple-301', '2024-05-14', '2024-05-16'),
(5, 'Amin', 'amxn0201@gmail.com', '0134548824', 'Deluxe Twin-103', '2024-08-06', '2024-08-08'),
(6, 'farid', 'farid12@gmail.com', '0123435656', 'deluxe twin-202', '2024-07-03', '2024-07-06'),
(11, 'Amin', 'amxn0201@gmail.com', '0134548824', 'Deluxe Triple-303', '2024-07-15', '2024-07-18'),
(12, 'Amin', 'amxn0201@gmail.com', '0134548824', 'Deluxe Queen-201', '2024-07-04', '2024-07-07'),
(13, 'Azhar', 'azhar@gmail.com', '0123456789', 'Deluxe Queen-202', '2024-07-03', '2024-07-04'),
(14, 'Azhar', 'azhar@gmail.com', '0123456789', 'Deluxe Queen-202', '2024-07-03', '2024-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_phoneNo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `username`, `password`, `customer_email`, `customer_phoneNo`) VALUES
(1, 'Amin', 'Amin Saifudin', '12345', 'amxn0201@gmail.com', '0134548824'),
(2, 'Auni Tasneem', 'auni', '111', 'auni@gmail.com', '0189072366');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `customer_id`, `username`, `customer_email`, `message`, `rating`) VALUES
(1, 2, 'auni', 'auni@gmail.com', 'good', 5);

-- --------------------------------------------------------

--
-- Table structure for table `reply_feedback`
--

CREATE TABLE `reply_feedback` (
  `reply_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `rating` int(11) NOT NULL,
  `reply` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reply_feedback`
--

INSERT INTO `reply_feedback` (`reply_id`, `feedback_id`, `customer_id`, `username`, `email`, `message`, `rating`, `reply`) VALUES
(1, 1, 2, 'auni', 'auni@gmail.com', 'good', 5, 'thank you');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(30) NOT NULL,
  `room_number` varchar(50) NOT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  `facilities` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_number`, `room_type`, `facilities`, `status`) VALUES
(1, 'Deluxe Twin-101', 'Deluxe Twin', 'Room size: 29 mÃÂÃÂ²/312 ftÃÂÃÂ², Non-smoking , 2 single beds', 1),
(2, 'Deluxe Twin-102', 'Deluxe Twin', 'Room size: 29 mÃÂÃÂ²/312 ftÃÂÃÂ², Non-smoking , 2 single beds', 1),
(3, 'Deluxe Twin-103', 'Deluxe Twin', 'Room size: 29 mÃÂÃÂÃÂÃÂ²/312 ftÃÂÃÂÃÂÃÂ², Non-smoking , 2 single beds', 1),
(4, 'Deluxe Queen-201', 'Deluxe Twin', 'Room size: 29 mÃÂÃÂ²/312 ftÃÂÃÂ², Non-smoking , 1 queen bed', 1),
(5, 'Deluxe Queen-202', 'Deluxe Twin', 'Room size: 29 mÃÂÃÂ²/312 ftÃÂÃÂ², Non-smoking , 1 queen bed', 1),
(6, 'Deluxe Queen-203', 'Deluxe Twin', 'Room size: 29 mÃÂÃÂ²/312 ftÃÂÃÂ², Non-smoking , 1 queen bed', 1),
(7, 'Deluxe Triple-301', 'Deluxe Twin', 'Room size: 47 mÃÂÃÂ²/506 ftÃÂÃÂ², Balcony/terrace, 1 double bed and 1 single bed', 1),
(8, 'Deluxe Triple-302', 'Deluxe Twin', 'Room size: 47 mÃÂÃÂ²/506 ftÃÂÃÂ², Balcony/terrace, 1 double bed and 1 single bed', 1),
(9, 'Deluxe Triple-303', 'Deluxe Twin', 'Room size: 47 mÃÂÃÂ²/506 ftÃÂÃÂ², Balcony/terrace, 1 double bed and 1 single bed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `staff_email` varchar(100) NOT NULL,
  `staff_phoneNo` varchar(15) NOT NULL,
  `role` enum('manager','staff') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `username`, `password`, `staff_email`, `staff_phoneNo`, `role`) VALUES
(20, 'hassan1995', 'hassan1995', 'hassan123', 'hassan@gmail.com', '0134548824', 'manager'),
(21, 'Muaz Nabil', 'MuazAhmad', '123', 'Muaz@gmail.com', '0123456789', 'staff'),
(22, 'nafiesa', 'fiesaa', '123', 'nafiesa@gmail.com', '0179082764', 'staff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookinghotel`
--
ALTER TABLE `bookinghotel`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `reply_feedback`
--
ALTER TABLE `reply_feedback`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookinghotel`
--
ALTER TABLE `bookinghotel`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reply_feedback`
--
ALTER TABLE `reply_feedback`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
