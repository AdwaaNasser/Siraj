-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 29, 2026 at 08:42 PM
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
  `type` enum('Temperature','Dust','Voltage','Energy') NOT NULL,
  `title` varchar(100) NOT NULL,
  `cause` varchar(255) NOT NULL,
  `explanation` varchar(1500) DEFAULT NULL,
  `readingID` int(11) NOT NULL,
  `status` enum('Active','Resolved','Dismissed') NOT NULL DEFAULT 'Active',
  `thresholdID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `panelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`alertID`, `type`, `title`, `cause`, `explanation`, `readingID`, `status`, `thresholdID`, `userID`, `panelID`) VALUES
(6, 'Dust', 'Abnormal reading detected on panel 4', 'dust value (90 %) is outside normal range', 'dust on panel 4 measured at 02 Apr 2026 - 23:45 has the value of 90 %, exceeding the maximum 70.14 % threshold by 19.86 %. This might be due to dust accumulation in the area. Immediate action is advised to prevent potential impact.', 12, 'Active', 2, 2, 4),
(7, 'Temperature', 'Abnormal reading detected on panel 5', 'temperature value (28 °C) is outside normal range', 'temperature on panel 5 measured at 02 Apr 2026 - 23:45 has the value of 28 °C, falling below the minimum 45 °C threshold by 17 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 13, 'Resolved', 1, 2, 5),
(10, 'Temperature', 'WARNING detected on Panel hh', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 11 measured at 08 Apr 2026 - 11:01 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 36, 'Active', 1, 11, 11),
(11, 'Temperature', 'WARNING detected on Panel f', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 12 measured at 08 Apr 2026 - 11:16 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 40, 'Active', 1, 11, 12),
(12, 'Temperature', 'WARNING detected on Panel ff', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 13 measured at 08 Apr 2026 - 11:18 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 44, 'Active', 1, 11, 13),
(13, 'Temperature', 'WARNING detected on Panel ffgg', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 14 measured at 08 Apr 2026 - 11:24 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 48, 'Active', 1, 11, 14),
(14, 'Temperature', 'WARNING detected on Panel dd', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 15 measured at 08 Apr 2026 - 11:26 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 52, 'Active', 1, 11, 15),
(15, 'Temperature', 'WARNING detected on Panel gg', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 16 measured at 08 Apr 2026 - 11:26 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 56, 'Active', 1, 11, 16),
(16, 'Temperature', 'WARNING detected on Panel Home', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 17 measured at 08 Apr 2026 - 11:36 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 60, 'Dismissed', 1, 12, 17),
(17, 'Temperature', 'WARNING detected on Panel School', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 18 measured at 08 Apr 2026 - 11:37 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 64, 'Resolved', 1, 12, 18),
(18, 'Temperature', 'WARNING detected on Panel Garden', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 19 measured at 08 Apr 2026 - 11:37 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 68, 'Resolved', 1, 12, 19),
(19, 'Temperature', 'WARNING detected on Panel a', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 20 measured at 08 Apr 2026 - 11:50 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 72, 'Active', 1, 13, 20),
(20, 'Temperature', 'WARNING detected on Panel a', 'temperature value (34.2 °C) is outside normal range', 'temperature on panel 21 measured at 21 Apr 2026 - 01:14 has the value of 34.2 °C, falling below the minimum 45 °C threshold by 10.8 °C. This might be due to ambient temperature in the area. Immediate action is advised to prevent potential impact.', 76, 'Active', 1, 12, 21);

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
(8, 'Sunny', 30, 0, 980, '2026-04-02 23:48:08', 3),
(9, 'Dust Storm', 52, 90, 500, '2026-04-02 23:48:08', 4),
(10, 'Sunny', 28, 10, 850, '2026-04-02 23:48:08', 5),
(21, 'Sunny', 32, 5, 950, '2026-04-02 23:49:36', 1),
(23, 'Sunny', 30, 0, 980, '2026-04-02 23:49:36', 3),
(24, 'Dust Storm', 52, 90, 500, '2026-04-02 23:49:36', 4),
(25, 'Sunny', 28, 10, 850, '2026-04-02 23:49:36', 5),
(28, 'Sunny', 34.2, 12, 980.5, '2026-04-08 10:50:43', 8),
(29, 'Sunny', 34.2, 12, 980.5, '2026-04-08 10:53:56', 9),
(30, 'Sunny', 34.2, 12, 980.5, '2026-04-08 10:56:32', 10),
(31, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:01:05', 11),
(32, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:16:08', 12),
(33, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:18:45', 13),
(34, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:24:52', 14),
(35, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:26:10', 15),
(36, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:26:39', 16),
(37, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:36:57', 17),
(38, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:37:15', 18),
(39, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:37:30', 19),
(40, 'Sunny', 34.2, 12, 980.5, '2026-04-08 11:50:01', 20),
(41, 'Sunny', 34.2, 12, 980.5, '2026-04-21 01:14:12', 21),
(43, 'Sunny', 34.2, 12, 980.5, '2026-04-27 19:29:15', 23);

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
(1, 'Main Roof', 200, 'Riyadh', 'Active', 1, 1),
(3, 'New Balcony', 200, 'Riyadh', 'Active', 3, 1),
(4, 'Desert Farm', 400, 'Abha', 'Warning', 4, 2),
(5, 'Gate Light', 150, 'Abha', 'Warning', 5, 2),
(8, 'e', 33, '2', 'Active', 9, 1),
(9, 'ff', 48, '33', 'Active', 10, 1),
(10, 'a', 77, 'a', 'Active', 11, 1),
(11, 'hh', 4, 'b', 'Warning', 12, 11),
(12, 'f', 44, 'f', 'Warning', 13, 11),
(13, 'ff', 33, 'rr', 'Warning', 14, 11),
(14, 'ffgg', 4, 'a', 'Warning', 15, 11),
(15, 'dd', 44, 'dd', 'Warning', 16, 11),
(16, 'gg', 55, 'g', 'Warning', 17, 11),
(17, 'Home', 200, 'Riyadh', 'Active', 18, 12),
(18, 'School', 400, 'Jeddah', 'Active', 19, 12),
(19, 'Garden', 300, 'Riyadh', 'Active', 20, 12),
(20, 'a', 33, 'b', 'Warning', 21, 13),
(21, 'a', 3, 'a', 'Warning', 22, 12),
(23, 'aa', 65, 'aa', 'Active', 24, 1);

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
(7, 30, '2026-04-02 20:45:42', 9),
(8, 980, '2026-04-02 20:45:42', 10),
(9, 0, '2026-04-02 20:45:42', 11),
(10, 52, '2026-04-02 20:45:42', 13),
(11, 500, '2026-04-02 20:45:42', 14),
(12, 90, '2026-04-02 20:45:42', 15),
(13, 28, '2026-04-02 20:45:42', 17),
(14, 850, '2026-04-02 20:45:42', 18),
(15, 10, '2026-04-02 20:45:42', 19),
(24, 34.2, '2026-04-08 07:50:43', 29),
(25, 980.5, '2026-04-08 07:50:43', 30),
(26, 12, '2026-04-08 07:50:43', 31),
(27, 220, '2026-04-08 07:50:43', 32),
(28, 34.2, '2026-04-08 07:53:56', 33),
(29, 980.5, '2026-04-08 07:53:56', 34),
(30, 12, '2026-04-08 07:53:56', 35),
(31, 220, '2026-04-08 07:53:56', 36),
(32, 34.2, '2026-04-08 07:56:32', 37),
(33, 980.5, '2026-04-08 07:56:32', 38),
(34, 12, '2026-04-08 07:56:32', 39),
(35, 220, '2026-04-08 07:56:32', 40),
(36, 34.2, '2026-04-08 08:01:05', 41),
(37, 980.5, '2026-04-08 08:01:05', 42),
(38, 12, '2026-04-08 08:01:05', 43),
(39, 220, '2026-04-08 08:01:05', 44),
(40, 34.2, '2026-04-08 08:16:08', 45),
(41, 980.5, '2026-04-08 08:16:08', 46),
(42, 12, '2026-04-08 08:16:08', 47),
(43, 220, '2026-04-08 08:16:08', 48),
(44, 34.2, '2026-04-08 08:18:45', 49),
(45, 980.5, '2026-04-08 08:18:45', 50),
(46, 12, '2026-04-08 08:18:45', 51),
(47, 220, '2026-04-08 08:18:45', 52),
(48, 34.2, '2026-04-08 08:24:52', 53),
(49, 980.5, '2026-04-08 08:24:52', 54),
(50, 12, '2026-04-08 08:24:52', 55),
(51, 220, '2026-04-08 08:24:52', 56),
(52, 34.2, '2026-04-08 08:26:10', 57),
(53, 980.5, '2026-04-08 08:26:10', 58),
(54, 12, '2026-04-08 08:26:10', 59),
(55, 220, '2026-04-08 08:26:10', 60),
(56, 34.2, '2026-04-08 08:26:39', 61),
(57, 980.5, '2026-04-08 08:26:39', 62),
(58, 12, '2026-04-08 08:26:39', 63),
(59, 220, '2026-04-08 08:26:39', 64),
(60, 34.2, '2026-04-08 08:36:57', 65),
(61, 980.5, '2026-04-08 08:36:57', 66),
(62, 12, '2026-04-08 08:36:57', 67),
(63, 220, '2026-04-08 08:36:57', 68),
(64, 34.2, '2026-04-08 08:37:15', 69),
(65, 980.5, '2026-04-08 08:37:15', 70),
(66, 12, '2026-04-08 08:37:15', 71),
(67, 220, '2026-04-08 08:37:15', 72),
(68, 34.2, '2026-04-08 08:37:30', 73),
(69, 980.5, '2026-04-08 08:37:30', 74),
(70, 12, '2026-04-08 08:37:30', 75),
(71, 220, '2026-04-08 08:37:30', 76),
(72, 34.2, '2026-04-08 08:50:01', 77),
(73, 980.5, '2026-04-08 08:50:01', 78),
(74, 12, '2026-04-08 08:50:01', 79),
(75, 220, '2026-04-08 08:50:01', 80),
(76, 34.2, '2026-04-20 22:14:12', 81),
(77, 980.5, '2026-04-20 22:14:12', 82),
(78, 12, '2026-04-20 22:14:12', 83),
(79, 220, '2026-04-20 22:14:12', 84),
(84, 34.2, '2026-04-27 16:29:15', 89),
(85, 980.5, '2026-04-27 16:29:15', 90),
(86, 12, '2026-04-27 16:29:15', 91),
(87, 220, '2026-04-27 16:29:15', 92);

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `sensorID` int(11) NOT NULL,
  `type` enum('temperature sensor','voltage sensor','sunlight sensor','dust sensor','energy sensor') NOT NULL,
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
(20, 'voltage sensor', 'V', 'Active', 5),
(29, 'temperature sensor', '°C', 'Active', 8),
(30, 'sunlight sensor', 'W/m²', 'Active', 8),
(31, 'dust sensor', '%', 'Active', 8),
(32, 'voltage sensor', 'V', 'Active', 8),
(33, 'temperature sensor', '°C', 'Active', 9),
(34, 'sunlight sensor', 'W/m²', 'Active', 9),
(35, 'dust sensor', '%', 'Active', 9),
(36, 'voltage sensor', 'V', 'Active', 9),
(37, 'temperature sensor', '°C', 'Active', 10),
(38, 'sunlight sensor', 'W/m²', 'Active', 10),
(39, 'dust sensor', '%', 'Active', 10),
(40, 'voltage sensor', 'V', 'Active', 10),
(41, 'temperature sensor', '°C', 'Active', 11),
(42, 'sunlight sensor', 'W/m²', 'Active', 11),
(43, 'dust sensor', '%', 'Active', 11),
(44, 'voltage sensor', 'V', 'Active', 11),
(45, 'temperature sensor', '°C', 'Active', 12),
(46, 'sunlight sensor', 'W/m²', 'Active', 12),
(47, 'dust sensor', '%', 'Active', 12),
(48, 'voltage sensor', 'V', 'Active', 12),
(49, 'temperature sensor', '°C', 'Active', 13),
(50, 'sunlight sensor', 'W/m²', 'Active', 13),
(51, 'dust sensor', '%', 'Active', 13),
(52, 'voltage sensor', 'V', 'Active', 13),
(53, 'temperature sensor', '°C', 'Active', 14),
(54, 'sunlight sensor', 'W/m²', 'Active', 14),
(55, 'dust sensor', '%', 'Active', 14),
(56, 'voltage sensor', 'V', 'Active', 14),
(57, 'temperature sensor', '°C', 'Active', 15),
(58, 'sunlight sensor', 'W/m²', 'Active', 15),
(59, 'dust sensor', '%', 'Active', 15),
(60, 'voltage sensor', 'V', 'Active', 15),
(61, 'temperature sensor', '°C', 'Active', 16),
(62, 'sunlight sensor', 'W/m²', 'Active', 16),
(63, 'dust sensor', '%', 'Active', 16),
(64, 'voltage sensor', 'V', 'Active', 16),
(65, 'temperature sensor', '°C', 'Active', 17),
(66, 'sunlight sensor', 'W/m²', 'Active', 17),
(67, 'dust sensor', '%', 'Active', 17),
(68, 'voltage sensor', 'V', 'Active', 17),
(69, 'temperature sensor', '°C', 'Active', 18),
(70, 'sunlight sensor', 'W/m²', 'Active', 18),
(71, 'dust sensor', '%', 'Active', 18),
(72, 'voltage sensor', 'V', 'Active', 18),
(73, 'temperature sensor', '°C', 'Active', 19),
(74, 'sunlight sensor', 'W/m²', 'Active', 19),
(75, 'dust sensor', '%', 'Active', 19),
(76, 'voltage sensor', 'V', 'Active', 19),
(77, 'temperature sensor', '°C', 'Active', 20),
(78, 'sunlight sensor', 'W/m²', 'Active', 20),
(79, 'dust sensor', '%', 'Active', 20),
(80, 'voltage sensor', 'V', 'Active', 20),
(81, 'temperature sensor', '°C', 'Active', 21),
(82, 'sunlight sensor', 'W/m²', 'Active', 21),
(83, 'dust sensor', '%', 'Active', 21),
(84, 'voltage sensor', 'V', 'Active', 21),
(89, 'temperature sensor', '°C', 'Active', 23),
(90, 'sunlight sensor', 'W/m²', 'Active', 23),
(91, 'dust sensor', '%', 'Active', 23),
(92, 'voltage sensor', 'V', 'Active', 23);

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
(5, 5, 4.95, 'Full'),
(6, 300, 0, 'Charging'),
(7, 15, 0, 'Low'),
(8, 15, 0, 'Low'),
(9, 15, 0.162, 'Low'),
(10, 15, 0.236, 'Low'),
(11, 15, 0.379, 'Low'),
(12, 15, 0.02, 'Low'),
(13, 15, 0.216, 'Low'),
(14, 15, 0.162, 'Low'),
(15, 15, 0.02, 'Low'),
(16, 15, 0.216, 'Low'),
(17, 15, 0.27, 'Low'),
(18, 15, 0.983, 'Low'),
(19, 15, 1.966, 'Low'),
(20, 15, 1.475, 'Low'),
(21, 15, 0.162, 'Low'),
(22, 15, 0.015, 'Low'),
(23, 15, 1.691, 'Low'),
(24, 15, 0.32, 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `thresholds`
--

CREATE TABLE `thresholds` (
  `threshold_id` int(11) NOT NULL,
  `type` enum('Dust Accumulation','Temperature','Voltage','Energy Production') NOT NULL,
  `value` double NOT NULL,
  `unit` enum('°C','V','kWh','%') NOT NULL,
  `userID` int(11) NOT NULL,
  `condition_is` enum('lower','higher') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thresholds`
--

INSERT INTO `thresholds` (`threshold_id`, `type`, `value`, `unit`, `userID`, `condition_is`) VALUES
(1, 'Temperature', 45, '°C', 0, 'lower'),
(2, 'Dust Accumulation', 70.14, '%', 0, 'higher'),
(3, 'Energy Production', 30, 'kWh', 0, 'lower');

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
  `created_at` datetime NOT NULL,
  `profile_pic` varchar(255) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password_hash`, `role`, `is_active`, `created_at`, `profile_pic`) VALUES
(1, 'sarah mohhamd', 'sarah@email.com', '$2y$10$l1rTIbGfE5EvTOMG98CQqO6Xlm3e9LvL2QMkx585YeKowdB.D9Bte', 'panel_owner', 1, '2026-02-10 00:00:00', 'default.png'),
(2, 'Reem', 'reem@email.com', 'hashed_pw', 'panel_owner', 1, '2026-01-18 00:00:00', 'default.png'),
(3, 'Aljory', 'admin@email.com', '$2y$10$l1rTIbGfE5EvTOMG98CQqO6Xlm3e9LvL2QMkx585YeKowdB.D9Bte', 'admin', 1, '2025-12-01 00:00:00', 'default.png'),
(4, 'Noura', 'Noura@siraj.com', '$2y$10$fvHjuiDGw4t6ZNRSGYN.k.Fs4duYR.W0SVWRCeYfqQQmAcUKXRVjq', 'panel_owner', 1, '2026-04-06 21:49:21', 'default.png'),
(5, 'Lama', 'Lama@siraj.com', '$2y$10$a8VQMxiaOU4LU11SfMPYvufm.o/AUym7TMzKHGqS8OJSYhbbl5xvG', 'panel_owner', 1, '2026-04-06 21:50:59', 'default.png'),
(6, 'Jory', 'Jory@siraj.com', '$2y$10$6nAIg20f7nYWb7Ryf1c1z..e8KRPURblzXsYY6Dlgm/BjeAudwfMa', 'panel_owner', 0, '2026-04-06 21:54:12', 'default.png'),
(11, 'Aljory Anas', 'aljoryle@gmail.com', '$2y$10$LfQ85xppST3DdaSMbSP4UeYbgkLZlsp.stbEJo.17FVIy5jnMqKQq', 'panel_owner', 1, '2026-04-08 10:59:13', 'default.png'),
(12, 'Reem', 'reem@siraj.com', '$2y$10$YP7kOvM35u1GOvuRcBMpB.1CxBD8q7DXGko/tZEoiucYfSx95M3ty', 'panel_owner', 1, '2026-04-08 11:36:14', 'default.png'),
(13, 'meme', 'meme@siraj.com', '$2y$10$qur.cfRnEiLmYtmxdWJasuwniQeShABET3.DDv7bHrwuJCEmv0DQW', 'panel_owner', 1, '2026-04-08 11:40:56', 'default.png'),
(15, 'Anas Alreemi', 'anasreemi@hotmail.com', '$2y$10$i2QIaCbw08QyUauGQFU1fuE2zaVj5JKDVsTLc3xrDFsW3hVAhsYaG', 'panel_owner', 1, '2026-04-27 19:26:33', 'default.png');

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
  MODIFY `alertID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `enviromentaldata`
--
ALTER TABLE `enviromentaldata`
  MODIFY `enviromentalDataID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `panel`
--
ALTER TABLE `panel`
  MODIFY `panelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `reading`
--
ALTER TABLE `reading`
  MODIFY `readingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
  MODIFY `sensorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `storage_unit`
--
ALTER TABLE `storage_unit`
  MODIFY `storageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `thresholds`
--
ALTER TABLE `thresholds`
  MODIFY `threshold_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert`
--
ALTER TABLE `alert`
  ADD CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`readingID`) REFERENCES `reading` (`readingID`),
  ADD CONSTRAINT `alert_ibfk_2` FOREIGN KEY (`thresholdID`) REFERENCES `thresholds` (`threshold_id`),
  ADD CONSTRAINT `alert_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alert_ibfk_4` FOREIGN KEY (`panelID`) REFERENCES `panel` (`panelID`);

--
-- Constraints for table `enviromentaldata`
--
ALTER TABLE `enviromentaldata`
  ADD CONSTRAINT `enviromentaldata_ibfk_1` FOREIGN KEY (`panelID`) REFERENCES `panel` (`panelID`) ON DELETE CASCADE;

--
-- Constraints for table `panel`
--
ALTER TABLE `panel`
  ADD CONSTRAINT `panel_ibfk_1` FOREIGN KEY (`storageID`) REFERENCES `storage_unit` (`storageID`),
  ADD CONSTRAINT `panel_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `reading`
--
ALTER TABLE `reading`
  ADD CONSTRAINT `reading_ibfk_1` FOREIGN KEY (`sensorID`) REFERENCES `sensor` (`sensorID`) ON DELETE CASCADE;

--
-- Constraints for table `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`panelID`) REFERENCES `panel` (`panelID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
