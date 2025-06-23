-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 28, 2024 at 06:28 PM
-- Server version: 10.6.16-MariaDB-cll-lve-log
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noornjxr_tv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ads`
--

CREATE TABLE `tbl_ads` (
  `id` int(11) NOT NULL,
  `ad_status` varchar(5) NOT NULL DEFAULT 'on',
  `ad_type` varchar(45) NOT NULL DEFAULT 'admob',
  `backup_ads` varchar(45) NOT NULL DEFAULT 'none',
  `admob_publisher_id` varchar(45) NOT NULL DEFAULT '0',
  `admob_app_id` varchar(100) NOT NULL DEFAULT '0',
  `admob_banner_unit_id` varchar(100) NOT NULL DEFAULT '0',
  `admob_interstitial_unit_id` varchar(100) NOT NULL DEFAULT '0',
  `admob_native_unit_id` varchar(100) NOT NULL DEFAULT '0',
  `admob_app_open_ad_unit_id` varchar(45) NOT NULL DEFAULT '0',
  `fan_banner_unit_id` varchar(100) NOT NULL DEFAULT '0',
  `fan_interstitial_unit_id` varchar(100) NOT NULL DEFAULT '0',
  `fan_native_unit_id` varchar(100) NOT NULL DEFAULT '0',
  `startapp_app_id` varchar(45) NOT NULL DEFAULT '0',
  `unity_game_id` varchar(45) NOT NULL DEFAULT '0',
  `unity_banner_placement_id` varchar(45) NOT NULL DEFAULT 'banner',
  `unity_interstitial_placement_id` varchar(45) NOT NULL DEFAULT 'video',
  `applovin_banner_ad_unit_id` varchar(45) NOT NULL DEFAULT '0',
  `applovin_interstitial_ad_unit_id` varchar(45) NOT NULL DEFAULT '0',
  `applovin_native_ad_manual_unit_id` varchar(45) NOT NULL DEFAULT '0',
  `applovin_banner_zone_id` varchar(45) NOT NULL DEFAULT '0',
  `applovin_interstitial_zone_id` varchar(45) NOT NULL DEFAULT '0',
  `mopub_banner_ad_unit_id` varchar(45) NOT NULL DEFAULT '0',
  `mopub_interstitial_ad_unit_id` varchar(45) NOT NULL DEFAULT '0',
  `interstitial_ad_interval` int(11) NOT NULL DEFAULT 3,
  `native_ad_interval` int(11) NOT NULL DEFAULT 20,
  `native_ad_index` int(11) NOT NULL DEFAULT 4,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `test_mode` varchar(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_ads`
--

INSERT INTO `tbl_ads` (`id`, `ad_status`, `ad_type`, `backup_ads`, `admob_publisher_id`, `admob_app_id`, `admob_banner_unit_id`, `admob_interstitial_unit_id`, `admob_native_unit_id`, `admob_app_open_ad_unit_id`, `fan_banner_unit_id`, `fan_interstitial_unit_id`, `fan_native_unit_id`, `startapp_app_id`, `unity_game_id`, `unity_banner_placement_id`, `unity_interstitial_placement_id`, `applovin_banner_ad_unit_id`, `applovin_interstitial_ad_unit_id`, `applovin_native_ad_manual_unit_id`, `applovin_banner_zone_id`, `applovin_interstitial_zone_id`, `mopub_banner_ad_unit_id`, `mopub_interstitial_ad_unit_id`, `interstitial_ad_interval`, `native_ad_interval`, `native_ad_index`, `date_time`, `test_mode`) VALUES
(1, 'on', 'admob', '', '', '', 'ca-app-pub-3940256099942544/6300978111', 'ca-app-pub-3940256099942544/1033173712', '', '', '0', '0', '0', '0', '4089993', 'banner', 'vadio', '0', '0', '0', '0', '0', '0', '0', 0, 131, 0, '2024-02-28 01:03:33', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cid`, `category_name`, `category_image`) VALUES
(37, 'Comedy', '1698716966_imasges.jpg'),
(38, 'Movies', '1625134869_movies.jpg'),
(39, 'Romance   ', '1698717104_isssmages.jpg'),
(40, 'Animation', '1698716893_images.png'),
(41, 'Horror', '1698717048_imxxages.jpg'),
(42, 'Music', '1698877640_ic_launcher.png'),
(44, 'Action', '1698716740_unnamed.jpg'),
(46, 'Fantasy ', '1698717313_imagsssses.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category2`
--

CREATE TABLE `tbl_category2` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category2`
--

INSERT INTO `tbl_category2` (`cid`, `category_name`, `category_image`) VALUES
(37, 'Automotive', '1698720881_images.jpg'),
(38, 'Movies', '1625134869_movies.jpg'),
(48, 'Mbc Group', '1698717534_Untitlead.png'),
(49, 'Rotana', '1698717690_issmages.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category3`
--

CREATE TABLE `tbl_category3` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category3`
--

INSERT INTO `tbl_category3` (`cid`, `category_name`, `category_image`) VALUES
(53, 'La Casa De Papel season 1', '1702939675_pBhvB.jpg'),
(54, 'Breaking Bad', '1702941976_3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_channel`
--

CREATE TABLE `tbl_channel` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `channel_name` varchar(255) NOT NULL,
  `channel_image` varchar(255) NOT NULL,
  `channel_url` varchar(1000) NOT NULL,
  `channel_description` text NOT NULL,
  `channel_type` varchar(45) NOT NULL DEFAULT 'URL',
  `video_id` varchar(45) NOT NULL,
  `user_agent` varchar(500) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_channel`
--

INSERT INTO `tbl_channel` (`id`, `category_id`, `channel_name`, `channel_image`, `channel_url`, `channel_description`, `channel_type`, `video_id`, `user_agent`) VALUES
(105, 38, 'What care can you get for a grand?', '1625126143_WhatCarCanYouGetForAGrand.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4', '<p>The Smoking Tire meets up with Chris and Jorge from CarsForAGrand.com to see just how far $1,000 can go when looking for a car.The Smoking Tire meets up with Chris and Jorge from CarsForAGrand.com to see just how far $1,000 can go when looking for a car.</p>\r\n', 'URL', '', 'default'),
(136, 38, 'www', '1697514489_iwsMu0ehRPbtaSxqiaUDQB9qMWT.jpg', 'http://192.168.1.106/tv/channel-add.php', '<p>www</p>\r\n', 'URL', '', 'default'),
(137, 38, 'wqq', '1697514501_9ssNSfNKpzZwhbFsnW3wa82m2sG.jpg', 'http://192.168.1.106/tv/channel-add.php', '<p>qwq</p>\r\n', 'URL', '', 'default'),
(138, 38, 'asas', '1697514517_b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg', 'http://192.168.1.106/tv/channel-add.php', '<p>asa</p>\r\n', 'URL', '', 'default'),
(139, 38, 'sadsad', '1697514529_NNxYkU70HPurnNCSiCjYAmacwm.jpg', 'http://192.168.1.106/tv/channel-add.php', '<p>adasd</p>\r\n', 'URL', '', 'default'),
(140, 38, 'asdsad', '1697514540_sFBDjWdw8gHSI2dMivP7H52iwvp.jpg', 'https://www.youtube.com/watch?v=FF10_N6qqYg', 'asdsa\r\n', 'YOUTUBE', 'FF10_N6qqYg', 'default'),
(141, 44, 'John Wick', '1698717189_john-wick-2017-image-3840x2400.jpg', 'http://commondatastorage.googleapis.com/http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'Keanu\'s best action movies, ranked from \'The Matrix\' to \'John Wick\' ', 'URL', '', 'default'),
(142, 41, 'theconjuring2', '1698719347_theconjuring2-keyart-logo-vertical-852x1136.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'The mercurial villain Loki resumes his role as the God of Mischief in a new series that takes place after the events of “Avengers: Endgame.”', 'URL', '', 'default'),
(143, 41, 'scream', '1698719387_scream_4-keyart-logo-vertical-852x1136.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', ' On the brink of losing her home, Maddie finds an intriguing job listing: helicopter parents looking for someone to bring their introverted 19-year-old son out of his shell before college. She has one summer to make him a man or die trying.', 'URL', '', 'default'),
(144, 41, 'Rob Zombie\\\'s Halloween', '1698719441_robzombieshalloween-keyart-logo-vertical-852x1136.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'After being committed for 15 years, Michael Myers escapes from the mental institution and immediately returns to Haddonfield to find his baby sister, Laurie.', 'URL', '', 'default'),
(145, 40, 'Five Nights at Freddy\\\'s', '1698719868_A4j8S6moJS2zNtRR8oWF08gRnL5.jpg', 'http://commondatastorage.googleapis.com/http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', '\r\n\r\nRecently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear\'s Pizzeria. But he soon discovers that nothing at Freddy\'s is what it seems.\r\n', 'URL', '', 'default'),
(146, 41, 'Saw X', '1698719929_aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg', 'http://commondatastorage.googleapis.com/http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'Between the events of \'Saw\' and \'Saw II\', a sick and desperate John Kramer travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer, only to discover the entire operation is a scam to defraud the most vulnerable. Armed with a newfound purpose, the infamous serial killer returns to his work, turning the tables on the con artists in his signature visceral way through devious, deranged, and ingenious traps.', 'URL', '', 'default'),
(147, 46, 'A Haunting in Venice', '1698720078_1Xgjl22MkAZQUavvOeBqRehrvqO.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'Celebrated sleuth Hercule Poirot, now retired and living in self-imposed exile in Venice, reluctantly attends a Halloween séance at a decaying, haunted palazzo. When one of the guests is murdered, the detective is thrust into a sinister world of shadows and secrets.', 'URL', '', 'default'),
(148, 40, 'Family Guy', '1698720118_hw2vi8agaJZ7oeSvS8uEYgOtK32.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'Sick, twisted, politically incorrect and Freakin\' Sweet animated series featuring the adventures of the dysfunctional Griffin family. Bumbling Peter and long-suffering Lois have three kids. Stewie (a brilliant but sadistic baby bent on killing his mother and taking over the world), Meg (the oldest, and is the most unpopular girl in town) and Chris (the middle kid, he\'s not very bright but has a passion for movies). The final member of the family is Brian - a talking dog and much more than a pet, he keeps Stewie in check whilst sipping Martinis and sorting through his own life issues.', 'URL', '', 'default'),
(149, 46, ' Loki (2021) ', '1698720174_voHUmluYmKyleFkTu3lOXQG702u.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElepAfter stealing the Tesseract during the events of “Avengers: Endgame,” an alternate version of Loki is brought to the mysterious Time Variance Authority, a bureaucratic organization that exists outside of time and space and monitors the timeline. They give Loki a choice: face being erased from existence due to being a “time variant” or help fix the timeline and stop a greater threat.hantsDream.mp4', 'URL', '', 'default'),
(150, 44, ' Oppenheimer (2023) ', '1698720215_8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'The story of J. Robert Oppenheimer’s role in the development of the atomic bomb during World War II.\r\n', 'URL', '', 'default'),
(151, 44, 'John Wick: Chapter 4 ', '1698720396_vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.', 'URL', '', 'default'),
(152, 37, ' The Flash (2023) ', '1698720440_rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'When his attempt to save his family inadvertently alters the future, Barry Allen becomes trapped in a reality in which General Zod has returned and there are no Super Heroes to turn to. In order to save the world that he is in and return to the future that he knows, Barry\'s only hope is to race for his life. But will making the ultimate sacrifice be enough to reset the universe?', 'URL', '', 'default'),
(153, 37, ' Journey to the Center of the Earth', '1698720498_myhj05hTAcQL2rhOrMqWxiioo49.jpg', 'https://www.youtube.com/watch?v=5qm8PH4xAss', 'On a quest to find out what happened to his missing brother, a scientist, his nephew and their mountain guide discover a fantastic and dangerous lost world in the center of the earth.', 'YOUTUBE', '5qm8PH4xAss', 'default'),
(154, 44, ' Fast X (2023) ', '1698720529_fiVW06jE7z9YnO4trhaMEdclSiC.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'aaa', 'URL', '', 'default'),
(155, 44, ' Muzzle (2023) ', '1698720581_qXChf7MFL36BgoLkiB3BzXiwW82.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'LAPD K-9 officer Jake Rosser has just witnessed the shocking murder of his dedicated partner by a mysterious assailant. As he investigates the shooter’s identity, he uncovers a vast conspiracy that has a chokehold on the city in this thrilling journey through the tangled streets of Los Angeles and the corrupt bureaucracy of the LAPD.', 'URL', '', 'default'),
(156, 40, 'Spider-Man: No Way Home', '1698720617_5weKu49pzJCt06OPpjvT80efnQj.jpg', 'https://server17.peliscdn.online/newhls/1db3debd16d3e03dac6b2180cb64a924/EP.0.1.v0.1698687235.720.m3u8', 'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.', 'URL', '', 'default'),
(157, 44, ' Extraction 2 (2023) ', '1698720646_7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'ffds', 'URL', '', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_channel2`
--

CREATE TABLE `tbl_channel2` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `channel_name` varchar(255) NOT NULL,
  `channel_image` varchar(255) NOT NULL,
  `channel_url` varchar(1000) NOT NULL,
  `channel_description` text NOT NULL,
  `channel_type` varchar(45) NOT NULL DEFAULT 'URL',
  `video_id` varchar(45) NOT NULL,
  `user_agent` varchar(500) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_channel2`
--

INSERT INTO `tbl_channel2` (`id`, `category_id`, `channel_name`, `channel_image`, `channel_url`, `channel_description`, `channel_type`, `video_id`, `user_agent`) VALUES
(138, 37, 'wqe', '1697681883_Untitled.jpg', 'https://server17.peliscdn.online/newhls/1db3debd16d3e03dac6b2180cb64a924/EP.0.1.v0.1698687235.720.m3u8', 'wewwewwewwewwewwewwewwewwewwew\r\n\r\n', 'URL', '', 'default'),
(144, 38, 'aaaaa', '1698968778_ic_launcher.png', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'aaaaaa', 'URL', '', 'default'),
(145, 49, 'Test2', '1698969562_ic_launcher.png', 'https://futuretoday-afv-family-2-be.samsung.wurl.tv/playlist.m3u8', 'For test', 'URL', '', 'default'),
(146, 49, 'test3', '1698969602_ic_launcher.png', ' https://shls-mbcbollywood-prod-dub.shahid.net/out/v1/a79c9d7ef2a64a54a64d5c4567b3462a/index_4.m3u8', 'for test', 'URL', '', 'default'),
(147, 37, 'test4', '1698969684_ic_launcher.png', 'https://www.youtube.com/watch?v=eksOMqVMINo', 'test 4 youtube', 'YOUTUBE', 'eksOMqVMINo', 'default'),
(148, 37, 'Breaking Bad 1', '1702942328_images.jpg', 'https://www.youtube.com/watch?v=46l2HlRQHk8', '..', 'YOUTUBE', '46l2HlRQHk8', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_channel3`
--

CREATE TABLE `tbl_channel3` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `channel_name` varchar(255) NOT NULL,
  `channel_image` varchar(255) NOT NULL,
  `channel_url` varchar(1000) NOT NULL,
  `channel_description` text NOT NULL,
  `channel_type` varchar(45) NOT NULL DEFAULT 'URL',
  `video_id` varchar(45) NOT NULL,
  `user_agent` varchar(500) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_channel3`
--

INSERT INTO `tbl_channel3` (`id`, `category_id`, `channel_name`, `channel_image`, `channel_url`, `channel_description`, `channel_type`, `video_id`, `user_agent`) VALUES
(153, 53, 'La Casa De Papel 1', '1702939804_73f3a3e2-8a00-11ea-8a72-3b4a65ec119d_image_hires_154643.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'To carry out the biggest heist in history, a mysterious man called The Professor recruits a band of eight robbers who have a single characteristic: none of them has anything to lose. Five months of seclusion - memorizing every step, every detail, every probability - culminate in eleven days locked up in the National Coinage and Stamp Factory of Spain, surround', 'URL', '', 'default'),
(154, 53, 'La Casa De Papel 2', '1702940097_73f3a3e2-8a00-11ea-8a72-3b4a65ec119d_image_hires_154643.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'To carry out the biggest heist in history, a mysterious man called The Professor recruits a band of eight robbers who have a single characteristic: none of them has anything to lose. Five months of seclusion - memorizing every step, every detail, every probability - culminate in eleven days locked up in the National Coinage and Stamp Factory of Spain, surrounded by police forces and with dozens of hostages in their power, to find out whether their suicide wager will lead to everything or nothing.', 'URL', '', 'default'),
(155, 53, 'La Casa De Papel 3', '1702940118_cdn4.premiumread.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'To carry out the biggest heist in history, a mysterious man called The Professor recruits a band of eight robbers who have a single characteristic: none of them has anything to lose. Five months of seclusion - memorizing every step, every detail, every probability - culminate in eleven days locked up in the National Coinage and Stamp Factory of Spain, surrounded by police forces and with dozens of hostages in their power, to find out whether their suicide wager will lead to everything or nothing.', 'URL', '', 'default'),
(156, 53, 'La Casa De Papel 4', '1702940340_cdn4.premiumread.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'To carry out the biggest heist in history, a mysterious man called The Professor recruits a band of eight robbers who have a single characteristic: none of them has anything to lose. Five months of seclusion - memorizing every step, every detail, every probability - culminate in eleven days locked up in the National Coinage and Stamp Factory of Spain, surrounded by police forces and with dozens of hostages in their power, to find out whether their suicide wager will lead to everything or nothing.', 'URL', '', 'default'),
(157, 54, 'Breaking Bad 1', '1702942006_images.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family\'s financial future at any cost as he enters the dangerous world of drugs and crime.', 'URL', '', 'default'),
(158, 54, 'Breaking Bad 2', '1702942026_3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', 'When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family\'s financial future at any cost as he enters the dangerous world of drugs and crime.', 'URL', '', 'default'),
(160, 54, 'Breaking Bad 3', '1702942418_images.jpg', 'https://www.youtube.com/watch?v=46l2HlRQHk8', 'When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He ', 'YOUTUBE', '46l2HlRQHk8', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fcm_template`
--

CREATE TABLE `tbl_fcm_template` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Notification',
  `message` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_fcm_template`
--

INSERT INTO `tbl_fcm_template` (`id`, `title`, `message`, `image`, `link`) VALUES
(29, 'xxxxxx', 'xxxxxxxxxxxx', '1698366497_avatar.png', ''),
(30, 'asa', 'sas', '1698367484_97.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fcm_token`
--

CREATE TABLE `tbl_fcm_token` (
  `id` int(11) NOT NULL,
  `user_android_token` varchar(500) NOT NULL,
  `user_unique_id` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `os_version` varchar(255) NOT NULL,
  `device_model` varchar(255) NOT NULL,
  `device_manufacturer` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_license`
--

CREATE TABLE `tbl_license` (
  `id` int(11) NOT NULL,
  `purchase_code` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `buyer` varchar(255) NOT NULL,
  `license_type` varchar(45) NOT NULL,
  `purchase_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `app_fcm_key` text NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `package_name` varchar(255) NOT NULL DEFAULT 'com.app.thestream',
  `onesignal_app_id` varchar(500) NOT NULL DEFAULT '0',
  `onesignal_rest_api_key` varchar(500) NOT NULL DEFAULT '0',
  `privacy_policy` text NOT NULL,
  `providers` varchar(45) NOT NULL DEFAULT 'onesignal',
  `protocol_type` varchar(10) NOT NULL DEFAULT 'http://',
  `fcm_notification_topic` varchar(255) NOT NULL DEFAULT 'the_stream_topic',
  `more_apps_url` text NOT NULL,
  `youtube_api_key` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `app_fcm_key`, `api_key`, `package_name`, `onesignal_app_id`, `onesignal_rest_api_key`, `privacy_policy`, `providers`, `protocol_type`, `fcm_notification_topic`, `more_apps_url`, `youtube_api_key`) VALUES
(1, 'AAAAJ1SpDag:APA91bG4AAQOoYmufavAmd8FT46GQr_oMpcjZJg32qROuQuh27AuNQL-pzpcmNmg5Iw4nBWqf0i7rTCnJBf6tlFPAPPu3sbSv4HXznxH3asDHg2U2oW9lHfO3j6TQcDkqBq4qf-nXoVB', 'cda11bx8aITlKsXCpNB7yVLnOdEGqg342ZFrQzJRetkSoUMi9w', 'com.tv803.tvappfierbaes', '', '', '', 'firebase', 'http', 'noor', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_role` enum('100','101','102') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `email`, `user_role`) VALUES
(1, 'admin', 'd8eb6c62ccc908d6e8a75dff54eb7b3344610ba4e29fc39a05b872dfdeb44762', 'Noor80312@gmail.com', '100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_ads`
--
ALTER TABLE `tbl_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_category2`
--
ALTER TABLE `tbl_category2`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_category3`
--
ALTER TABLE `tbl_category3`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_channel`
--
ALTER TABLE `tbl_channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_channel2`
--
ALTER TABLE `tbl_channel2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_channel3`
--
ALTER TABLE `tbl_channel3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fcm_template`
--
ALTER TABLE `tbl_fcm_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fcm_token`
--
ALTER TABLE `tbl_fcm_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_license`
--
ALTER TABLE `tbl_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_ads`
--
ALTER TABLE `tbl_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_category2`
--
ALTER TABLE `tbl_category2`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tbl_category3`
--
ALTER TABLE `tbl_category3`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tbl_channel`
--
ALTER TABLE `tbl_channel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `tbl_channel2`
--
ALTER TABLE `tbl_channel2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `tbl_channel3`
--
ALTER TABLE `tbl_channel3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `tbl_fcm_template`
--
ALTER TABLE `tbl_fcm_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_fcm_token`
--
ALTER TABLE `tbl_fcm_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_license`
--
ALTER TABLE `tbl_license`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
