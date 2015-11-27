-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2015 at 04:44 PM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
    NO SQL
BEGIN

SET @query = NULL;
SELECT GROUP_CONCAT(CONCAT('MAX(CASE WHEN col = "', col, '" THEN value END) AS `', name, '`')) INTO @query 
FROM (SELECT u.phone_type col, pt.type_name name FROM `users` u INNER JOIN `phone_type` pt ON u.phone_type = pt.phone_type) d;
-- SELECT @query;

SET @query = CONCAT('SELECT id, user_id, ', @query, ' 
	FROM (SELECT id, user_id, phone_type col, phone_num value FROM users) u GROUP BY user_id');
-- SELECT @query;				  

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `body`, `title`, `gender`) VALUES
(3, 'DBMS stands for DataBase ...', 'MySQL Tutorial', 'F'),
(4, 'After you went through a ...', 'How To Use MySQL Well', 'M'),
(5, 'In this tutorial we will show ...', 'Optimizing MySQL', 'F'),
(6, '1. Never run mysqld as root. 2. ...', '1001 MySQL Tricks', 'M'),
(7, 'In the following database comparison ...', 'MySQL vs. YourSQL', 'F'),
(8, 'When configured properly, MySQL ...', 'MySQL Security', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EmployeeID` int(11) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `URL` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `Salary`, `URL`) VALUES
(3, 200, 'tinkesh kumar abc.com'),
(4, 800, 'tinkesh kumar abc.com'),
(7, 450, 'tinkesh kumar abc.com'),
(NULL, 450, 'tinkesh kumar abc.com'),
(NULL, 450, 'tinkesh kumar abc.com'),
(NULL, 10000, 'tinkesh kumar abc.com'),
(NULL, 5000, 'tinkesh kumar abc.com');

-- --------------------------------------------------------

--
-- Table structure for table `group_c`
--

CREATE TABLE IF NOT EXISTS `group_c` (
  `parent_id` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_c`
--

INSERT INTO `group_c` (`parent_id`, `child_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(1, 4),
(2, 6),
(3, 1),
(3, 2),
(4, 1),
(4, 1),
(1, 1),
(5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phone_type`
--

CREATE TABLE IF NOT EXISTS `phone_type` (
  `phone_type` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phone_type`
--

INSERT INTO `phone_type` (`phone_type`, `type_name`) VALUES
(1, 'home'),
(2, 'office'),
(3, 'corporate'),
(4, 'extra');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`) VALUES
(1, 'Shoes'),
(2, 'Pants'),
(3, 'Shirt');

-- --------------------------------------------------------

--
-- Table structure for table `reps`
--

CREATE TABLE IF NOT EXISTS `reps` (
  `rep_id` int(11) NOT NULL,
  `rep_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reps`
--

INSERT INTO `reps` (`rep_id`, `rep_name`) VALUES
(1, 'John'),
(2, 'Sally'),
(3, 'Joe'),
(4, 'Bob');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `prod_id` int(11) NOT NULL,
  `rep_id` int(11) NOT NULL,
  `sale_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`prod_id`, `rep_id`, `sale_date`, `quantity`) VALUES
(1, 1, '2013-05-16 00:00:00', 20),
(1, 1, '2013-06-19 00:00:00', 2),
(1, 2, '2013-05-01 00:00:00', 89),
(1, 3, '2013-01-29 00:00:00', 19),
(2, 1, '2013-07-03 00:00:00', 5),
(2, 2, '2013-02-14 00:00:00', 23),
(2, 3, '2013-04-18 00:00:00', 1),
(2, 3, '2013-07-22 00:00:00', 69),
(2, 3, '2013-08-03 00:00:00', 78),
(3, 1, '2013-08-22 00:00:00', 27),
(3, 2, '2013-01-07 00:00:00', 150),
(3, 2, '2013-06-27 00:00:00', 500),
(3, 3, '2013-03-06 00:00:00', 13);

-- --------------------------------------------------------

--
-- Table structure for table `self`
--

CREATE TABLE IF NOT EXISTS `self` (
  `id` int(11) NOT NULL,
  `Name` varchar(55) NOT NULL,
  `aid` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `self`
--

INSERT INTO `self` (`id`, `Name`, `aid`) VALUES
(1, 'tinkesh', 0),
(2, 'ankit', 0),
(3, 'Rizban', 1),
(4, 'Shila', 1),
(5, 'Amir', 2),
(6, 'Sanjeet', 2),
(7, 'Sanjeet', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL,
  `marks` int(10) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `marks`, `student_id`, `subject`) VALUES
(2, 58, 1, 'Javascript'),
(3, 45, 1, 'jQuery'),
(4, 58, 1, 'PHP'),
(5, 65, 2, 'Javascript'),
(6, 59, 2, 'PHP'),
(7, 71, 2, 'jQuery');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone_type` int(11) NOT NULL,
  `phone_num` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `phone_type`, `phone_num`) VALUES
(1, 123, 1, '8506859190'),
(2, 123, 2, '2323232323'),
(3, 123, 3, '6578789898'),
(4, 123, 4, '9999999999');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD FULLTEXT KEY `body` (`body`,`title`);

--
-- Indexes for table `phone_type`
--
ALTER TABLE `phone_type`
  ADD PRIMARY KEY (`phone_type`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `reps`
--
ALTER TABLE `reps`
  ADD PRIMARY KEY (`rep_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`prod_id`,`rep_id`,`sale_date`),
  ADD KEY `rep_id` (`rep_id`);

--
-- Indexes for table `self`
--
ALTER TABLE `self`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `phone_type`
--
ALTER TABLE `phone_type`
  MODIFY `phone_type` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `self`
--
ALTER TABLE `self`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`rep_id`) REFERENCES `reps` (`rep_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
