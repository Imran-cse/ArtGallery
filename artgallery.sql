-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2017 at 09:38 PM
-- Server version: 5.7.11
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artgallery`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getImage` ()  NO SQL
SELECT art.id,art.image FROM art$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserInfoByUId` (IN `uid` VARCHAR(128))  NO SQL
SELECT users.Email,users.PhoneNumber,users.sex,users.Address,users.birthdate FROM users WHERE users.Id=uid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertArtByArtistId` (IN `cat` TEXT, IN `image` VARBINARY(255), IN `creationDate` DATE, IN `creationPlace` TEXT, IN `price` DOUBLE, IN `artistid` VARCHAR(128), IN `name` VARCHAR(255))  NO SQL
INSERT INTO art VALUES(null, artistId, name, cat, image, creationDate, creationPlace, price)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewImage` (IN `imageId` INT(11))  NO SQL
SELECT art.name, art.catagory, art.image, art.creationDate, art.creationPlace, art.price FROM art WHERE art.id=imageId$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `art`
--

CREATE TABLE `art` (
  `id` int(11) NOT NULL,
  `artistId` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `catagory` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `creationDate` date NOT NULL,
  `creationPlace` text NOT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `art`
--

INSERT INTO `art` (`id`, `artistId`, `name`, `catagory`, `image`, `creationDate`, `creationPlace`, `price`) VALUES
(5, 'b74ed4ce-f09d-4180-bf5f-e527ccf55548', 'paint', '17547340_945103195592213_1585867060_o.jpg', '~/UploadedImages/17547340_945103195592213_1585867060_o.jpg', '2017-03-27', 'Khulna', 200),
(6, 'b74ed4ce-f09d-4180-bf5f-e527ccf55548', 'Flower', '17549006_945103002258899_897194909_o.jpg', '~/UploadedImages/17549006_945103002258899_897194909_o.jpg', '2017-03-23', 'Khulna', 100),
(7, 'b74ed4ce-f09d-4180-bf5f-e527ccf55548', 'paint', '8d6cb3ca992d0e03a73d78a349f36267.jpg', '~/UploadedImages/8d6cb3ca992d0e03a73d78a349f36267.jpg', '2015-03-03', 'Khulna', 115),
(8, 'b74ed4ce-f09d-4180-bf5f-e527ccf55548', 'paint', '17572019_945103088925557_1101435968_o.jpg', '~/UploadedImages/17572019_945103088925557_1101435968_o.jpg', '2017-03-31', 'Khulna', 1000),
(9, 'b74ed4ce-f09d-4180-bf5f-e527ccf55548', 'paint', 'c27bfbcc842a9125be8b590c531e5b7e.jpg', '~/UploadedImages/c27bfbcc842a9125be8b590c531e5b7e.jpg', '2015-03-03', 'Khulna', 2000),
(10, 'b74ed4ce-f09d-4180-bf5f-e527ccf55548', 'historical', 'maxresdefault.jpg', '~/UploadedImages/maxresdefault.jpg', '1886-06-03', 'Italy', 5000000),
(11, 'b74ed4ce-f09d-4180-bf5f-e527ccf55548', 'Art-Show.jpg', 'art', '~/UploadedImages/Art-Show.jpg', '2015-06-04', 'Khulna', 200);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` varchar(11) NOT NULL,
  `userId` varchar(128) NOT NULL,
  `income` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--

CREATE TABLE `auction` (
  `id` int(11) NOT NULL,
  `artId` int(11) NOT NULL,
  `maxBid` double NOT NULL,
  `userId` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `userId` varchar(128) NOT NULL,
  `expenditure` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `artId` int(11) NOT NULL,
  `userId` varchar(128) NOT NULL,
  `ratingNo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Id` varchar(128) NOT NULL,
  `Name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Id`, `Name`) VALUES
('38c00717-a0b0-4551-b942-caad03af9b6a', 'Client'),
('97df8a68-8d1d-4b75-b544-175a0909dbe6', 'Admin'),
('b487bb27-68da-408f-b885-b210a52ba9f3', 'Artist');

-- --------------------------------------------------------

--
-- Table structure for table `userclaims`
--

CREATE TABLE `userclaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(128) NOT NULL,
  `ClaimType` longtext NOT NULL,
  `ClaimValue` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlogins`
--

CREATE TABLE `userlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `UserId` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `UserId` varchar(128) NOT NULL,
  `RoleId` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`UserId`, `RoleId`) VALUES
('7dd9577c-035e-4137-8518-570c2327f78c', '97df8a68-8d1d-4b75-b544-175a0909dbe6'),
('b74ed4ce-f09d-4180-bf5f-e527ccf55548', 'b487bb27-68da-408f-b885-b210a52ba9f3');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` varchar(128) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext NOT NULL,
  `SecurityStamp` longtext NOT NULL,
  `PhoneNumber` longtext NOT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEndDateUtc` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `sex` text NOT NULL,
  `Address` text NOT NULL,
  `birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `UserName`, `FirstName`, `LastName`, `Email`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEndDateUtc`, `LockoutEnabled`, `AccessFailedCount`, `sex`, `Address`, `birthdate`) VALUES
('7dd9577c-035e-4137-8518-570c2327f78c', 'imran', 'Imran', 'Hossain', 'imran@gmail.com', 0, 'AK5aXYDpsJD4DZAV445kEa4SzlpB8BZFf6FvWlAM2WxaOzpqZXrRpGUbgEp125Zo+Q==', '56182ee4-0b06-42bd-9a7f-03e89fa4e554', '01681717471', 0, 0, '2017-03-27 19:39:32', 0, 0, 'M', 'Khulna', '1996-10-21'),
('b74ed4ce-f09d-4180-bf5f-e527ccf55548', 'pranta', 'Pranta', 'Protik', 'pranto@pothik.com', 0, 'AEvN97v1D9zKcC9qzPCTl0ZqLbMpWYB3h+9a1jzMwnp0BnNE6WIM5ox5G4Ukf9HIGA==', '56f6ace4-30a4-46bd-83c7-a227a3b58ed2', '01812378716', 0, 0, '2017-03-27 19:34:47', 0, 0, 'M', 'Khulna', '1997-04-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `art`
--
ALTER TABLE `art`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artistId` (`artistId`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `userId_2` (`userId`);

--
-- Indexes for table `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artId` (`artId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artId` (`artId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `userclaims`
--
ALTER TABLE `userclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `userlogins`
--
ALTER TABLE `userlogins`
  ADD UNIQUE KEY `LoginProvider` (`LoginProvider`),
  ADD UNIQUE KEY `ProviderKey` (`ProviderKey`),
  ADD UNIQUE KEY `UserId` (`UserId`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`RoleId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `art`
--
ALTER TABLE `art`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `auction`
--
ALTER TABLE `auction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `userclaims`
--
ALTER TABLE `userclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `art`
--
ALTER TABLE `art`
  ADD CONSTRAINT `art_ibfk_1` FOREIGN KEY (`artistId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `artist`
--
ALTER TABLE `artist`
  ADD CONSTRAINT `artist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`artId`) REFERENCES `art` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`artId`) REFERENCES `art` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userclaims`
--
ALTER TABLE `userclaims`
  ADD CONSTRAINT `userclaims_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userlogins`
--
ALTER TABLE `userlogins`
  ADD CONSTRAINT `userlogins_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
