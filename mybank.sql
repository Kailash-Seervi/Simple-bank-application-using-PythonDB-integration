-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2019 at 08:08 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mybank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Acc_no` int(11) NOT NULL,
  `Acc_type` char(1) NOT NULL,
  `Acc_balance` int(11) NOT NULL DEFAULT '0',
  `locked|unlocked` char(3) DEFAULT '1',
  `Acc_status` char(3) NOT NULL DEFAULT '1',
  `deleted` char(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Acc_no`, `Acc_type`, `Acc_balance`, `locked|unlocked`, `Acc_status`, `deleted`) VALUES
(2, 'S', 1974, '1', '1', '0'),
(10, 'S', 0, '1', '1', '0'),
(34, 'S', 19177, '', '', ''),
(35, 'C', 500000, '', '', '1'),
(36, 'S', 1000, '', '', ''),
(37, 'C', 0, '', '0', '1'),
(45, 'S', 0, '1', '1', '0'),
(46, 'S', 0, '1', '1', '0'),
(49, 'S', 0, '1', '1', '0'),
(51, 'S', 0, '1', '1', '0'),
(52, 'S', 0, '1', '1', '0'),
(53, 'S', 0, '1', '1', '0'),
(54, 'S', 0, '1', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `AdminName` varchar(20) NOT NULL,
  `AdminPasswd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `AdminName`, `AdminPasswd`) VALUES
(1111, 'admin1', 'admin@123'),
(1112, 'admin2', 'qwerty@123');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cust_id` int(11) NOT NULL,
  `cust_first_name` varchar(20) NOT NULL,
  `cust_second_name` varchar(10) NOT NULL,
  `Addr_line1` varchar(30) NOT NULL,
  `Addr_line2` varchar(30) NOT NULL,
  `city` varchar(10) NOT NULL,
  `state` varchar(20) NOT NULL,
  `Pincode` int(11) NOT NULL,
  `opening_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_id`, `cust_first_name`, `cust_second_name`, `Addr_line1`, `Addr_line2`, `city`, `state`, `Pincode`, `opening_date`) VALUES
(2, 'zxcv', 'bnmk', 'No.5,6th lane ,Sir MV Nagar', 'KR puram', 'Bangalore', 'Karnataka', 560084, '2019-04-12 18:30:00'),
(7, 'ergrg', 'fvegr', 'bgrgte', 'gffbgr', 'rytnhtb', 'gtttg', 43565, '0000-00-00 00:00:00'),
(8, 'dvbgbf', 'bffgs', ' vvbsfx', 'gfvbf', ' bgsdfd', 'fvssdvs', 3446576, '2019-04-12 18:30:00'),
(10, 'dfg', 'dfgfdtf', 'vfvsvv', 'dvsdfvs', 'BLLLLLL', 'KAAAAAA', 566666, '2019-04-12 18:30:00'),
(12, 'jytyjyhjfh', 'ththth', '111111111111', '2222222222222', 'BLLLL', 'KAAAA', 560016, '2019-04-12 18:30:00'),
(13, 'vf', 'be', '', 'vv', 'ev', '', 4545, '0000-00-00 00:00:00'),
(14, 'fs', 'ss', '', 'sfrs', 'sf', 'fs', 433, '0000-00-00 00:00:00'),
(15, 'ggt', 'gtj', 'y', 'h', '', 'hy', 6767, '0000-00-00 00:00:00'),
(16, 'fwfw', 'ff', 'fre', 'fe', 'frfer', 'veve', 45657, '0000-00-00 00:00:00'),
(17, 'ttr', '', 'rb', 'tb', 'rbfg', 'bgbg', 456, '0000-00-00 00:00:00'),
(18, 'freer', 'gr', 'ge', 'r', 'vgbfdr', 'vrtg', 6554, '0000-00-00 00:00:00'),
(19, 'revetb', 'tgbr', 'brb', 'rr', 'bbbt', 'gbnrhf', 3456, '0000-00-00 00:00:00'),
(25, 'fegtb', 'tg', '', 'v', 'v', 'dbgbg', 4567, '0000-00-00 00:00:00'),
(27, 'WDWWEF', 'RFRF', 'RFREFRE', 'RFFREF', 'ERE', 'FERRF', 345, '0000-00-00 00:00:00'),
(29, 'vvfd', 'vvvv', 'vebghn', 'hnhnhbv', 'vrtvtvbgbg', 'tgbgfgfbgb', 546577, '0000-00-00 00:00:00'),
(32, 'fgftgv', 'gtbby', 'nybn', 'ntbttvfdc', 'fvrrt', 'evynb', 4354657, '0000-00-00 00:00:00'),
(33, 'ntntt', '', '', 'tntnnn', 'nnnnbt', 'tnnnu', 554665, '0000-00-00 00:00:00'),
(34, 'bt', 'rbrbrb', 'bbdbby', 'brbrb', 'byrbrbrb', 'bbgrr', 54645656, '0000-00-00 00:00:00'),
(35, 'defevgg', 'gb', 'bbbbb', 'rbrbbrbb', 'btbbhttbb', 'rbthbth', 45654, '0000-00-00 00:00:00'),
(36, 'kkkkk', 'rrrrr', 'ttrhgt', 'hthtrh', 'trhtr', 'hntyh', 456787, '0000-00-00 00:00:00'),
(37, 'qoqoq', 'gtrogt', 'tgtrgtg', 'g', 'tgtg', 'ttrgt', 34556, '0000-00-00 00:00:00'),
(44, 'ewew', 'ewrvrfe', 'ewfrgr', 'ffrgegrfwr', 'cdwfrw', 'efrwfwrfr', 5, '2019-04-28 14:01:45'),
(45, 'jjyhtgr', 'gtggt', 'ytujtujyjy', 'hyrhyrhrh', 'hhthtr', 'htththt', 56576, '2019-04-28 14:05:57'),
(46, 'ghtrf', 'gggg', 'rgrfrfr', 'frrfrwf', 'rfrfr', 'rfrff', 45546, '2019-04-28 14:07:31'),
(49, 'gtrg', 'rgrgrg', 'rgrgrr', 'rrgrg', 'grrgr', 'gggtg', 566767, '2019-04-28 14:17:30'),
(51, 'htgr', 'rgrgrg', 'rgrg', 'rgrgrgr', 'rr', 'grgrgrg', 4667, '2019-04-28 14:19:03'),
(52, 'ghrg', 'tt', 'gggg', 'rgrgrgrg', 'rgrgrgr', 'grgrgrg', 56655, '2019-04-28 14:20:28'),
(53, 'fvgbtg', 'tggeg', 'gggeg', 'gegeg', 'ergrg', 'ggrgr', 656754, '2019-04-28 14:22:07'),
(54, 'yezdan', 'R', 'wall street', 'NY', 'NY city', 'New York', 234344, '2019-04-30 05:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_deposits`
--

CREATE TABLE `fixed_deposits` (
  `FD_Acc_no` int(11) NOT NULL,
  `Acc_no` int(11) NOT NULL,
  `FD_Amount` int(11) NOT NULL DEFAULT '1000',
  `FD_term` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fixed_deposits`
--

INSERT INTO `fixed_deposits` (`FD_Acc_no`, `Acc_no`, `FD_Amount`, `FD_term`) VALUES
(9000, 2, 1000, 20),
(9001, 2, 6000, 30),
(9002, 2, 90000, 30),
(9005, 2, 8000, 34),
(9006, 2, 6000, 34),
(9007, 2, 7000, 33),
(9008, 37, 1000, 55),
(9009, 35, 100000, 12),
(9010, 36, 20000, 33),
(9011, 10, 1000000, 12),
(9013, 35, 30000, 7),
(9014, 2, 2147483647, 12),
(9015, 2, 4000, 12),
(9016, 2, 1000, 12),
(9017, 2, 1000, 12),
(9018, 2, 1000, 12);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `Loan_Acc_no` int(11) NOT NULL,
  `Acc_no` int(11) NOT NULL,
  `LoanAmt` int(11) NOT NULL,
  `Loan_term` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`Loan_Acc_no`, `Acc_no`, `LoanAmt`, `Loan_term`) VALUES
(5000, 2, 7000, 20),
(5003, 37, 5000, 13),
(5004, 36, 7000, 9),
(5005, 10, 80000, 30),
(5007, 2, 10000000, 55),
(5008, 2, 2000, 12),
(5009, 2, 1000, 12),
(5010, 2, 200, 12),
(5011, 35, 100, 12),
(5012, 35, 100000000, 12),
(5013, 35, 100000, 12),
(5014, 35, 20000, 12),
(5015, 35, 30000, 30),
(5016, 2, 1000, 12),
(5017, 2, 1000, 12),
(5018, 2, 100, 12);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `trans_id` int(11) NOT NULL,
  `Acc_no` int(10) NOT NULL,
  `TransType` varchar(10) NOT NULL,
  `AmountOfTrans` int(11) DEFAULT NULL,
  `ToAcc` int(11) NOT NULL,
  `Acc_balance` int(11) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`trans_id`, `Acc_no`, `TransType`, `AmountOfTrans`, `ToAcc`, `Acc_balance`, `time`) VALUES
(1002, 2, '', 500, 2, 13512, '2019-04-16 19:48:17'),
(1007, 2, 'CREDIT', 34, 34, 16778, '2019-04-17 12:04:09'),
(1008, 34, 'DEBIT', 34, 2, 8677, '2019-04-17 12:04:09'),
(1009, 2, 'DEPOSIT', 100, 2, 17928, '2019-04-24 05:20:44'),
(1010, 2, 'WITHDRAWN', 5, 2, 15690, '2019-04-24 15:46:28'),
(1011, 2, 'DEPOSIT', 50, 2, 15740, '2019-04-24 15:46:42'),
(1012, 2, 'CREDIT', 2000, 34, 13740, '2019-04-24 15:47:38'),
(1013, 34, 'DEBIT', 2000, 2, 10677, '2019-04-24 15:47:38'),
(1014, 2, 'DEPOSIT', 30, 2, 13770, '2019-04-24 16:29:52'),
(1015, 2, 'WITHDRAWN', 40, 2, 13730, '2019-04-24 16:30:00'),
(1016, 2, 'CREDIT', 200, 34, 13530, '2019-04-24 16:30:10'),
(1017, 34, 'DEBIT', 200, 2, 10877, '2019-04-24 16:30:10'),
(1018, 2, 'DEPOSIT', 4000, 2, 17530, '2019-04-26 21:56:51'),
(1019, 2, 'WITHDRAWN', 5000, 2, 12530, '2019-04-26 21:57:09'),
(1020, 2, 'WITHDRAWN', 2000, 2, 10530, '2019-04-26 21:57:17'),
(1021, 2, 'CREDIT', 2000, 34, 8530, '2019-04-26 21:57:48'),
(1022, 34, 'DEBIT', 2000, 2, 12877, '2019-04-26 21:57:48'),
(1023, 2, 'DEPOSIT', 44, 2, 8574, '2019-04-28 20:38:20'),
(1024, 2, 'WITHDRAWN', 300, 2, 8274, '2019-04-28 20:40:15'),
(1025, 2, 'DEBIT', 5000, 34, 3274, '2019-04-28 20:40:25'),
(1026, 34, 'CREDIT', 5000, 2, 17877, '2019-04-28 20:40:25'),
(1027, 2, 'DEPOSIT', 5000, 2, 8274, '2019-04-28 22:59:46'),
(1028, 2, 'WITHDRAWN', 4000, 2, 4274, '2019-04-28 22:59:55'),
(1029, 2, 'DEBIT', 300, 34, 3974, '2019-04-28 23:00:10'),
(1030, 34, 'CREDIT', 300, 2, 18177, '2019-04-28 23:00:10'),
(1031, 2, 'DEPOSIT', 1000, 2, 4974, '2019-04-30 10:56:01'),
(1032, 2, 'WITHDRAWN', 2000, 2, 2974, '2019-04-30 10:57:51'),
(1033, 2, 'DEBIT', 1000, 34, 1974, '2019-04-30 10:58:16'),
(1034, 34, 'CREDIT', 1000, 2, 19177, '2019-04-30 10:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_credentials`
--

CREATE TABLE `user_credentials` (
  `cust_id` int(11) NOT NULL,
  `userid` varchar(20) CHARACTER SET utf16 NOT NULL,
  `passwd` char(60) NOT NULL,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_transc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_credentials`
--

INSERT INTO `user_credentials` (`cust_id`, `userid`, `passwd`, `last_login`, `last_seen`, `last_transc`) VALUES
(2, 'qwerty', 'abc@12345', '2019-04-13 11:00:00', '2019-04-13 11:17:00', '2019-04-13 04:04:45'),
(25, 'qqqq', '1111', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '999999', '1111111', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'mmmm', 'mmmm', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'qwqw', 'wqwq', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'rrrrr', '11111', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'www', 'xyz', '2019-04-15 15:08:59', '2019-04-15 15:08:59', '0000-00-00 00:00:00'),
(45, 'poiuyt', 'ertgf', '2019-04-28 19:36:19', '2019-04-28 19:36:19', '2019-04-28 14:06:19'),
(46, 'afgrgrr', 'rgrgrg', '2019-04-28 19:37:41', '2019-04-28 19:37:41', '2019-04-28 14:07:41'),
(49, 'tgttetgtg', 'getgg', '2019-04-28 19:47:35', '2019-04-28 19:47:35', '2019-04-28 14:17:35'),
(51, 'grgr', 'ggrgr', '2019-04-28 19:49:25', '2019-04-28 19:49:25', '2019-04-28 14:19:25'),
(52, 'gtrh', 'hbgnumut', '2019-04-28 19:50:46', '2019-04-28 19:50:46', '2019-04-28 14:20:46'),
(53, 'tjhtrgru', 'hyjngbv', '2019-04-28 19:52:20', '2019-04-28 19:52:20', '2019-04-28 14:22:20'),
(54, 'yezr', 'abcd@12345', '2019-04-30 11:03:56', '2019-04-30 11:03:56', '2019-04-30 05:33:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Acc_no`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `fixed_deposits`
--
ALTER TABLE `fixed_deposits`
  ADD PRIMARY KEY (`FD_Acc_no`),
  ADD KEY `Acc_no` (`Acc_no`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`Loan_Acc_no`),
  ADD KEY `Acc_no` (`Acc_no`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD PRIMARY KEY (`cust_id`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1113;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `fixed_deposits`
--
ALTER TABLE `fixed_deposits`
  MODIFY `FD_Acc_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9019;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `Loan_Acc_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5019;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1035;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Acc_no`) REFERENCES `customers` (`cust_id`);

--
-- Constraints for table `fixed_deposits`
--
ALTER TABLE `fixed_deposits`
  ADD CONSTRAINT `fixed_deposits_ibfk_1` FOREIGN KEY (`Acc_no`) REFERENCES `account` (`Acc_no`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`Acc_no`) REFERENCES `account` (`Acc_no`);

--
-- Constraints for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD CONSTRAINT `user_credentials_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
