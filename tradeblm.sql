-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2021 at 01:15 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tradeblm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `firstname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(165) NOT NULL,
  `password` varchar(265) NOT NULL,
  `type` enum('global','partner','moderator','customer_care') NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alert_settings`
--

CREATE TABLE `alert_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email_blm_payment_confirm` tinyint(1) NOT NULL DEFAULT '1',
  `email_account_access` tinyint(1) NOT NULL DEFAULT '0',
  `sms_blm_payment_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `notify_ blm_payment_confirm` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blm_balance`
--

CREATE TABLE `blm_balance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_address` varchar(50) NOT NULL,
  `balance` bigint(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blm_balance`
--

INSERT INTO `blm_balance` (`id`, `user_id`, `account_address`, `balance`, `date_created`) VALUES
(1, 6, 'BDF5-C11B-A4BB-0CE5', 2123, '2019-09-02 13:19:01'),
(2, 1, '5DB8-DE82-C59C-BC80', 9858, '2019-09-02 13:19:01'),
(3, 2, '7A7F-C86B-C784-115D', 4101, '2019-08-28 05:32:49'),
(4, 3, '8ABF-5B67-9214-9B01', 0, '2019-08-28 05:33:12'),
(5, 4, '272C-6AD4-4B46-5605', 0, '2019-08-28 05:33:33'),
(6, 5, '9D87-19D6-F088-1D35', 0, '2019-08-28 05:33:51'),
(7, 7, 'E5D3-6948-5334-8A09', 0, '2019-08-28 05:34:08'),
(8, 8, '129C-63C6-3BB7-0B87', 0, '2019-08-28 05:34:25'),
(9, 9, '3FE0-EC23-CF9F-9C6D', 90, '2019-08-28 05:34:44'),
(10, 10, 'E399-142E-E771-633F', 90, '2019-08-28 05:35:00'),
(11, 11, '6A00-C23E-FB52-47C9', 0, '2019-08-28 05:35:20'),
(12, 12, 'D3C9-CC10-5694-6270', 0, '2019-08-28 05:36:02'),
(13, 13, '092A-6D2C-6F08-16C2', 0, '2019-08-28 06:07:38'),
(14, 14, '5BC9-91AE-83E8-8631', 0, '2020-07-02 11:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `trade_id` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `attachment` varchar(850) NOT NULL,
  `unseen` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `from_user_id`, `to_user_id`, `trade_id`, `message`, `attachment`, `unseen`, `date_created`) VALUES
(1, 2, 1, '', 'Have you make a payment.', '', 0, '2019-07-02 13:44:18'),
(2, 2, 1, '', 'Have you make a payment.', '', 0, '2019-07-02 13:45:04'),
(3, 1, 2, '', 'Just want to do that now.', '', 1, '2019-07-02 16:25:05'),
(8, 2, 1, '', 'Ok! Please make it snapy.', '', 0, '2019-07-03 12:40:47'),
(9, 1, 2, '', 'Sure! I will do..', '', 1, '2019-07-03 12:41:59'),
(10, 2, 1, '', 'Ok..', '', 0, '2019-07-03 12:42:30'),
(11, 6, 2, '', 'Hello', '', 1, '2019-07-03 19:27:09'),
(12, 2, 6, '', 'hi! i can see you have opened a trade with me.', '', 1, '2019-08-21 05:12:38'),
(13, 6, 2, '', 'yeah', '', 1, '2019-07-03 19:30:18'),
(14, 2, 6, '', 'ok! you can make a payment and i will confirm it.', '', 1, '2019-08-21 05:12:38'),
(15, 6, 2, '', 'ok! what is your account number.', '', 1, '2019-07-03 19:33:26'),
(16, 2, 6, '', '3047213476', '', 1, '2019-08-21 05:12:38'),
(17, 9, 1, '', 'hello', '', 1, '2019-07-08 11:17:09'),
(18, 1, 9, '', 'make payment dkdk', '', 0, '2019-07-08 11:18:48'),
(19, 10, 9, '', 'hello', '', 0, '2019-07-08 11:24:54'),
(20, 9, 10, '', 'mdjdjdk', '', 0, '2019-07-08 11:25:35'),
(21, 9, 1, '', 'can i make payment now', '', 1, '2019-07-09 13:50:08'),
(22, 1, 9, '', 'sure, and make it snapy.', '', 0, '2019-07-09 13:51:00'),
(23, 1, 9, '', 'ok', '', 0, '2019-07-27 10:53:30'),
(24, 1, 9, '', 'ghghgh', '11909233065d3efec575609.png', 0, '2019-07-29 14:12:21'),
(25, 1, 9, '', 'ghghgh', '2668818685d3f02033457a.png', 0, '2019-07-29 14:26:11'),
(26, 1, 9, '', 'here is the payment proof', '12102109955d3f04c040e6f.png', 0, '2019-07-29 14:37:52'),
(27, 1, 9, '', 'jdjdjd', '1029450435d3f105bb7af1.png', 0, '2019-07-29 15:27:23'),
(28, 1, 9, '', 'another message', '20192450545d3f108a99f5c.png', 0, '2019-07-29 15:28:10'),
(29, 1, 9, '', 'anothell eoe', '9042669115d3f110d498fe.png', 0, '2019-07-29 15:30:21'),
(30, 1, 9, '', 'just about another message.', '', 0, '2019-07-29 15:32:43'),
(31, 1, 9, '', 'hghghg', '13327189985d3f12fdf3069.png', 0, '2019-07-29 15:38:38'),
(32, 1, 9, '', 'this iskejie eijiej', '6662937245d3f1522bd21c.png', 0, '2019-07-29 15:47:46'),
(33, 1, 9, '', 'thisie eijei wijiw', '', 0, '2019-07-29 15:48:16'),
(34, 1, 9, '', 'thiehisi wijwijeijei iejie', '', 0, '2019-07-29 15:52:35'),
(35, 1, 9, '', 'this eijei ekmeji eme', '', 0, '2019-07-29 15:53:13'),
(36, 1, 9, '', 'hugugu', '', 0, '2019-07-29 16:00:55'),
(37, 9, 1, 'b54c2f375e', 'confirmed', '9645574085d3f19222ab90.png', 1, '2019-07-29 16:04:50'),
(38, 1, 9, 'b54c2f375e', 'this is another message', '', 0, '2019-08-14 14:23:21'),
(39, 1, 9, 'b54c2f375e', 'message again', '', 0, '2019-08-14 14:27:10'),
(40, 1, 9, 'b54c2f375e', 'mess with image', '18631934875d541a707825d.png', 0, '2019-08-14 14:28:02'),
(41, 6, 2, 'f2690e3a09', 'ok', '1498058365d5520c342f59.png', 1, '2019-08-15 09:07:15'),
(42, 6, 2, 'f2690e3a09', 'i have made the payment', '', 1, '2019-08-15 09:31:54'),
(43, 2, 6, 'f2690e3a09', 'i have seen your payment confirmation', '', 1, '2019-08-21 05:12:38'),
(44, 6, 2, 'f2690e3a09', 'ok', '', 1, '2019-08-20 12:13:16'),
(45, 6, 2, 'f2690e3a09', 'thanks', '', 1, '2019-08-21 04:52:20'),
(46, 2, 6, 'f2690e3a09', 'you are welcome', '', 1, '2019-08-21 05:12:38'),
(47, 6, 2, 'f2690e3a09', 'i think something wrong', '', 1, '2019-08-21 06:33:05'),
(48, 6, 2, 'f2690e3a09', 'check this out', '', 1, '2019-08-21 06:36:58'),
(49, 6, 2, 'f2690e3a09', 'yeah', '', 1, '2019-08-21 06:38:56'),
(50, 2, 6, 'f2690e3a09', 'ok', '', 1, '2019-08-21 13:23:44'),
(51, 6, 2, 'f2690e3a09', 'ok again', '', 1, '2019-08-21 13:32:35'),
(52, 6, 2, 'f2690e3a09', 'ok again', '', 1, '2019-08-21 13:33:05'),
(53, 6, 2, 'f2690e3a09', 'ok again', '', 1, '2019-08-21 13:33:13'),
(54, 6, 2, 'f2690e3a09', 'ok again', '', 1, '2019-08-21 13:33:17'),
(55, 2, 6, 'f2690e3a09', 'yeah', '', 1, '2019-08-21 22:13:18'),
(56, 6, 2, 'f2690e3a09', 'see you', '', 1, '2019-08-21 22:31:58'),
(57, 2, 6, 'f2690e3a09', 'ok', '', 1, '2019-08-21 22:34:53'),
(58, 2, 6, 'f2690e3a09', 'yeah', '17938830945d5dba2fb9cf1.png', 1, '2019-08-21 22:40:00'),
(59, 6, 2, 'f2690e3a09', 'yeah testing', '', 1, '2019-08-21 22:48:48'),
(60, 6, 2, 'f2690e3a09', 'yeah testing', '', 1, '2019-08-21 22:48:54'),
(61, 2, 6, 'f2690e3a09', 'hello', '', 1, '2019-08-22 14:51:38'),
(62, 2, 6, 'f2690e3a09', 'check this out', '9146269105d5e9e2a2f3d2.png', 1, '2019-08-22 14:52:42'),
(63, 2, 6, 'f2690e3a09', 'check this out', '15990974365d5e9e2b00af5.png', 1, '2019-08-22 14:52:43'),
(64, 2, 6, 'f2690e3a09', 'message without image', '', 1, '2019-08-22 15:00:28'),
(65, 2, 6, 'f2690e3a09', 'Hello', '', 1, '2019-08-22 16:16:09'),
(66, 2, 6, 'f2690e3a09', 'sksksk', '', 1, '2019-08-22 16:21:00'),
(67, 2, 6, 'f2690e3a09', 'hghg hghgh', '15717201535d5eb40e66566.png', 1, '2019-08-22 16:26:07'),
(68, 6, 2, 'f2690e3a09', 'yeah', '', 1, '2019-08-22 16:33:30'),
(69, 2, 6, 'f2690e3a09', 'skeie ieie ieie', '', 1, '2019-08-23 06:21:30'),
(70, 6, 2, 'f2690e3a09', 'yeah yeah', '', 0, '2019-08-23 06:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `dispute`
--

CREATE TABLE `dispute` (
  `id` int(11) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `editorials`
--

CREATE TABLE `editorials` (
  `id` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `editorials`
--

INSERT INTO `editorials` (`id`, `description`, `content`, `date_updated`) VALUES
(1, 'terms-and-conditions', '<p>This is the terms and condition content. This updated now. updated now</p>', '2019-09-26 11:54:39'),
(2, 'privacy-and-policy', '<p>Founded in May of 2019, TradeBLM is a digital currency wallet and platform where traders and consumers (referrals) can transact with new digital currencies, BLM. We\'re based in Moscow, Russia..</p> 										<p>BLM is the recent discovered currency that make traders rich. The BLM network is made up of thousands of computers run by individuals all over the world..</p>', '2019-09-25 14:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `logged_in`
--

CREATE TABLE `logged_in` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logged_in`
--

INSERT INTO `logged_in` (`id`, `user_id`, `date_created`) VALUES
(86, 10, '2019-07-08 11:23:19'),
(91, 9, '2019-07-09 14:10:59'),
(101, 9, '2019-07-29 16:03:29'),
(103, 11, '2019-08-09 16:24:05'),
(168, 2, '2019-09-03 15:28:37'),
(174, 2, '2019-09-03 15:43:35'),
(184, 6, '2019-09-25 17:51:23'),
(185, 6, '2019-09-30 11:31:32'),
(188, 2, '2020-07-02 12:01:29'),
(189, 6, '2021-01-09 12:50:08'),
(190, 6, '2021-02-01 10:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('payment_confirm','payment_verify','open_trade','blm_transfer') NOT NULL,
  `notification` text NOT NULL,
  `url` varchar(256) NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `notification`, `url`, `seen`, `date_created`) VALUES
(1, 2, 'payment_confirm', '<strong>lolaji</strong> have confirmed their payment for the trade <strong>f2690e3a09</strong>, verify the payment now.', 'http://localhost/tradeblm/user/trade_room/?tid=f2690e3a09', 1, '2019-08-19 06:01:16'),
(2, 2, 'payment_confirm', '<strong>lolaji</strong> have confirmed that he has payed for the trade <strong>f2690e3a09</strong>, verify the payment now.', 'http://localhost/tradeblm/user/trade_room/?tid=f2690e3a09', 1, '2019-08-19 06:01:16'),
(3, 2, 'payment_confirm', '<strong>lolaji</strong> have confirmed that he has payed for the trade <strong>f2690e3a09</strong>, verify the payment now.', 'http://localhost/tradeblm/user/trade_room/?tid=f2690e3a09', 1, '2019-08-19 06:01:16'),
(4, 1, 'blm_transfer', 'You have successfully transfered 200 BLM to lolaji.', '', 1, '2019-09-03 13:31:41'),
(5, 6, 'blm_transfer', 'You have received 200 BLM fromeazy', '', 1, '2019-09-02 12:57:15'),
(6, 1, 'blm_transfer', 'You have successfully transfered 200 BLM to lolaji.', '', 1, '2019-09-03 13:31:41'),
(7, 6, 'blm_transfer', 'You have received 200 BLM fromeazy', '', 1, '2019-09-02 12:57:15'),
(8, 1, 'blm_transfer', 'You have successfully transfered 200 BLM to lolaji.', '', 1, '2019-09-03 13:31:41'),
(9, 6, 'blm_transfer', 'You have received 200 BLM fromeazy', '', 1, '2019-09-02 13:04:16'),
(10, 1, 'blm_transfer', 'You have successfully transfered 200 BLM to lolaji.', '', 1, '2019-09-03 13:31:41'),
(11, 6, 'blm_transfer', 'You have received 200 BLM fromeazy', '', 1, '2019-09-02 13:18:06'),
(12, 1, 'blm_transfer', 'You have successfully transfered 1000 BLM to lolaji.', '', 1, '2019-09-03 13:31:41'),
(13, 6, 'blm_transfer', 'You have received 1000 BLM fromeazy', '', 1, '2019-09-02 13:18:06'),
(14, 1, 'blm_transfer', 'You have successfully transfered 200 BLM to lolaji.', '', 1, '2019-09-03 13:31:41'),
(15, 6, 'blm_transfer', 'You have received 200 BLM from eazy', '', 1, '2019-09-02 13:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `referral_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `user_id`, `referral_id`, `date_created`) VALUES
(1, 1, 4, '2019-06-26 11:26:34'),
(2, 1, 5, '2019-06-26 13:53:37'),
(3, 2, 6, '2019-06-30 17:35:15'),
(4, 2, 7, '2019-07-04 16:26:04'),
(5, 1, 2, '2019-07-06 12:31:00'),
(6, 1, 8, '2019-07-08 08:35:46'),
(7, 1, 9, '2019-07-08 11:13:40'),
(8, 9, 10, '2019-07-08 11:22:35'),
(9, 6, 11, '2019-08-09 16:12:18'),
(10, 2, 12, '2019-08-21 13:43:47'),
(11, 2, 13, '2019-08-28 06:07:38'),
(12, 2, 14, '2020-07-02 11:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `blm_amount` decimal(10,2) NOT NULL,
  `bid_amount` decimal(10,2) NOT NULL,
  `mode` enum('open','payed','completed','dispute','canceled') NOT NULL DEFAULT 'open',
  `trade_id` varchar(50) NOT NULL,
  `payment_method` enum('bitcoin','bank_transfer','cash') NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trades`
--

INSERT INTO `trades` (`id`, `buyer_id`, `seller_id`, `blm_amount`, `bid_amount`, `mode`, `trade_id`, `payment_method`, `date_updated`, `date_created`) VALUES
(2, 1, 2, '180.00', '100.00', 'completed', '4f19fb9387', 'bank_transfer', '2019-07-03 17:46:09', '2019-06-18 00:00:00'),
(3, 6, 2, '18.00', '10.00', 'payed', 'f2690e3a09', 'bank_transfer', '2019-08-15 10:13:24', '2019-07-03 00:00:00'),
(4, 2, 1, '421.20', '234.00', 'completed', 'd7710b307d', 'bank_transfer', '2019-07-08 09:12:23', '2019-07-06 00:00:00'),
(5, 9, 1, '180.00', '100.00', 'completed', '2f58d557eb', 'bank_transfer', '2019-07-08 11:19:25', '2019-07-08 00:00:00'),
(6, 10, 9, '90.00', '50.00', 'completed', '62dba2d393', 'bank_transfer', '2019-07-08 11:26:27', '2019-07-08 00:00:00'),
(7, 9, 1, '90.00', '50.00', 'open', 'b54c2f375e', 'bitcoin', '2019-07-08 11:31:48', '2019-07-08 00:00:00'),
(8, 2, 1, '180.00', '100.00', 'completed', '6af28ccc7b', 'bank_transfer', '2019-08-15 09:12:59', '2019-07-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `unread_chat`
--

CREATE TABLE `unread_chat` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` enum('trader','admin','partner') NOT NULL DEFAULT 'trader',
  `firstname` varchar(256) NOT NULL,
  `lastname` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `username` varchar(100) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `state` varchar(150) NOT NULL,
  `country` varchar(150) NOT NULL,
  `bio` text NOT NULL,
  `pic_path` varchar(150) NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `firstname`, `lastname`, `email`, `password`, `username`, `gender`, `state`, `country`, `bio`, `pic_path`, `activated`, `date_updated`, `date_created`) VALUES
(1, 'admin', 'easy', 'motunrayo', 'easy@gmail.com', 'fce177e35613a2b7fab0e4a5b741cf08b425750b846166d69c6d8216172bbe9d', 'eazy', 'M', 'ibadan', 'Nigeria', '', '', 1, '2019-08-28 06:18:48', '2019-06-10 00:00:00'),
(2, 'trader', 'Slim', 'Akinyemi', 'slimj@gmail.com', 'd0c32260487c84f871c7054d6c7f94fb9343daa78f61cc7a5dd7b1887faea5b9', 'slimj', 'M', '', '', 'This is my bio', '', 1, '2019-08-28 06:20:11', '0000-00-00 00:00:00'),
(3, 'trader', 'Ajibola', 'Salami', 'aji.lolade@gmail.com', '895564ed377e69cfd361c91f9cea1e823081944ef307d4b62ab14bd3342de618', 'aji', 'M', '', '', 'This is my bio', '', 1, '2020-07-02 10:58:35', '0000-00-00 00:00:00'),
(4, 'trader', '', '', 'akin@gmail.com', '895564ed377e69cfd361c91f9cea1e823081944ef307d4b62ab14bd3342de618', 'akin', 'M', '', '', '', '', 0, '2019-08-28 06:21:19', '0000-00-00 00:00:00'),
(5, 'trader', '', '', 'akande@gmail.com', '17901cc0a8ab4c2750415e9c6db6f134360817ffc92da61b7828f14c7d782d42', 'akande', 'M', '', '', '', '', 0, '2019-08-28 06:21:59', '2019-06-26 00:00:00'),
(6, 'partner', '', '', 'ayo.lolade@gmail.com', '895564ed377e69cfd361c91f9cea1e823081944ef307d4b62ab14bd3342de618', 'lolaji', 'M', '', '', '', '', 1, '2019-09-03 13:33:52', '2019-06-30 00:00:00'),
(7, 'trader', '', '', 'ayobami.lolade@gmail.com', '895564ed377e69cfd361c91f9cea1e823081944ef307d4b62ab14bd3342de618', 'ajibola', 'M', '', '', '', '', 0, '2019-08-28 06:21:33', '2019-07-04 00:00:00'),
(8, 'trader', '', '', 'ayo@gmail.com', 'f089c555d50b8a3672ab77bd4e3f177becded8c263b52c0bb6fb2e5282a728f5', 'ayo', 'M', '', '', '', '', 0, '2019-08-28 06:22:21', '2019-07-08 00:00:00'),
(9, 'trader', '', '', 'lola@gmail.,com', '47acf82a48cfa5c340ea536cdd66c75ef85eb8d3fcff468fc7c8abcaceb15ed0', 'lola', 'M', '', '', '', '', 0, '2019-08-28 06:22:46', '2019-07-08 00:00:00'),
(10, 'trader', '', '', 'josh@gmail.com', '386a85d8c88778b00b1355608363c7e3078857f3e9633cfd0802d3bf1c0b5b83', 'josh', 'M', '', '', '', '', 0, '2019-08-28 06:23:15', '2019-07-08 00:00:00'),
(11, 'trader', '', '', 'aji.lolade@yahoo.com', '895564ed377e69cfd361c91f9cea1e823081944ef307d4b62ab14bd3342de618', 'jison', 'M', '', '', '', '', 1, '2019-08-28 06:23:35', '2019-08-09 00:00:00'),
(12, 'trader', '', '', 'ak@gmail.com', '7f093592aebbb47767b5655699cdab8c86c4b24f5c93e3b22a3c2538856e9bf1', 'ak', 'M', '', '', '', '', 0, '2019-08-28 06:23:57', '2019-08-21 00:00:00'),
(13, 'trader', '', '', 'joel@gmail.com', 'a6761ccff1191f3ee53acada4f7965241538511ef6eb52d37974507ab5a9023e', 'joel', 'M', '', '', '', '', 1, '2019-08-28 06:09:43', '2019-08-28 00:00:00'),
(14, 'trader', '', '', 'ecbusiness.team@gmail.com', 'bece0c8d222f5e0571644331941764fc99224643f842e8846f14f491b19c568e', 'ecbusiness', 'M', '', '', '', '', 1, '2020-07-02 11:35:07', '2020-07-02 13:34:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alert_settings`
--
ALTER TABLE `alert_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blm_balance`
--
ALTER TABLE `blm_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `account_address` (`account_address`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `unseen` (`unseen`),
  ADD KEY `trade_id` (`trade_id`);

--
-- Indexes for table `dispute`
--
ALTER TABLE `dispute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `editorials`
--
ALTER TABLE `editorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logged_in`
--
ALTER TABLE `logged_in`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `seen` (`seen`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `referral_id` (`referral_id`);

--
-- Indexes for table `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `trade_id` (`trade_id`);

--
-- Indexes for table `unread_chat`
--
ALTER TABLE `unread_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `password` (`password`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alert_settings`
--
ALTER TABLE `alert_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blm_balance`
--
ALTER TABLE `blm_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `dispute`
--
ALTER TABLE `dispute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `editorials`
--
ALTER TABLE `editorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logged_in`
--
ALTER TABLE `logged_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `trades`
--
ALTER TABLE `trades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `unread_chat`
--
ALTER TABLE `unread_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
