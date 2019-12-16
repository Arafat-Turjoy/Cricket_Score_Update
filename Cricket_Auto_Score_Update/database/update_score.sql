-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 05, 2017 at 04:44 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `update_score`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(128) DEFAULT NULL,
  `isPresent` int(11) DEFAULT NULL,
  `isActive` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `firstname`, `username`, `password`, `email`, `role`, `isPresent`, `isActive`) VALUES
(11, 'Mohammad Arafat Ullah', 'Arafat Turjoy', '123456', 'arafat.ngc@gmail.com', 'super_admin', 1, 0),
(12, 'Md: Tanvir Hossain', 'Tanvir Pallab', '12345678', 'th4pallab@gmail.com', 'admin', 1, 0),
(13, 'Md. Jannatul Nayeem', 'Nayeem', '1234', 'jannatulnayeem423@gmail.com', 'admin', 1, 0),
(14, 'Pritam Chowdhury', 'pritam', '12345', 'Ppcctulan@gmail.com', 'admin', 1, 0),
(17, 'Md. Golam Sarwar', 'Sarwar Sojol', '123', 'sojolewu6@gmail.com', 'admin', 1, 1),
(18, 'Safa Zaman', 'Safa', '123', 'safazaman@gmail.com', 'admin', 1, 0),
(19, 'Arthy Anjum', 'admin', '123', 'arthy.anjum@gmail.com', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_atch`
--

DROP TABLE IF EXISTS `m_atch`;
CREATE TABLE IF NOT EXISTS `m_atch` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_Aid` int(11) DEFAULT NULL,
  `team_Bid` int(11) DEFAULT NULL,
  `team_Aname` varchar(128) DEFAULT NULL,
  `team_Bname` varchar(128) DEFAULT NULL,
  `admin_name` varchar(128) DEFAULT NULL,
  `toss` int(11) DEFAULT NULL,
  `overs` int(11) NOT NULL,
  `isActive` int(11) DEFAULT '0',
  `isSelect` int(11) DEFAULT '0',
  `adminid` int(11) DEFAULT NULL,
  `isFinished` int(11) DEFAULT '0',
  PRIMARY KEY (`match_id`),
  KEY `team_Aid` (`team_Aid`),
  KEY `team_Bid` (`team_Bid`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_atch`
--



-- --------------------------------------------------------

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(30) DEFAULT NULL,
  `tem_id` int(11) DEFAULT NULL,
  `isSelect` int(11) DEFAULT '0',
  PRIMARY KEY (`player_id`),
  KEY `tem_id` (`tem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--



-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `bat_run` int(11) DEFAULT '0',
  `played_ball` int(11) DEFAULT '0',
  `hitted_fours` int(11) DEFAULT '0',
  `hitted_sixes` int(11) DEFAULT '0',
  `bowlruns` int(11) DEFAULT '0',
  `bowled_overs` int(11) DEFAULT '0',
  `wicket` int(11) DEFAULT '0',
  `extra` int(11) DEFAULT '0',
  `out_type` varchar(255) DEFAULT NULL,
  `stricking_role` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL,
  `toss` int(11) DEFAULT NULL,
  `extra_wicket` int(11) DEFAULT '0',
  `noball` int(11) DEFAULT '0',
  `wideball` int(11) DEFAULT '0',
  PRIMARY KEY (`status_id`),
  KEY `match_id` (`match_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--


-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(30) DEFAULT NULL,
  `manager_name` varchar(30) NOT NULL,
  `coach_name` varchar(30) NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--




--
-- Constraints for dumped tables
--

--
-- Constraints for table `m_atch`
--
ALTER TABLE `m_atch`
  ADD CONSTRAINT `m_atch_ibfk_1` FOREIGN KEY (`team_Aid`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `m_atch_ibfk_2` FOREIGN KEY (`team_Bid`) REFERENCES `team` (`team_id`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`tem_id`) REFERENCES `team` (`team_id`);

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `m_atch` (`match_id`),
  ADD CONSTRAINT `status_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
