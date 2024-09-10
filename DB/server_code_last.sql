-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2021 at 01:21 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `server_code`
--

-- --------------------------------------------------------

--
-- Table structure for table `acts`
--

CREATE TABLE `acts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_act_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `acts`
--

INSERT INTO `acts` (`id`, `name`, `slug`, `parent_act_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'solo', 'solo', 1, 1, '2020-12-20 05:57:44', '2020-12-20 05:57:44'),
(2, 'bands', 'bands', 3, 1, '2020-12-20 05:57:44', '2020-12-20 09:04:11'),
(8, 'Test Category', 'test-category', 6, 1, '2021-02-25 15:36:07', '2021-02-25 15:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT 1,
  `fullname` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `event_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `act_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `website` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `blocked` enum('active','blocked') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `facebook` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `user_id`, `fullname`, `exp`, `location_id`, `event_id`, `act_id`, `website`, `status_id`, `role_id`, `blocked`, `facebook`, `twitter`, `youtube`, `instagram`, `linkedin`, `created_at`, `updated_at`) VALUES
(9, 8, 'Doritos', '23', 1, 1, 2, 'www.doritos.com', 1, 1, 'active', 'test.com', 'test.com', 'test.com', 'test.com', 'test.com', '2020-12-30 13:31:27', '2021-01-04 08:00:44'),
(15, 3, 'SKYKNIGHTS', '5', 3, 1, 2, NULL, 1, 1, 'active', NULL, NULL, NULL, NULL, NULL, '2021-02-27 18:28:15', '2021-02-27 19:49:10'),
(16, 1, 'CLIQUE', '7', 1, 1, 2, NULL, 1, 1, 'active', NULL, NULL, NULL, NULL, NULL, '2021-02-27 19:03:39', '2021-02-27 19:49:11'),
(17, 7, 'GROOVE STATION', '12', 2, 2, 8, NULL, 1, 1, 'active', NULL, NULL, NULL, NULL, NULL, '2021-02-27 19:16:00', '2021-02-27 19:49:13'),
(18, 8, 'HIGH KEY', '4', 2, 3, 2, NULL, 1, 1, 'active', NULL, NULL, NULL, NULL, NULL, '2021-02-27 19:38:32', '2021-02-27 19:49:16'),
(19, 1, 'THE PASSENGERS', '7', 1, 2, 2, NULL, 1, 1, 'active', NULL, NULL, NULL, NULL, NULL, '2021-02-27 19:58:09', '2021-02-27 20:52:04');

-- --------------------------------------------------------

--
-- Table structure for table `artist_details_page`
--

CREATE TABLE `artist_details_page` (
  `id` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `title` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist_details_page`
--

INSERT INTO `artist_details_page` (`id`, `content`, `title`, `created_at`, `updated_at`) VALUES
(1, '[\"<p>asd2<\\/p>\",\"<p>asd3<\\/p>\",null,\"<p>asd<\\/p>\"]', 'test', '2021-03-15 15:28:53', '2021-03-15 15:28:53'),
(2, '\"<p>qw<\\/p>\"', 'Eman', '2021-03-15 15:29:46', '2021-03-15 15:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `artist_images`
--

CREATE TABLE `artist_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `artist_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `url` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `primary` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `artist_images`
--

INSERT INTO `artist_images` (`id`, `artist_id`, `url`, `type`, `title`, `alt`, `created_at`, `updated_at`, `primary`) VALUES
(8, 9, '1609343089.jpg', 'pageimage', NULL, NULL, '2020-12-30 15:44:49', '2020-12-30 15:44:49', NULL),
(9, 9, '1609343101.jpg', 'repimage', NULL, NULL, '2020-12-30 15:45:01', '2020-12-30 15:45:01', NULL),
(10, 9, '1609343119.png', 'reviewimage', NULL, NULL, '2020-12-30 15:45:19', '2020-12-30 15:45:19', NULL),
(11, 9, '1609343154.jpg', 'galleryimage', 'TEST', 'test', '2020-12-30 15:45:54', '2020-12-30 15:45:54', NULL),
(12, 9, '1609343173.jpg', 'galleryimage', 'test 2', 'test2', '2020-12-30 15:46:13', '2020-12-30 15:46:13', NULL),
(14, 9, '1609343224.jpg', 'galleryimage', 'test 4', 'test4', '2020-12-30 15:47:04', '2020-12-30 15:47:04', NULL),
(38, 15, '1614451083.jpg', 'pageimage', NULL, NULL, '2021-02-27 18:38:03', '2021-02-27 18:38:03', NULL),
(39, 15, '1614451106.jpg', 'repimage', NULL, NULL, '2021-02-27 18:38:26', '2021-02-27 18:38:26', NULL),
(40, 15, '1614451139.jpg', 'reviewimage', NULL, NULL, '2021-02-27 18:38:59', '2021-02-27 18:38:59', NULL),
(41, 15, '1614451182.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 18:39:42', '2021-02-27 18:39:42', NULL),
(42, 15, '1614451196.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 18:39:56', '2021-02-27 18:39:56', NULL),
(43, 15, '1614451219.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 18:40:19', '2021-02-27 18:40:19', NULL),
(44, 15, '1614451249.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 18:40:49', '2021-02-27 18:40:49', NULL),
(45, 16, '1614452847.jpg', 'pageimage', NULL, NULL, '2021-02-27 19:07:27', '2021-02-27 19:07:27', NULL),
(46, 16, '1614452861.jpg', 'repimage', NULL, NULL, '2021-02-27 19:07:41', '2021-02-27 19:07:41', NULL),
(47, 16, '1614452869.jpg', 'reviewimage', NULL, NULL, '2021-02-27 19:07:49', '2021-02-27 19:07:49', NULL),
(48, 16, '1614452882.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 19:08:02', '2021-02-27 19:08:02', NULL),
(49, 16, '1614452891.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 19:08:11', '2021-02-27 19:08:11', NULL),
(50, 16, '1614452904.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 19:08:24', '2021-02-27 19:08:24', NULL),
(51, 17, '1614453472.jpg', 'pageimage', NULL, NULL, '2021-02-27 19:17:52', '2021-02-27 19:17:52', NULL),
(52, 17, '1614453483.jpg', 'repimage', NULL, NULL, '2021-02-27 19:18:03', '2021-02-27 19:18:03', NULL),
(53, 17, '1614453501.jpg', 'reviewimage', NULL, NULL, '2021-02-27 19:18:21', '2021-02-27 19:18:21', NULL),
(54, 17, '1614453517.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 19:18:37', '2021-02-27 19:18:37', NULL),
(55, 17, '1614453529.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 19:18:49', '2021-02-27 19:18:49', NULL),
(56, 17, '1614453551.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 19:19:11', '2021-02-27 19:19:11', NULL),
(57, 18, '1615758512.jpg', 'pageimage', NULL, NULL, '2021-02-27 19:40:24', '2021-03-14 19:48:32', NULL),
(58, 18, '1614454842.jpg', 'repimage', NULL, NULL, '2021-02-27 19:40:42', '2021-02-27 19:40:42', NULL),
(59, 18, '1614454854.jpg', 'reviewimage', NULL, NULL, '2021-02-27 19:40:54', '2021-02-27 19:40:54', NULL),
(60, 18, '1614454865.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 19:41:05', '2021-02-27 19:41:05', NULL),
(61, 18, '1614454879.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 19:41:19', '2021-02-27 19:41:19', NULL),
(62, 19, '1614456071.jpg', 'pageimage', NULL, NULL, '2021-02-27 20:01:11', '2021-02-27 20:01:11', NULL),
(63, 19, '1614456123.jpg', 'repimage', NULL, NULL, '2021-02-27 20:02:03', '2021-02-27 20:02:03', NULL),
(64, 19, '1615756718.jpg', 'reviewimage', NULL, NULL, '2021-02-27 20:02:52', '2021-03-14 19:18:38', NULL),
(65, 19, '1614456219.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 20:03:39', '2021-02-27 20:03:39', NULL),
(66, 19, '1614456231.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-27 20:03:51', '2021-02-27 20:03:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `artist_infos`
--

CREATE TABLE `artist_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `artist_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `features` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `artist_infos`
--

INSERT INTO `artist_infos` (`id`, `artist_id`, `features`, `about`, `created_at`, `updated_at`) VALUES
(2, 9, '\"5 Piece Band\\nFemale Lead Vocalist\\nVocals, Double Bass, Keys, Sax and Drums\\nJazz, Swing, Postmodern Jukebox, Pop\\nLondon based, available nationwide\\nProfessional and Experienced Musicians\\n2x45 minute performance as standard\\nBackground music between sets\\nPA and Lighting available for a fee\\nQuartet, Trio, Duo and Solo Line-up available\\nGlowing references from many happy clients\"', '\"\\\"\\\\\\\"Bring the Hollywood golden age to your doorstep with inimitable jazz and swing masters Chateau Grey!\\\\\\\\n\\\\\\\\nWhether you want them to take centre stage or blend expertly into the background with their subtle and sophisticated repertoire of jazz, swing and Postmodern Jukebox style twists on modern songs, nothing comes close to the seamless glamour of Chateau Grey.\\\\\\\\n\\\\\\\\nComing as a 5-piece as standard, with sultry female vocals, bouncy double-bass, keys, sax and drums, this remarkable collective features some of UK\'s finest jazz musicians. Their repertoire weaves through beloved swing and jazz classics from Ella Fitzgerald to Frank Sinatra and Peggy Lee. Chateau Grey also provide a wonderful vintage twist to more modern songs from artist as diverse as Madonna, David Bowie, and Bon Jovi.\\\\\\\\n\\\\\\\\nThis glamorous London band has known each other for many years and bring true passion to inject your event with jazz and swing joy. Between them, members of the band have played for legends Shirley Bassey and Liza Minnelli, while their lead singer made her television debut at just 16. She\'s graced the stage at The Royal Albert Hall, the QE and the International Guinness Jazz Festival, and the band has racked up some serious mileage performing for high profile clients such as Microsoft, Morgan Stanley, and the United Nations.\\\\\\\\n\\\\\\\\nChateau Grey offer two flexible 45 minute sets of music as standard, with background music provided when they\'re not performing. If you opt for smaller solo, duo or trio line ups, a PA is included in the price, while lighting, a sound engineer and PA can be hired in for events of over 100 people - contact us for more details.\\\\\\\\n\\\\\\\\nChateau Grey are available for weddings, parties and corporate events worldwide - they\'ve played for clients in Switzerland, France, Ireland, Morocco, Poland, and more in the last 12 months alone!\\\\\\\\n\\\\\\\\nGet your glad rags on, or make your big day mellow - Chateau Grey will play at your pace. Book them for your event today!\\\\\\\"\\\"\"', '2021-02-26 09:36:56', '2021-02-27 15:48:03'),
(6, 15, '5 Piece Charismatic Pop Band/\r\nMale Vocals and Guitar x2, Sax, Bass & Drums/\r\nPop & Contemporary hits, with Folk, Soul & Motown/\r\nExperienced and Professional Act/\r\nLondon based, available nationwide/\r\nHappy to learn first dance or special request/\r\nPlaylist DJ service between live sets/\r\nHigh quality and fully PAT tested PA and lighting/\r\n2x60 or 3x40 minutes of live performance/', '\"Skyknights are an incredible 5-piece party band who guarantee a stellar night of sensational music! Led by a pair of star lead vocalists, Skyknights are the showpiece act to make your event unforgettable.\\r\\n\\r\\nThese natural born performers can turn their musical skills and irresistible on-stage charisma to almost any style of music you can think of: pop, folk, rock, funk, soul, Motown, indie - even a dance tune or two! Skyknights\' blend of infectious tunes and unending energy are the perfect recipe for a shoulder-to-shoulder squeeze on the dance floor.\\r\\n\\r\\nThe Skyknights boys know each other well. They\'ve performed at over 200 weddings and events together over the years, perfecting their uplifting show and gathering countless glowing reviews from delighted brides and grooms (and bridesmaids and mothers-in-law). Every member of the band is a top musician, but what sets these guys apart is the talent of and chemistry between the two lead singers: Ant B and Ant K.\\r\\n\\r\\nAnt B has been the lead singer on Strictly and on recent West End show \'Rip It Up\'. He\'s also toured all the arenas supporting McFly and Busted and co-wrote McFly\'s hit \'Love is Easy\'. Ant K has fronted bands supporting McBusted and Aloe Blacc as well as performing alongside Sigala. He has also played session guitar for McFly\'s Danny Jones and co-wrote the McFly song \'Dare You To Move\'. Together the two Ants form the perfect musical team, their voices combining beautifully, their friendship clear to see.\\r\\n\\r\\nAs standard, Skyknights appear as a 5-piece featuring two singing guitarists, bass guitar, sax and drums. You can tailor their line-up to suit your event by removing the sax player or adding a keys player.\\r\\n\\r\\nWhen you hire Skyknights for your event, everything you need for a dazzling evening\'s entertainment is included: high quality lights and PA, a playlist DJ service and your choice of first dance (or a special request) learned and performed. Want to make DJ requests on the night? Ask about upgrading to Skyknight\'s manned DJ service.\"', '2021-02-27 19:02:25', '2021-02-27 19:02:25'),
(7, 16, '5-7 Piece Band/\r\nFemale Lead Vocals/\r\nVocals, Guitar, Bass, Drums and Sax/\r\nMotown, Disco, Pop, Funk, Soul hits/\r\nHighly experienced musicians/\r\nLondon based, available nationwide/\r\n2x60 or 3x40 minute sets as standard/\r\nManned DJ Service provided as standard/', '\"Ready to send your guests into a dance floor frenzy, Clique supply a show like no other! Regarded as one of the most exciting and professional function bands in the UK right now, Clique are a premier choice for your occasion.\\r\\n\\r\\nThis 5-piece London-based band for weddings and events deliver a carefully selected set list of Motown anthems, soul hits and disco favourites from the likes of Aretha Franklin, Marvin Gaye and James Brown, as well as contemporary modern pop songs and 50s rock \'n\' roll. Clique\'s energetic performances of irresistibly danceable songs is sure to get you moving and grooving on the dance floor!\\r\\n\\r\\nClique consists of a fabulous female lead vocalist, guitar, bass, sax and drums. This amazing band\'s harmonies blend together to create an exceptionally funky sound that, when partnered with their on-stage passion and charisma, will set your event alight!\\r\\n\\r\\nYou can hire Clique for your event with the addition of trumpet and keys, adding more depth to their incredible sound and creating a fantastic experience for you and all your guests. And if you\'re looking for daytime entertainment, they have that covered too: with options to hire a vocal and keys duo or a vocal, keys, bass and drums jazz quartet, you can secure the perfect musical backdrop to your wedding ceremony, drinks reception or corporate dinner.\"', '2021-02-27 19:13:52', '2021-02-27 19:13:52'),
(8, 17, '5-Piece Function Band/\r\nFemale Lead Vocals, Guitar, Bass, Drums & Keys/\r\nFunk, Soul, Disco & Motown Band/\r\n5 - 10 Piece Line-Ups Available/\r\n2 x 60 minute sets of live music/\r\nOption to add Sax, Trumpet, Trombone, Percussion/\r\nOption to add Male & Female Vocals/\r\nHighly experienced musicians/\r\nPlaylist DJ Service Included As Standard/', '\"Groove Station are one of the most spectacular live wedding bands and corporate event bands on the planet! When you hire this sensational band expect a show-stopping performance of all your favourite soul, funk, disco and Motown classics by legendary artists like James Brown, Stevie Wonder, Aretha Franklin, Chic, Chaka Khan, Earth, Wind and Fire, Michael Jackson and Prince. If that weren\'t enough, Groove Station also deliver stunning renditions of more recent tunes by the modern-day heirs to these all-time legends including Bruno Mars, Beyonc\\u00e9, Jamiroquai, Pharrell Williams and many more! If you\'re in the market for something unique, Groove Station also perform a selection of rare funk, groove and acid jazz cuts to please even the most discerning aficionado of fine music.\\r\\n\\r\\nGroove Station perform every single song in their singular style, infusing their live show with glitz, glam, flair and energy for an unrivalled live music experience that you and your guests will remember forever!\\r\\n\\r\\nThe band is made up of highly experienced pro musicians who have performed at hundreds of weddings and corporate events at illustrious venues including Emirates Stadium, Madame Tussauds, Blenheim Palace, Bush Hall, The Savoy, The Ritz and The London Science Museum.\\r\\n\\r\\nAvailable in a variety of line-ups to suit all budgets, Groove Station\'s standard line-up is their 5-piece which features scintillating female vocals accompanied by guitar, bass, drums and keys. This line-up is ideal for smaller events: it\'s compact, yet still delivers a powerful performance to get everyone out of their seats and on to the dance floor! For the full Groove Station experience, the band\'s 7-piece is recommended. This features the same core as the 5-piece, plus a male vocalist and a sax player to supply vocal harmonies and gorgeous brassy melodies.\"', '2021-02-27 19:34:55', '2021-02-27 19:34:55'),
(9, 18, '4 Piece Band/\r\nExciting and Energetic Function Band/\r\nVersatile Female Lead Vocalist/\r\nVocals, Guitar, Bass and Drums/\r\nParty-starting Pop, Soul, Funk and Rock/\r\nHampshire based, available South, Mids, Wales/\r\nOver 10 years of experience/\r\n2x60 or 3x40 minute sets as standard/\r\nPlaylist DJ service between live sets/', '\"You\'ll be powerless to resist the dance floor when High Key are on stage! This lively and slick 4-piece, comprised of some of the UK\'s best musicians, will light up your night with their show-stopping sets of pop, rock, 80s, soul, RnB, funk and indie!\\r\\n\\r\\nHigh Key have been performing for over 10 years across both the UK and Europe, perfecting their fresh and stylish show. Their feel-good party playlist features the top artists from throughout the decades. You\'ll be dancing to 00s and 10s hits from Ed Sheeran, Walk The Moon and Dua Lipa, 90s and 00s tunes from Alphabet, Beyonc\\u00e9, P!nk and Arctic Monkeys PLUS classic 70s and 80s favourites by Blondie, Queen, Whitney Houston and Bon Jovi. What a night you\'ll have!\"', '2021-02-27 19:49:00', '2021-02-27 19:49:00'),
(10, 19, '5 Piece Band/\nMale Lead Vocalist/\nVocals, Guitars, Keys, Bass and Drums/\nIndie, Pop and Rock Covers/\nSurrey based, available nationwide/\n2x60 minute performances as standard/\nHappy to learn first dance or special request/\nPlaylist DJ Service Included As Standard/\nHigh quality and fully PAT tested PA and lighting/\nOption to add 2,3,4,5 piece acoustic set/\nGlowing references from many happy clients/', '\"\\\"\\\\\\\"The Passengers are an extremely talented 5-piece function band with a rock and indie edge.\\\\\\\\r\\\\\\\\n\\\\\\\\r\\\\\\\\nIf you\'re looking for a band to get the room rocking into the early hours with authentic covers of songs bfffffffffy artists like Kasabian, Arctic Monkeys, Foo Fighters, Blink 182, Red Hot Chilli Peppers and The Killers, then The Passengers are the band for you. Mixing things up to please a wider range of guests, The Passengers also cover rock and pop songs from the 60s to the modern day by acts including The Rolling Stones, The Beatles, Oasis and Fleetwood Mac.\\\\\\\\r\\\\\\\\n\\\\\\\\r\\\\\\\\nThis Surrey wedding band, party band and corporate event band are vastly experienced, with over five years on the road together performing at numerous events. The Passengers are made up of outstanding musicians with impressive musical CVs; individually, members of the band have received radio play on Absolute Radio and BBC Radio 2, reached number 3 in the charts and played sold out arenas on a tour of Japan.\\\\\\\\r\\\\\\\\n\\\\\\\\r\\\\\\\\nFeaturing both male and female lead vocals accompanied by guitar, keys, synth, bass, drums, banjo and double bass, The Passengers can make their mark on any song.\\\\\\\"\\\"\"', '2021-02-27 20:51:42', '2021-03-14 17:39:50');

-- --------------------------------------------------------

--
-- Table structure for table `artist_music`
--

CREATE TABLE `artist_music` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `artist_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `url` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `artist_music`
--

INSERT INTO `artist_music` (`id`, `artist_id`, `url`, `title`, `created_at`, `updated_at`) VALUES
(2, 9, '1609343464.mp3', 'TEST 111', '2020-12-30 15:51:04', '2020-12-30 15:51:04'),
(3, 9, '1609797700.mp3', 'TEST 222', '2021-01-04 22:01:40', '2021-01-04 22:01:40'),
(12, 15, '1614451272.mp3', 'test songs', '2021-02-27 18:41:12', '2021-02-27 18:41:12'),
(13, 15, '1614451297.mp3', 'our\'s love story', '2021-02-27 18:41:37', '2021-02-27 18:41:37'),
(14, 16, '1614452930.mp3', 'test songs', '2021-02-27 19:08:50', '2021-02-27 19:08:50'),
(15, 16, '1614452946.mp3', 'test songs', '2021-02-27 19:09:06', '2021-02-27 19:09:06'),
(16, 16, '1614452956.mp3', 'our\'s love story', '2021-02-27 19:09:16', '2021-02-27 19:09:16'),
(17, 17, '1614453817.mp3', 'Song\'s mo', '2021-02-27 19:23:37', '2021-02-27 19:23:37'),
(18, 17, '1614453835.mp3', 'Crazy girl', '2021-02-27 19:23:55', '2021-02-27 19:23:55'),
(19, 18, '1614454985.mp3', 'test songs', '2021-02-27 19:43:05', '2021-02-27 19:43:05'),
(20, 18, '1614454994.mp3', 'our\'s love story', '2021-02-27 19:43:14', '2021-02-27 19:43:14'),
(21, 19, '1614456373.mp3', 'Song\'s mo', '2021-02-27 20:06:13', '2021-02-27 20:06:13'),
(22, 19, '1614456411.mp3', 'our\'s love story', '2021-02-27 20:06:51', '2021-02-27 20:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `artist_repertories`
--

CREATE TABLE `artist_repertories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `artist_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `janre` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `artist_repertories`
--

INSERT INTO `artist_repertories` (`id`, `artist_id`, `janre`, `content`, `created_at`, `updated_at`) VALUES
(4, 9, 'SOUL', '\"hello world - test song 1\\nhello world - test song 2\\nhello world - test song 3\"', '2020-12-30 15:54:28', '2021-01-05 17:36:42'),
(6, 9, 'TEST', '\"hello world - test song 1\\r\\nhello world - test song 2\\r\\nhello world - test song 3\"', '2021-01-04 22:03:39', '2021-01-04 22:03:39'),
(12, 15, '00\'S TO PRESENT', '\"Valerie - The Zutons\\/Amy Winehouse\\r\\nSex On Fire - King Of Leon\\r\\nHey Ya - Outkast\\r\\nBack For Good - Take That\\r\\nSmooth - Santana\\r\\nMr Brightside - The Killers\\r\\nThis Love - Maroon 5\\r\\nHungry Heart - Bruce Springsteen\\r\\nI Just Haven\'t Met You Yet - Michael Buble\\r\\nEverything - Michael Buble\\r\\nLocked Out Of Heaven - Bruno Mars\\r\\nThinking Out Loud - Ed Sheeran\\r\\nGet Lucky - Pharrell\\r\\nAll About That Bass - Meghan Trainer\\r\\nViva La Vida - Coldplay\\r\\nSugar - Maroon 5 Hey Ho - The Lumineers\\r\\nShut up and dance - Walk the Moon\\r\\nI Wont Give Up - Jason Mraz\\r\\nGrow Old With Me - Tom Odell\\r\\nLast Request - Paolo Nutini\\r\\nShe\\u2019s The One - Robbie Williams\\r\\nShe Will Be Loved - Maroon 5\\r\\nYou\\u2019ve Got The Love - Florence & The Machine\\r\\nAll of me - John Legend\\r\\nEverything - Michael Buble\\r\\nLittle Lion Man - Mumford & Sons\\r\\nPencil Full of Lead - Paolo Nutini\\r\\nSing - Ed Sheeran\\r\\nSenorita - Justin Timberlake\\r\\nWake Me Up - Avicii\\r\\nMake Luv - Junior Jack\\r\\nWorld Hold On - Bob Sinclair\"', '2021-02-27 18:59:39', '2021-02-27 18:59:39'),
(13, 15, '50\'S AND 60\'S', '\"Build Me Up Buttercup - The Foundations\\r\\nI Can\'t Get No (Satisfaction) - The Rolling Stones\\r\\nHit The Road Jack - Ray Charles\\r\\nTracks Of My Tears - Smokey Robinson\\r\\nMy Girl - The Temptations\\r\\nStand By Me - Ben E King\\r\\nPinball Wizard - The Who\\r\\nHound Dog - Elvis\\r\\nSherry Baby - Frankie Valli & The Four Seasons\\r\\nI Want You Back - The Jackson 5\\r\\nI Feel Fine - The Beatles \\r\\nSaw Her Standing There - The Beatles\\r\\nCome Together - The Beatles\\r\\nTwist And Shout - The Beatles \\r\\nTwist Again - Chubby Checker\\r\\nBrown Eyed Girl - Van Morrison\\r\\nRunaround Sue - Dion\\r\\nWonderful World - Sam Cooke\\r\\nBe my Baby - The Ron nets\\r\\nYour Love Keeps Lifting me - Jackie Wilson\\r\\nCan\\u2019t Help Falling in Love - Elvis\\r\\nIt\\u2019s Nit Unusual - Tom Jones\\r\\nCan\\u2019t Take My Eyes Off Of You - Frankie Valli\\r\\nJailhouse Rock - Elvis\\r\\nGreat Balls Of Fire - Jerry Lee Lewis\\r\\nJohnny B Good - Chuck Berry\\r\\nRock Around The Clock - Bill Haley\"', '2021-02-27 19:01:10', '2021-02-27 19:01:10'),
(14, 16, 'MOTOWN', '\"Higher and Higher\\r\\nI want you back - Jackson 5\\r\\nABC - Jackson 5\\r\\nDancing in the street\\r\\nHow sweet it is\\r\\nAin\\u2019t No Mountain\\r\\nFor once in my life\\r\\nSigned sealed delivered\\r\\nMy girl\\r\\nReach out\\r\\nSay a little prayer\\r\\nStoned love\\r\\nSatisfaction\\r\\nMove on up\\r\\nSuperstition\\r\\nGet ready\\r\\nCan\\u2019t hurry love\\r\\nKnock on wood\\r\\nProud Mary\\r\\nRiver deep mountain high\"', '2021-02-27 19:12:36', '2021-02-27 19:12:36'),
(15, 16, '60S & 70S SOUL', '\"Let\\u2019s stay together\\r\\nNatural woman\\r\\nRespect\\r\\nSon of a preacher man\\r\\nI feel good\\r\\nThink\\r\\nSoul man\\r\\nAs\\r\\nSir duke\\r\\nI wish\\r\\nMustang sally\\r\\nStand by me\"', '2021-02-27 19:13:02', '2021-02-27 19:13:02'),
(16, 17, 'FUNK, SOUL AND 80\'S GROOVE', '\"And The Beat Goes On \\u2013 The Whispers (requires male vocal)\\r\\nAin\\u2019t Nobody \\u2013 Chaka Khan\\r\\nAll This Love That I\\u2019m Giving \\u2013 Gwen Mcrae\\r\\nBrick House \\u2013 Commodores\\r\\nForget Me Nots \\u2013 Patrice Rushen\\r\\nGet Down On It \\u2013 Kool & The Gang\\r\\nGet Down Saturday Night - Oliver Cheatham\\r\\nGet Up Offa That Thing \\u2013 James Brown\\r\\nGimme The Night - George Benson\\r\\nGoing Back To My Roots - Oddyssey\\r\\nGot to Be Real - Cheryl Lynn\\r\\nI Found Lovin \\u2013 The Fatback Band\\r\\nJammin - Bob Marley\\r\\nJungle Boogie \\u2013 Kool & The Gang (requires trumpet + male vocal)\\r\\nKeep The Fire Burning - Gewn McCrae\\r\\nKiss \\u2013 Prince\\r\\nLadies Night - Kool & The Gang\\r\\nOutstanding - The Gap Band\\r\\nPapa\\u2019s Got A Brand New Bag \\u2013 James Brown (requires trumpet + male vocal)\\r\\nPick Up The Pieces \\u2013 Average White Band (requires trumpet)\\r\\nPlay That Funky Music \\u2013 Wild Cherry\\r\\nPYT \\u2013 Michael Jackson\\r\\nNever Too Much \\u2013 Luther Vandross\\r\\nRock With You \\u2013 Michael Jackson\\r\\nSomebody Elses Guy \\u2013 Jocelyn Brown\\r\\nTeardrops \\u2013 Womack & Womack\\r\\nThinking Of You \\u2013 Chic\"', '2021-02-27 19:26:55', '2021-02-27 19:26:55'),
(17, 18, '10\'S - PRESENT', '\"Bruno Mars \\u2013 Just The Way You Are\\r\\nBruno Mars \\u2013 Treasure\\r\\nCee Lo Green - Forget You\\r\\nClean Bandit \\u2013 Rather Be\\r\\nDaft Punk \\u2013 Get Lucky\\r\\nDua Lipa - New Rules\\r\\nEd Sheeran - Thinking Out Loud\\r\\nEd Sheeran - Perfect\\r\\nEd Sheeran - Shape Of You\\r\\nJess Glynne \\u2013 Hold My Hand\"', '2021-02-27 19:47:01', '2021-02-27 19:47:01'),
(18, 18, '70\'S & 80\'S HITS', '\"ABBA \\u2013 Dancing Queen\\r\\nABBA \\u2013 Mamma Mia\\r\\nAHA \\u2013 Take On Me\\r\\nThe Beatles \\u2013 Hey Jude\\r\\nBlondie - One Way Or Another\\r\\nBon Jovi - Livin\\u2019 On A Prayer\\r\\nBryan Adams - Summer of 69\\r\\nChaka Khan - Aint\\u2019 Nobody\\r\\nChuck Berry \\u2013 Johnny B. Goode\\r\\nDirty Dancing \\u2013 Time Of My Life\\r\\nDolly Parton \\u2013 9 \\u2013 5\\r\\nFleetwood Mac \\u2013 Everywhere\\r\\nFunktown America - Celebrate Good Times\\r\\nGrease- You\\u2019re The One That I Want\\r\\nHuey Lewis \\u2013 The Power Of Love\"', '2021-02-27 19:47:20', '2021-02-27 19:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `artist_videos`
--

CREATE TABLE `artist_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `artist_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `url` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `artist_videos`
--

INSERT INTO `artist_videos` (`id`, `artist_id`, `url`, `primary`, `created_at`, `updated_at`) VALUES
(5, 9, 'https://www.youtube.com/watch?v=IqzxUXo_h4I', 1, '2020-12-30 15:41:07', '2020-12-30 15:41:30'),
(6, 9, 'https://www.youtube.com/watch?v=iF6xjg72CV4', 0, '2020-12-30 15:41:24', '2020-12-30 15:41:30'),
(7, 9, 'https://www.youtube.com/watch?v=u8c00DdxBcQ', 0, '2020-12-30 15:41:42', '2020-12-30 15:41:42'),
(8, 9, 'https://www.youtube.com/watch?v=Z6cLM52KrM4', 0, '2020-12-30 15:42:40', '2020-12-30 15:42:40'),
(9, 9, 'https://www.youtube.com/watch?v=JVuuatjHGnY', 0, '2021-01-04 21:59:39', '2021-01-04 21:59:39'),
(12, 15, 'https://www.youtube.com/watch?v=JI1At0_-po4', 0, '2021-02-27 18:29:58', '2021-02-27 18:30:31'),
(13, 15, 'https://www.youtube.com/watch?v=d72xqMZ94-Y', 1, '2021-02-27 18:30:22', '2021-02-27 18:30:31'),
(14, 16, 'https://www.youtube.com/watch?v=PKfdYhscZJk', 0, '2021-02-27 19:06:09', '2021-02-27 19:06:09'),
(15, 16, 'https://www.youtube.com/watch?v=JI1At0_-po4', 0, '2021-02-27 19:06:26', '2021-02-27 19:06:26'),
(16, 17, 'https://www.youtube.com/watch?v=JI1At0_-po4', 0, '2021-02-27 19:16:21', '2021-02-27 19:16:21'),
(17, 17, 'https://www.youtube.com/watch?v=PKfdYhscZJk', 0, '2021-02-27 19:16:25', '2021-02-27 19:16:25'),
(18, 18, 'https://www.youtube.com/watch?v=PKfdYhscZJk', 0, '2021-02-27 19:39:06', '2021-02-27 19:39:06'),
(19, 18, 'https://www.youtube.com/watch?v=d72xqMZ94-Y', 0, '2021-02-27 19:39:10', '2021-02-27 19:39:10'),
(20, 19, 'https://www.youtube.com/watch?v=PKfdYhscZJk', 0, '2021-02-27 19:58:31', '2021-02-27 19:58:31'),
(21, 19, 'https://www.youtube.com/watch?v=d72xqMZ94-Y', 0, '2021-02-27 19:58:38', '2021-02-27 19:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `title`, `description`, `img`, `category_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'World Music Stage', '<b>Who were the most demanded musicians in 2019?</b>', 'uploads/1614131995.jpg', 1, 1, '2021-02-24 01:59:55', '2021-02-24 01:59:55');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_number` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_location_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `venue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `status_id` int(11) NOT NULL,
  `paid_datetime` datetime DEFAULT NULL,
  `datetime1` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `booking_number`, `price_location_id`, `name`, `email`, `tel`, `event_id`, `venue`, `datetime`, `other`, `amount`, `status_id`, `paid_datetime`, `datetime1`, `created_at`, `updated_at`) VALUES
(6, 'TME0006', 10, 'birthday', 'egortokarb@gmail.com', '111111', 1, 'ggggg', '02/23/2021 06:30 PM', 'gggggg', 440.00, 1, NULL, '2021-02-23 18:30:00', '2021-02-22 09:35:50', '2021-02-22 09:35:50'),
(7, 'TME0007', 10, 'birthday', 'alenakdadasevich@gmail.com', '111111', 1, 'ggggg', '02/23/2021 06:30 PM', 'gggggg', 440.00, 1, NULL, '2021-02-23 18:30:00', '2021-02-22 09:37:04', '2021-02-22 09:37:04'),
(8, 'TME0008', 11, 'Denis P', 'alenakdadasevich@gmail.com', '65575464', 3, 'aaaaaaaaaa', '02/25/2021 10:30 AM', 'aaaaaaaaaa', 590.00, 1, NULL, '2021-02-25 10:30:00', '2021-02-22 09:41:01', '2021-02-22 09:41:01'),
(9, 'TME0009', 10, 'birthday', 'plfreelancer003@gmail.com', '+4587628475', 1, 'bv', '02/25/2021 04:00 AM', 'bb', 590.00, 1, NULL, '2021-02-25 04:00:00', '2021-02-23 19:09:36', '2021-02-23 19:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `booking_addons`
--

CREATE TABLE `booking_addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `price_addon_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'uncategorized', NULL, '2020-12-20 05:57:45', '2020-12-20 05:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `category_home_page`
--

CREATE TABLE `category_home_page` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `category_home_page_id` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_home_page`
--

INSERT INTO `category_home_page` (`id`, `name`, `category_home_page_id`, `url`, `created_at`, `updated_at`) VALUES
(1, 'LED ELECTRIC STRINGS', 1, '1615911486.jpg', '2021-03-16 14:18:06', '2021-03-16 14:18:06'),
(2, 'DJs', 1, '1615911486.jpg', '2021-03-16 14:18:06', '2021-03-16 14:18:06'),
(3, 'BOLLYWOOD ENTERTAINMENT', 1, '1615911486.jpg', '2021-03-16 14:18:06', '2021-03-16 14:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `client_reviews`
--

CREATE TABLE `client_reviews` (
  `id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `review_order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_reviews`
--

INSERT INTO `client_reviews` (`id`, `title`, `review`, `review_order`, `created_at`, `updated_at`) VALUES
(3, 'saaaaaaaaa', 'aadddddddddd', 944, '2021-03-14 17:59:50', '2021-03-14 18:07:02'),
(4, 'Eman', '5555', 1844, '2021-03-14 18:00:48', '2021-03-14 18:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'England', '2020-12-20 05:57:43', '2020-12-20 05:57:43'),
(2, 'Scotland', '2020-12-20 05:57:43', '2020-12-20 05:57:43'),
(3, 'Wales', '2020-12-20 05:57:43', '2020-12-20 05:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `slug`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'wedding', 'wedding', 1, '2020-12-20 05:57:44', '2020-12-20 05:57:44'),
(2, 'party', 'party', 1, '2020-12-20 05:57:44', '2020-12-20 05:57:44'),
(3, 'birthday', 'birthday', 1, '2021-02-20 17:20:47', '2021-02-20 17:20:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `find_artist_page`
--

CREATE TABLE `find_artist_page` (
  `id` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `title` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `find_artist_page`
--

INSERT INTO `find_artist_page` (`id`, `content`, `title`, `created_at`, `updated_at`) VALUES
(1, '[\"<p>asdfrewq<\\/p>\",\"<p>asddddddd<\\/p>\"]', 'asd', '2021-03-15 14:16:55', '2021-03-15 14:16:55'),
(2, NULL, 'Eman', '2021-03-15 15:26:52', '2021-03-15 15:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `footer_page`
--

CREATE TABLE `footer_page` (
  `id` int(11) NOT NULL,
  `copyrights` text NOT NULL,
  `facebook` text NOT NULL,
  `twitter` text NOT NULL,
  `youtube` text NOT NULL,
  `instagram` text NOT NULL,
  `google` text NOT NULL,
  `linkedin` text NOT NULL,
  `Pinterest` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `footer_page`
--

INSERT INTO `footer_page` (`id`, `copyrights`, `facebook`, `twitter`, `youtube`, `instagram`, `google`, `linkedin`, `Pinterest`, `created_at`, `updated_at`) VALUES
(1, 'asd', 'asd', 'https://twitter.com/oshyoshin', 'asd', 'https://www.instagram.com/eman.mohamed.k/', 'asd', 'asd', 'asd', '2021-03-14 18:53:02', '2021-03-14 18:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `home_page`
--

CREATE TABLE `home_page` (
  `id` int(11) NOT NULL,
  `main_image` text DEFAULT NULL,
  `main_title` text DEFAULT NULL,
  `main_subtitle` text DEFAULT NULL,
  `tag_line` text DEFAULT NULL,
  `top_content_title` text DEFAULT NULL,
  `top_content` text DEFAULT NULL,
  `image_content` text DEFAULT NULL,
  `content_title` text DEFAULT NULL,
  `extra_content_title` text DEFAULT NULL,
  `extra_content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_page`
--

INSERT INTO `home_page` (`id`, `main_image`, `main_title`, `main_subtitle`, `tag_line`, `top_content_title`, `top_content`, `image_content`, `content_title`, `extra_content_title`, `extra_content`, `created_at`, `updated_at`) VALUES
(1, '1615911486.png', 'qweq', 'qw', 'qw', 'wq', '<p>qw</p>', '1615911486.jpg', 'qwe', 'qw', '<p>qw</p>', '2021-03-16 14:18:06', '2021-03-16 14:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `janres`
--

CREATE TABLE `janres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `slug`, `country_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'London', 'london', 1, 1, '2020-12-20 05:57:44', '2020-12-20 05:57:44'),
(2, 'Manchester', 'manchester', 1, 1, '2020-12-20 05:57:44', '2020-12-20 05:57:44'),
(3, 'Birmingham', 'birmingham', 1, 1, '2020-12-20 05:57:44', '2021-01-31 13:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_num` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quoteID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `draft` tinyint(1) NOT NULL DEFAULT 1,
  `trashed` tinyint(1) NOT NULL DEFAULT 0,
  `event_date` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `owner` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `content`, `subject`, `from`, `to`, `name`, `tel`, `quoteID`, `checked`, `draft`, `trashed`, `event_date`, `file`, `created_at`, `updated_at`, `owner`) VALUES
(8, 'yes, you already have the info we will use the same design as Admin, we will have the same sections as the entertainment nation has plus we will add Booking and Messages to it... we also need to look into quotes as client really wants to use these.... For now please make sure in admin everything is done what I sent in previous documents, those ponts I wrote today here (settings, video) and mainly arrange so we can test messages. I can give you server email account details.', 'TEST EMAIL2', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1608594069.jpg', '2020-12-21 23:41:09', '2020-12-21 23:41:09', NULL),
(14, 'Lorem Ipsum<span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br><br></span>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br>', 'HELLO WORLD', 'peter@msbx.co.uk', 'admin@topmusicevents.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1609798283.jpg', '2021-01-04 22:11:23', '2021-01-04 22:11:23', 1),
(17, '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">solo</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">05/10/2021 12:00 AM</span>\n        <span class=\"label label-success\">John Doe</span>\n        <span class=\"label label-success\">5654654465465</span>\n        <br><br>\n        <span>TEST TEST</span>', 'topmusicevents.co.uk', 'krenkson@gmail.com', 'admin@topmusicevents.co.uk', NULL, NULL, '', 1, 1, 0, NULL, NULL, '2021-01-13 15:16:26', '2021-01-13 15:16:43', 0),
(18, '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">solo</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">05/05/2021 12:00 AM</span>\n        <span class=\"label label-success\">John Doe</span>\n        <span class=\"label label-success\">88888888888</span>\n        <br><br>\n        <span>HELLO WORLD</span>', 'topmusicevents.co.uk', 'peter@msbx.co.uk', 'admin@topmusicevents.co.uk', NULL, NULL, '', 1, 1, 0, NULL, NULL, '2021-01-26 14:41:10', '2021-02-19 17:38:06', 0),
(19, '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">02/25/2021 10:34 PM</span>\n        <span class=\"label label-success\">mykyta</span>\n        <span class=\"label label-success\">87878</span>\n        <br><br>\n        <span>hello</span>', 'topmusicevents.co.uk', 'admin@topmusicevents.co.uk', 'admin@topmusicevents.co.uk', NULL, NULL, '', 1, 1, 0, NULL, NULL, '2021-02-19 13:34:18', '2021-02-19 13:35:33', 0),
(20, '<span class=\"label label-info\">party</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">Manchester</span>\n        <span class=\"label label-info\">02/01/2021 2:28 AM</span>\n        <span class=\"label label-success\">111</span>\n        <span class=\"label label-success\">111111</span>\n        <br><br>\n        <span>rhytrjhryjdr</span>', 'topmusicevents.co.uk', 'egortokarb@gmail.com', 'admin@topmusicevents.co.uk', NULL, NULL, '', 1, 1, 0, NULL, NULL, '2021-02-19 17:28:49', '2021-02-20 17:16:32', 0),
(21, '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">solo</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">02/27/2021 11:41 AM</span>\n        <span class=\"label label-success\">Alena</span>\n        <span class=\"label label-success\">+4587628475</span>\n        <br><br>\n        <span>I need solo for my wedding.\r\nCan you provide a solo fast and quality?</span>', 'topmusicevents.co.uk', 'alenakdadasevich@gmail.com', 'admin@topmusicevents.co.uk', NULL, NULL, '', 1, 1, 0, NULL, NULL, '2021-02-23 02:41:45', '2021-02-23 02:42:59', 0),
(22, '<span class=\"label label-info\">party</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">02/01/2021 2:28 AM</span>\n        <span class=\"label label-success\">Alena</span>\n        <span class=\"label label-success\">+4587628475</span>\n        <br><br>\n        <span>fddgdfgdfgsgdfgdfg</span>', 'topmusicevents.co.uk', 'alenakdadasevich@gmail.com', 'admin@topmusicevents.co.uk', NULL, NULL, '', 1, 1, 0, NULL, NULL, '2021-02-23 02:52:48', '2021-02-23 02:57:33', 0),
(23, '<span class=\"label label-info\">party</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">02/01/2021 2:28 AM</span>\n        <span class=\"label label-success\">Alena</span>\n        <span class=\"label label-success\">+4587628475</span>\n        <br><br>\n        <span>fddgdfgdfgsgdfgdfg</span>', 'topmusicevents.co.uk', 'alenakdadasevich@gmail.com', 'admin@topmusicevents.co.uk', NULL, NULL, '', 1, 1, 0, NULL, NULL, '2021-02-23 02:53:37', '2021-02-23 02:57:38', 0),
(24, 'fddgdfgdfgsgdfgdfg', 'Quote', 'admin@topmusicevents.co.uk', '11', NULL, NULL, '', 0, 0, 0, NULL, '', '2021-02-25 13:10:28', '2021-02-25 13:10:28', 1),
(25, 'fddgdfgdfgsgdfgdfg', 'Quote', 'admin@topmusicevents.co.uk', '11', NULL, NULL, '', 0, 0, 0, NULL, '', '2021-02-25 13:10:28', '2021-02-25 13:10:28', 0),
(26, '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">Manchester</span>\n        <span class=\"label label-info\">24/03/2021</span>\n        <span class=\"label label-success\">eman</span>\n        <span class=\"label label-success\">0125147</span>\n        <br><br>\n        <span>asd</span>', 'topmusicevents.co.uk', 'info@topmusicevents.co.uk', 'admin@topmusicevents.co.uk', 'eman', '0125147', '', 1, 1, 0, '24/03/2021', NULL, '2021-03-16 14:54:34', '2021-03-17 08:37:40', 0),
(27, NULL, 'Pending Input', 'emahmoud@beltonefinancial.com', NULL, NULL, '01152329789', '', 0, 0, 0, NULL, NULL, NULL, NULL, 1),
(28, NULL, 'Pending Input', 'eman.mohamed.ka@gmail.com', NULL, NULL, '01152329789', '', 1, 0, 0, NULL, NULL, NULL, '2021-03-17 05:43:35', 1),
(29, 'eeeeeeee', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966207.jpg', '2021-03-17 07:30:07', '2021-03-17 07:30:07', 1),
(30, 'eeeeeeee', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966207.jpg', '2021-03-17 07:30:07', '2021-03-17 07:30:07', 1),
(31, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 1, 0, 0, NULL, '', '2021-03-17 07:33:25', '2021-03-17 08:02:56', 1),
(32, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966430.jpg', '2021-03-17 07:33:50', '2021-03-17 07:33:50', 1),
(33, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966430.jpg', '2021-03-17 07:33:50', '2021-03-17 07:33:50', 1),
(34, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966528.jpg', '2021-03-17 07:35:28', '2021-03-17 07:35:28', 1),
(35, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966528.jpg', '2021-03-17 07:35:28', '2021-03-17 07:35:28', 1),
(36, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 1, 0, 0, NULL, '1615966534.jpg', '2021-03-17 07:35:34', '2021-03-17 08:03:04', 1),
(37, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966534.jpg', '2021-03-17 07:35:34', '2021-03-17 07:35:34', 1),
(38, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966578.jpg', '2021-03-17 07:36:18', '2021-03-17 07:36:18', 1),
(39, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966578.jpg', '2021-03-17 07:36:18', '2021-03-17 07:36:18', 1),
(40, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966603.jpg', '2021-03-17 07:36:43', '2021-03-17 07:36:43', 1),
(41, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966603.jpg', '2021-03-17 07:36:43', '2021-03-17 07:36:43', 1),
(42, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966644.jpg', '2021-03-17 07:37:24', '2021-03-17 07:37:24', 1),
(43, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966644.jpg', '2021-03-17 07:37:24', '2021-03-17 07:37:24', 1),
(44, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 1, 0, 0, NULL, '1615966656.jpg', '2021-03-17 07:37:36', '2021-03-17 08:37:33', 1),
(45, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966656.jpg', '2021-03-17 07:37:36', '2021-03-17 07:37:36', 1),
(46, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966822.jpg', '2021-03-17 07:40:22', '2021-03-17 07:40:22', 1),
(47, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966822.jpg', '2021-03-17 07:40:22', '2021-03-17 07:40:22', 1),
(48, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 1, 0, 0, NULL, '1615966823.jpg', '2021-03-17 07:40:23', '2021-03-17 08:00:32', 1),
(49, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966823.jpg', '2021-03-17 07:40:23', '2021-03-17 07:40:23', 1),
(50, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966842.jpg', '2021-03-17 07:40:42', '2021-03-17 07:40:42', 1),
(51, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966842.jpg', '2021-03-17 07:40:42', '2021-03-17 07:40:42', 1),
(52, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966850.jpg', '2021-03-17 07:40:51', '2021-03-17 07:40:51', 1),
(53, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966850.jpg', '2021-03-17 07:40:51', '2021-03-17 07:40:51', 1),
(54, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966862.jpg', '2021-03-17 07:41:02', '2021-03-17 07:41:02', 1),
(55, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966862.jpg', '2021-03-17 07:41:02', '2021-03-17 07:41:02', 1),
(56, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966874.jpg', '2021-03-17 07:41:14', '2021-03-17 07:41:14', 1),
(57, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966874.jpg', '2021-03-17 07:41:14', '2021-03-17 07:41:14', 1),
(58, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966884.jpg', '2021-03-17 07:41:24', '2021-03-17 07:41:24', 1),
(59, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966884.jpg', '2021-03-17 07:41:24', '2021-03-17 07:41:24', 1),
(60, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615966903.jpg', '2021-03-17 07:41:43', '2021-03-17 07:41:43', 1),
(61, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615966903.jpg', '2021-03-17 07:41:43', '2021-03-17 07:41:43', 1),
(62, 'party\r\n        bands\r\n        London\r\n        02/01/2021 2:28 AM\r\n        Alena\r\n        +4587628475\r\n        <br><br>\r\n        fddgdfgdfgsgdfgdfg', 'Pending Input', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615970232.jpg', '2021-03-17 08:37:12', '2021-03-17 08:37:12', 1),
(63, 'party\r\n        bands\r\n        London\r\n        02/01/2021 2:28 AM\r\n        Alena\r\n        +4587628475\r\n        <br><br>\r\n        fddgdfgdfgsgdfgdfg', 'Pending Input', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', NULL, NULL, '', 0, 0, 0, NULL, '1615970296.jpg', '2021-03-17 08:38:16', '2021-03-17 08:38:16', 1),
(64, 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'admin@topmusicevents.co.uk', NULL, NULL, '', 0, 0, 0, NULL, '1615975705.jpg', '2021-03-17 10:08:25', '2021-03-17 10:08:25', 1),
(65, 'I need solo for my wedding.\r\nCan you provide a solo fast and quality?', 'Quote', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', NULL, NULL, 'TMEQ263', 0, 0, 0, '', '', '2021-03-17 12:13:02', '2021-03-17 12:13:02', 1),
(66, 'I need solo for my wedding.\r\nCan you provide a solo fast and quality?', 'Quote', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', NULL, NULL, 'TMEQ80', 0, 0, 0, '', '', '2021-03-17 12:13:44', '2021-03-17 12:13:44', 1),
(67, 'I need solo for my wedding.\r\nCan you provide a solo fast and quality?', 'Quote', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', NULL, NULL, 'TMEQ938', 0, 0, 0, '', '', '2021-03-17 12:15:52', '2021-03-17 12:15:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2000_10_30_000000_create_roles_table', 1),
(2, '2000_10_30_000000_create_statuses_table', 1),
(3, '2000_11_14_211120_create_countries_table', 1),
(4, '2000_11_14_212851_create_parent_acts_table', 1),
(5, '2001_11_13_081446_create_events_table', 1),
(6, '2001_11_13_081832_create_acts_table', 1),
(7, '2001_11_13_093025_create_locations_table', 1),
(8, '2001_11_13_093159_create_addons_table', 1),
(9, '2001_11_15_151256_create_janres_table', 1),
(10, '2002_10_12_000000_create_users_table', 1),
(11, '2002_10_12_100000_create_password_resets_table', 1),
(12, '2003_08_19_000000_create_failed_jobs_table', 1),
(13, '2020_10_30_205139_create_artists_table', 1),
(14, '2020_10_31_064031_create_messages_table', 1),
(15, '2020_11_05_142805_create_artist_videos_table', 1),
(16, '2020_11_05_143010_create_artist_music_table', 1),
(17, '2020_11_05_143234_create_artist_images_table', 1),
(18, '2020_11_05_145717_create_artist_repertories_table', 1),
(19, '2020_11_13_075506_create_price_standard_infos_table', 1),
(20, '2020_11_13_075554_create_price_locations_table', 1),
(21, '2020_11_13_080621_create_price_addons_table', 1),
(22, '2020_11_13_094830_create_bookings_table', 1),
(23, '2020_11_13_094831_create_booking_addons_table', 1),
(24, '2020_11_13_112509_create_pages_table', 1),
(25, '2020_12_14_045813_create_categories_table', 1),
(26, '2020_12_14_050342_create_blogs_table', 1),
(27, '2020_12_18_081113_create_menus_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8 DEFAULT NULL,
  `file` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `url`, `file`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'Faq', 'faq', 'This is faq page.<br>', NULL, NULL, 1, '2020-12-20 06:08:25', '2020-12-20 06:08:25'),
(2, 'title', 'title', '<h2>What is Lorem Ipsum?</h2>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, NULL, 1, '2021-01-12 15:35:33', '2021-01-12 15:35:33'),
(3, 'url', 'url', NULL, NULL, NULL, 1, '2021-03-13 17:58:07', '2021-03-13 17:58:07'),
(4, 'url', 'url', NULL, NULL, NULL, 1, '2021-03-13 17:59:04', '2021-03-13 17:59:04'),
(5, 'Mohamed', 'mohamed', NULL, NULL, NULL, 1, '2021-03-13 18:01:13', '2021-03-13 18:01:13'),
(8, 'test', 'test', NULL, 'https://github.com/emaanmohamed', NULL, 1, '2021-03-13 18:13:05', '2021-03-13 18:13:05'),
(9, 'test', 'test', NULL, 'https://github.com/emaanmohamed', NULL, 1, '2021-03-13 18:14:06', '2021-03-13 18:14:06'),
(10, 'Eman', 'eman', NULL, 'https://github.com/emaanmohamed', NULL, 1, '2021-03-13 18:15:29', '2021-03-13 18:15:29'),
(11, 'Eman', 'eman', NULL, 'https://github.com/emaanmohamed', NULL, 1, '2021-03-13 18:16:10', '2021-03-13 18:16:10'),
(12, 'asdasd', 'asdasd', '<p>asdasd</p>', NULL, NULL, 1, '2021-03-13 20:26:42', '2021-03-13 20:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `parent_acts`
--

CREATE TABLE `parent_acts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `parent_acts`
--

INSERT INTO `parent_acts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'WEDDING BANDS', '2020-12-20 05:57:43', '2021-01-31 12:57:15'),
(2, 'LED ELECTRIC STRINGS', '2020-12-20 05:57:43', '2021-01-31 12:57:34'),
(3, 'CLASSICAL PERFORMERS', '2020-12-20 05:57:43', '2021-01-31 12:57:54'),
(4, 'POP & ROCK', '2020-12-20 05:57:43', '2021-01-31 12:58:14'),
(5, 'SOUL & MOTOWN', '2021-01-12 16:38:48', '2021-01-31 12:58:38'),
(6, 'JAZZ BANDS', '2021-01-12 16:38:59', '2021-01-31 12:58:53'),
(7, 'DJs', '2021-01-31 12:55:44', '2021-01-31 12:55:44'),
(8, 'STRINGS', '2021-01-31 12:56:10', '2021-01-31 12:59:09'),
(9, 'SAXOPHONISTS', '2021-01-31 12:56:31', '2021-01-31 12:59:28'),
(10, 'PIANISTS', '2021-01-31 12:56:59', '2021-01-31 12:56:59'),
(11, 'ACOUSTIC & FOLK', '2021-01-31 13:00:38', '2021-01-31 13:00:38'),
(12, 'BOLLYWOOD ENTERTAINMENT', '2021-01-31 13:05:25', '2021-01-31 13:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `price_addons`
--

CREATE TABLE `price_addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `artist_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `price_addons`
--

INSERT INTO `price_addons` (`id`, `artist_id`, `type`, `price`, `created_at`, `updated_at`) VALUES
(2, 9, 'extra songs', '150', '2020-12-30 15:52:39', '2020-12-30 15:52:39'),
(3, 9, 'extra singer', '300', '2020-12-30 15:52:50', '2020-12-30 15:52:50'),
(8, 15, 'Extra Song', '1000', '2021-02-27 18:56:13', '2021-02-27 18:56:13'),
(9, 15, 'Extra Bands', '1200', '2021-02-27 18:56:27', '2021-02-27 18:56:27'),
(10, 15, 'ADDED KEYBOARD', '338', '2021-02-27 18:56:43', '2021-02-27 18:56:43'),
(11, 16, '7 PIECE LINE UP (ADDS KEYS AND TRUMPET)', '810', '2021-02-27 19:11:33', '2021-02-27 19:11:33'),
(12, 16, 'MANNED DJ SERVICE (1AM CURFEW)', '270', '2021-02-27 19:11:44', '2021-02-27 19:11:44'),
(13, 17, 'Extra Song', '240', '2021-02-27 19:25:50', '2021-02-27 19:25:50'),
(14, 17, 'ADDED KEYBOARD', '500', '2021-02-27 19:25:58', '2021-02-27 19:25:58'),
(15, 18, 'Extra Bands', '456', '2021-02-27 19:45:55', '2021-02-27 19:45:55'),
(16, 18, 'MANNED DJ SERVICE (1AM CURFEW)', '650', '2021-02-27 19:46:05', '2021-02-27 19:46:05'),
(17, 19, 'ADDED KEYBOARD', '1250', '2021-02-27 20:07:27', '2021-02-27 20:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `price_locations`
--

CREATE TABLE `price_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `artist_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `price` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `price_locations`
--

INSERT INTO `price_locations` (`id`, `artist_id`, `location_id`, `price`, `created_at`, `updated_at`) VALUES
(10, 9, 1, '290', '2020-12-30 15:52:20', '2020-12-30 15:52:20'),
(11, 9, 2, '290', '2020-12-30 15:52:20', '2020-12-30 15:52:20'),
(12, 9, 3, '290', '2020-12-30 15:52:20', '2020-12-30 15:52:20'),
(22, 15, 1, '1500', '2021-02-27 18:57:02', '2021-02-27 18:57:02'),
(23, 15, 2, '1900', '2021-02-27 18:57:02', '2021-02-27 18:57:02'),
(24, 15, 3, '1300', '2021-02-27 18:57:02', '2021-02-27 18:57:02'),
(25, 16, 1, '580', '2021-02-27 19:12:02', '2021-02-27 19:12:02'),
(26, 16, 2, '690', '2021-02-27 19:12:02', '2021-02-27 19:12:02'),
(27, 16, 3, '1020', '2021-02-27 19:12:02', '2021-02-27 19:12:02'),
(28, 17, 1, '542', '2021-02-27 19:26:10', '2021-02-27 19:26:10'),
(29, 17, 2, '151', '2021-02-27 19:26:10', '2021-02-27 19:26:10'),
(30, 17, 3, '745', '2021-02-27 19:26:10', '2021-02-27 19:26:10'),
(31, 18, 1, '890', '2021-02-27 19:46:19', '2021-02-27 19:46:19'),
(32, 18, 2, '786', '2021-02-27 19:46:19', '2021-02-27 19:46:19'),
(33, 18, 3, '900', '2021-02-27 19:46:19', '2021-02-27 19:46:19'),
(34, 19, 1, '774', '2021-02-27 20:07:41', '2021-02-27 20:07:41'),
(35, 19, 2, '455', '2021-02-27 20:07:41', '2021-02-27 20:07:41'),
(36, 19, 3, '1801', '2021-02-27 20:07:41', '2021-02-27 20:07:41');

-- --------------------------------------------------------

--
-- Table structure for table `price_standard_infos`
--

CREATE TABLE `price_standard_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `artist_id` bigint(20) UNSIGNED NOT NULL,
  `length` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lineup` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `price_standard_infos`
--

INSERT INTO `price_standard_infos` (`id`, `artist_id`, `length`, `time`, `lineup`, `created_at`, `updated_at`) VALUES
(2, 9, 'Usually just 1 hour,\r\nwe can do 2 hours', 'we need just 30min no time check', 'TBA', '2020-12-30 15:53:59', '2020-12-30 15:53:59'),
(5, 15, 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 or 3x40 minute sets of live performance. Approximately 60-75 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings also available.', 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 or 3x40 minute sets of live performance. Approximately 60-75 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings also available.', 'Tam', '2021-02-27 18:55:49', '2021-02-27 18:55:49'),
(6, 16, 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 or 3x40 minute sets of live performance.', 'Approximately 90 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings available.', '5 Piece Band', '2021-02-27 19:11:09', '2021-02-27 19:11:09'),
(7, 17, 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 minute sets of live performance.', 'Approximately 90 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings also available.', 'Female Lead Vocals, Guitar, Keys, Bass and Drums', '2021-02-27 19:25:30', '2021-02-27 19:25:30'),
(8, 18, 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 or 3x40 minute sets of live performance.', 'Approximately 75 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings also available.', 'Tap', '2021-02-27 19:45:22', '2021-02-27 19:45:22'),
(9, 19, 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 minute sets of live performance.', 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 minute sets of live performance.', 'Tip', '2021-02-27 20:07:19', '2021-02-27 20:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `quote_page`
--

CREATE TABLE `quote_page` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quote_page`
--

INSERT INTO `quote_page` (`id`, `title`, `url`, `created_at`, `updated_at`) VALUES
(1, 'asd', '1615811551.jpg', '2021-03-15 10:32:31', '2021-03-15 10:32:31'),
(2, 'asadasd', '1615812049.jpg', '2021-03-15 10:40:49', '2021-03-15 10:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `review` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `artist_id`, `title`, `review`, `created_at`, `updated_at`) VALUES
(1, 1, 'ANTONINA & CHRIS - WEDDING - BRIGHTON', 'The band were absolutely fabulous! They really made the night, they were great fun--}}\r\n{{--                                    and people were dancing till the very end.--}}\r\n{{--                                    Everyone commented on how brilliant they were and how much they\'d enjoyed the music.--}}\r\n{{--                                    10 out of 10 would definitely recommend this band!', '2021-03-10 16:07:36', '2021-03-10 16:07:36'),
(2, 1, 'ANTONINA & CHRIS - WEDDING - BRIGHTON', 'The band were absolutely fabulous! They really made the night, they were great fun--}}\r\n{{--                                    and people were dancing till the very end.--}}\r\n{{--                                    Everyone commented on how brilliant they were and how much they\'d enjoyed the music.--}}\r\n{{--                                    10 out of 10 would definitely recommend this band!', '2021-03-10 16:15:54', '2021-03-10 16:15:54'),
(4, 1, 'title', 'BUDAPEST - GEORGE EZRA\r\nCAN\'T FEEL MY FACE - THE WEEKEND\r\nCAN\'T STOP THE FEELING - JUSTIN TIMBERLAKE\r\nGET LUCKY - DAFT PUNK\r\nHEY BROTHER - AVICII\r\nHO HEY - THE LUMINEERS\r\nHOLD BACK THE RIVER - JAMES BAY\r\nI TOOK A PILL IN IBIZA - MIKE POSNER\r\nI WILL WAIT - MUMFORD & SONS\r\nJUST THE WAY YOU ARE - BRUNO MARS\r\nLIGHTNING BOLT - JAKE BUGG', '2021-03-10 18:51:17', '2021-03-10 18:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name1` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `name1`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'original', '2020-12-20 05:57:43', '2020-12-20 05:57:43'),
(2, 'client', 'top', '2020-12-20 05:57:43', '2020-12-20 05:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name1` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name2` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name3` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name4` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name1`, `name2`, `name3`, `name4`, `created_at`, `updated_at`) VALUES
(1, 'active', 'approved', 'outstanding', 'published', '2020-12-20 05:57:43', '2020-12-20 05:57:43'),
(2, 'pending', 'pending', 'paid', 'draft', '2020-12-20 05:57:43', '2020-12-20 05:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `tel` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `roles` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `status_id`, `tel`, `address`, `remember_token`, `created_at`, `updated_at`, `roles`) VALUES
(1, 'ADMIN', 'admin@topmusicevents.co.uk', NULL, '$2y$10$u5D66p/70hB7g6a/xyyM0OmqDwmZikoVJJUKnpJvTaC23VvnMgVTm', 1, 1, NULL, NULL, 'kI0M0QhojlApYKOvEWmh2CW3iQ9fSxmKT2zYsMGRV9z2sPlWTfY5LlT6Rihv', '2020-12-20 05:57:45', '2020-12-20 05:57:45', NULL),
(3, 'Johnh Doe', 'eman.mohamed.ka@gmail.com', NULL, '$2y$10$v21kXjn9x4MLq4Mr3j00zuLyo1DBWcz9ExEePN73uBxam6rPu4dB2', 2, 1, '222222222', '90 Station Road, E15 London', NULL, '2020-12-20 16:32:27', '2021-02-20 13:18:20', ''),
(7, 'baymax', 'bay@gmail.com', NULL, '$2y$10$zXpX.3SeMkVt8xFV.qV0QemW8/fnA9l8FyIkv7zugOgDOv5xFplu6', 2, 1, '123345456', '1003 apt, St Elizabeth, NY', NULL, '2020-12-24 00:20:05', '2020-12-24 00:20:15', NULL),
(8, 'peter', 'peter@msbx.co.uk', NULL, '$2y$10$ibhjdyft2pTb6Gy8cVhwQ.Z7AfOrH2z/GCKtNi7R76EQVdpfdfife', 2, 1, '2222222222', '5 Sunny View, Higher Newmarket Road', NULL, '2020-12-26 18:24:09', '2020-12-26 18:24:17', NULL),
(9, 'Test Client', 'krenkson@gmail.com', NULL, '$2y$10$3LFplzWUcvkvB62rWDRyBuRSiIFPEYlNRcur9JphiAZUjgRT6Z4/O', 2, 1, '07809671303', '92 Statio Road, N3', NULL, '2020-12-29 20:54:09', '2020-12-29 20:54:14', NULL),
(11, 'Test Client', 'email@email.com', NULL, '$2y$10$p5CIdRhuNblYGqXosX8mVOgpjFUrJlL019uCfcl4lz60.AEiACZ7a', 2, 1, '000000000', '92 Station Road, N3 2SG, London', NULL, '2021-02-19 14:35:36', '2021-02-19 14:35:42', NULL),
(12, 'Egor Tokar', 'egortokarb@gmail.com', NULL, '$2y$10$bcUN3HoygHDX6sr8YppVd.B7vsWGzVL2f3xP2ABTadGj4IqGZfMda', 1, 2, '123456789', 'Ukraine Kyiv', NULL, '2021-02-20 13:19:33', '2021-02-20 13:20:38', 'Dashboard,Our Artist,Messages,Bookings,Event Types,Event Locations,Act Types,Web Pages,Calendar,Latest News,Settings,Support');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acts`
--
ALTER TABLE `acts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `acts_status_id_foreign` (`status_id`) USING BTREE,
  ADD KEY `acts_parent_act_id_foreign` (`parent_act_id`) USING BTREE;

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `artists_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `artists_event_id_foreign` (`event_id`) USING BTREE,
  ADD KEY `artists_act_id_foreign` (`act_id`) USING BTREE,
  ADD KEY `artists_location_id_foreign` (`location_id`) USING BTREE,
  ADD KEY `artists_status_id_foreign` (`status_id`) USING BTREE,
  ADD KEY `artists_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indexes for table `artist_details_page`
--
ALTER TABLE `artist_details_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artist_images`
--
ALTER TABLE `artist_images`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `artist_images_artist_id_foreign` (`artist_id`) USING BTREE;

--
-- Indexes for table `artist_infos`
--
ALTER TABLE `artist_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_info_artist_id_foreign` (`artist_id`);

--
-- Indexes for table `artist_music`
--
ALTER TABLE `artist_music`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `artist_music_artist_id_foreign` (`artist_id`) USING BTREE;

--
-- Indexes for table `artist_repertories`
--
ALTER TABLE `artist_repertories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `artist_repertories_artist_id_foreign` (`artist_id`) USING BTREE;

--
-- Indexes for table `artist_videos`
--
ALTER TABLE `artist_videos`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `artist_videos_artist_id_foreign` (`artist_id`) USING BTREE;

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `blogs_title_unique` (`title`) USING BTREE,
  ADD UNIQUE KEY `blogs_img_unique` (`img`) USING BTREE,
  ADD KEY `blogs_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `blogs_category_id_foreign` (`category_id`) USING BTREE;

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bookings_price_location_id_foreign` (`price_location_id`) USING BTREE,
  ADD KEY `bookings_event_id_foreign` (`event_id`) USING BTREE;

--
-- Indexes for table `booking_addons`
--
ALTER TABLE `booking_addons`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `booking_addons_booking_id_foreign` (`booking_id`) USING BTREE,
  ADD KEY `booking_addons_price_addon_id_foreign` (`price_addon_id`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `category_home_page`
--
ALTER TABLE `category_home_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_reviews`
--
ALTER TABLE `client_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `events_status_id_foreign` (`status_id`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Indexes for table `find_artist_page`
--
ALTER TABLE `find_artist_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_page`
--
ALTER TABLE `footer_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page`
--
ALTER TABLE `home_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `janres`
--
ALTER TABLE `janres`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `locations_status_id_foreign` (`status_id`) USING BTREE,
  ADD KEY `locations_country_id_foreign` (`country_id`) USING BTREE;

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `pages_status_id_foreign` (`status_id`) USING BTREE;

--
-- Indexes for table `parent_acts`
--
ALTER TABLE `parent_acts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indexes for table `price_addons`
--
ALTER TABLE `price_addons`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `price_addons_artist_id_foreign` (`artist_id`) USING BTREE;

--
-- Indexes for table `price_locations`
--
ALTER TABLE `price_locations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `price_locations_location_id_foreign` (`location_id`) USING BTREE,
  ADD KEY `price_locations_artist_id_foreign` (`artist_id`) USING BTREE;

--
-- Indexes for table `price_standard_infos`
--
ALTER TABLE `price_standard_infos`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `price_standard_infos_artist_id_foreign` (`artist_id`) USING BTREE;

--
-- Indexes for table `quote_page`
--
ALTER TABLE `quote_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  ADD KEY `users_role_id_foreign` (`role_id`) USING BTREE,
  ADD KEY `users_status_id_foreign` (`status_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acts`
--
ALTER TABLE `acts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `artist_details_page`
--
ALTER TABLE `artist_details_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `artist_images`
--
ALTER TABLE `artist_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `artist_infos`
--
ALTER TABLE `artist_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `artist_music`
--
ALTER TABLE `artist_music`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `artist_repertories`
--
ALTER TABLE `artist_repertories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `artist_videos`
--
ALTER TABLE `artist_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `booking_addons`
--
ALTER TABLE `booking_addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_home_page`
--
ALTER TABLE `category_home_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client_reviews`
--
ALTER TABLE `client_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `find_artist_page`
--
ALTER TABLE `find_artist_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `footer_page`
--
ALTER TABLE `footer_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_page`
--
ALTER TABLE `home_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `janres`
--
ALTER TABLE `janres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `parent_acts`
--
ALTER TABLE `parent_acts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `price_addons`
--
ALTER TABLE `price_addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `price_locations`
--
ALTER TABLE `price_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `price_standard_infos`
--
ALTER TABLE `price_standard_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `quote_page`
--
ALTER TABLE `quote_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acts`
--
ALTER TABLE `acts`
  ADD CONSTRAINT `acts_parent_act_id_foreign` FOREIGN KEY (`parent_act_id`) REFERENCES `parent_acts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `acts_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `artists`
--
ALTER TABLE `artists`
  ADD CONSTRAINT `artists_act_id_foreign` FOREIGN KEY (`act_id`) REFERENCES `acts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `artists_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `artists_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `artists_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `artists_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `artists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `artist_images`
--
ALTER TABLE `artist_images`
  ADD CONSTRAINT `artist_images_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `artist_infos`
--
ALTER TABLE `artist_infos`
  ADD CONSTRAINT `artist_info_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `artist_music`
--
ALTER TABLE `artist_music`
  ADD CONSTRAINT `artist_music_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `artist_repertories`
--
ALTER TABLE `artist_repertories`
  ADD CONSTRAINT `artist_repertories_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `artist_videos`
--
ALTER TABLE `artist_videos`
  ADD CONSTRAINT `artist_videos_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_price_location_id_foreign` FOREIGN KEY (`price_location_id`) REFERENCES `price_locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_addons`
--
ALTER TABLE `booking_addons`
  ADD CONSTRAINT `booking_addons_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `booking_addons_price_addon_id_foreign` FOREIGN KEY (`price_addon_id`) REFERENCES `price_addons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `locations_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `price_addons`
--
ALTER TABLE `price_addons`
  ADD CONSTRAINT `price_addons_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `price_locations`
--
ALTER TABLE `price_locations`
  ADD CONSTRAINT `price_locations_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `price_locations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `price_standard_infos`
--
ALTER TABLE `price_standard_infos`
  ADD CONSTRAINT `price_standard_infos_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
