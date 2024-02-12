-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2022 at 04:56 PM
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
-- Database: `final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` varchar(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `UserName`, `Password`) VALUES
('A01', 'administrator', 'admin1234!');

-- --------------------------------------------------------

--
-- Table structure for table `blood_type`
--

CREATE TABLE `blood_type` (
  `Blood_Type` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_type`
--

INSERT INTO `blood_type` (`Blood_Type`) VALUES
('A+'),
('A-'),
('AB+'),
('AB-'),
('B+'),
('B-'),
('O+'),
('O-');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `ID` varchar(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Age` int(3) DEFAULT NULL,
  `Blood_Type` varchar(3) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`ID`, `Name`, `Phone`, `Email`, `Gender`, `Age`, `Blood_Type`, `Address`) VALUES
('D01', 'John Doe', '9027894561', 'JohnDoe@Gmail.com', 'M', 53, 'A-', '123 John Doe Lane');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `Hospital` varchar(50) NOT NULL,
  `Blood_Type` varchar(3) NOT NULL,
  `Priority` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`Hospital`, `Blood_Type`, `Priority`) VALUES
('St Patrick Memorial', 'O+', 3);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `ID` varchar(3) NOT NULL,
  `Blood_Type` varchar(20) DEFAULT NULL,
  `Priority` int(1) DEFAULT NULL
) ;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`ID`, `Blood_Type`, `Priority`) VALUES
('P01', 'A-', 3);

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE `priority` (
  `Level` int(1) NOT NULL,
  `Colour` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`Level`, `Colour`) VALUES
(1, 'Red'),
(2, 'Yellow'),
(3, 'Green');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `blood_type`
--
ALTER TABLE `blood_type`
  ADD PRIMARY KEY (`Blood_Type`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Blood_Type` (`Blood_Type`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`Hospital`),
  ADD KEY `Blood_Type` (`Blood_Type`),
  ADD KEY `Priority` (`Priority`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Blood_Type` (`Blood_Type`),
  ADD KEY `Priority` (`Priority`);

--
-- Indexes for table `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`Level`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donors`
--
ALTER TABLE `donors`
  ADD CONSTRAINT `donors_ibfk_1` FOREIGN KEY (`Blood_Type`) REFERENCES `blood_type` (`Blood_Type`);

--
-- Constraints for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD CONSTRAINT `hospitals_ibfk_1` FOREIGN KEY (`Blood_Type`) REFERENCES `blood_type` (`Blood_Type`),
  ADD CONSTRAINT `hospitals_ibfk_2` FOREIGN KEY (`Priority`) REFERENCES `priority` (`Level`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`Blood_Type`) REFERENCES `blood_type` (`Blood_Type`),
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`Priority`) REFERENCES `priority` (`Level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
