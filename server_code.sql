/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : server_code

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-04-20 16:53:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acts
-- ----------------------------
DROP TABLE IF EXISTS `acts`;
CREATE TABLE `acts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_act_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `acts_status_id_foreign` (`status_id`) USING BTREE,
  KEY `acts_parent_act_id_foreign` (`parent_act_id`) USING BTREE,
  CONSTRAINT `acts_parent_act_id_foreign` FOREIGN KEY (`parent_act_id`) REFERENCES `parent_acts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acts_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of acts
-- ----------------------------
INSERT INTO `acts` VALUES ('1', 'solo', 'solo', '1', '1', '2020-12-20 12:57:44', '2020-12-20 12:57:44');
INSERT INTO `acts` VALUES ('2', 'bands', 'bands', '3', '1', '2020-12-20 12:57:44', '2020-12-20 16:04:11');
INSERT INTO `acts` VALUES ('8', 'Test Category', 'test-category', '6', '1', '2021-02-25 22:36:07', '2021-02-25 22:36:07');

-- ----------------------------
-- Table structure for addons
-- ----------------------------
DROP TABLE IF EXISTS `addons`;
CREATE TABLE `addons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of addons
-- ----------------------------

-- ----------------------------
-- Table structure for artists
-- ----------------------------
DROP TABLE IF EXISTS `artists`;
CREATE TABLE `artists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT 1,
  `fullname` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `event_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `act_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `website` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 2,
  `role_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `blocked` enum('active','blocked') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `facebook` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `artists_user_id_foreign` (`user_id`) USING BTREE,
  KEY `artists_event_id_foreign` (`event_id`) USING BTREE,
  KEY `artists_act_id_foreign` (`act_id`) USING BTREE,
  KEY `artists_location_id_foreign` (`location_id`) USING BTREE,
  KEY `artists_status_id_foreign` (`status_id`) USING BTREE,
  KEY `artists_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `artists_act_id_foreign` FOREIGN KEY (`act_id`) REFERENCES `acts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `artists_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `artists_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `artists_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `artists_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `artists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of artists
-- ----------------------------
INSERT INTO `artists` VALUES ('9', '8', 'Doritos', '23', '1', '1', '2', 'www.doritos.com', '1', '1', 'active', 'test.com', 'test.com', 'test.com', 'test.com', 'test.com', '2020-12-30 20:31:27', '2021-01-04 15:00:44');
INSERT INTO `artists` VALUES ('15', '3', 'SKYKNIGHTS', '5', '3', '1', '2', null, '1', '1', 'active', null, null, null, null, null, '2021-02-28 01:28:15', '2021-02-28 02:49:10');
INSERT INTO `artists` VALUES ('16', '1', 'CLIQUE', '7', '1', '1', '2', null, '1', '1', 'active', null, null, null, null, null, '2021-02-28 02:03:39', '2021-02-28 02:49:11');
INSERT INTO `artists` VALUES ('17', '7', 'GROOVE STATION', '12', '2', '2', '8', null, '1', '1', 'active', null, null, null, null, null, '2021-02-28 02:16:00', '2021-02-28 02:49:13');
INSERT INTO `artists` VALUES ('18', '8', 'HIGH KEY', '4', '2', '3', '2', null, '1', '1', 'active', null, null, null, null, null, '2021-02-28 02:38:32', '2021-03-19 18:40:20');
INSERT INTO `artists` VALUES ('20', '1', 'Alexey Grigorev', '100', '1', '2', '1', 'fgs', '1', '1', 'active', null, null, null, null, null, '2021-03-23 10:48:52', '2021-03-23 10:48:58');

-- ----------------------------
-- Table structure for artist_details_page
-- ----------------------------
DROP TABLE IF EXISTS `artist_details_page`;
CREATE TABLE `artist_details_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `title` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of artist_details_page
-- ----------------------------
INSERT INTO `artist_details_page` VALUES ('1', 0x5B223C703E617364323C5C2F703E222C223C703E617364333C5C2F703E222C6E756C6C2C223C703E6173643C5C2F703E225D, 'test', '2021-03-15 22:28:53', '2021-03-15 22:28:53');
INSERT INTO `artist_details_page` VALUES ('2', 0x223C703E71773C5C2F703E22, 'Eman', '2021-03-15 22:29:46', '2021-03-15 22:29:46');

-- ----------------------------
-- Table structure for artist_images
-- ----------------------------
DROP TABLE IF EXISTS `artist_images`;
CREATE TABLE `artist_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `url` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `primary` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `artist_images_artist_id_foreign` (`artist_id`) USING BTREE,
  CONSTRAINT `artist_images_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of artist_images
-- ----------------------------
INSERT INTO `artist_images` VALUES ('8', '9', '1609343089.jpg', 'pageimage', null, null, '2020-12-30 22:44:49', '2020-12-30 22:44:49', null);
INSERT INTO `artist_images` VALUES ('9', '9', '1609343101.jpg', 'repimage', null, null, '2020-12-30 22:45:01', '2020-12-30 22:45:01', null);
INSERT INTO `artist_images` VALUES ('10', '9', '1609343119.png', 'reviewimage', null, null, '2020-12-30 22:45:19', '2020-12-30 22:45:19', null);
INSERT INTO `artist_images` VALUES ('11', '9', '1609343154.jpg', 'galleryimage', 'TEST', 'test', '2020-12-30 22:45:54', '2020-12-30 22:45:54', null);
INSERT INTO `artist_images` VALUES ('12', '9', '1609343173.jpg', 'galleryimage', 'test 2', 'test2', '2020-12-30 22:46:13', '2020-12-30 22:46:13', null);
INSERT INTO `artist_images` VALUES ('14', '9', '1609343224.jpg', 'galleryimage', 'test 4', 'test4', '2020-12-30 22:47:04', '2020-12-30 22:47:04', null);
INSERT INTO `artist_images` VALUES ('38', '15', '1614451083.jpg', 'pageimage', null, null, '2021-02-28 01:38:03', '2021-02-28 01:38:03', null);
INSERT INTO `artist_images` VALUES ('39', '15', '1614451106.jpg', 'repimage', null, null, '2021-02-28 01:38:26', '2021-02-28 01:38:26', null);
INSERT INTO `artist_images` VALUES ('40', '15', '1614451139.jpg', 'reviewimage', null, null, '2021-02-28 01:38:59', '2021-02-28 01:38:59', null);
INSERT INTO `artist_images` VALUES ('41', '15', '1614451182.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 01:39:42', '2021-02-28 01:39:42', null);
INSERT INTO `artist_images` VALUES ('42', '15', '1614451196.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 01:39:56', '2021-02-28 01:39:56', null);
INSERT INTO `artist_images` VALUES ('43', '15', '1614451219.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 01:40:19', '2021-02-28 01:40:19', null);
INSERT INTO `artist_images` VALUES ('44', '15', '1614451249.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 01:40:49', '2021-02-28 01:40:49', null);
INSERT INTO `artist_images` VALUES ('45', '16', '1614452847.jpg', 'pageimage', null, null, '2021-02-28 02:07:27', '2021-02-28 02:07:27', null);
INSERT INTO `artist_images` VALUES ('46', '16', '1614452861.jpg', 'repimage', null, null, '2021-02-28 02:07:41', '2021-02-28 02:07:41', null);
INSERT INTO `artist_images` VALUES ('47', '16', '1614452869.jpg', 'reviewimage', null, null, '2021-02-28 02:07:49', '2021-02-28 02:07:49', null);
INSERT INTO `artist_images` VALUES ('48', '16', '1614452882.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 02:08:02', '2021-02-28 02:08:02', null);
INSERT INTO `artist_images` VALUES ('49', '16', '1614452891.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 02:08:11', '2021-02-28 02:08:11', null);
INSERT INTO `artist_images` VALUES ('50', '16', '1614452904.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 02:08:24', '2021-02-28 02:08:24', null);
INSERT INTO `artist_images` VALUES ('51', '17', '1614453472.jpg', 'pageimage', null, null, '2021-02-28 02:17:52', '2021-02-28 02:17:52', null);
INSERT INTO `artist_images` VALUES ('52', '17', '1614453483.jpg', 'repimage', null, null, '2021-02-28 02:18:03', '2021-02-28 02:18:03', null);
INSERT INTO `artist_images` VALUES ('53', '17', '1614453501.jpg', 'reviewimage', null, null, '2021-02-28 02:18:21', '2021-02-28 02:18:21', null);
INSERT INTO `artist_images` VALUES ('54', '17', '1614453517.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 02:18:37', '2021-02-28 02:18:37', null);
INSERT INTO `artist_images` VALUES ('55', '17', '1614453529.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 02:18:49', '2021-02-28 02:18:49', null);
INSERT INTO `artist_images` VALUES ('56', '17', '1614453551.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 02:19:11', '2021-02-28 02:19:11', null);
INSERT INTO `artist_images` VALUES ('57', '18', '1615758512.jpg', 'pageimage', null, null, '2021-02-28 02:40:24', '2021-03-15 02:48:32', null);
INSERT INTO `artist_images` VALUES ('58', '18', '1614454842.jpg', 'repimage', null, null, '2021-02-28 02:40:42', '2021-02-28 02:40:42', null);
INSERT INTO `artist_images` VALUES ('59', '18', '1614454854.jpg', 'reviewimage', null, null, '2021-02-28 02:40:54', '2021-02-28 02:40:54', null);
INSERT INTO `artist_images` VALUES ('60', '18', '1614454865.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 02:41:05', '2021-02-28 02:41:05', null);
INSERT INTO `artist_images` VALUES ('61', '18', '1614454879.jpg', 'galleryimage', 'gallery', 'gallery', '2021-02-28 02:41:19', '2021-02-28 02:41:19', null);

-- ----------------------------
-- Table structure for artist_infos
-- ----------------------------
DROP TABLE IF EXISTS `artist_infos`;
CREATE TABLE `artist_infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `features` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artist_info_artist_id_foreign` (`artist_id`),
  CONSTRAINT `artist_info_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of artist_infos
-- ----------------------------
INSERT INTO `artist_infos` VALUES ('2', '9', '\"5 Piece Band\\nFemale Lead Vocalist\\nVocals, Double Bass, Keys, Sax and Drums\\nJazz, Swing, Postmodern Jukebox, Pop\\nLondon based, available nationwide\\nProfessional and Experienced Musicians\\n2x45 minute performance as standard\\nBackground music between sets\\nPA and Lighting available for a fee\\nQuartet, Trio, Duo and Solo Line-up available\\nGlowing references from many happy clients\"', '\"\\\"\\\\\\\"Bring the Hollywood golden age to your doorstep with inimitable jazz and swing masters Chateau Grey!\\\\\\\\n\\\\\\\\nWhether you want them to take centre stage or blend expertly into the background with their subtle and sophisticated repertoire of jazz, swing and Postmodern Jukebox style twists on modern songs, nothing comes close to the seamless glamour of Chateau Grey.\\\\\\\\n\\\\\\\\nComing as a 5-piece as standard, with sultry female vocals, bouncy double-bass, keys, sax and drums, this remarkable collective features some of UK\'s finest jazz musicians. Their repertoire weaves through beloved swing and jazz classics from Ella Fitzgerald to Frank Sinatra and Peggy Lee. Chateau Grey also provide a wonderful vintage twist to more modern songs from artist as diverse as Madonna, David Bowie, and Bon Jovi.\\\\\\\\n\\\\\\\\nThis glamorous London band has known each other for many years and bring true passion to inject your event with jazz and swing joy. Between them, members of the band have played for legends Shirley Bassey and Liza Minnelli, while their lead singer made her television debut at just 16. She\'s graced the stage at The Royal Albert Hall, the QE and the International Guinness Jazz Festival, and the band has racked up some serious mileage performing for high profile clients such as Microsoft, Morgan Stanley, and the United Nations.\\\\\\\\n\\\\\\\\nChateau Grey offer two flexible 45 minute sets of music as standard, with background music provided when they\'re not performing. If you opt for smaller solo, duo or trio line ups, a PA is included in the price, while lighting, a sound engineer and PA can be hired in for events of over 100 people - contact us for more details.\\\\\\\\n\\\\\\\\nChateau Grey are available for weddings, parties and corporate events worldwide - they\'ve played for clients in Switzerland, France, Ireland, Morocco, Poland, and more in the last 12 months alone!\\\\\\\\n\\\\\\\\nGet your glad rags on, or make your big day mellow - Chateau Grey will play at your pace. Book them for your event today!\\\\\\\"\\\"\"', '2021-02-26 16:36:56', '2021-02-27 22:48:03');
INSERT INTO `artist_infos` VALUES ('6', '15', '5 Piece Charismatic Pop Band/\r\nMale Vocals and Guitar x2, Sax, Bass & Drums/\r\nPop & Contemporary hits, with Folk, Soul & Motown/\r\nExperienced and Professional Act/\r\nLondon based, available nationwide/\r\nHappy to learn first dance or special request/\r\nPlaylist DJ service between live sets/\r\nHigh quality and fully PAT tested PA and lighting/\r\n2x60 or 3x40 minutes of live performance/', '\"Skyknights are an incredible 5-piece party band who guarantee a stellar night of sensational music! Led by a pair of star lead vocalists, Skyknights are the showpiece act to make your event unforgettable.\\r\\n\\r\\nThese natural born performers can turn their musical skills and irresistible on-stage charisma to almost any style of music you can think of: pop, folk, rock, funk, soul, Motown, indie - even a dance tune or two! Skyknights\' blend of infectious tunes and unending energy are the perfect recipe for a shoulder-to-shoulder squeeze on the dance floor.\\r\\n\\r\\nThe Skyknights boys know each other well. They\'ve performed at over 200 weddings and events together over the years, perfecting their uplifting show and gathering countless glowing reviews from delighted brides and grooms (and bridesmaids and mothers-in-law). Every member of the band is a top musician, but what sets these guys apart is the talent of and chemistry between the two lead singers: Ant B and Ant K.\\r\\n\\r\\nAnt B has been the lead singer on Strictly and on recent West End show \'Rip It Up\'. He\'s also toured all the arenas supporting McFly and Busted and co-wrote McFly\'s hit \'Love is Easy\'. Ant K has fronted bands supporting McBusted and Aloe Blacc as well as performing alongside Sigala. He has also played session guitar for McFly\'s Danny Jones and co-wrote the McFly song \'Dare You To Move\'. Together the two Ants form the perfect musical team, their voices combining beautifully, their friendship clear to see.\\r\\n\\r\\nAs standard, Skyknights appear as a 5-piece featuring two singing guitarists, bass guitar, sax and drums. You can tailor their line-up to suit your event by removing the sax player or adding a keys player.\\r\\n\\r\\nWhen you hire Skyknights for your event, everything you need for a dazzling evening\'s entertainment is included: high quality lights and PA, a playlist DJ service and your choice of first dance (or a special request) learned and performed. Want to make DJ requests on the night? Ask about upgrading to Skyknight\'s manned DJ service.\"', '2021-02-28 02:02:25', '2021-02-28 02:02:25');
INSERT INTO `artist_infos` VALUES ('7', '16', '5-7 Piece Band/\r\nFemale Lead Vocals/\r\nVocals, Guitar, Bass, Drums and Sax/\r\nMotown, Disco, Pop, Funk, Soul hits/\r\nHighly experienced musicians/\r\nLondon based, available nationwide/\r\n2x60 or 3x40 minute sets as standard/\r\nManned DJ Service provided as standard/', '\"Ready to send your guests into a dance floor frenzy, Clique supply a show like no other! Regarded as one of the most exciting and professional function bands in the UK right now, Clique are a premier choice for your occasion.\\r\\n\\r\\nThis 5-piece London-based band for weddings and events deliver a carefully selected set list of Motown anthems, soul hits and disco favourites from the likes of Aretha Franklin, Marvin Gaye and James Brown, as well as contemporary modern pop songs and 50s rock \'n\' roll. Clique\'s energetic performances of irresistibly danceable songs is sure to get you moving and grooving on the dance floor!\\r\\n\\r\\nClique consists of a fabulous female lead vocalist, guitar, bass, sax and drums. This amazing band\'s harmonies blend together to create an exceptionally funky sound that, when partnered with their on-stage passion and charisma, will set your event alight!\\r\\n\\r\\nYou can hire Clique for your event with the addition of trumpet and keys, adding more depth to their incredible sound and creating a fantastic experience for you and all your guests. And if you\'re looking for daytime entertainment, they have that covered too: with options to hire a vocal and keys duo or a vocal, keys, bass and drums jazz quartet, you can secure the perfect musical backdrop to your wedding ceremony, drinks reception or corporate dinner.\"', '2021-02-28 02:13:52', '2021-02-28 02:13:52');

-- ----------------------------
-- Table structure for artist_music
-- ----------------------------
DROP TABLE IF EXISTS `artist_music`;
CREATE TABLE `artist_music` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `url` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `artist_music_artist_id_foreign` (`artist_id`) USING BTREE,
  CONSTRAINT `artist_music_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of artist_music
-- ----------------------------
INSERT INTO `artist_music` VALUES ('2', '9', '1609343464.mp3', 'TEST 111', '2020-12-30 22:51:04', '2020-12-30 22:51:04');
INSERT INTO `artist_music` VALUES ('3', '9', '1609797700.mp3', 'TEST 222', '2021-01-05 05:01:40', '2021-01-05 05:01:40');
INSERT INTO `artist_music` VALUES ('12', '15', '1614451272.mp3', 'test songs', '2021-02-28 01:41:12', '2021-02-28 01:41:12');
INSERT INTO `artist_music` VALUES ('13', '15', '1614451297.mp3', 'our\'s love story', '2021-02-28 01:41:37', '2021-02-28 01:41:37');
INSERT INTO `artist_music` VALUES ('14', '16', '1614452930.mp3', 'test songs', '2021-02-28 02:08:50', '2021-02-28 02:08:50');
INSERT INTO `artist_music` VALUES ('15', '16', '1614452946.mp3', 'test songs', '2021-02-28 02:09:06', '2021-02-28 02:09:06');
INSERT INTO `artist_music` VALUES ('16', '16', '1614452956.mp3', 'our\'s love story', '2021-02-28 02:09:16', '2021-02-28 02:09:16');
INSERT INTO `artist_music` VALUES ('17', '17', '1614453817.mp3', 'Song\'s mo', '2021-02-28 02:23:37', '2021-02-28 02:23:37');
INSERT INTO `artist_music` VALUES ('18', '17', '1614453835.mp3', 'Crazy girl', '2021-02-28 02:23:55', '2021-02-28 02:23:55');
INSERT INTO `artist_music` VALUES ('19', '18', '1614454985.mp3', 'test songs', '2021-02-28 02:43:05', '2021-02-28 02:43:05');
INSERT INTO `artist_music` VALUES ('20', '18', '1614454994.mp3', 'our\'s love story', '2021-02-28 02:43:14', '2021-02-28 02:43:14');

-- ----------------------------
-- Table structure for artist_repertories
-- ----------------------------
DROP TABLE IF EXISTS `artist_repertories`;
CREATE TABLE `artist_repertories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `janre` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `artist_repertories_artist_id_foreign` (`artist_id`) USING BTREE,
  CONSTRAINT `artist_repertories_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of artist_repertories
-- ----------------------------
INSERT INTO `artist_repertories` VALUES ('4', '9', 'SOUL', '\"hello world - test song 1\\nhello world - test song 2\\nhello world - test song 3\"', '2020-12-30 22:54:28', '2021-01-06 00:36:42');
INSERT INTO `artist_repertories` VALUES ('6', '9', 'TEST', '\"hello world - test song 1\\r\\nhello world - test song 2\\r\\nhello world - test song 3\"', '2021-01-05 05:03:39', '2021-01-05 05:03:39');
INSERT INTO `artist_repertories` VALUES ('12', '15', '00\'S TO PRESENT', '\"Valerie - The Zutons\\/Amy Winehouse\\r\\nSex On Fire - King Of Leon\\r\\nHey Ya - Outkast\\r\\nBack For Good - Take That\\r\\nSmooth - Santana\\r\\nMr Brightside - The Killers\\r\\nThis Love - Maroon 5\\r\\nHungry Heart - Bruce Springsteen\\r\\nI Just Haven\'t Met You Yet - Michael Buble\\r\\nEverything - Michael Buble\\r\\nLocked Out Of Heaven - Bruno Mars\\r\\nThinking Out Loud - Ed Sheeran\\r\\nGet Lucky - Pharrell\\r\\nAll About That Bass - Meghan Trainer\\r\\nViva La Vida - Coldplay\\r\\nSugar - Maroon 5 Hey Ho - The Lumineers\\r\\nShut up and dance - Walk the Moon\\r\\nI Wont Give Up - Jason Mraz\\r\\nGrow Old With Me - Tom Odell\\r\\nLast Request - Paolo Nutini\\r\\nShe\\u2019s The One - Robbie Williams\\r\\nShe Will Be Loved - Maroon 5\\r\\nYou\\u2019ve Got The Love - Florence & The Machine\\r\\nAll of me - John Legend\\r\\nEverything - Michael Buble\\r\\nLittle Lion Man - Mumford & Sons\\r\\nPencil Full of Lead - Paolo Nutini\\r\\nSing - Ed Sheeran\\r\\nSenorita - Justin Timberlake\\r\\nWake Me Up - Avicii\\r\\nMake Luv - Junior Jack\\r\\nWorld Hold On - Bob Sinclair\"', '2021-02-28 01:59:39', '2021-02-28 01:59:39');
INSERT INTO `artist_repertories` VALUES ('13', '15', '50\'S AND 60\'S', '\"Build Me Up Buttercup - The Foundations\\r\\nI Can\'t Get No (Satisfaction) - The Rolling Stones\\r\\nHit The Road Jack - Ray Charles\\r\\nTracks Of My Tears - Smokey Robinson\\r\\nMy Girl - The Temptations\\r\\nStand By Me - Ben E King\\r\\nPinball Wizard - The Who\\r\\nHound Dog - Elvis\\r\\nSherry Baby - Frankie Valli & The Four Seasons\\r\\nI Want You Back - The Jackson 5\\r\\nI Feel Fine - The Beatles \\r\\nSaw Her Standing There - The Beatles\\r\\nCome Together - The Beatles\\r\\nTwist And Shout - The Beatles \\r\\nTwist Again - Chubby Checker\\r\\nBrown Eyed Girl - Van Morrison\\r\\nRunaround Sue - Dion\\r\\nWonderful World - Sam Cooke\\r\\nBe my Baby - The Ron nets\\r\\nYour Love Keeps Lifting me - Jackie Wilson\\r\\nCan\\u2019t Help Falling in Love - Elvis\\r\\nIt\\u2019s Nit Unusual - Tom Jones\\r\\nCan\\u2019t Take My Eyes Off Of You - Frankie Valli\\r\\nJailhouse Rock - Elvis\\r\\nGreat Balls Of Fire - Jerry Lee Lewis\\r\\nJohnny B Good - Chuck Berry\\r\\nRock Around The Clock - Bill Haley\"', '2021-02-28 02:01:10', '2021-02-28 02:01:10');
INSERT INTO `artist_repertories` VALUES ('14', '16', 'MOTOWN', '\"Higher and Higher\\r\\nI want you back - Jackson 5\\r\\nABC - Jackson 5\\r\\nDancing in the street\\r\\nHow sweet it is\\r\\nAin\\u2019t No Mountain\\r\\nFor once in my life\\r\\nSigned sealed delivered\\r\\nMy girl\\r\\nReach out\\r\\nSay a little prayer\\r\\nStoned love\\r\\nSatisfaction\\r\\nMove on up\\r\\nSuperstition\\r\\nGet ready\\r\\nCan\\u2019t hurry love\\r\\nKnock on wood\\r\\nProud Mary\\r\\nRiver deep mountain high\"', '2021-02-28 02:12:36', '2021-02-28 02:12:36');
INSERT INTO `artist_repertories` VALUES ('15', '16', '60S & 70S SOUL', '\"Let\\u2019s stay together\\r\\nNatural woman\\r\\nRespect\\r\\nSon of a preacher man\\r\\nI feel good\\r\\nThink\\r\\nSoul man\\r\\nAs\\r\\nSir duke\\r\\nI wish\\r\\nMustang sally\\r\\nStand by me\"', '2021-02-28 02:13:02', '2021-02-28 02:13:02');
INSERT INTO `artist_repertories` VALUES ('16', '17', 'FUNK, SOUL AND 80\'S GROOVE', '\"And The Beat Goes On \\u2013 The Whispers (requires male vocal)\\r\\nAin\\u2019t Nobody \\u2013 Chaka Khan\\r\\nAll This Love That I\\u2019m Giving \\u2013 Gwen Mcrae\\r\\nBrick House \\u2013 Commodores\\r\\nForget Me Nots \\u2013 Patrice Rushen\\r\\nGet Down On It \\u2013 Kool & The Gang\\r\\nGet Down Saturday Night - Oliver Cheatham\\r\\nGet Up Offa That Thing \\u2013 James Brown\\r\\nGimme The Night - George Benson\\r\\nGoing Back To My Roots - Oddyssey\\r\\nGot to Be Real - Cheryl Lynn\\r\\nI Found Lovin \\u2013 The Fatback Band\\r\\nJammin - Bob Marley\\r\\nJungle Boogie \\u2013 Kool & The Gang (requires trumpet + male vocal)\\r\\nKeep The Fire Burning - Gewn McCrae\\r\\nKiss \\u2013 Prince\\r\\nLadies Night - Kool & The Gang\\r\\nOutstanding - The Gap Band\\r\\nPapa\\u2019s Got A Brand New Bag \\u2013 James Brown (requires trumpet + male vocal)\\r\\nPick Up The Pieces \\u2013 Average White Band (requires trumpet)\\r\\nPlay That Funky Music \\u2013 Wild Cherry\\r\\nPYT \\u2013 Michael Jackson\\r\\nNever Too Much \\u2013 Luther Vandross\\r\\nRock With You \\u2013 Michael Jackson\\r\\nSomebody Elses Guy \\u2013 Jocelyn Brown\\r\\nTeardrops \\u2013 Womack & Womack\\r\\nThinking Of You \\u2013 Chic\"', '2021-02-28 02:26:55', '2021-02-28 02:26:55');
INSERT INTO `artist_repertories` VALUES ('17', '18', '10\'S - PRESENT', '\"Bruno Mars \\u2013 Just The Way You Are\\r\\nBruno Mars \\u2013 Treasure\\r\\nCee Lo Green - Forget You\\r\\nClean Bandit \\u2013 Rather Be\\r\\nDaft Punk \\u2013 Get Lucky\\r\\nDua Lipa - New Rules\\r\\nEd Sheeran - Thinking Out Loud\\r\\nEd Sheeran - Perfect\\r\\nEd Sheeran - Shape Of You\\r\\nJess Glynne \\u2013 Hold My Hand\"', '2021-02-28 02:47:01', '2021-02-28 02:47:01');
INSERT INTO `artist_repertories` VALUES ('18', '18', '70\'S & 80\'S HITS', '\"ABBA \\u2013 Dancing Queen\\r\\nABBA \\u2013 Mamma Mia\\r\\nAHA \\u2013 Take On Me\\r\\nThe Beatles \\u2013 Hey Jude\\r\\nBlondie - One Way Or Another\\r\\nBon Jovi - Livin\\u2019 On A Prayer\\r\\nBryan Adams - Summer of 69\\r\\nChaka Khan - Aint\\u2019 Nobody\\r\\nChuck Berry \\u2013 Johnny B. Goode\\r\\nDirty Dancing \\u2013 Time Of My Life\\r\\nDolly Parton \\u2013 9 \\u2013 5\\r\\nFleetwood Mac \\u2013 Everywhere\\r\\nFunktown America - Celebrate Good Times\\r\\nGrease- You\\u2019re The One That I Want\\r\\nHuey Lewis \\u2013 The Power Of Love\"', '2021-02-28 02:47:20', '2021-02-28 02:47:20');

-- ----------------------------
-- Table structure for artist_videos
-- ----------------------------
DROP TABLE IF EXISTS `artist_videos`;
CREATE TABLE `artist_videos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `url` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `artist_videos_artist_id_foreign` (`artist_id`) USING BTREE,
  CONSTRAINT `artist_videos_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of artist_videos
-- ----------------------------
INSERT INTO `artist_videos` VALUES ('5', '9', 'https://www.youtube.com/watch?v=IqzxUXo_h4I', '1', '2020-12-30 22:41:07', '2020-12-30 22:41:30');
INSERT INTO `artist_videos` VALUES ('6', '9', 'https://www.youtube.com/watch?v=iF6xjg72CV4', '0', '2020-12-30 22:41:24', '2020-12-30 22:41:30');
INSERT INTO `artist_videos` VALUES ('7', '9', 'https://www.youtube.com/watch?v=u8c00DdxBcQ', '0', '2020-12-30 22:41:42', '2020-12-30 22:41:42');
INSERT INTO `artist_videos` VALUES ('8', '9', 'https://www.youtube.com/watch?v=Z6cLM52KrM4', '0', '2020-12-30 22:42:40', '2020-12-30 22:42:40');
INSERT INTO `artist_videos` VALUES ('9', '9', 'https://www.youtube.com/watch?v=JVuuatjHGnY', '0', '2021-01-05 04:59:39', '2021-01-05 04:59:39');
INSERT INTO `artist_videos` VALUES ('12', '15', 'https://www.youtube.com/watch?v=JI1At0_-po4', '0', '2021-02-28 01:29:58', '2021-02-28 01:30:31');
INSERT INTO `artist_videos` VALUES ('13', '15', 'https://www.youtube.com/watch?v=d72xqMZ94-Y', '1', '2021-02-28 01:30:22', '2021-02-28 01:30:31');
INSERT INTO `artist_videos` VALUES ('14', '16', 'https://www.youtube.com/watch?v=PKfdYhscZJk', '0', '2021-02-28 02:06:09', '2021-02-28 02:06:09');
INSERT INTO `artist_videos` VALUES ('15', '16', 'https://www.youtube.com/watch?v=JI1At0_-po4', '0', '2021-02-28 02:06:26', '2021-02-28 02:06:26');
INSERT INTO `artist_videos` VALUES ('16', '17', 'https://www.youtube.com/watch?v=JI1At0_-po4', '0', '2021-02-28 02:16:21', '2021-02-28 02:16:21');
INSERT INTO `artist_videos` VALUES ('17', '17', 'https://www.youtube.com/watch?v=PKfdYhscZJk', '0', '2021-02-28 02:16:25', '2021-02-28 02:16:25');
INSERT INTO `artist_videos` VALUES ('18', '18', 'https://www.youtube.com/watch?v=PKfdYhscZJk', '0', '2021-02-28 02:39:06', '2021-02-28 02:39:06');
INSERT INTO `artist_videos` VALUES ('19', '18', 'https://www.youtube.com/watch?v=d72xqMZ94-Y', '0', '2021-02-28 02:39:10', '2021-02-28 02:39:10');

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `blogs_title_unique` (`title`) USING BTREE,
  UNIQUE KEY `blogs_img_unique` (`img`) USING BTREE,
  KEY `blogs_user_id_foreign` (`user_id`) USING BTREE,
  KEY `blogs_category_id_foreign` (`category_id`) USING BTREE,
  CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES ('1', '1', 'World Music Stage', '<b>Who were the most demanded musicians in 2019?</b>', 'uploads/1614131995.jpg', '1', '1', '2021-02-24 08:59:55', '2021-02-24 08:59:55');

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_number` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_location_id` bigint(20) unsigned NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `venue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `status_id` int(11) NOT NULL,
  `paid_datetime` datetime DEFAULT NULL,
  `datetime1` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `bookings_price_location_id_foreign` (`price_location_id`) USING BTREE,
  KEY `bookings_event_id_foreign` (`event_id`) USING BTREE,
  CONSTRAINT `bookings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_price_location_id_foreign` FOREIGN KEY (`price_location_id`) REFERENCES `price_locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO `bookings` VALUES ('6', 'TME0006', '10', 'birthday', 'egortokarb@gmail.com', '111111', '1', 'ggggg', '02/23/2021 06:30 PM', 'gggggg', '440.00', '1', null, '2021-02-23 18:30:00', '2021-02-22 16:35:50', '2021-02-22 16:35:50');
INSERT INTO `bookings` VALUES ('7', 'TME0007', '10', 'birthday', 'alenakdadasevich@gmail.com', '111111', '1', 'ggggg', '02/23/2021 06:30 PM', 'gggggg', '440.00', '1', null, '2021-02-23 18:30:00', '2021-02-22 16:37:04', '2021-02-22 16:37:04');
INSERT INTO `bookings` VALUES ('8', 'TME0008', '11', 'Denis P', 'alenakdadasevich@gmail.com', '65575464', '3', 'aaaaaaaaaa', '02/25/2021 10:30 AM', 'aaaaaaaaaa', '590.00', '1', null, '2021-02-25 10:30:00', '2021-02-22 16:41:01', '2021-02-22 16:41:01');
INSERT INTO `bookings` VALUES ('9', 'TME0009', '10', 'birthday', 'plfreelancer003@gmail.com', '+4587628475', '1', 'bv', '02/25/2021 04:00 AM', 'bb', '590.00', '1', null, '2021-02-25 04:00:00', '2021-02-24 02:09:36', '2021-02-24 02:09:36');

-- ----------------------------
-- Table structure for booking_addons
-- ----------------------------
DROP TABLE IF EXISTS `booking_addons`;
CREATE TABLE `booking_addons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint(20) unsigned NOT NULL,
  `price_addon_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `booking_addons_booking_id_foreign` (`booking_id`) USING BTREE,
  KEY `booking_addons_price_addon_id_foreign` (`price_addon_id`) USING BTREE,
  CONSTRAINT `booking_addons_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  CONSTRAINT `booking_addons_price_addon_id_foreign` FOREIGN KEY (`price_addon_id`) REFERENCES `price_addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booking_addons
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'uncategorized', null, '2020-12-20 12:57:45', '2020-12-20 12:57:45');

-- ----------------------------
-- Table structure for category_home_page
-- ----------------------------
DROP TABLE IF EXISTS `category_home_page`;
CREATE TABLE `category_home_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `category_home_page_id` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_home_page
-- ----------------------------
INSERT INTO `category_home_page` VALUES ('1', 'LED ELECTRIC STRINGS', '1', '1615911486.jpg', '2021-03-16 21:18:06', '2021-03-16 21:18:06');
INSERT INTO `category_home_page` VALUES ('2', 'DJs', '1', '1615911486.jpg', '2021-03-16 21:18:06', '2021-03-16 21:18:06');
INSERT INTO `category_home_page` VALUES ('3', 'BOLLYWOOD ENTERTAINMENT', '1', '1615911486.jpg', '2021-03-16 21:18:06', '2021-03-16 21:18:06');

-- ----------------------------
-- Table structure for client_reviews
-- ----------------------------
DROP TABLE IF EXISTS `client_reviews`;
CREATE TABLE `client_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `review_order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_reviews
-- ----------------------------
INSERT INTO `client_reviews` VALUES ('3', 'saaaaaaaaa', 'aadddddddddd', '944', '2021-03-15 00:59:50', '2021-03-15 01:07:02');
INSERT INTO `client_reviews` VALUES ('4', 'Eman', '5555', '1844', '2021-03-15 01:00:48', '2021-03-15 01:07:38');

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'England', '2020-12-20 12:57:43', '2020-12-20 12:57:43');
INSERT INTO `countries` VALUES ('2', 'Scotland', '2020-12-20 12:57:43', '2020-12-20 12:57:43');
INSERT INTO `countries` VALUES ('3', 'Wales', '2020-12-20 12:57:43', '2020-12-20 12:57:43');

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `events_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `events_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('1', 'wedding', 'wedding', '1', '2020-12-20 12:57:44', '2020-12-20 12:57:44');
INSERT INTO `events` VALUES ('2', 'party', 'party', '1', '2020-12-20 12:57:44', '2020-12-20 12:57:44');
INSERT INTO `events` VALUES ('3', 'birthday', 'birthday', '1', '2021-02-21 00:20:47', '2021-02-21 00:20:47');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for find_artist_page
-- ----------------------------
DROP TABLE IF EXISTS `find_artist_page`;
CREATE TABLE `find_artist_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `title` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of find_artist_page
-- ----------------------------
INSERT INTO `find_artist_page` VALUES ('1', 0x5B223C703E61736466726577713C5C2F703E222C223C703E6173646464646464643C5C2F703E225D, 'asd', '2021-03-15 21:16:55', '2021-03-15 21:16:55');
INSERT INTO `find_artist_page` VALUES ('2', null, 'Eman', '2021-03-15 22:26:52', '2021-03-15 22:26:52');

-- ----------------------------
-- Table structure for footer_page
-- ----------------------------
DROP TABLE IF EXISTS `footer_page`;
CREATE TABLE `footer_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `copyrights` text NOT NULL,
  `facebook` text NOT NULL,
  `twitter` text NOT NULL,
  `youtube` text NOT NULL,
  `instagram` text NOT NULL,
  `google` text NOT NULL,
  `linkedin` text NOT NULL,
  `Pinterest` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of footer_page
-- ----------------------------
INSERT INTO `footer_page` VALUES ('1', 'asd', 'asd', 'https://twitter.com/oshyoshin', 'asd', 'https://www.instagram.com/eman.mohamed.k/', 'asd', 'asd', 'asd', '2021-03-15 01:53:02', '2021-03-15 01:53:02');

-- ----------------------------
-- Table structure for home_page
-- ----------------------------
DROP TABLE IF EXISTS `home_page`;
CREATE TABLE `home_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home_page
-- ----------------------------
INSERT INTO `home_page` VALUES ('1', '1615911486.png', 'qweq', 'qw', 'qw', 'wq', '<p>qw</p>', '1615911486.jpg', 'qwe', 'qw', '<p>qw</p>', '2021-03-16 21:18:06', '2021-03-16 21:18:06');

-- ----------------------------
-- Table structure for janres
-- ----------------------------
DROP TABLE IF EXISTS `janres`;
CREATE TABLE `janres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of janres
-- ----------------------------

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `locations_status_id_foreign` (`status_id`) USING BTREE,
  KEY `locations_country_id_foreign` (`country_id`) USING BTREE,
  CONSTRAINT `locations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `locations_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of locations
-- ----------------------------
INSERT INTO `locations` VALUES ('1', 'London', 'london', '1', '1', '2020-12-20 12:57:44', '2020-12-20 12:57:44');
INSERT INTO `locations` VALUES ('2', 'Manchester', 'manchester', '1', '1', '2020-12-20 12:57:44', '2020-12-20 12:57:44');
INSERT INTO `locations` VALUES ('3', 'Birmingham', 'birmingham', '1', '1', '2020-12-20 12:57:44', '2021-01-31 20:07:03');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_num` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('3', 'menu1', '18', '2021-03-23 19:56:04', '2021-03-23 19:56:04');
INSERT INTO `menus` VALUES ('4', 'asdfasd', '17', '2021-03-23 20:00:00', '2021-03-23 20:00:00');
INSERT INTO `menus` VALUES ('5', 'fff', '17', '2021-03-23 20:03:53', '2021-03-23 20:03:53');
INSERT INTO `menus` VALUES ('6', 'sadf', '1', '2021-03-23 20:04:54', '2021-03-23 20:04:54');
INSERT INTO `menus` VALUES ('7', 'asdfasdfasdf', '17', '2021-03-23 21:11:08', '2021-03-23 21:11:08');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `owner` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('8', 'yes, you already have the info we will use the same design as Admin, we will have the same sections as the entertainment nation has plus we will add Booking and Messages to it... we also need to look into quotes as client really wants to use these.... For now please make sure in admin everything is done what I sent in previous documents, those ponts I wrote today here (settings, video) and mainly arrange so we can test messages. I can give you server email account details.', 'TEST EMAIL2', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1608594069.jpg', '2020-12-22 06:41:09', '2020-12-22 06:41:09', null);
INSERT INTO `messages` VALUES ('14', 'Lorem Ipsum<span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br><br></span>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br>', 'HELLO WORLD', 'peter@msbx.co.uk', 'admin@topmusicevents.co.uk', null, null, '', '0', '0', '0', null, '1609798283.jpg', '2021-01-05 05:11:23', '2021-01-05 05:11:23', '1');
INSERT INTO `messages` VALUES ('17', '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">solo</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">05/10/2021 12:00 AM</span>\n        <span class=\"label label-success\">John Doe</span>\n        <span class=\"label label-success\">5654654465465</span>\n        <br><br>\n        <span>TEST TEST</span>', 'topmusicevents.co.uk', 'krenkson@gmail.com', 'admin@topmusicevents.co.uk', null, null, '', '1', '1', '0', null, null, '2021-01-13 22:16:26', '2021-01-13 22:16:43', '0');
INSERT INTO `messages` VALUES ('18', '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">solo</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">05/05/2021 12:00 AM</span>\n        <span class=\"label label-success\">John Doe</span>\n        <span class=\"label label-success\">88888888888</span>\n        <br><br>\n        <span>HELLO WORLD</span>', 'topmusicevents.co.uk', 'peter@msbx.co.uk', 'admin@topmusicevents.co.uk', null, null, '', '1', '1', '0', null, null, '2021-01-26 21:41:10', '2021-02-20 00:38:06', '0');
INSERT INTO `messages` VALUES ('19', '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">02/25/2021 10:34 PM</span>\n        <span class=\"label label-success\">mykyta</span>\n        <span class=\"label label-success\">87878</span>\n        <br><br>\n        <span>hello</span>', 'topmusicevents.co.uk', 'admin@topmusicevents.co.uk', 'admin@topmusicevents.co.uk', null, null, '', '1', '1', '0', null, null, '2021-02-19 20:34:18', '2021-02-19 20:35:33', '0');
INSERT INTO `messages` VALUES ('20', '<span class=\"label label-info\">party</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">Manchester</span>\n        <span class=\"label label-info\">02/01/2021 2:28 AM</span>\n        <span class=\"label label-success\">111</span>\n        <span class=\"label label-success\">111111</span>\n        <br><br>\n        <span>rhytrjhryjdr</span>', 'topmusicevents.co.uk', 'egortokarb@gmail.com', 'admin@topmusicevents.co.uk', null, null, '', '1', '1', '0', null, null, '2021-02-20 00:28:49', '2021-02-21 00:16:32', '0');
INSERT INTO `messages` VALUES ('21', '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">solo</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">02/27/2021 11:41 AM</span>\n        <span class=\"label label-success\">Alena</span>\n        <span class=\"label label-success\">+4587628475</span>\n        <br><br>\n        <span>I need solo for my wedding.\r\nCan you provide a solo fast and quality?</span>', 'topmusicevents.co.uk', 'alenakdadasevich@gmail.com', 'admin@topmusicevents.co.uk', null, null, '', '1', '1', '0', null, null, '2021-02-23 09:41:45', '2021-02-23 09:42:59', '0');
INSERT INTO `messages` VALUES ('22', '<span class=\"label label-info\">party</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">02/01/2021 2:28 AM</span>\n        <span class=\"label label-success\">Alena</span>\n        <span class=\"label label-success\">+4587628475</span>\n        <br><br>\n        <span>fddgdfgdfgsgdfgdfg</span>', 'topmusicevents.co.uk', 'alenakdadasevich@gmail.com', 'admin@topmusicevents.co.uk', null, null, '', '1', '1', '0', null, null, '2021-02-23 09:52:48', '2021-02-23 09:57:33', '0');
INSERT INTO `messages` VALUES ('23', '<span class=\"label label-info\">party</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">London</span>\n        <span class=\"label label-info\">02/01/2021 2:28 AM</span>\n        <span class=\"label label-success\">Alena</span>\n        <span class=\"label label-success\">+4587628475</span>\n        <br><br>\n        <span>fddgdfgdfgsgdfgdfg</span>', 'topmusicevents.co.uk', 'alenakdadasevich@gmail.com', 'admin@topmusicevents.co.uk', null, null, '', '1', '1', '0', null, null, '2021-02-23 09:53:37', '2021-02-23 09:57:38', '0');
INSERT INTO `messages` VALUES ('24', 'fddgdfgdfgsgdfgdfg', 'Quote', 'admin@topmusicevents.co.uk', '11', null, null, '', '0', '0', '0', null, '', '2021-02-25 20:10:28', '2021-02-25 20:10:28', '1');
INSERT INTO `messages` VALUES ('25', 'fddgdfgdfgsgdfgdfg', 'Quote', 'admin@topmusicevents.co.uk', '11', null, null, '', '0', '0', '0', null, '', '2021-02-25 20:10:28', '2021-02-25 20:10:28', '0');
INSERT INTO `messages` VALUES ('26', '<span class=\"label label-info\">wedding</span>\n        <span class=\"label label-info\">bands</span>\n        <span class=\"label label-info\">Manchester</span>\n        <span class=\"label label-info\">24/03/2021</span>\n        <span class=\"label label-success\">eman</span>\n        <span class=\"label label-success\">0125147</span>\n        <br><br>\n        <span>asd</span>', 'topmusicevents.co.uk', 'info@topmusicevents.co.uk', 'admin@topmusicevents.co.uk', 'eman', '0125147', '', '1', '1', '0', '24/03/2021', null, '2021-03-16 21:54:34', '2021-03-17 15:37:40', '0');
INSERT INTO `messages` VALUES ('27', null, 'Pending Input', 'emahmoud@beltonefinancial.com', null, null, '01152329789', '', '0', '0', '0', null, null, null, null, '1');
INSERT INTO `messages` VALUES ('28', null, 'Pending Input', 'eman.mohamed.ka@gmail.com', null, null, '01152329789', '', '1', '0', '0', null, null, null, '2021-03-17 12:43:35', '1');
INSERT INTO `messages` VALUES ('29', 'eeeeeeee', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966207.jpg', '2021-03-17 14:30:07', '2021-03-17 14:30:07', '1');
INSERT INTO `messages` VALUES ('30', 'eeeeeeee', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966207.jpg', '2021-03-17 14:30:07', '2021-03-17 14:30:07', '1');
INSERT INTO `messages` VALUES ('31', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '1', '0', '0', null, '', '2021-03-17 14:33:25', '2021-03-17 15:02:56', '1');
INSERT INTO `messages` VALUES ('32', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966430.jpg', '2021-03-17 14:33:50', '2021-03-17 14:33:50', '1');
INSERT INTO `messages` VALUES ('33', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966430.jpg', '2021-03-17 14:33:50', '2021-03-17 14:33:50', '1');
INSERT INTO `messages` VALUES ('34', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966528.jpg', '2021-03-17 14:35:28', '2021-03-17 14:35:28', '1');
INSERT INTO `messages` VALUES ('35', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966528.jpg', '2021-03-17 14:35:28', '2021-03-17 14:35:28', '1');
INSERT INTO `messages` VALUES ('36', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '1', '0', '0', null, '1615966534.jpg', '2021-03-17 14:35:34', '2021-03-17 15:03:04', '1');
INSERT INTO `messages` VALUES ('37', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966534.jpg', '2021-03-17 14:35:34', '2021-03-17 14:35:34', '1');
INSERT INTO `messages` VALUES ('38', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966578.jpg', '2021-03-17 14:36:18', '2021-03-17 14:36:18', '1');
INSERT INTO `messages` VALUES ('39', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966578.jpg', '2021-03-17 14:36:18', '2021-03-17 14:36:18', '1');
INSERT INTO `messages` VALUES ('40', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966603.jpg', '2021-03-17 14:36:43', '2021-03-17 14:36:43', '1');
INSERT INTO `messages` VALUES ('41', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966603.jpg', '2021-03-17 14:36:43', '2021-03-17 14:36:43', '1');
INSERT INTO `messages` VALUES ('42', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966644.jpg', '2021-03-17 14:37:24', '2021-03-17 14:37:24', '1');
INSERT INTO `messages` VALUES ('43', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966644.jpg', '2021-03-17 14:37:24', '2021-03-17 14:37:24', '1');
INSERT INTO `messages` VALUES ('44', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '1', '0', '0', null, '1615966656.jpg', '2021-03-17 14:37:36', '2021-03-17 15:37:33', '1');
INSERT INTO `messages` VALUES ('45', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966656.jpg', '2021-03-17 14:37:36', '2021-03-17 14:37:36', '1');
INSERT INTO `messages` VALUES ('46', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966822.jpg', '2021-03-17 14:40:22', '2021-03-17 14:40:22', '1');
INSERT INTO `messages` VALUES ('47', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966822.jpg', '2021-03-17 14:40:22', '2021-03-17 14:40:22', '1');
INSERT INTO `messages` VALUES ('48', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '1', '0', '0', null, '1615966823.jpg', '2021-03-17 14:40:23', '2021-03-17 15:00:32', '1');
INSERT INTO `messages` VALUES ('49', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966823.jpg', '2021-03-17 14:40:23', '2021-03-17 14:40:23', '1');
INSERT INTO `messages` VALUES ('50', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966842.jpg', '2021-03-17 14:40:42', '2021-03-17 14:40:42', '1');
INSERT INTO `messages` VALUES ('51', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966842.jpg', '2021-03-17 14:40:42', '2021-03-17 14:40:42', '1');
INSERT INTO `messages` VALUES ('52', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966850.jpg', '2021-03-17 14:40:51', '2021-03-17 14:40:51', '1');
INSERT INTO `messages` VALUES ('53', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966850.jpg', '2021-03-17 14:40:51', '2021-03-17 14:40:51', '1');
INSERT INTO `messages` VALUES ('54', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966862.jpg', '2021-03-17 14:41:02', '2021-03-17 14:41:02', '1');
INSERT INTO `messages` VALUES ('55', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966862.jpg', '2021-03-17 14:41:02', '2021-03-17 14:41:02', '1');
INSERT INTO `messages` VALUES ('56', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966874.jpg', '2021-03-17 14:41:14', '2021-03-17 14:41:14', '1');
INSERT INTO `messages` VALUES ('57', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966874.jpg', '2021-03-17 14:41:14', '2021-03-17 14:41:14', '1');
INSERT INTO `messages` VALUES ('58', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966884.jpg', '2021-03-17 14:41:24', '2021-03-17 14:41:24', '1');
INSERT INTO `messages` VALUES ('59', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966884.jpg', '2021-03-17 14:41:24', '2021-03-17 14:41:24', '1');
INSERT INTO `messages` VALUES ('60', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'peter@msbx.co.uk', null, null, '', '0', '0', '0', null, '1615966903.jpg', '2021-03-17 14:41:43', '2021-03-17 14:41:43', '1');
INSERT INTO `messages` VALUES ('61', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'krenkson@gmail.com', null, null, '', '0', '0', '0', null, '1615966903.jpg', '2021-03-17 14:41:43', '2021-03-17 14:41:43', '1');
INSERT INTO `messages` VALUES ('62', 'party\r\n        bands\r\n        London\r\n        02/01/2021 2:28 AM\r\n        Alena\r\n        +4587628475\r\n        <br><br>\r\n        fddgdfgdfgsgdfgdfg', 'Pending Input', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', null, null, '', '0', '0', '0', null, '1615970232.jpg', '2021-03-17 15:37:12', '2021-03-17 15:37:12', '1');
INSERT INTO `messages` VALUES ('63', 'party\r\n        bands\r\n        London\r\n        02/01/2021 2:28 AM\r\n        Alena\r\n        +4587628475\r\n        <br><br>\r\n        fddgdfgdfgsgdfgdfg', 'Pending Input', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', null, null, '', '0', '0', '0', null, '1615970296.jpg', '2021-03-17 15:38:16', '2021-03-17 15:38:16', '1');
INSERT INTO `messages` VALUES ('64', 'asd', 'Pending Input', 'admin@topmusicevents.co.uk', 'admin@topmusicevents.co.uk', null, null, '', '0', '0', '0', null, '1615975705.jpg', '2021-03-17 17:08:25', '2021-03-17 17:08:25', '1');
INSERT INTO `messages` VALUES ('65', 'I need solo for my wedding.\r\nCan you provide a solo fast and quality?', 'Quote', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', null, null, 'TMEQ263', '0', '0', '0', '', '', '2021-03-17 19:13:02', '2021-03-17 19:13:02', '1');
INSERT INTO `messages` VALUES ('66', 'I need solo for my wedding.\r\nCan you provide a solo fast and quality?', 'Quote', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', null, null, 'TMEQ80', '0', '0', '0', '', '', '2021-03-17 19:13:44', '2021-03-17 19:13:44', '1');
INSERT INTO `messages` VALUES ('67', 'I need solo for my wedding.\r\nCan you provide a solo fast and quality?', 'Quote', 'admin@topmusicevents.co.uk', 'eman.mohamed.ka@gmail.com', null, null, 'TMEQ938', '0', '0', '0', '', '', '2021-03-17 19:15:52', '2021-03-17 19:15:52', '1');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2000_10_30_000000_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('2', '2000_10_30_000000_create_statuses_table', '1');
INSERT INTO `migrations` VALUES ('3', '2000_11_14_211120_create_countries_table', '1');
INSERT INTO `migrations` VALUES ('4', '2000_11_14_212851_create_parent_acts_table', '1');
INSERT INTO `migrations` VALUES ('5', '2001_11_13_081446_create_events_table', '1');
INSERT INTO `migrations` VALUES ('6', '2001_11_13_081832_create_acts_table', '1');
INSERT INTO `migrations` VALUES ('7', '2001_11_13_093025_create_locations_table', '1');
INSERT INTO `migrations` VALUES ('8', '2001_11_13_093159_create_addons_table', '1');
INSERT INTO `migrations` VALUES ('9', '2001_11_15_151256_create_janres_table', '1');
INSERT INTO `migrations` VALUES ('10', '2002_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('11', '2002_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('12', '2003_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('13', '2020_10_30_205139_create_artists_table', '1');
INSERT INTO `migrations` VALUES ('14', '2020_10_31_064031_create_messages_table', '1');
INSERT INTO `migrations` VALUES ('15', '2020_11_05_142805_create_artist_videos_table', '1');
INSERT INTO `migrations` VALUES ('16', '2020_11_05_143010_create_artist_music_table', '1');
INSERT INTO `migrations` VALUES ('17', '2020_11_05_143234_create_artist_images_table', '1');
INSERT INTO `migrations` VALUES ('18', '2020_11_05_145717_create_artist_repertories_table', '1');
INSERT INTO `migrations` VALUES ('19', '2020_11_13_075506_create_price_standard_infos_table', '1');
INSERT INTO `migrations` VALUES ('20', '2020_11_13_075554_create_price_locations_table', '1');
INSERT INTO `migrations` VALUES ('21', '2020_11_13_080621_create_price_addons_table', '1');
INSERT INTO `migrations` VALUES ('22', '2020_11_13_094830_create_bookings_table', '1');
INSERT INTO `migrations` VALUES ('23', '2020_11_13_094831_create_booking_addons_table', '1');
INSERT INTO `migrations` VALUES ('24', '2020_11_13_112509_create_pages_table', '1');
INSERT INTO `migrations` VALUES ('25', '2020_12_14_045813_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('26', '2020_12_14_050342_create_blogs_table', '1');
INSERT INTO `migrations` VALUES ('27', '2020_12_18_081113_create_menus_table', '1');

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8 DEFAULT NULL,
  `file` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pages_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `pages_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', 'Faq', 'faq', 'This is faq page.<br>', null, null, '1', '2020-12-20 13:08:25', '2020-12-20 13:08:25');
INSERT INTO `pages` VALUES ('2', 'title', 'title', '<h2>What is Lorem Ipsum?</h2>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', null, null, '1', '2021-01-12 22:35:33', '2021-01-12 22:35:33');
INSERT INTO `pages` VALUES ('3', 'url', 'url', null, null, null, '1', '2021-03-14 00:58:07', '2021-03-14 00:58:07');
INSERT INTO `pages` VALUES ('4', 'url', 'url', null, null, null, '1', '2021-03-14 00:59:04', '2021-03-14 00:59:04');
INSERT INTO `pages` VALUES ('5', 'Mohamed', 'mohamed', null, null, null, '1', '2021-03-14 01:01:13', '2021-03-14 01:01:13');
INSERT INTO `pages` VALUES ('8', 'test', 'test', null, 'https://github.com/emaanmohamed', null, '1', '2021-03-14 01:13:05', '2021-03-14 01:13:05');
INSERT INTO `pages` VALUES ('9', 'test', 'test', null, 'https://github.com/emaanmohamed', null, '1', '2021-03-14 01:14:06', '2021-03-14 01:14:06');
INSERT INTO `pages` VALUES ('10', 'Eman', 'eman', null, 'https://github.com/emaanmohamed', null, '1', '2021-03-14 01:15:29', '2021-03-14 01:15:29');
INSERT INTO `pages` VALUES ('11', 'Eman', 'eman', null, 'https://github.com/emaanmohamed', null, '1', '2021-03-14 01:16:10', '2021-03-14 01:16:10');
INSERT INTO `pages` VALUES ('12', 'asdasd', 'asdasd', '<p>asdasd</p>', null, null, '1', '2021-03-14 03:26:42', '2021-03-14 03:26:42');
INSERT INTO `pages` VALUES ('13', 'this is my first page', 'this-is-my-first-page', '<p>Hello.</p>\r\n<p>This is my first new page.</p>\r\n<p>THanks.</p>', null, null, '1', '2021-03-23 18:25:16', '2021-03-23 18:25:16');
INSERT INTO `pages` VALUES ('14', 'second page', 'second-page', '<p>asdfasdfasdf</p>', null, null, '1', '2021-03-23 19:36:32', '2021-03-23 19:36:32');
INSERT INTO `pages` VALUES ('15', 'third page', 'third-page', '<p>asdfasdfasdf</p>', null, null, '1', '2021-03-23 19:38:09', '2021-03-23 19:38:09');
INSERT INTO `pages` VALUES ('16', 'forthpage', 'forthpage', '<p>this is it</p>\r\n<p>And <strong>YES</strong></p>', null, null, '1', '2021-03-23 19:41:14', '2021-03-23 19:41:14');
INSERT INTO `pages` VALUES ('17', 'Fifthpage', 'fifthpage', '<p>Of course.</p>\r\n<p><strong>COOL!!</strong></p>', null, null, '1', '2021-03-23 19:51:12', '2021-03-23 19:51:12');

-- ----------------------------
-- Table structure for parent_acts
-- ----------------------------
DROP TABLE IF EXISTS `parent_acts`;
CREATE TABLE `parent_acts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of parent_acts
-- ----------------------------
INSERT INTO `parent_acts` VALUES ('1', 'WEDDING BANDS', '2020-12-20 12:57:43', '2021-01-31 19:57:15');
INSERT INTO `parent_acts` VALUES ('2', 'LED ELECTRIC STRINGS', '2020-12-20 12:57:43', '2021-01-31 19:57:34');
INSERT INTO `parent_acts` VALUES ('3', 'CLASSICAL PERFORMERS', '2020-12-20 12:57:43', '2021-01-31 19:57:54');
INSERT INTO `parent_acts` VALUES ('4', 'POP & ROCK', '2020-12-20 12:57:43', '2021-01-31 19:58:14');
INSERT INTO `parent_acts` VALUES ('5', 'SOUL & MOTOWN', '2021-01-12 23:38:48', '2021-01-31 19:58:38');
INSERT INTO `parent_acts` VALUES ('6', 'JAZZ BANDS', '2021-01-12 23:38:59', '2021-01-31 19:58:53');
INSERT INTO `parent_acts` VALUES ('7', 'DJs', '2021-01-31 19:55:44', '2021-01-31 19:55:44');
INSERT INTO `parent_acts` VALUES ('8', 'STRINGS', '2021-01-31 19:56:10', '2021-01-31 19:59:09');
INSERT INTO `parent_acts` VALUES ('9', 'SAXOPHONISTS', '2021-01-31 19:56:31', '2021-01-31 19:59:28');
INSERT INTO `parent_acts` VALUES ('10', 'PIANISTS', '2021-01-31 19:56:59', '2021-01-31 19:56:59');
INSERT INTO `parent_acts` VALUES ('11', 'ACOUSTIC & FOLK', '2021-01-31 20:00:38', '2021-01-31 20:00:38');
INSERT INTO `parent_acts` VALUES ('12', 'BOLLYWOOD ENTERTAINMENT', '2021-01-31 20:05:25', '2021-01-31 20:05:25');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for price_addons
-- ----------------------------
DROP TABLE IF EXISTS `price_addons`;
CREATE TABLE `price_addons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) unsigned NOT NULL,
  `type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `price_addons_artist_id_foreign` (`artist_id`) USING BTREE,
  CONSTRAINT `price_addons_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of price_addons
-- ----------------------------
INSERT INTO `price_addons` VALUES ('2', '9', 'extra songs', '150', '2020-12-30 22:52:39', '2020-12-30 22:52:39');
INSERT INTO `price_addons` VALUES ('3', '9', 'extra singer', '300', '2020-12-30 22:52:50', '2020-12-30 22:52:50');
INSERT INTO `price_addons` VALUES ('8', '15', 'Extra Song', '1000', '2021-02-28 01:56:13', '2021-02-28 01:56:13');
INSERT INTO `price_addons` VALUES ('9', '15', 'Extra Bands', '1200', '2021-02-28 01:56:27', '2021-02-28 01:56:27');
INSERT INTO `price_addons` VALUES ('10', '15', 'ADDED KEYBOARD', '338', '2021-02-28 01:56:43', '2021-02-28 01:56:43');
INSERT INTO `price_addons` VALUES ('11', '16', '7 PIECE LINE UP (ADDS KEYS AND TRUMPET)', '810', '2021-02-28 02:11:33', '2021-02-28 02:11:33');
INSERT INTO `price_addons` VALUES ('12', '16', 'MANNED DJ SERVICE (1AM CURFEW)', '270', '2021-02-28 02:11:44', '2021-02-28 02:11:44');
INSERT INTO `price_addons` VALUES ('13', '17', 'Extra Song', '240', '2021-02-28 02:25:50', '2021-02-28 02:25:50');
INSERT INTO `price_addons` VALUES ('14', '17', 'ADDED KEYBOARD', '500', '2021-02-28 02:25:58', '2021-02-28 02:25:58');
INSERT INTO `price_addons` VALUES ('15', '18', 'Extra Bands', '456', '2021-02-28 02:45:55', '2021-02-28 02:45:55');
INSERT INTO `price_addons` VALUES ('16', '18', 'MANNED DJ SERVICE (1AM CURFEW)', '650', '2021-02-28 02:46:05', '2021-02-28 02:46:05');

-- ----------------------------
-- Table structure for price_locations
-- ----------------------------
DROP TABLE IF EXISTS `price_locations`;
CREATE TABLE `price_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) unsigned NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL,
  `price` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `price_locations_location_id_foreign` (`location_id`) USING BTREE,
  KEY `price_locations_artist_id_foreign` (`artist_id`) USING BTREE,
  CONSTRAINT `price_locations_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `price_locations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of price_locations
-- ----------------------------
INSERT INTO `price_locations` VALUES ('10', '9', '1', '290', '2020-12-30 22:52:20', '2020-12-30 22:52:20');
INSERT INTO `price_locations` VALUES ('11', '9', '2', '290', '2020-12-30 22:52:20', '2020-12-30 22:52:20');
INSERT INTO `price_locations` VALUES ('12', '9', '3', '290', '2020-12-30 22:52:20', '2020-12-30 22:52:20');
INSERT INTO `price_locations` VALUES ('22', '15', '1', '1500', '2021-02-28 01:57:02', '2021-02-28 01:57:02');
INSERT INTO `price_locations` VALUES ('23', '15', '2', '1900', '2021-02-28 01:57:02', '2021-02-28 01:57:02');
INSERT INTO `price_locations` VALUES ('24', '15', '3', '1300', '2021-02-28 01:57:02', '2021-02-28 01:57:02');
INSERT INTO `price_locations` VALUES ('25', '16', '1', '580', '2021-02-28 02:12:02', '2021-02-28 02:12:02');
INSERT INTO `price_locations` VALUES ('26', '16', '2', '690', '2021-02-28 02:12:02', '2021-02-28 02:12:02');
INSERT INTO `price_locations` VALUES ('27', '16', '3', '1020', '2021-02-28 02:12:02', '2021-02-28 02:12:02');
INSERT INTO `price_locations` VALUES ('28', '17', '1', '542', '2021-02-28 02:26:10', '2021-02-28 02:26:10');
INSERT INTO `price_locations` VALUES ('29', '17', '2', '151', '2021-02-28 02:26:10', '2021-02-28 02:26:10');
INSERT INTO `price_locations` VALUES ('30', '17', '3', '745', '2021-02-28 02:26:10', '2021-02-28 02:26:10');
INSERT INTO `price_locations` VALUES ('31', '18', '1', '890', '2021-02-28 02:46:19', '2021-02-28 02:46:19');
INSERT INTO `price_locations` VALUES ('32', '18', '2', '786', '2021-02-28 02:46:19', '2021-02-28 02:46:19');
INSERT INTO `price_locations` VALUES ('33', '18', '3', '900', '2021-02-28 02:46:19', '2021-02-28 02:46:19');

-- ----------------------------
-- Table structure for price_standard_infos
-- ----------------------------
DROP TABLE IF EXISTS `price_standard_infos`;
CREATE TABLE `price_standard_infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) unsigned NOT NULL,
  `length` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lineup` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `price_standard_infos_artist_id_foreign` (`artist_id`) USING BTREE,
  CONSTRAINT `price_standard_infos_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of price_standard_infos
-- ----------------------------
INSERT INTO `price_standard_infos` VALUES ('2', '9', 'Usually just 1 hour,\r\nwe can do 2 hours', 'we need just 30min no time check', 'TBA', '2020-12-30 22:53:59', '2020-12-30 22:53:59');
INSERT INTO `price_standard_infos` VALUES ('5', '15', 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 or 3x40 minute sets of live performance. Approximately 60-75 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings also available.', 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 or 3x40 minute sets of live performance. Approximately 60-75 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings also available.', 'Tam', '2021-02-28 01:55:49', '2021-02-28 01:55:49');
INSERT INTO `price_standard_infos` VALUES ('6', '16', 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 or 3x40 minute sets of live performance.', 'Approximately 90 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings available.', '5 Piece Band', '2021-02-28 02:11:09', '2021-02-28 02:11:09');
INSERT INTO `price_standard_infos` VALUES ('7', '17', 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 minute sets of live performance.', 'Approximately 90 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings also available.', 'Female Lead Vocals, Guitar, Keys, Bass and Drums', '2021-02-28 02:25:30', '2021-02-28 02:25:30');
INSERT INTO `price_standard_infos` VALUES ('8', '18', 'Prices are based on a 5pm or later arrival and Midnight finish, including 2x60 or 3x40 minute sets of live performance.', 'Approximately 75 minutes are required for the act to set up and sound check (depending on access to the performance area). Alternative timings also available.', 'Tap', '2021-02-28 02:45:22', '2021-02-28 02:45:22');

-- ----------------------------
-- Table structure for quote_page
-- ----------------------------
DROP TABLE IF EXISTS `quote_page`;
CREATE TABLE `quote_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quote_page
-- ----------------------------
INSERT INTO `quote_page` VALUES ('1', 'asd', '1615811551.jpg', '2021-03-15 17:32:31', '2021-03-15 17:32:31');
INSERT INTO `quote_page` VALUES ('2', 'asadasd', '1615812049.jpg', '2021-03-15 17:40:49', '2021-03-15 17:40:49');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `review` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES ('1', '19', 'ANTONINA & CHRIS - WEDDING - BRIGHTON', 'The band were absolutely fabulous! They really made the night, they were great fun--}}\r\n{{--                                    and people were dancing till the very end.--}}\r\n{{--                                    Everyone commented on how brilliant they were and how much they\'d enjoyed the music.--}}\r\n{{--                                    10 out of 10 would definitely recommend this band!', '2021-03-10 23:07:36', '2021-03-10 23:07:36');
INSERT INTO `reviews` VALUES ('2', '19', 'ANTONINA & CHRIS - WEDDING - BRIGHTON', 'The band were absolutely fabulous! They really made the night, they were great fun--}}\r\n{{--                                    and people were dancing till the very end.--}}\r\n{{--                                    Everyone commented on how brilliant they were and how much they\'d enjoyed the music.--}}\r\n{{--                                    10 out of 10 would definitely recommend this band!', '2021-03-10 23:15:54', '2021-03-10 23:15:54');
INSERT INTO `reviews` VALUES ('4', '19', 'title', 'BUDAPEST - GEORGE EZRA\r\nCAN\'T FEEL MY FACE - THE WEEKEND\r\nCAN\'T STOP THE FEELING - JUSTIN TIMBERLAKE\r\nGET LUCKY - DAFT PUNK\r\nHEY BROTHER - AVICII\r\nHO HEY - THE LUMINEERS\r\nHOLD BACK THE RIVER - JAMES BAY\r\nI TOOK A PILL IN IBIZA - MIKE POSNER\r\nI WILL WAIT - MUMFORD & SONS\r\nJUST THE WAY YOU ARE - BRUNO MARS\r\nLIGHTNING BOLT - JAKE BUGG', '2021-03-11 01:51:17', '2021-03-11 01:51:17');
INSERT INTO `reviews` VALUES ('5', '19', 'asdf', 'asdfasdfasdfasdfasdfasd/l.kfaj;lsdkasdddddphifuqlkjh alskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfha  alskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfh alskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfh alskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfh alskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhalskdjfhalskjdfhlskjdfh', '2021-03-22 04:31:38', '2021-03-22 04:31:43');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name1` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'original', '2020-12-20 12:57:43', '2020-12-20 12:57:43');
INSERT INTO `roles` VALUES ('2', 'client', 'top', '2020-12-20 12:57:43', '2020-12-20 12:57:43');

-- ----------------------------
-- Table structure for statuses
-- ----------------------------
DROP TABLE IF EXISTS `statuses`;
CREATE TABLE `statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name1` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name2` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name3` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name4` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of statuses
-- ----------------------------
INSERT INTO `statuses` VALUES ('1', 'active', 'approved', 'outstanding', 'published', '2020-12-20 12:57:43', '2020-12-20 12:57:43');
INSERT INTO `statuses` VALUES ('2', 'pending', 'pending', 'paid', 'draft', '2020-12-20 12:57:43', '2020-12-20 12:57:43');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL DEFAULT 3,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `tel` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `roles` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  KEY `users_role_id_foreign` (`role_id`) USING BTREE,
  KEY `users_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'ADMIN', 'admin@topmusicevents.co.uk', null, '$2y$10$u5D66p/70hB7g6a/xyyM0OmqDwmZikoVJJUKnpJvTaC23VvnMgVTm', '1', '1', null, null, 'kI0M0QhojlApYKOvEWmh2CW3iQ9fSxmKT2zYsMGRV9z2sPlWTfY5LlT6Rihv', '2020-12-20 12:57:45', '2020-12-20 12:57:45', null);
INSERT INTO `users` VALUES ('3', 'Johnh Doe', 'eman.mohamed.ka@gmail.com', null, '$2y$10$v21kXjn9x4MLq4Mr3j00zuLyo1DBWcz9ExEePN73uBxam6rPu4dB2', '2', '1', '222222222', '90 Station Road, E15 London', null, '2020-12-20 23:32:27', '2021-02-20 20:18:20', '');
INSERT INTO `users` VALUES ('7', 'baymax', 'bay@gmail.com', null, '$2y$10$zXpX.3SeMkVt8xFV.qV0QemW8/fnA9l8FyIkv7zugOgDOv5xFplu6', '2', '1', '123345456', '1003 apt, St Elizabeth, NY', null, '2020-12-24 07:20:05', '2020-12-24 07:20:15', null);
INSERT INTO `users` VALUES ('8', 'peter', 'peter@msbx.co.uk', null, '$2y$10$ibhjdyft2pTb6Gy8cVhwQ.Z7AfOrH2z/GCKtNi7R76EQVdpfdfife', '2', '1', '2222222222', '5 Sunny View, Higher Newmarket Road', null, '2020-12-27 01:24:09', '2020-12-27 01:24:17', null);
INSERT INTO `users` VALUES ('9', 'Test Client', 'krenkson@gmail.com', null, '$2y$10$3LFplzWUcvkvB62rWDRyBuRSiIFPEYlNRcur9JphiAZUjgRT6Z4/O', '2', '1', '07809671303', '92 Statio Road, N3', null, '2020-12-30 03:54:09', '2020-12-30 03:54:14', null);
INSERT INTO `users` VALUES ('11', 'Test Client', 'email@email.com', null, '$2y$10$p5CIdRhuNblYGqXosX8mVOgpjFUrJlL019uCfcl4lz60.AEiACZ7a', '2', '1', '000000000', '92 Station Road, N3 2SG, London', null, '2021-02-19 21:35:36', '2021-02-19 21:35:42', null);
INSERT INTO `users` VALUES ('12', 'Egor Tokar', 'egortokarb@gmail.com', null, '$2y$10$bcUN3HoygHDX6sr8YppVd.B7vsWGzVL2f3xP2ABTadGj4IqGZfMda', '1', '2', '123456789', 'Ukraine Kyiv', null, '2021-02-20 20:19:33', '2021-02-20 20:20:38', 'Dashboard,Our Artist,Messages,Bookings,Event Types,Event Locations,Act Types,Web Pages,Calendar,Latest News,Settings,Support');
