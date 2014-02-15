-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2013 at 09:44 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bidtour`
--
CREATE DATABASE IF NOT EXISTS `bidtour` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `bidtour`;

-- --------------------------------------------------------

--
-- Table structure for table `continent`
--

CREATE TABLE IF NOT EXISTS `continent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `display_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `img_id` (`display_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `continent`
--

INSERT INTO `continent` (`id`, `name`, `display_id`) VALUES
(1, 'Africa', 1),
(2, 'Europe', 2),
(3, 'North america', 3),
(4, 'Iran', 4);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `sequence_id` int(11) NOT NULL,
  `url` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=37 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `place_id`, `sequence_id`, `url`) VALUES
(1, 1, 1, 'africa1'),
(2, 2, 1, 'africa2'),
(3, 3, 1, 'africa3'),
(4, 1, 2, 'africa4'),
(5, 2, 2, 'africa5'),
(6, 3, 2, 'africa6'),
(7, 1, 3, 'africa7'),
(8, 2, 3, 'africa8'),
(9, 3, 3, 'africa9'),
(10, 4, 1, 'eu1'),
(11, 5, 1, 'eu2'),
(12, 6, 1, 'eu3'),
(13, 4, 2, 'eu4'),
(14, 5, 2, 'eu5'),
(15, 6, 2, 'eu6'),
(16, 4, 3, 'eu7'),
(17, 5, 3, 'eu8'),
(18, 6, 3, 'eu9'),
(19, 7, 1, 'ca1'),
(20, 8, 1, 'ca2'),
(21, 9, 1, 'ca3'),
(22, 7, 2, 'ca4'),
(23, 8, 2, 'ca5'),
(24, 9, 2, 'ca6'),
(25, 7, 3, 'ca7'),
(26, 8, 3, 'ca8'),
(27, 11, 1, 'iran1'),
(28, 12, 1, 'iran2'),
(29, 13, 1, 'iran3'),
(30, 11, 2, 'iran4'),
(31, 12, 2, 'iran5'),
(32, 13, 2, 'iran6'),
(33, 11, 3, 'iran7'),
(34, 12, 3, 'iran8'),
(35, 13, 3, 'iran9'),
(36, 9, 3, 'ca9');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `continent_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `paypal_url` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `continent_id` (`continent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `continent_id`, `name`, `description`, `price`, `paypal_url`) VALUES
(1, 1, 'Sahara Desert', 'Camels and hot beautiful atmospher. Tanning is natural!', '100.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=africa&amount=100%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(2, 1, 'Kenya Game', 'Have a wild life while you see amazing creatures', '500.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=africa&amount=500%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(3, 1, 'South Africa ', 'Beautiful people beautiful culture. Experience the culture now!', '500.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=africa&amount=500%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(4, 2, 'Paris', 'City of love. It''s all about love and the romantic air.', '400.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=europe&amount=400%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(5, 2, 'Buckingham', 'Monarch, culture, class, formalities, history, all brought to you in this great city of the Queen, princes and princeses', '600.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=europe&amount=600%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(6, 2, 'Italy', 'See one of the most influential people in the world. An opportunities, once in a lifetime. Visit the Vatican city and get your papacy blessings  city.', '600.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=europe&amount=600%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(7, 3, 'Great Niagra falls', 'One of the seveen wonders in the world. Come to niagara it a lasting memory!', '1000.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=north%20america&amount=1000%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(8, 3, 'Mississauga', 'The world winning twin tower 2013. You can get higher than u can imagine, its not a flight view', '1000.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=north%20america&amount=1000%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(9, 3, 'Toronto', 'Yeah! Longest street. Queen of England''s city. Full of life. Home to many stars.', '600.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=north%20america&amount=600%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(11, 4, 'Tehran', 'Persian beauties, ancient Persian culture,\r\nLearn history', '250.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=iran&amount=250%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(12, 4, 'Esfahan', 'Walk brigdes of the ancestors. Sculptors and handicraft', '400.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=iran&amount=400%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted'),
(13, 4, 'Kish', 'Go naked its the beach. Shop forever, good things all the way. Great island with culture ', '400.00', 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&business=BJG3JYHE5QSS4&lc=CA&item_name=iran&amount=400%2e00&currency_code=CAD&button_subtype=products&tax_rate=13%2e000&add=1&bn=PP%2dShopCartBF%3abtn_cart_LG%2egif%3aNonHosted');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
