-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2022 at 09:33 PM
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
-- Database: `hospital xyz`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_doctors`
--

CREATE TABLE `all_doctors` (
  `Doc_ID` varchar(8) NOT NULL,
  `Department` varchar(20) NOT NULL
) ;

--
-- Dumping data for table `all_doctors`
--

INSERT INTO `all_doctors` (`Doc_ID`, `Department`) VALUES
('DC001', 'Emergency'),
('DR001', 'Emergency');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentName` varchar(20) NOT NULL,
  `Location` varchar(35) NOT NULL,
  `Services Available` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentName`, `Location`, `Services Available`) VALUES
('Emergency', '1st Floor', 'Trauma Response, Surgery, Acute Care');

-- --------------------------------------------------------

--
-- Table structure for table `doc_reg`
--

CREATE TABLE `doc_reg` (
  `Doc_ID` varchar(8) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Qualification` varchar(10) NOT NULL,
  `Salary` int(6) NOT NULL,
  `Clock_In` time NOT NULL,
  `Clock_Out` time NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Hired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doc_reg`
--

INSERT INTO `doc_reg` (`Doc_ID`, `Name`, `Qualification`, `Salary`, `Clock_In`, `Clock_Out`, `Address`, `Phone`, `Hired`) VALUES
('DC001', 'Dr John Gouda', 'MD', 100000, '14:00:00', '02:00:00', '123 Gouda Lane, Gotham', '9027894561', '2012-11-07');

-- --------------------------------------------------------

--
-- Table structure for table `on_call_docs`
--

CREATE TABLE `on_call_docs` (
  `Doc_ID` varchar(8) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Qualification` varchar(10) NOT NULL,
  `Fee_Per_Call` decimal(9,0) NOT NULL,
  `Amount_Owed` decimal(9,0) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL
) ;

--
-- Dumping data for table `on_call_docs`
--

INSERT INTO `on_call_docs` (`Doc_ID`, `Name`, `Qualification`, `Fee_Per_Call`, `Amount_Owed`, `Address`, `Phone`) VALUES
('DC001', 'Dr Jane Brie', 'MD', '200', '1500', '123 Gouda Lane', '9024561237');

-- --------------------------------------------------------

--
-- Table structure for table `patient_admit`
--

CREATE TABLE `patient_admit` (
  `Pat_No` varchar(8) NOT NULL,
  `Deposit` int(6) NOT NULL,
  `Payment` varchar(6) NOT NULL,
  `Room_No` varchar(6) NOT NULL,
  `Department` varchar(11) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Admitted_on` date NOT NULL,
  `Investigation` varchar(20) NOT NULL,
  `Treatment_Started` date NOT NULL,
  `Attending` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_admit`
--

INSERT INTO `patient_admit` (`Pat_No`, `Deposit`, `Payment`, `Room_No`, `Department`, `State`, `Admitted_on`, `Investigation`, `Treatment_Started`, `Attending`) VALUES
('PT001', 3002, 'Cash', 'RN001', 'Emergency', 'Stable', '2016-11-01', 'Xrayed Chest', '2016-11-01', 'Nurse Jackie');

-- --------------------------------------------------------

--
-- Table structure for table `patient_checkup`
--

CREATE TABLE `patient_checkup` (
  `Pat_No` varchar(8) NOT NULL,
  `Doc_ID` varchar(8) NOT NULL,
  `Diagnosis` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Treatment` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_checkup`
--

INSERT INTO `patient_checkup` (`Pat_No`, `Doc_ID`, `Diagnosis`, `Status`, `Treatment`) VALUES
('PT001', 'DC001', 'Heart Attack', 'Stable', 'Continued Monitoring');

-- --------------------------------------------------------

--
-- Table structure for table `patient_discharge`
--

CREATE TABLE `patient_discharge` (
  `Pat_No` varchar(8) NOT NULL,
  `Treatment_Advised` varchar(50) NOT NULL,
  `Treatment_Given` varchar(50) NOT NULL,
  `Medication` varchar(50) NOT NULL,
  `Payment_Made` int(7) NOT NULL,
  `Discharge_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_discharge`
--

INSERT INTO `patient_discharge` (`Pat_No`, `Treatment_Advised`, `Treatment_Given`, `Medication`, `Payment_Made`, `Discharge_Date`) VALUES
('PT001', 'Ice Injury', 'Ice Pack', 'Advil', 350, '2019-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `patient_entry`
--

CREATE TABLE `patient_entry` (
  `Pat_No` varchar(8) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Date_arrived` date NOT NULL,
  `Age` int(3) NOT NULL,
  `Sex` varchar(1) NOT NULL,
  `Family_Doctor` varchar(25) NOT NULL,
  `Diagnosis` varchar(50) NOT NULL,
  `Referred` varchar(1) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Department` varchar(20) NOT NULL
) ;

--
-- Dumping data for table `patient_entry`
--

INSERT INTO `patient_entry` (`Pat_No`, `Name`, `Date_arrived`, `Age`, `Sex`, `Family_Doctor`, `Diagnosis`, `Referred`, `Address`, `City`, `Phone`, `Department`) VALUES
('PT001', 'Mark Parmigiano', '2014-11-12', 53, 'M', 'Dr BooBoo', 'Broken Arm', 'Y', '123 Owie Lane', 'Gotham', '9257894268', 'Emergency');

-- --------------------------------------------------------

--
-- Table structure for table `patient_operations`
--

CREATE TABLE `patient_operations` (
  `Pat_No` varchar(8) NOT NULL,
  `Date` date NOT NULL,
  `Preop_Condition` varchar(30) NOT NULL,
  `Postop_Condition` varchar(30) NOT NULL,
  `Operation_Type` varchar(40) NOT NULL,
  `Medications` varchar(35) NOT NULL,
  `Doc_ID` varchar(8) NOT NULL,
  `Op_theatre` varchar(8) NOT NULL,
  `Suggested_Followup` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_operations`
--

INSERT INTO `patient_operations` (`Pat_No`, `Date`, `Preop_Condition`, `Postop_Condition`, `Operation_Type`, `Medications`, `Doc_ID`, `Op_theatre`, `Suggested_Followup`) VALUES
('PT001', '2014-11-01', 'Critical', 'Stable', 'Arterial Bypass', 'Motrin', 'DR001', 'Th001', 'Refer to Cardiology');

-- --------------------------------------------------------

--
-- Table structure for table `patient_registration`
--

CREATE TABLE `patient_registration` (
  `Pat_No` varchar(8) NOT NULL,
  `Date_Visited` date NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Treatment` varchar(30) NOT NULL,
  `Medication` varchar(30) NOT NULL,
  `Doc_ID` varchar(8) NOT NULL,
  `Payment` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_registration`
--

INSERT INTO `patient_registration` (`Pat_No`, `Date_Visited`, `Status`, `Treatment`, `Medication`, `Doc_ID`, `Payment`) VALUES
('PT001', '2012-11-12', 'Triage', 'Antibiotics', 'Amoxicillin', 'DC001', 200);

-- --------------------------------------------------------

--
-- Table structure for table `room_details`
--

CREATE TABLE `room_details` (
  `Room_No` varchar(8) NOT NULL,
  `Type` varchar(1) NOT NULL,
  `Satus` varchar(1) NOT NULL,
  `Daily_Fee` int(4) NOT NULL,
  `Other_Fees` int(5) NOT NULL
) ;

--
-- Dumping data for table `room_details`
--

INSERT INTO `room_details` (`Room_No`, `Type`, `Satus`, `Daily_Fee`, `Other_Fees`) VALUES
('RN001', 'P', 'Y', 100, 400);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_doctors`
--
ALTER TABLE `all_doctors`
  ADD PRIMARY KEY (`Doc_ID`),
  ADD KEY `Department` (`Department`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentName`);

--
-- Indexes for table `doc_reg`
--
ALTER TABLE `doc_reg`
  ADD KEY `Doc_ID` (`Doc_ID`);

--
-- Indexes for table `on_call_docs`
--
ALTER TABLE `on_call_docs`
  ADD KEY `Doc_ID` (`Doc_ID`);

--
-- Indexes for table `patient_admit`
--
ALTER TABLE `patient_admit`
  ADD PRIMARY KEY (`Pat_No`),
  ADD KEY `Department` (`Department`),
  ADD KEY `Room_No` (`Room_No`);

--
-- Indexes for table `patient_checkup`
--
ALTER TABLE `patient_checkup`
  ADD KEY `Pat_No` (`Pat_No`),
  ADD KEY `Doc_ID` (`Doc_ID`);

--
-- Indexes for table `patient_discharge`
--
ALTER TABLE `patient_discharge`
  ADD KEY `Pat_No` (`Pat_No`);

--
-- Indexes for table `patient_entry`
--
ALTER TABLE `patient_entry`
  ADD PRIMARY KEY (`Pat_No`),
  ADD KEY `Department` (`Department`);

--
-- Indexes for table `patient_operations`
--
ALTER TABLE `patient_operations`
  ADD KEY `Pat_No` (`Pat_No`),
  ADD KEY `Doc_ID` (`Doc_ID`);

--
-- Indexes for table `patient_registration`
--
ALTER TABLE `patient_registration`
  ADD KEY `Doc_ID` (`Doc_ID`),
  ADD KEY `Pat_No` (`Pat_No`);

--
-- Indexes for table `room_details`
--
ALTER TABLE `room_details`
  ADD PRIMARY KEY (`Room_No`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_doctors`
--
ALTER TABLE `all_doctors`
  ADD CONSTRAINT `all_doctors_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`DepartmentName`);

--
-- Constraints for table `doc_reg`
--
ALTER TABLE `doc_reg`
  ADD CONSTRAINT `doc_reg_ibfk_1` FOREIGN KEY (`Doc_ID`) REFERENCES `all_doctors` (`Doc_ID`);

--
-- Constraints for table `on_call_docs`
--
ALTER TABLE `on_call_docs`
  ADD CONSTRAINT `on_call_docs_ibfk_1` FOREIGN KEY (`Doc_ID`) REFERENCES `all_doctors` (`Doc_ID`);

--
-- Constraints for table `patient_admit`
--
ALTER TABLE `patient_admit`
  ADD CONSTRAINT `patient_admit_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`DepartmentName`),
  ADD CONSTRAINT `patient_admit_ibfk_2` FOREIGN KEY (`Pat_No`) REFERENCES `patient_entry` (`Pat_No`),
  ADD CONSTRAINT `patient_admit_ibfk_3` FOREIGN KEY (`Room_No`) REFERENCES `room_details` (`Room_No`);

--
-- Constraints for table `patient_checkup`
--
ALTER TABLE `patient_checkup`
  ADD CONSTRAINT `patient_checkup_ibfk_1` FOREIGN KEY (`Pat_No`) REFERENCES `patient_entry` (`Pat_No`),
  ADD CONSTRAINT `patient_checkup_ibfk_2` FOREIGN KEY (`Doc_ID`) REFERENCES `all_doctors` (`Doc_ID`);

--
-- Constraints for table `patient_discharge`
--
ALTER TABLE `patient_discharge`
  ADD CONSTRAINT `patient_discharge_ibfk_1` FOREIGN KEY (`Pat_No`) REFERENCES `patient_admit` (`Pat_No`);

--
-- Constraints for table `patient_entry`
--
ALTER TABLE `patient_entry`
  ADD CONSTRAINT `patient_entry_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`DepartmentName`);

--
-- Constraints for table `patient_operations`
--
ALTER TABLE `patient_operations`
  ADD CONSTRAINT `patient_operations_ibfk_1` FOREIGN KEY (`Doc_ID`) REFERENCES `all_doctors` (`Doc_ID`),
  ADD CONSTRAINT `patient_operations_ibfk_2` FOREIGN KEY (`Pat_No`) REFERENCES `patient_entry` (`Pat_No`);

--
-- Constraints for table `patient_registration`
--
ALTER TABLE `patient_registration`
  ADD CONSTRAINT `patient_registration_ibfk_1` FOREIGN KEY (`Doc_ID`) REFERENCES `all_doctors` (`Doc_ID`),
  ADD CONSTRAINT `patient_registration_ibfk_2` FOREIGN KEY (`Pat_No`) REFERENCES `patient_entry` (`Pat_No`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
