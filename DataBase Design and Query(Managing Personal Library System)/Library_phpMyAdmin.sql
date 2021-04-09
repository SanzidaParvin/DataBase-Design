-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2017 at 07:11 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_list`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `AuthorID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`AuthorID`, `FirstName`, `LastName`) VALUES
(1, 'Humayun', 'Ahmed'),
(2, 'Sharatchandra', 'Chattopaddhay'),
(3, 'Muhammed', 'Zafar Iqbal'),
(4, 'Samaresh', 'Majumder'),
(5, 'Rakib', 'Hasan'),
(6, 'Taslima', 'Nasrin'),
(7, 'Jahanara', 'Imam'),
(8, 'Anisul', 'Haque'),
(9, 'Maxim', 'Gorky');

-- --------------------------------------------------------

--
-- Table structure for table `booklist`
--

CREATE TABLE `booklist` (
  `BookID` int(11) NOT NULL,
  `BookTitle` varchar(100) NOT NULL,
  `AuthorID` int(11) NOT NULL,
  `BookType` varchar(50) NOT NULL,
  `Price_in_BDT` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL,
  `OwnershipID` int(11) NOT NULL,
  `PublisherID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booklist`
--

INSERT INTO `booklist` (`BookID`, `BookTitle`, `AuthorID`, `BookType`, `Price_in_BDT`, `VersionID`, `OwnershipID`, `PublisherID`) VALUES
(1, 'Aguner poroshmoni', 1, 'Novel', 200, 1, 1, 3),
(2, 'Aaj Dupure Tomar Nimantron', 1, 'Story', 200, 2, 2, 3),
(3, 'Chayabithi', 1, 'Novel', 200, 1, 1, 9),
(4, 'Fiha Somikoron', 1, 'Science Fiction Novel', 150, 1, 1, 1),
(5, 'Himu', 1, 'Novel', 150, 1, 1, 3),
(6, 'Himu Remand-E', 1, 'Novel', 150, 1, 1, 3),
(7, 'Jochna O Jononir Golpo', 1, 'Novel', 550, 1, 1, 3),
(8, 'Megher Chaya', 1, 'Novel', 150, 1, 1, 11),
(9, 'Misir Alir Amimangsito Rahasya', 1, 'Science Fiction (Series)', 250, 1, 2, 3),
(10, 'Rupar Palonko', 1, 'Novel', 200, 1, 1, 3),
(11, 'Bamuner Meye', 2, 'Novel', 200, 1, 1, 2),
(12, 'Bipradas', 2, 'Novel', 150, 1, 1, 12),
(13, 'Datta', 2, 'Novel', 300, 1, 1, 12),
(14, 'Dena Paona', 2, 'Novel', 215, 1, 1, 2),
(15, 'Palli Samaj', 2, 'Novel', 175, 2, 1, 2),
(16, 'Parineeta', 2, 'Novel', 200, 1, 1, 12),
(17, 'Mahesh', 2, 'Story', 250, 1, 1, 2),
(18, 'Mejdidi', 2, 'Story', 300, 1, 1, 12),
(19, 'Pather Dabi', 2, 'Novel', 150, 1, 1, 12),
(20, 'Animan', 3, 'Science Fiction', 225, 1, 1, 15),
(21, 'Adh Dozon School', 3, 'Juvenile Novel', 125, 1, 1, 14),
(22, 'Amar Bondhu Rasherd', 3, 'Juvenile Novel', 150, 1, 2, 6),
(23, 'Cromium Oronno', 3, 'Science Fiction', 140, 1, 1, 15),
(24, 'Copotronic Shukh-Dukkho', 3, 'Science Fiction', 100, 1, 1, 5),
(25, 'Ekjon Otumanobi', 3, 'Science Fiction', 100, 2, 1, 15),
(26, 'Eron', 3, 'Science Fiction', 140, 1, 1, 15),
(27, 'Hat Kata Robin', 3, 'Juvenile Novel', 160, 1, 1, 8),
(28, 'Meku Kahini', 3, 'Story', 160, 1, 1, 4),
(29, 'Meyetir Nam Narina', 3, 'Science Fiction', 200, 1, 1, 9),
(30, 'Pri', 3, 'Science Fiction', 120, 1, 1, 15),
(31, 'Uttaradhikar', 4, 'Novel', 350, 1, 1, 2),
(32, 'Kaalbela', 4, 'Novel', 350, 1, 1, 2),
(33, 'Kalpurush', 4, 'Novel', 350, 1, 1, 2),
(34, 'Shatkahon', 4, 'Novel', 500, 1, 1, 2),
(35, 'Gorvodharini', 4, 'Novel', 630, 1, 1, 2),
(36, 'Aat Kuthuri Noy Dorja', 4, 'Novel', 500, 1, 1, 2),
(37, 'Tin Goyenda', 5, 'Juvenile Detective', 75, 1, 1, 13),
(38, 'Rupali Makorsha', 5, 'Juvenile Detective', 75, 1, 3, 13),
(39, 'Momee', 5, 'Juvenile Detective', 75, 1, 1, 13),
(40, 'Rotnodano', 5, 'Juvenile Detective', 75, 2, 1, 13),
(41, 'Roktochokkhu', 5, 'Juvenile Detective', 75, 2, 3, 13),
(42, 'Jolo Doshyur Dip 1,2', 5, 'Juvenile Detective', 75, 2, 3, 13),
(43, 'Mukto Shikary', 5, 'Juvenile Detective', 75, 2, 1, 13),
(44, 'Kakatua Rohossho', 5, 'Juvenile Detective', 75, 1, 1, 13),
(45, 'Bhuter Hashi', 5, 'Juvenile Detective', 75, 1, 1, 13),
(46, 'Vishon Arunno 1 & 2', 5, 'Juvenile Detective', 75, 1, 1, 13),
(47, 'Guhamanob', 5, 'Juvenile Detective', 75, 1, 1, 13),
(48, 'Purono Shotru', 5, 'Juvenile Detective', 75, 1, 1, 13),
(49, 'Dhakay Tin Goyenda', 5, 'Juvenile Detective', 75, 1, 1, 13),
(50, 'Shingher Gorjon', 5, 'Juvenile Detective', 75, 1, 1, 13),
(51, 'Phera', 6, 'Novel', 200, 1, 1, 16),
(52, 'Nirbasan', 6, 'Autobiography', 250, 1, 3, 10),
(53, 'Ekattorer Dingulee', 7, 'Liberation War Memoir', 300, 1, 2, 7),
(54, 'Maa', 8, 'Liberation War Memoir', 300, 1, 3, 15),
(55, 'Mother', 9, 'Novel', 500, 3, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `borrowedbooklist`
--

CREATE TABLE `borrowedbooklist` (
  `BorrowedID` int(11) NOT NULL,
  `BookTitle` varchar(100) NOT NULL,
  `PersonName` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `OwnershipID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrowedbooklist`
--

INSERT INTO `borrowedbooklist` (`BorrowedID`, `BookTitle`, `PersonName`, `Address`, `Phone`, `Email`, `OwnershipID`) VALUES
(1, 'Aaj Dupure Tomar Nimantron', 'Sabiha Tanzim', '63 Rail Road, Jessore, Bangladesh', '01913019722', 'sabiha12@gmail.com', 2),
(2, 'Misir Alir Amimangsito Rahasya', 'Sharmin Sultana', '102/4 Ghop, Jessore, Bangladesh', '01813017652', 'happy.sharmin@gmail.com', 2),
(3, 'Amar Bondhu Rasherd', 'Tanisha Tasnim', '64/9 Modhubagh, Dhaka, Bangladesh', '01712446672', 'tanisha_tasnim@yahoo.com', 2),
(4, 'Ekattorer Dingulee', 'Mafruha Lubla', '350 Police-Line Road, Rasulpur, Satkhira, Bangladesh', '01716569126', 'mlubna@gmail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lentbooklist`
--

CREATE TABLE `lentbooklist` (
  `LentBookID` int(11) NOT NULL,
  `BookTitle` varchar(100) NOT NULL,
  `PersonName` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `OwnershipID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lentbooklist`
--

INSERT INTO `lentbooklist` (`LentBookID`, `BookTitle`, `PersonName`, `Address`, `Phone`, `Email`, `OwnershipID`) VALUES
(1, 'Rupali Makorsha', 'Tania Afrin', 'House # 16, Road # 5, Stadium Para, Jessore, Bangladesh', '019167863823', 'afrin_tania@yahoo.com', 3),
(2, 'Roktochokkhu', 'Fatema Khatun', '16/kha, Barandi Para, Jessore, Bangladesh', '01718487481', 'f.k.shumi@gmail.com', 3),
(3, 'Jolo Doshyur Dip 1,2', 'Farjana Ferdous', '74 Ring Road, Mohammadpur, Dhaka, Bangladesh', '01712548548', 'bobyhalum@yahoo.com', 3),
(4, 'Nirbasan', 'Sk Masud Rana', '69/2 Link Road, Gulshan 1, Dhaka, Bangladesh', '01611986642', 'masud.ece@gmail.com', 3),
(5, 'Maa', 'Abdul Monayem', '34/6, Shankarpur, Jessore, Bangladesh', '01812698731', 'N/A', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ownership`
--

CREATE TABLE `ownership` (
  `OwnershipID` int(11) NOT NULL,
  `Ownership` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ownership`
--

INSERT INTO `ownership` (`OwnershipID`, `Ownership`) VALUES
(1, 'SelfOwned'),
(2, 'Borrowed'),
(3, 'Lended');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `PublisherID` int(11) NOT NULL,
  `PublisherName` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`PublisherID`, `PublisherName`, `Address`) VALUES
(1, 'Afsar Brothers', '38/4, Banglabazar, Dhaka-1100, Bangladesh'),
(2, 'Ananda Publishers Pvt Ltd', '45, Beniatola Ln, College Row, College Street, Kolkata, West Bengal 700009, India'),
(3, 'Annyaprokash', '69/F, Green Road, Panthapath, Dhaka, Bangladesh'),
(4, 'Anupam Prokashoni', '38/4, banglabazar, 1100, Dhaka, Bangladesh'),
(5, 'Gyankosh', 'House # 7, Mumtaj Plaza, Dhanmondi, Road # 4, Dhaka-1205, Bangladesh'),
(6, 'Kakoli Prokashoni', '38/4, Banglabazar, Dhaka-1100, Bangladesh'),
(7, 'Shandhani Prakashani', 'N/A'),
(8, 'Mowla Brothers', '28 Tipu Sultan Road, Dhaka 1100, Bangladesh'),
(9, 'Pearl Publications', '38/2 Banglabazar Dhaka-1100'),
(10, 'People Book Society', '155, Dhaka New Market, Dhaka-1205, Bangladesh'),
(11, 'Protik', '46/1 Hemendra Das Road, Shutrapur, Dhaka-1100, Bangladesh'),
(12, 'Roy M. C. Sarkar Bahadur & Sons', '14, Bankim Chatterjee Street, Kolkata - 700073, India'),
(13, 'Sheba Prokashoni', '24/4, Shahid Sayed Nazrul Islam Sharani, Shegunbagicha, Dhaka-1000, Bangladesh'),
(14, 'Shikha Prokashoni', '38/2 Kha Banglabazar, Dhaka-1100, Bangladesh'),
(15, 'Somoy Prokashon', '38/2 Kha Banglabazar, Dhaka-1100, Bangladesh'),
(16, 'Srishti Publishers & Distributors', '212 A, Peacock Lane, Shahpur Jat, New Delhi 110049, India'),
(17, 'Citadel', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `VersionID` int(11) NOT NULL,
  `Version` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`VersionID`, `Version`) VALUES
(1, 'PhysicalCopy'),
(2, 'eCopy'),
(3, 'Both');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AuthorID`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `AuthorID_2` (`AuthorID`);

--
-- Indexes for table `booklist`
--
ALTER TABLE `booklist`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `VersionID` (`VersionID`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `OwnershipID` (`OwnershipID`),
  ADD KEY `PublisherID` (`PublisherID`);

--
-- Indexes for table `borrowedbooklist`
--
ALTER TABLE `borrowedbooklist`
  ADD PRIMARY KEY (`BorrowedID`),
  ADD KEY `BorrowedID` (`BorrowedID`),
  ADD KEY `OwnershipID` (`OwnershipID`);

--
-- Indexes for table `lentbooklist`
--
ALTER TABLE `lentbooklist`
  ADD PRIMARY KEY (`LentBookID`),
  ADD KEY `LentBookID` (`LentBookID`),
  ADD KEY `OwnershipID` (`OwnershipID`);

--
-- Indexes for table `ownership`
--
ALTER TABLE `ownership`
  ADD PRIMARY KEY (`OwnershipID`),
  ADD KEY `OwnershipID` (`OwnershipID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`PublisherID`),
  ADD KEY `PublisherID` (`PublisherID`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`VersionID`),
  ADD KEY `VersionID` (`VersionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `booklist`
--
ALTER TABLE `booklist`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `borrowedbooklist`
--
ALTER TABLE `borrowedbooklist`
  MODIFY `BorrowedID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lentbooklist`
--
ALTER TABLE `lentbooklist`
  MODIFY `LentBookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ownership`
--
ALTER TABLE `ownership`
  MODIFY `OwnershipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `PublisherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `version`
--
ALTER TABLE `version`
  MODIFY `VersionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booklist`
--
ALTER TABLE `booklist`
  ADD CONSTRAINT `booklist_ibfk_1` FOREIGN KEY (`VersionID`) REFERENCES `version` (`VersionID`),
  ADD CONSTRAINT `booklist_ibfk_2` FOREIGN KEY (`OwnershipID`) REFERENCES `ownership` (`OwnershipID`),
  ADD CONSTRAINT `booklist_ibfk_3` FOREIGN KEY (`PublisherID`) REFERENCES `publisher` (`PublisherID`),
  ADD CONSTRAINT `booklist_ibfk_4` FOREIGN KEY (`AuthorID`) REFERENCES `author` (`AuthorID`);

--
-- Constraints for table `borrowedbooklist`
--
ALTER TABLE `borrowedbooklist`
  ADD CONSTRAINT `borrowedbooklist_ibfk_1` FOREIGN KEY (`OwnershipID`) REFERENCES `ownership` (`OwnershipID`);

--
-- Constraints for table `lentbooklist`
--
ALTER TABLE `lentbooklist`
  ADD CONSTRAINT `lentbooklist_ibfk_1` FOREIGN KEY (`OwnershipID`) REFERENCES `ownership` (`OwnershipID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
