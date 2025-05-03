-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2025 at 11:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fbb`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `content`, `created_at`) VALUES
(1, 9, 'me lang🫶🥺', '2025-04-26 21:38:00'),
(2, 10, 'Ekaw na doll', '2025-04-28 07:51:00'),
(3, 11, 'nasubrahan na sa bangus', '2025-04-29 23:24:00'),
(4, 22, 'sino kaaway mo jan ya?', '2025-04-29 18:07:00'),
(5, 26, 'player coach senator', '2025-05-02 19:33:00'),
(6, 30, 'amen', '2025-04-30 20:08:00'),
(7, 33, 'hoping may guves us peace of mind', '2025-05-01 05:30:00'),
(8, 9, 'me lang🫶🥺', '2025-04-26 21:38:00'),
(9, 10, 'Ekaw na doll', '2025-04-28 07:51:00'),
(10, 11, 'nasubrahan na sa bangus', '2025-04-29 23:24:00'),
(11, 22, 'sino kaaway mo jan ya?', '2025-04-29 18:07:00'),
(12, 26, 'player coach senator', '2025-05-02 19:33:00'),
(13, 30, 'amen', '2025-04-30 20:08:00'),
(14, 33, 'hoping may guves us peace of mind', '2025-05-01 05:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `content`, `created_at`) VALUES
(1, 3, 'Sharedpost', '2025-04-29 22:30:00'),
(2, 3, 'Sharedpost', '2025-04-30 21:42:00'),
(3, 3, 'Sharedpost', '2025-05-01 06:30:00'),
(4, 48, 'Shared a memory', '2025-04-18 12:30:00'),
(5, 48, 'Shared a memory', '2025-04-25 11:38:00'),
(6, 48, 'Sharedpost', '2025-04-29 03:00:00'),
(7, 48, 'Sharedpost', '2025-05-01 08:33:00'),
(8, 4, 'sharedpost :Kung may darating man ulit sana yung sigurado na', '2025-04-26 22:24:00'),
(9, 4, 'Sharedpost: kauban na lang kulang', '2025-04-26 21:38:00'),
(10, 4, 'Post:stop underestimate yourself', '2025-04-28 07:51:00'),
(11, 4, 'Post:dmo tgaa placer kung wa mo kaila ani HAHA', '2025-04-29 23:24:00'),
(12, 4, 'Sharedpost', '2025-05-02 18:28:00'),
(13, 5, 'Sharedpost:me and my blush blindness forever', '2025-04-29 05:56:00'),
(14, 5, 'Sharedpost:me sa mga basher', '2025-04-30 20:06:00'),
(15, 5, 'Sharedpost', '2025-04-30 21:07:00'),
(16, 5, 'Sharedpost:song 1 percent memories 99 percent', '2025-05-01 22:03:00'),
(17, 5, 'Sharedpost:wala pa bang sahod? Nahihilo na ako eh', '2025-05-02 19:30:00'),
(18, 6, 'Sharedpost:ibalik sa pressure cooker to di pa malambot', '2025-04-21 13:00:00'),
(19, 6, 'Sharedpost :next year black toga na', '2025-04-24 12:05:00'),
(20, 6, 'Sharedpost', '2025-05-01 03:56:00'),
(21, 7, 'Sharedpost', '2025-04-29 18:07:00'),
(22, 7, 'Sharedpost', '2025-04-29 20:17:00'),
(23, 7, 'Sharedpost', '2025-04-30 23:34:00'),
(24, 7, 'Sharedpost:konting tulong at dasal para sa asawa ng kasamahan namin sa foodpanda', '2025-05-02 19:30:00'),
(25, 7, 'Sharedpost', '2025-05-02 19:33:00'),
(26, 8, 'Sharedpost', '2025-04-30 05:57:00'),
(27, 8, 'Sharedpost', '2025-05-01 18:45:00'),
(28, 8, 'Sharedpost', '2025-05-02 20:12:00'),
(29, 9, 'Post:life is short enjoy life habang healthy pa', '2025-04-30 20:08:00'),
(30, 9, 'Sharedpost', '2025-04-30 19:45:00'),
(31, 9, 'Sharedpost', '2025-04-30 21:33:00'),
(32, 9, 'Sharedpost:hoping may guves us peace of mind', '2025-05-01 05:30:00'),
(33, 9, 'Sharespost:nilagay sa ref yung tirang pagkain para hindi masira', '2025-05-02 15:08:00'),
(34, 10, 'sharedpost:magjoin na kayo plss', '2025-04-22 19:36:00'),
(35, 10, 'Sharedpost:sa mga pips diyan dont think twice', '2025-04-23 18:56:00'),
(36, 10, 'Sharedpost:sa friday na watch na kayo', '2025-04-30 08:36:00'),
(37, 11, 'Sharedpost', '2025-05-01 18:45:00'),
(38, 11, 'Sharedpost', '2025-05-01 19:46:00'),
(39, 11, 'Sharedpost', '2025-05-02 20:06:00'),
(40, 11, 'Sharedpost', '2025-05-02 20:30:00'),
(41, 11, 'Exploring the city today!', '2025-04-21 09:00:00'),
(42, 12, 'Loving the weather today!', '2025-04-21 10:30:00'),
(43, 13, 'Here’s a new travel vlog!', '2025-04-21 11:00:00'),
(44, 14, 'Check out my new art piece!', '2025-04-21 12:15:00'),
(45, 15, 'Just completed a workout!', '2025-04-21 13:00:00'),
(46, 16, 'Had a great lunch!', '2025-04-21 14:00:00'),
(47, 17, 'My thoughts on the latest movie.', '2025-04-21 15:00:00'),
(48, 18, 'A beautiful sunset today!', '2025-04-21 16:00:00'),
(49, 19, 'I just finished a new book!', '2025-04-21 17:00:00'),
(50, 20, 'Excited about this new project!', '2025-04-21 18:00:00'),
(51, 21, 'Celebrating a milestone!', '2025-04-21 19:00:00'),
(52, 22, 'Trying out new recipes!', '2025-04-21 20:00:00'),
(53, 23, 'Feeling good after a workout!', '2025-04-22 09:00:00'),
(54, 24, 'Here’s my latest photography work!', '2025-04-22 10:30:00'),
(55, 25, 'Enjoying some quiet time!', '2025-04-22 11:00:00'),
(56, 26, 'A new song is out now!', '2025-04-22 12:15:00'),
(57, 27, 'Excited for the weekend!', '2025-04-22 13:00:00'),
(58, 28, 'A great day for hiking!', '2025-04-22 14:00:00'),
(59, 29, 'Just finished a painting!', '2025-04-22 15:00:00'),
(60, 30, 'Exploring a new city!', '2025-04-22 16:00:00'),
(61, 31, 'A perfect day at the beach!', '2025-04-22 17:00:00'),
(62, 32, 'Started a new project today!', '2025-04-22 18:00:00'),
(63, 33, 'Had a blast with friends today!', '2025-04-22 19:00:00'),
(64, 34, 'Feeling peaceful and relaxed.', '2025-04-22 20:00:00'),
(65, 35, 'My thoughts on the latest tech trends!', '2025-04-23 09:00:00'),
(66, 36, 'Just got a new camera!', '2025-04-23 10:30:00'),
(67, 37, 'A great workout session today!', '2025-04-23 11:00:00'),
(68, 38, 'Exploring new recipes to try!', '2025-04-23 12:15:00'),
(69, 39, 'Trying out new hobbies!', '2025-04-23 13:00:00'),
(70, 40, 'Visited a beautiful park today!', '2025-04-23 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reacts`
--

CREATE TABLE `reacts` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reacts`
--

INSERT INTO `reacts` (`id`, `post_id`, `created_at`) VALUES
(1, 1, '2025-04-29 22:30:00'),
(2, 2, '2025-04-30 21:42:00'),
(3, 3, '2025-05-01 06:30:00'),
(4, 4, '2025-04-18 12:30:00'),
(5, 5, '2025-04-25 11:38:00'),
(6, 6, '2025-04-29 03:00:00'),
(7, 7, '2025-05-01 08:33:00'),
(8, 8, '2025-04-26 22:24:00'),
(9, 9, '2025-04-26 21:38:00'),
(10, 10, '2025-04-28 07:51:00'),
(11, 11, '2025-04-29 23:24:00'),
(12, 12, '2025-05-02 18:28:00'),
(13, 13, '2025-04-29 05:56:00'),
(14, 14, '2025-04-30 20:06:00'),
(15, 15, '2025-04-30 21:07:00'),
(16, 17, '2025-05-01 22:03:00'),
(17, 18, '2025-05-02 19:30:00'),
(18, 19, '2025-04-21 13:00:00'),
(19, 20, '2025-04-24 12:05:00'),
(20, 21, '2025-05-01 03:56:00'),
(21, 22, '2025-04-29 18:07:00'),
(22, 23, '2025-04-29 20:17:00'),
(23, 24, '2025-04-30 23:34:00'),
(24, 25, '2025-05-02 19:30:00'),
(25, 26, '2025-05-02 19:33:00'),
(26, 27, '2025-04-30 05:57:00'),
(27, 28, '2025-05-01 18:45:00'),
(28, 29, '2025-05-02 20:12:00'),
(29, 30, '2025-04-30 20:08:00'),
(30, 31, '2025-04-30 19:45:00'),
(31, 32, '2025-04-30 21:33:00'),
(32, 33, '2025-05-01 05:30:00'),
(33, 34, '2025-05-02 15:08:00'),
(34, 1, '2025-04-29 22:30:00'),
(35, 2, '2025-04-30 21:42:00'),
(36, 3, '2025-05-01 06:30:00'),
(37, 4, '2025-04-18 12:30:00'),
(38, 5, '2025-04-25 11:38:00'),
(39, 6, '2025-04-29 03:00:00'),
(40, 7, '2025-05-01 08:33:00'),
(41, 8, '2025-04-26 22:24:00'),
(42, 9, '2025-04-26 21:38:00'),
(43, 10, '2025-04-28 07:51:00'),
(44, 11, '2025-04-29 23:24:00'),
(45, 12, '2025-05-02 18:28:00'),
(46, 13, '2025-04-29 05:56:00'),
(47, 14, '2025-04-30 20:06:00'),
(48, 15, '2025-04-30 21:07:00'),
(49, 17, '2025-05-01 22:03:00'),
(50, 18, '2025-05-02 19:30:00'),
(51, 19, '2025-04-21 13:00:00'),
(52, 20, '2025-04-24 12:05:00'),
(53, 21, '2025-05-01 03:56:00'),
(54, 22, '2025-04-29 18:07:00'),
(55, 23, '2025-04-29 20:17:00'),
(56, 24, '2025-04-30 23:34:00'),
(57, 25, '2025-05-02 19:30:00'),
(58, 26, '2025-05-02 19:33:00'),
(59, 27, '2025-04-30 05:57:00'),
(60, 28, '2025-05-01 18:45:00'),
(61, 29, '2025-05-02 20:12:00'),
(62, 30, '2025-04-30 20:08:00'),
(63, 31, '2025-04-30 19:45:00'),
(64, 32, '2025-04-30 21:33:00'),
(65, 33, '2025-05-01 05:30:00'),
(66, 34, '2025-05-02 15:08:00'),
(67, 41, '2025-04-21 09:30:00'),
(68, 41, '2025-04-21 10:15:00'),
(69, 42, '2025-04-21 10:45:00'),
(70, 42, '2025-04-21 11:10:00'),
(71, 43, '2025-04-21 11:20:00'),
(72, 43, '2025-04-21 12:00:00'),
(73, 44, '2025-04-21 12:45:00'),
(74, 44, '2025-04-21 13:10:00'),
(75, 45, '2025-04-21 13:45:00'),
(76, 45, '2025-04-21 14:05:00'),
(77, 46, '2025-04-21 14:30:00'),
(78, 47, '2025-04-21 15:30:00'),
(79, 48, '2025-04-21 16:45:00'),
(80, 49, '2025-04-21 17:15:00'),
(81, 50, '2025-04-21 18:10:00'),
(82, 51, '2025-04-21 18:30:00'),
(83, 52, '2025-04-21 19:00:00'),
(84, 53, '2025-04-22 09:15:00'),
(85, 53, '2025-04-22 10:00:00'),
(86, 54, '2025-04-22 10:45:00'),
(87, 55, '2025-04-22 11:15:00'),
(88, 56, '2025-04-22 12:00:00'),
(89, 57, '2025-04-22 12:30:00'),
(90, 58, '2025-04-22 13:00:00'),
(91, 59, '2025-04-22 14:15:00'),
(92, 60, '2025-04-22 15:00:00'),
(93, 61, '2025-04-22 16:10:00'),
(94, 62, '2025-04-22 17:00:00'),
(95, 63, '2025-04-22 18:15:00'),
(96, 64, '2025-04-22 19:00:00'),
(97, 65, '2025-04-23 09:30:00'),
(98, 66, '2025-04-23 10:00:00'),
(99, 67, '2025-04-23 10:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE `shares` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shares`
--

INSERT INTO `shares` (`id`, `post_id`, `created_at`) VALUES
(1, 1, '2025-04-29 22:30:00'),
(2, 2, '2025-04-30 21:42:00'),
(3, 3, '2025-05-01 06:30:00'),
(4, 4, '2025-04-18 12:30:00'),
(5, 5, '2025-04-25 11:38:00'),
(6, 6, '2025-04-29 03:00:00'),
(7, 7, '2025-05-01 08:33:00'),
(8, 8, '2025-04-26 22:24:00'),
(9, 9, '2025-04-26 21:38:00'),
(10, 11, '2025-04-29 23:24:00'),
(11, 13, '2025-04-29 05:56:00'),
(12, 14, '2025-04-30 20:06:00'),
(13, 15, '2025-04-30 21:07:00'),
(14, 17, '2025-05-01 22:03:00'),
(15, 18, '2025-05-02 19:30:00'),
(16, 19, '2025-04-21 13:00:00'),
(17, 20, '2025-04-24 12:05:00'),
(18, 21, '2025-05-01 03:56:00'),
(19, 22, '2025-04-29 18:07:00'),
(20, 23, '2025-04-29 20:17:00'),
(21, 24, '2025-04-30 23:34:00'),
(22, 25, '2025-05-02 19:30:00'),
(23, 27, '2025-04-30 05:57:00'),
(24, 28, '2025-05-01 18:45:00'),
(25, 29, '2025-05-02 20:12:00'),
(26, 1, '2025-04-29 22:30:00'),
(27, 2, '2025-04-30 21:42:00'),
(28, 3, '2025-05-01 06:30:00'),
(29, 4, '2025-04-18 12:30:00'),
(30, 5, '2025-04-25 11:38:00'),
(31, 6, '2025-04-29 03:00:00'),
(32, 7, '2025-05-01 08:33:00'),
(33, 8, '2025-04-26 22:24:00'),
(34, 9, '2025-04-26 21:38:00'),
(35, 11, '2025-04-29 23:24:00'),
(36, 13, '2025-04-29 05:56:00'),
(37, 14, '2025-04-30 20:06:00'),
(38, 15, '2025-04-30 21:07:00'),
(39, 17, '2025-05-01 22:03:00'),
(40, 18, '2025-05-02 19:30:00'),
(41, 19, '2025-04-21 13:00:00'),
(42, 20, '2025-04-24 12:05:00'),
(43, 21, '2025-05-01 03:56:00'),
(44, 22, '2025-04-29 18:07:00'),
(45, 23, '2025-04-29 20:17:00'),
(46, 24, '2025-04-30 23:34:00'),
(47, 25, '2025-05-02 19:30:00'),
(48, 27, '2025-04-30 05:57:00'),
(49, 28, '2025-05-01 18:45:00'),
(50, 29, '2025-05-02 20:12:00'),
(51, 30, '2025-04-30 20:08:00'),
(52, 31, '2025-04-30 19:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` enum('male','female','other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `gender`) VALUES
(1, 'Mariel daligdig', 'female'),
(2, 'Fritz silvestre', 'female'),
(3, 'Peejay roxas', 'male'),
(4, 'Versoza tonggala', 'female'),
(5, 'Shelloh almodal', 'female'),
(6, 'Eleza mae valenzuela', 'female'),
(7, 'Keneyh valerio', 'female'),
(8, 'Patrick yap', 'male'),
(9, 'Terence tonggala', 'male'),
(10, 'Rj gatin', 'male'),
(11, 'Jst hannah', 'female'),
(12, 'Arman alariao', 'male'),
(13, 'Marianee tandoc', 'female'),
(14, 'Justin carl', 'male'),
(15, 'Mark sheldon alariao', 'male'),
(16, 'Russel magas', 'male'),
(17, 'Ajay velarde', 'male'),
(18, 'Rexielyn godino', 'female'),
(19, 'Camille castro', 'female'),
(20, 'Aira villo', 'female'),
(21, 'Jhen ney', 'female'),
(22, 'Kharene casinillo', 'female'),
(23, 'Ron mark', 'male'),
(24, 'Hanz martin caleza', 'male'),
(25, 'Liezel baring', 'female'),
(26, 'Robilyn cayubit', 'female'),
(27, 'Arnel pevida', 'male'),
(28, 'Marnie bruza', 'female'),
(29, 'Chelsy casandra', 'female'),
(30, 'Sam cabanting', 'male'),
(31, 'Kaye cortez', 'female'),
(32, 'Rodesa yanson', 'female'),
(33, 'Johnbert lonzaga', 'male'),
(34, 'Michaila alsagon', 'female'),
(35, 'Daphne alariao', 'female'),
(36, 'Armando alariao', 'male'),
(37, 'Mark johnsen alariao', 'male'),
(38, 'Carl john morales', 'male'),
(39, 'Hannah', 'female'),
(40, 'Rafael esparagoza', 'male'),
(41, 'Mery joy valerio', 'female'),
(42, 'Yza jacobo', 'female'),
(43, 'Reynan peralta', 'male'),
(44, 'Tyronne sotto', 'male'),
(45, 'Cedrick avenido', 'male'),
(46, 'Prime monterde', 'male'),
(47, 'Rose ann tonggala', 'female'),
(48, 'Russel Magas', 'male'),
(49, 'Kyla pepito', 'female'),
(50, 'Daphne alariao', 'female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reacts`
--
ALTER TABLE `reacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `reacts`
--
ALTER TABLE `reacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `shares`
--
ALTER TABLE `shares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reacts`
--
ALTER TABLE `reacts`
  ADD CONSTRAINT `reacts_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shares`
--
ALTER TABLE `shares`
  ADD CONSTRAINT `shares_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
