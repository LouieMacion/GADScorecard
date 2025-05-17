-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 16, 2025 at 01:32 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gad_dbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminID` varchar(10) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(2) NOT NULL,
  `contactNo` varchar(12) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `fname`, `lname`, `dob`, `sex`, `contactNo`, `email`, `password`) VALUES
('A001', 'Gab', 'Molna', '2015-05-17', 'F', '0928263826', '@usep.edu.ph', 'molinatortor');

-- --------------------------------------------------------

--
-- Table structure for table `assignedeval`
--

DROP TABLE IF EXISTS `assignedeval`;
CREATE TABLE IF NOT EXISTS `assignedeval` (
  `evaluatorID` varchar(10) NOT NULL,
  `papsID` varchar(10) NOT NULL,
  `adminID` varchar(10) NOT NULL,
  PRIMARY KEY (`evaluatorID`,`papsID`,`adminID`),
  KEY `papsID` (`papsID`),
  KEY `adminID` (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
CREATE TABLE IF NOT EXISTS `certification` (
  `certificationID` varchar(10) NOT NULL,
  `papsID` varchar(10) NOT NULL,
  `userID` varchar(10) NOT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`certificationID`),
  KEY `userID` (`userID`),
  KEY `papsID` (`papsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `commentID` varchar(10) NOT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  `userid` varchar(10) NOT NULL,
  `evaluatorID` varchar(10) NOT NULL,
  `papsID` varchar(10) NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `userid` (`userid`),
  KEY `evaluatorID` (`evaluatorID`),
  KEY `papsID` (`papsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enduser`
--

DROP TABLE IF EXISTS `enduser`;
CREATE TABLE IF NOT EXISTS `enduser` (
  `userID` varchar(10) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(2) NOT NULL,
  `contactNo` varchar(12) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `address` varchar(25) DEFAULT NULL,
  `orgname` varchar(25) DEFAULT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `evaluator`
--

DROP TABLE IF EXISTS `evaluator`;
CREATE TABLE IF NOT EXISTS `evaluator` (
  `evaluatorID` varchar(10) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(2) NOT NULL,
  `contactNo` varchar(12) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `address` varchar(25) DEFAULT NULL,
  `expertise` varchar(25) DEFAULT NULL,
  `department` varchar(25) DEFAULT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`evaluatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `followup`
--

DROP TABLE IF EXISTS `followup`;
CREATE TABLE IF NOT EXISTS `followup` (
  `userID` varchar(10) NOT NULL,
  `papsID` varchar(10) NOT NULL,
  `evaluatorID` varchar(10) NOT NULL,
  `dateRequested` date DEFAULT NULL,
  PRIMARY KEY (`userID`,`papsID`,`evaluatorID`),
  KEY `evaluatorID` (`evaluatorID`),
  KEY `papsID` (`papsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paps`
--

DROP TABLE IF EXISTS `paps`;
CREATE TABLE IF NOT EXISTS `paps` (
  `papsID` varchar(10) NOT NULL,
  `userID` varchar(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `organization` varchar(25) NOT NULL,
  `dateSubmitted` date DEFAULT NULL,
  PRIMARY KEY (`papsID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `itemID` varchar(10) NOT NULL,
  `papsID` varchar(10) NOT NULL,
  `evaluatorID` varchar(10) NOT NULL,
  `score` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`itemID`,`papsID`,`evaluatorID`),
  KEY `evaluatorID` (`evaluatorID`),
  KEY `papsID` (`papsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scoresheet`
--

DROP TABLE IF EXISTS `scoresheet`;
CREATE TABLE IF NOT EXISTS `scoresheet` (
  `itemID` varchar(10) NOT NULL,
  `item` text NOT NULL,
  `subitem` text,
  `adminID` varchar(10) NOT NULL,
  `yesValue` decimal(5,2) NOT NULL,
  `noValue` decimal(5,2) NOT NULL,
  `partlyValue` decimal(5,2) NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `adminID` (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scoresheet`
--

INSERT INTO `scoresheet` (`itemID`, `item`, `subitem`, `adminID`, `yesValue`, `noValue`, `partlyValue`) VALUES
('1', '1 Question 1', '1.1 Sub item', 'A001', 1.00, 0.00, 0.00),
('1.1', '1 Question 1', '1.1 Sub item 2', 'A001', 1.00, 0.00, 0.00),
('1001', '1 Test', '1.1 Test 101', 'A001', 0.50, 0.00, 0.33),
('1001-1', '1 Test', '1.2 huehue', 'A001', 0.50, 0.00, 0.33),
('22', '2 Hello World!', '', 'A001', 0.50, 0.00, 0.33),
('3', '3 Question 3', '3.1', 'A001', 1.00, 0.00, 0.00),
('3.1', '3 Question 3', '3.3 Sub 3', 'A001', 1.00, 0.00, 0.00),
('3.2', '3 Question 3', '3.2 sub item 2', 'A001', 1.00, 0.00, 0.00),
('3001', '3 wowow', '3.1 naay nasunog', 'A001', 0.67, 0.00, 0.33),
('3002', '3 wowow', '3.2 sub item 2', 'A001', 0.67, 0.00, 0.33);

-- --------------------------------------------------------

--
-- Table structure for table `scoresheetversions`
--

DROP TABLE IF EXISTS `scoresheetversions`;
CREATE TABLE IF NOT EXISTS `scoresheetversions` (
  `versionID` varchar(10) NOT NULL,
  `itemID` varchar(10) NOT NULL,
  `adminID` varchar(10) NOT NULL,
  `dateAdministered` datetime NOT NULL,
  PRIMARY KEY (`versionID`,`itemID`),
  KEY `itemID` (`itemID`),
  KEY `adminID` (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scoresheetversions`
--

INSERT INTO `scoresheetversions` (`versionID`, `itemID`, `adminID`, `dateAdministered`) VALUES
('V68253D9B5', '1', 'A001', '2025-05-15 01:04:27'),
('V68253D9B5', '1.1', 'A001', '2025-05-15 01:04:27'),
('V68253E580', '1', 'A001', '2025-05-15 01:07:36'),
('V68253E580', '1.1', 'A001', '2025-05-15 01:07:36'),
('V68253E580', '3', 'A001', '2025-05-15 01:07:36'),
('V68253E580', '3.1', 'A001', '2025-05-15 01:07:36'),
('V68253E580', '3.2', 'A001', '2025-05-15 01:07:36'),
('V682542A91', '1', 'A001', '2025-05-15 01:26:01'),
('V682542A91', '1.1', 'A001', '2025-05-15 01:26:01'),
('V682542A91', '22', 'A001', '2025-05-15 01:26:01'),
('V682542A91', '3', 'A001', '2025-05-15 01:26:01'),
('V682542A91', '3.1', 'A001', '2025-05-15 01:26:01'),
('V682542A91', '3.2', 'A001', '2025-05-15 01:26:01'),
('V682547286', '1001', 'A001', '2025-05-15 01:45:12'),
('V682547286', '1001-1', 'A001', '2025-05-15 01:45:12'),
('V682547286', '22', 'A001', '2025-05-15 01:45:12'),
('V6825472A7', '1001', 'A001', '2025-05-15 01:45:14'),
('V6825472A7', '1001-1', 'A001', '2025-05-15 01:45:14'),
('V6825472A7', '22', 'A001', '2025-05-15 01:45:14'),
('V682548461', '1001', 'A001', '2025-05-15 01:49:58'),
('V682548461', '1001-1', 'A001', '2025-05-15 01:49:58'),
('V682548461', '22', 'A001', '2025-05-15 01:49:58'),
('V682548461', '3001', 'A001', '2025-05-15 01:49:58'),
('V682548461', '3002', 'A001', '2025-05-15 01:49:58'),
('V682693994', '1001', 'A001', '2025-05-16 01:23:37'),
('V682693994', '1001-1', 'A001', '2025-05-16 01:23:37'),
('V682693994', '22', 'A001', '2025-05-16 01:23:37'),
('V682693994', '3001', 'A001', '2025-05-16 01:23:37'),
('V682693994', '3002', 'A001', '2025-05-16 01:23:37');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignedeval`
--
ALTER TABLE `assignedeval`
  ADD CONSTRAINT `assignedeval_ibfk_1` FOREIGN KEY (`evaluatorID`) REFERENCES `evaluator` (`evaluatorID`),
  ADD CONSTRAINT `assignedeval_ibfk_2` FOREIGN KEY (`papsID`) REFERENCES `paps` (`papsID`),
  ADD CONSTRAINT `assignedeval_ibfk_3` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`);

--
-- Constraints for table `certification`
--
ALTER TABLE `certification`
  ADD CONSTRAINT `certification_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `enduser` (`userID`),
  ADD CONSTRAINT `certification_ibfk_2` FOREIGN KEY (`papsID`) REFERENCES `paps` (`papsID`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `enduser` (`userID`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`evaluatorID`) REFERENCES `evaluator` (`evaluatorID`),
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`papsID`) REFERENCES `paps` (`papsID`);

--
-- Constraints for table `followup`
--
ALTER TABLE `followup`
  ADD CONSTRAINT `followup_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `enduser` (`userID`),
  ADD CONSTRAINT `followup_ibfk_2` FOREIGN KEY (`evaluatorID`) REFERENCES `evaluator` (`evaluatorID`),
  ADD CONSTRAINT `followup_ibfk_3` FOREIGN KEY (`papsID`) REFERENCES `paps` (`papsID`);

--
-- Constraints for table `paps`
--
ALTER TABLE `paps`
  ADD CONSTRAINT `paps_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `enduser` (`userID`);

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `scoresheet` (`itemID`),
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`evaluatorID`) REFERENCES `evaluator` (`evaluatorID`),
  ADD CONSTRAINT `score_ibfk_3` FOREIGN KEY (`papsID`) REFERENCES `paps` (`papsID`);

--
-- Constraints for table `scoresheet`
--
ALTER TABLE `scoresheet`
  ADD CONSTRAINT `scoresheet_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`);

--
-- Constraints for table `scoresheetversions`
--
ALTER TABLE `scoresheetversions`
  ADD CONSTRAINT `scoresheetversions_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `scoresheet` (`itemID`),
  ADD CONSTRAINT `scoresheetversions_ibfk_2` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
