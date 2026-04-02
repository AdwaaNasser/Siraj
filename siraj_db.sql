-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 02, 2026 at 09:36 PM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siraj_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `alertID` int(11) NOT NULL,
  `type` enum('warning','critical') NOT NULL,
  `title` varchar(100) NOT NULL,
  `cause` varchar(255) NOT NULL,
  `explanation` varchar(255) DEFAULT NULL,
  `readingID` int(11) NOT NULL,
  `status` enum('New','Active','Resolved','Dismissed') NOT NULL DEFAULT 'New',
  `thresholdID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `panelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`alertID`, `type`, `title`, `cause`, `explanation`, `readingID`, `status`, `thresholdID`, `userID`, `panelID`) VALUES
(1, 'warning', 'Dust Warning', 'High Soiling', 'Soiling level is 55%. Cleaning recommended.', 6, 'Active', 2, 1, 2),
(2, 'critical', 'Critical Failure', 'Extreme Dust/Heat', 'Extreme dust & heat. Maintenance required!', 12, 'Active', 2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `enviromentaldata`
--

CREATE TABLE `enviromentaldata` (
  `enviromentalDataID` int(11) NOT NULL,
  `weatherCondition` enum('Sunny','Cloudy','Rainy','Dust Storm') NOT NULL,
  `ambientTemperature` double NOT NULL,
  `dustAccumulation` double NOT NULL,
  `sunlightIntensity` double NOT NULL,
  `timestamp` datetime NOT NULL,
  `panelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enviromentaldata`
--

INSERT INTO `enviromentaldata` (`enviromentalDataID`, `weatherCondition`, `ambientTemperature`, `dustAccumulation`, `sunlightIntensity`, `timestamp`, `panelID`) VALUES
(6, 'Sunny', 32, 5, 950, '2026-04-02 23:48:08', 1),
(7, 'Dust Storm', 45, 55, 700, '2026-04-02 23:48:08', 2),
(8, 'Sunny', 30, 0, 980, '2026-04-02 23:48:08', 3),
(9, 'Dust Storm', 52, 90, 500, '2026-04-02 23:48:08', 4),
(10, 'Sunny', 28, 10, 850, '2026-04-02 23:48:08', 5),
(21, 'Sunny', 32, 5, 950, '2026-04-02 23:49:36', 1),
(22, 'Dust Storm', 45, 55, 700, '2026-04-02 23:49:36', 2),
(23, 'Sunny', 30, 0, 980, '2026-04-02 23:49:36', 3),
(24, 'Dust Storm', 52, 90, 500, '2026-04-02 23:49:36', 4),
(25, 'Sunny', 28, 10, 850, '2026-04-02 23:49:36', 5);

-- --------------------------------------------------------

--
-- Table structure for table `panel`
--

CREATE TABLE `panel` (
  `panelID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `capacity` double NOT NULL,
  `location` varchar(150) NOT NULL,
  `status` enum('Active','Warning','Faulty','Inactive') NOT NULL,
  `storageID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `panel`
--

INSERT INTO `panel` (`panelID`, `name`, `capacity`, `location`, `status`, `storageID`, `userID`) VALUES
(1, 'Main Roof', 400, 'Riyadh', 'Active', 1, 1),
(2, 'Garden Unit', 150, 'Riyadh', 'Warning', 2, 1),
(3, 'New Balcony', 200, 'Riyadh', 'Active', 3, 1),
(4, 'Desert Farm', 400, 'Abha', 'Faulty', 4, 2),
(5, 'Gate Light', 150, 'Abha', 'Active', 5, 2);

--
-- Triggers `panel`
--
DELIMITER $$
CREATE TRIGGER `capacity_limit` BEFORE INSERT ON `panel` FOR EACH ROW BEGIN
  IF NEW.capacity > 400 THEN
    SET NEW.capacity = 400;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reading`
--

CREATE TABLE `reading` (
  `readingID` int(11) NOT NULL,
  `value` double NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sensorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reading`
--

INSERT INTO `reading` (`readingID`, `value`, `timestamp`, `sensorID`) VALUES
(1, 32, '2026-04-02 20:45:42', 1),
(2, 950, '2026-04-02 20:45:42', 2),
(3, 5, '2026-04-02 20:45:42', 3),
(4, 45, '2026-04-02 20:45:42', 5),
(5, 700, '2026-04-02 20:45:42', 6),
(6, 55, '2026-04-02 20:45:42', 7),
(7, 30, '2026-04-02 20:45:42', 9),
(8, 980, '2026-04-02 20:45:42', 10),
(9, 0, '2026-04-02 20:45:42', 11),
(10, 52, '2026-04-02 20:45:42', 13),
(11, 500, '2026-04-02 20:45:42', 14),
(12, 90, '2026-04-02 20:45:42', 15),
(13, 28, '2026-04-02 20:45:42', 17),
(14, 850, '2026-04-02 20:45:42', 18),
(15, 10, '2026-04-02 20:45:42', 19);

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `sensorID` int(11) NOT NULL,
  `type` enum('temperature sensor','voltage sensor','sunlight sensor','dust sensor') NOT NULL,
  `unit` enum('°C','V','W/m²','%') NOT NULL,
  `status` enum('Active','Inactive','Faulty') NOT NULL DEFAULT 'Active',
  `panelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sensor`
--

INSERT INTO `sensor` (`sensorID`, `type`, `unit`, `status`, `panelID`) VALUES
(1, 'temperature sensor', '°C', 'Active', 1),
(2, 'sunlight sensor', 'W/m²', 'Active', 1),
(3, 'dust sensor', '%', 'Active', 1),
(4, 'voltage sensor', 'V', 'Active', 1),
(5, 'temperature sensor', '°C', 'Active', 2),
(6, 'sunlight sensor', 'W/m²', 'Active', 2),
(7, 'dust sensor', '%', 'Active', 2),
(8, 'voltage sensor', 'V', 'Active', 2),
(9, 'temperature sensor', '°C', 'Active', 3),
(10, 'sunlight sensor', 'W/m²', 'Active', 3),
(11, 'dust sensor', '%', 'Active', 3),
(12, 'voltage sensor', 'V', 'Active', 3),
(13, 'temperature sensor', '°C', 'Active', 4),
(14, 'sunlight sensor', 'W/m²', 'Active', 4),
(15, 'dust sensor', '%', 'Active', 4),
(16, 'voltage sensor', 'V', 'Active', 4),
(17, 'temperature sensor', '°C', 'Active', 5),
(18, 'sunlight sensor', 'W/m²', 'Active', 5),
(19, 'dust sensor', '%', 'Active', 5),
(20, 'voltage sensor', 'V', 'Active', 5);

-- --------------------------------------------------------

--
-- Table structure for table `storage_unit`
--

CREATE TABLE `storage_unit` (
  `storageID` int(11) NOT NULL,
  `capacity` double NOT NULL,
  `currentLevel` double NOT NULL DEFAULT '0',
  `status` enum('Full','Charging','Discharging','Low') NOT NULL DEFAULT 'Low'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `storage_unit`
--

INSERT INTO `storage_unit` (`storageID`, `capacity`, `currentLevel`, `status`) VALUES
(1, 10, 9.56, 'Charging'),
(2, 5, 1.32, 'Low'),
(3, 5, 1.07, 'Low'),
(4, 10, 1.1, 'Low'),
(5, 5, 4.95, 'Full');

-- --------------------------------------------------------

--
-- Table structure for table `thresholds`
--

CREATE TABLE `thresholds` (
  `threshold_id` int(11) NOT NULL,
  `type` enum('Dust Accumulation','Temperature','Voltage','Energy Production') NOT NULL,
  `value` double NOT NULL,
  `unit` enum('°C','V','kWh','%') NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thresholds`
--

INSERT INTO `thresholds` (`threshold_id`, `type`, `value`, `unit`, `userID`) VALUES
(1, 'Temperature', 45, '°C', 0),
(2, 'Dust Accumulation', 70.14, '%', 0),
(3, 'Energy Production', 30, 'kWh', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password_hash`, `role`, `is_active`, `created_at`) VALUES
(1, 'Sara Ahmed', 'sara@email.com', 'hashed_pw', 'panel_owner', 1, '2026-02-10 00:00:00'),
(2, 'Reem Ali', 'reem@email.com', 'hashed_pw', 'panel_owner', 1, '2026-01-18 00:00:00'),
(3, 'Admin User', 'admin@email.com', 'hashed_pw', 'admin', 1, '2025-12-01 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`alertID`),
  ADD KEY `readingID` (`readingID`),
  ADD KEY `thresholdID` (`thresholdID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `panelID` (`panelID`);

--
-- Indexes for table `enviromentaldata`
--
ALTER TABLE `enviromentaldata`
  ADD PRIMARY KEY (`enviromentalDataID`),
  ADD KEY `panelID` (`panelID`);

--
-- Indexes for table `panel`
--
ALTER TABLE `panel`
  ADD PRIMARY KEY (`panelID`),
  ADD KEY `storageID` (`storageID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `reading`
--
ALTER TABLE `reading`
  ADD PRIMARY KEY (`readingID`),
  ADD KEY `sensorID` (`sensorID`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`sensorID`),
  ADD KEY `panelID` (`panelID`);

--
-- Indexes for table `storage_unit`
--
ALTER TABLE `storage_unit`
  ADD PRIMARY KEY (`storageID`);

--
-- Indexes for table `thresholds`
--
ALTER TABLE `thresholds`
  ADD PRIMARY KEY (`threshold_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `alertID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enviromentaldata`
--
ALTER TABLE `enviromentaldata`
  MODIFY `enviromentalDataID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `panel`
--
ALTER TABLE `panel`
  MODIFY `panelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reading`
--
ALTER TABLE `reading`
  MODIFY `readingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
  MODIFY `sensorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `storage_unit`
--
ALTER TABLE `storage_unit`
  MODIFY `storageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thresholds`
--
ALTER TABLE `thresholds`
  MODIFY `threshold_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert`
--
ALTER TABLE `alert`
  ADD CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`readingID`) REFERENCES `reading` (`readingID`),
  ADD CONSTRAINT `alert_ibfk_2` FOREIGN KEY (`thresholdID`) REFERENCES `thresholds` (`threshold_id`),
  ADD CONSTRAINT `alert_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `alert_ibfk_4` FOREIGN KEY (`panelID`) REFERENCES `panel` (`panelID`);

--
-- Constraints for table `enviromentaldata`
--
ALTER TABLE `enviromentaldata`
  ADD CONSTRAINT `enviromentaldata_ibfk_1` FOREIGN KEY (`panelID`) REFERENCES `panel` (`panelID`);

--
-- Constraints for table `panel`
--
ALTER TABLE `panel`
  ADD CONSTRAINT `panel_ibfk_1` FOREIGN KEY (`storageID`) REFERENCES `storage_unit` (`storageID`),
  ADD CONSTRAINT `panel_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reading`
--
ALTER TABLE `reading`
  ADD CONSTRAINT `reading_ibfk_1` FOREIGN KEY (`sensorID`) REFERENCES `sensor` (`sensorID`);

--
-- Constraints for table `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`panelID`) REFERENCES `panel` (`panelID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
