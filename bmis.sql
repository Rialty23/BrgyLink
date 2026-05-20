-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2026 at 04:31 PM
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
-- Database: `bmis`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_analytics_cache`
--

CREATE TABLE `ai_analytics_cache` (
  `id` int(11) NOT NULL,
  `cache_key` varchar(100) DEFAULT NULL,
  `ai_response` text DEFAULT NULL,
  `request_count` int(11) DEFAULT 0,
  `max_requests` int(11) DEFAULT 3,
  `last_generated` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ai_analytics_cache`
--

INSERT INTO `ai_analytics_cache` (`id`, `cache_key`, `ai_response`, `request_count`, `max_requests`, `last_generated`, `updated_at`) VALUES
(1, 'resident_ai_analysis_v1', 'Summary:\n- Total residents recorded: {total_residents}.\n- Dominant gender: {gender_dominant} by {gender_difference_percent}%.\n- Dominant age group: {dominant_age_group}.\nTrends:\n- Working age (15–49): {age_15_49_count} ({age_15_49_percent}%).\n- Seniors (60+): {age_60_plus_count} ({age_60_plus_percent}%).\nObservations:\n- Male: {male_count} ({male_percent}%), Female: {female_count} ({female_percent}%).\nRecommendations:\n- Prioritize programs based on {dominant_age_group}.\n- Keep age/sex encoding consistent for accurate analytics.', 0, 5, '2026-05-03 22:41:01', '2026-05-03 22:41:01'),
(2, 'resident_ai_analysis_v2', 'Summary:\n- Current population entries: {total_residents}.\n- Gender split is {male_percent}% Male vs {female_percent}% Female.\nTrends:\n- Youth (0–14): {age_0_14_count} ({age_0_14_percent}%) may increase school-related service needs.\nObservations:\n- Dominant age bracket: {dominant_age_group}.\nRecommendations:\n- Strengthen youth support and health monitoring.\n- Validate age input (numeric only) to reduce reporting errors.', 0, 5, '2026-05-03 22:41:01', '2026-05-03 22:41:01'),
(3, 'resident_ai_analysis_v3', 'Summary:\n- Total residents in database: {total_residents}.\n- The community is workforce-driven (15–49: {age_15_49_percent}%).\nTrends:\n- 50–59: {age_50_59_count} ({age_50_59_percent}%), 60+: {age_60_plus_count} ({age_60_plus_percent}%).\nObservations:\n- {gender_dominant} population is higher by {gender_difference_percent}%.\nRecommendations:\n- Expand livelihood + employment support programs.\n- Prepare senior-focused services if 60+ grows further.', 0, 5, '2026-05-03 22:41:01', '2026-05-03 22:41:01'),
(4, 'resident_ai_analysis_v4', 'Summary:\n- Resident masterlist count: {total_residents}.\n- Dominant segment: {dominant_age_group}.\nTrends:\n- Age distribution: 0–14={age_0_14_percent}%, 15–49={age_15_49_percent}%, 50–59={age_50_59_percent}%, 60+={age_60_plus_percent}%.\nObservations:\n- Male={male_count}, Female={female_count}.\nRecommendations:\n- Balance programs across youth, workforce, and seniors.\n- Run monthly audits to keep analytics reliable.', 0, 5, '2026-05-03 22:41:01', '2026-05-03 22:41:01'),
(5, 'resident_ai_analysis_v5', 'Summary:\n- Current totals: {total_residents}.\n- Gender: {male_percent}% Male / {female_percent}% Female.\nTrends:\n- Dominant age group ({dominant_age_group}) will likely drive most certificate/assistance requests.\nObservations:\n- Even small shifts in age/sex encoding affect the computed percentages.\nRecommendations:\n- Add dropdowns/validation for sex values (Male/Female).\n- Use this breakdown for budgeting and targeted services.', 0, 5, '2026-05-03 22:41:01', '2026-05-03 22:41:01'),
(6, 'resident_ai_analysis', 'Summary:\n- Total residents recorded: 122.\n- Dominant gender: Female by 3.28%.\n- Dominant age group: 15-49.\nTrends:\n- Working age (15–49): 65 (53.28%).\n- Seniors (60+): 30 (24.59%).\nObservations:\n- Male: 59 (48.36%), Female: 63 (51.64%).\nRecommendations:\n- Prioritize programs based on 15-49.\n- Keep age/sex encoding consistent for accurate analytics.', 3, 3, '2026-05-15 14:32:40', '2026-05-15 14:32:40'),
(7, 'resident_ai_analysis_v6', 'Summary:\n- Total residents: {total_residents}.\n- Dominant gender: {gender_dominant} (+{gender_difference_percent}%).\nTrends:\n- Youth (0–14): {age_0_14_count} ({age_0_14_percent}%).\n- Seniors (60+): {age_60_plus_count} ({age_60_plus_percent}%).\nObservations:\n- The largest bracket is {dominant_age_group}, which can affect demand for barangay services.\nRecommendations:\n- Strengthen youth support (education/nutrition) and senior health assistance.\n- Keep records consistent for accurate reporting.', 0, 10, '2026-05-03 22:41:51', '2026-05-03 22:41:51'),
(8, 'resident_ai_analysis_v7', 'Summary:\n- Current resident registry: {total_residents}.\n- Gender breakdown: {male_count} Male ({male_percent}%) vs {female_count} Female ({female_percent}%).\nTrends:\n- Working-age (15–49) remains the key segment: {age_15_49_count} ({age_15_49_percent}%).\nObservations:\n- A strong workforce segment usually correlates with higher livelihood-related requests.\nRecommendations:\n- Improve livelihood and job referral programs.\n- Ensure sex values are standardized (Male/Female).', 0, 10, '2026-05-03 22:41:51', '2026-05-03 22:41:51'),
(9, 'resident_ai_analysis_v8', 'Summary:\n- Total population records: {total_residents}.\n- Dominant age group: {dominant_age_group}.\nTrends:\n- Pre-senior (50–59): {age_50_59_count} ({age_50_59_percent}%).\n- Seniors (60+): {age_60_plus_count} ({age_60_plus_percent}%).\nObservations:\n- Increasing older-age share may increase medical and assistance documentation requests.\nRecommendations:\n- Plan targeted services for 50+ residents (health screening, benefits support).\n- Keep periodic audits to reduce inaccurate ages.', 0, 10, '2026-05-03 22:41:51', '2026-05-03 22:41:51'),
(10, 'resident_ai_analysis_v9', 'Summary:\n- Population size: {total_residents}.\n- Gender difference is {gender_difference_percent}% (Dominant: {gender_dominant}).\nTrends:\n- Age group shares: 0–14={age_0_14_percent}%, 15–49={age_15_49_percent}%, 50–59={age_50_59_percent}%, 60+={age_60_plus_percent}%.\nObservations:\n- Analytics accuracy depends on clean age/sex encoding.\nRecommendations:\n- Add validation rules for age (numeric range) and sex (dropdown values).\n- Use the dominant bracket {dominant_age_group} as a basis for program planning.', 0, 10, '2026-05-03 22:41:51', '2026-05-03 22:41:51'),
(11, 'resident_ai_analysis_v10', 'Summary:\n- Total residents logged: {total_residents}.\n- Largest segment: {dominant_age_group}.\nTrends:\n- If 0–14 is sizable ({age_0_14_percent}%), expect stronger demand for youth services.\n- If 60+ is sizable ({age_60_plus_percent}%), expect stronger demand for senior assistance.\nObservations:\n- Male={male_percent}% vs Female={female_percent}%.\nRecommendations:\n- Balance programs across youth + livelihood + seniors based on the age distribution.\n- Maintain monthly data cleanup for reliable analytics output.', 0, 10, '2026-05-03 22:41:51', '2026-05-03 22:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `approval`
--

CREATE TABLE `approval` (
  `id_approval` int(11) NOT NULL,
  `id_resident` int(11) NOT NULL,
  `apstatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brgy_info`
--

CREATE TABLE `brgy_info` (
  `id_brgy_info` int(11) NOT NULL,
  `brgy` varchar(50) NOT NULL,
  `municipal` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `openhours` text NOT NULL,
  `background` text NOT NULL,
  `vision` text NOT NULL,
  `mission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brgy_info`
--

INSERT INTO `brgy_info` (`id_brgy_info`, `brgy`, `municipal`, `province`, `email`, `contact`, `openhours`, `background`, `vision`, `mission`) VALUES
(1, 'East Modern Site', 'Aurora Hill ', 'Baguio City, Benguet', 'barangayeastmodernsite@gmail.com', '422-2528', 'Open Hours of Barangay: Monday to Friday (8:00 to 5:00)', 'Barangay East Modern Site is a prominent residential community located in Baguio City, within the Cordillera Administrative Region. Situated along P. Ledesma Street, the barangay forms an integral part of Baguio’s urban landscape and is composed of a diverse population of families and individuals who contribute to the city’s rich cultural and social identity. Its strategic location provides residents with convenient access to essential schools, commercial establishments, and public services, making it an active and well-connected community within the northeastern district.\r\n\r\nA defining landmark of the barangay is the remarkable Immaculate Conception Parish Church. Serving as a prominent spiritual and social center, the parish acts as the heartbeat of the community, where residents gather for worship, religious festivities, and social programs. This landmark not only reinforces a sense of unity and \"Bayanihan\" spirit among the people but also provides a distinct sense of heritage and place within the Aurora Hill area.\r\n\r\nOver the years, East Modern Site has continuously worked to strengthen its local governance, improve public service delivery, and promote active community participation. Through the steady collaboration of barangay officials, community leaders, and residents, the barangay strives to maintain peace, order, and sustainable development. By balancing modern urban growth with the preservation of core values like cooperation and faith, East Modern Site remains a vital and harmonious residential haven in the \"Summer Capital of the Philippines.\"', '“A progressive, inclusive, and empowered community that fosters safe, sustainable, and people-centered development — where every resident thrives in unity, dignity, and shared prosperity.”', '\"To deliver responsive, efficient, and transparent public service that addresses the needs of its residents. It is committed to promoting programs that enhance health, safety, education, social welfare, and environmental sustainability within the community. The barangay also aims to encourage active citizen participation in decision-making processes to ensure inclusive and accountable governance. By strengthening partnerships with local institutions and stakeholders, East Modern Site works toward creating opportunities that uplift the quality of life of its constituents. Through dedication, cooperation, and integrity, the barangay endeavors to build a united and resilient community prepared for present and future challenges\"');

-- --------------------------------------------------------

--
-- Stand-in structure for view `masked_users`
-- (See below for the actual view)
--
CREATE TABLE `masked_users` (
`id_user` int(1)
,`masked_email` int(1)
,`masked_password` int(1)
,`masked_lname` int(1)
,`masked_fname` int(1)
,`masked_address` int(1)
,`masked_position` int(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id_position` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `pos_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id_position`, `position`, `pos_order`) VALUES
(1, 'Barangay Chairman', 1),
(2, 'Sk Chairperson', 2),
(3, 'Barangay Secretary', 3),
(4, 'Barangay Treasurer', 4),
(5, 'Councilor 1', 5),
(6, 'Councilor 2', 6),
(7, 'Councilor 3', 7),
(8, 'Councilor 4', 8),
(9, 'Councilor 5', 9),
(10, 'Councilor 6', 10);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id_system` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `acronym` varchar(50) NOT NULL,
  `poweredBy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id_system`, `name`, `acronym`, `poweredBy`) VALUES
(1, 'Barangay East Modern Site Information System', 'BBIS', 'Ive Generalao');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_activities`
--

CREATE TABLE `tbl_activities` (
  `id_activity` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `date` date NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_activities`
--

INSERT INTO `tbl_activities` (`id_activity`, `name`, `date`, `image`) VALUES
(1, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 1_BARKADA2026_EMSB ', '2026-01-02', 'uploads/WEEK 1_BARKADA2026_EMSB.jpg'),
(2, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 2_BARKADA2026_EMSB', '2026-01-05', 'uploads/WEEK 2_BARKADA2026_EMSB.jpg'),
(3, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 3_BARKADA2026_EMSB', '2026-01-12', 'uploads/WEEK 3_BARKADA2026_EMSB.jpg'),
(4, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 4_BARKADA2026_EMSB', '2026-01-21', 'uploads/WEEK 4_BARKADA2026_EMSB.jpg'),
(5, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 5_BARKADA2026_EMSB', '2026-01-31', 'uploads/WEEK 5_BARKADA2026_EMSB.jpg'),
(6, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 7_BARKADA2026_EMSB', '2026-02-09', 'uploads/WEEK 7_BARKADA2026_EMSB.jpg'),
(7, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 8_BARKADA2026_EMSB', '2026-02-18', 'uploads/WEEK 8_BARKADA2026_EMSB.jpg'),
(8, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 9_BARKADA2026_EMSB', '2026-02-27', 'uploads/WEEK 9_BARKADA2026_EMSB.jpg'),
(9, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 11_BARKADA2026_EMSB', '2026-03-11', 'uploads/WEEK 11_BARKADA2026_EMSB.jpg'),
(11, 'Barangay Supporting Women\'s Organization', '2026-03-11', 'uploads/supporting EMS women\'s organization.jpg'),
(12, '1st Semester Barangay Assembly 2026 na may temang “Nagkakaisang Barangay Tungo sa Kalinisan, Kaayusan, Kapayapaan at Kaunlaran.”', '2026-03-14', 'uploads/1st Semester Barangay Assembly 2026.jpg'),
(13, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 12_BARKADA2026_EMSB', '2026-03-22', 'uploads/WEEK 12_BARKADA2026_EMSB.jpg'),
(14, '#KALINISANsaBagongPilipinas2026 #DILGBARKADA #BuildBetterMore #CleanCommunities WEEK 13_BARKADA2026_EMSB', '2026-03-27', 'uploads/WEEK 13_BARKADA2026_EMSB.jpg'),
(15, 'Barangay Fiesta & Feast of St. Joseph the Worker 2026 ', '2026-05-01', 'uploads/barangay fiesta.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mi` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `user_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `email`, `password`, `lname`, `fname`, `mi`, `role`, `user_status`) VALUES
(1, 'barangayeastmodernsite@gmail.com', '16c9cd4f0d8d4983776b14d8c62f66ae', 'Admin', 'User', '', 'administrator', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_announcement`
--

CREATE TABLE `tbl_announcement` (
  `id_announcement` int(11) NOT NULL,
  `event` varchar(1000) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `addedby` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `set_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_announcement`
--

INSERT INTO `tbl_announcement` (`id_announcement`, `event`, `target`, `start_date`, `addedby`, `title`, `photo`, `set_date`) VALUES
(14, 'Calling all residents of Purok 4! Please be advised that there will be a community meeting to discuss important local projects and administrative updates. Your presence and participation are highly encouraged.\r\n\r\nDate: January 10, 2026\r\n\r\nTime: 9:00 AM\r\n\r\nLocation: Purok 4, in front of Reyes’ store\r\n\r\nAgenda:\r\n\r\nProfiling, Census, and Registration of Barangay Inhabitants\r\n\r\nCCTV implementation\r\n\r\nRegistration of Motorcycles\r\n\r\nCanal Project (in front of the Gaddi residence)\r\n\r\nWe look forward to seeing everyone there. Thank you for your cooperation!', NULL, '2026-05-07', 'Admin, User', 'NOTICE: Important Purok 4 Community Meeting', 'uploads/announcement_photos/ANN_69fc591d0d55b.jpg', '2026-01-10'),
(15, 'Just a friendly reminder to everyone asking about the SPES program: The online application period for 2026 was from January 7 to January 23, 2026.\r\n\r\nIf you missed this window, please stay tuned to the PESO Baguio Facebook Page for any announcements regarding future batches or new openings.\r\n\r\nAlways ensure your documents are complete, scanned clearly, and follow the specific requirements (like PSA birth certificates instead of NSO) to ensure your application is successful next time!', NULL, '2026-05-07', 'Admin, User', '📢 Note on SPES 2026 Applications', 'uploads/announcement_photos/ANN_69fc59c1aed8c.jpg', '2026-01-16'),
(16, 'Maintaining high standards of cleanliness and safety is vital for our local food businesses! We are keeping this record of the Food Handlers Orientation from January 21, 2026, to encourage all our local vendors and food service workers to stay updated on health protocols.\r\n\r\nProper training keeps our customers safe and our community healthy. If you are a food handler and need information on how to get certified or when the next training session will be, reach out to the East Modern Site Barangay office!', NULL, '2026-05-07', 'Admin, User', '🛡️ Prioritizing Food Safety in Our Community', 'uploads/announcement_photos/ANN_69fc59ff4ad5f.jpg', '2026-01-21'),
(17, 'Did you know that keeping our pets vaccinated is one of the best ways to keep our community safe from rabies? We are keeping this notice from February 25, 2026, as a reminder to all pet owners that these services are periodically offered by our Barangay.\r\n\r\nKey reminders for responsible pet ownership:\r\n\r\nAlways ensure your pets are of age and healthy before scheduling their vaccinations.\r\n\r\nDon\'t forget that registration is a mandatory requirement for dogs in our city.\r\n\r\nKeep your contact info and vaccination records up to date!\r\n\r\nStay tuned to our official Barangay channels for announcements on upcoming vaccination drives.', NULL, '2026-05-07', 'Admin, User', '🐶 Protecting Our Furry Friends: Rabies Vaccination Info', 'uploads/announcement_photos/ANN_69fc5a413eaae.jpg', '2026-02-25'),
(18, 'This serves as a record of the Barangay Assembly Day for the 1st Semester of 2026, held at the East Modern Site Barangay Hall on March 14, 2026.\r\n\r\nTheme: \"Nagkakaisang Barangay Tungo sa Kalinisan, Kaayusan, Kapayapaan at Kaunlaran.\"\r\n\r\nPurpose: The assembly serves as a venue for transparency and community dialogue, covering essential reports, accomplishments, and upcoming projects for our barangay.\r\n\r\nIf you are a resident looking for the minutes of this meeting or the Financial Report presented during the assembly, please visit the Barangay office.', NULL, '2026-05-07', 'Admin, User', '🏛️ Post-Assembly Report: Barangay Assembly Day (1st Semester 2026)', 'uploads/announcement_photos/ANN_69fc5a8b5e6b8.jpg', '2026-03-14'),
(19, 'What a wonderful celebration we had last May 1st! We came together as a community to honor the Feast Day of Saint Joseph the Worker with a day full of faith, service, and fun.\r\n\r\nA quick look back at our day:\r\n\r\nFaith & Service: We started with a solemn procession and Holy Mass, followed by a very successful Free Legal Consultation and Notarization service provided by the IBP.\r\n\r\nEnergy & Talent: From the morning Zumba session to the incredible performances by our Senior Citizens, PWDs, and Youth, the \"Hawak Mo ang Beat\" spirit was alive!\r\n\r\nCommunity Spirit: A special thanks to PB Peter G. Bucasan, Hon. Betty Lourdes F. Tabanda, and Kag. Ricky R. Give Jr. for their inspiring words and leadership.\r\n\r\nThank you to everyone who made this fiesta a success. See you at the next one! 🎊', NULL, '2026-05-07', 'Admin, User', '🎉 Viva! Highlights from the East Modern Site Barangay Fiesta 2026', 'uploads/announcement_photos/ANN_69fc5b87ee658.jpg', '2026-04-30'),
(20, 'We would like to extend our heartfelt thanks to the volunteer lawyers of the Integrated Bar of the Philippines (IBP) for their service last May 1st!\r\n\r\nProviding free legal consultations and notarization at the Doña Nicasia Juco Puyat Elementary School was a vital part of our community festivities. We hope that the residents who attended found the advice and services helpful for their legal and documentation needs.\r\n\r\nStay tuned for future outreach programs and public service announcements from the Barangay office!', NULL, '2026-05-07', 'Admin, User', '🏛️ Giving Back: A Successful Day of Legal Assistance', 'uploads/announcement_photos/ANN_69fc5cf11966a.jpg', '2026-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blotter`
--

CREATE TABLE `tbl_blotter` (
  `id_blotter` int(11) NOT NULL,
  `control_no` varchar(255) DEFAULT '',
  `id_resident` int(11) DEFAULT 0,
  `qr_code` varchar(255) DEFAULT '',
  `case_no` varchar(50) DEFAULT NULL,
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mi` varchar(255) NOT NULL,
  `age` int(3) DEFAULT NULL,
  `houseno` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `municipal` varchar(255) NOT NULL,
  `blot_photo` mediumblob DEFAULT NULL,
  `contact` varchar(20) NOT NULL,
  `narrative` mediumtext NOT NULL,
  `timeapplied` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('PENDING','APPROVED','REJECTED','READY FOR PICKUP','CLAIMED','DELETED','UNDER REVIEW','RECORDED','ONGOING','RESOLVED','CLOSED','ARCHIVED','CANCELLED') DEFAULT 'PENDING',
  `rlname` varchar(255) DEFAULT NULL,
  `rfname` varchar(255) DEFAULT NULL,
  `rmi` varchar(255) DEFAULT NULL,
  `rage` int(3) DEFAULT NULL,
  `rcontact` varchar(20) DEFAULT NULL,
  `raddress` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `witness` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_blotter`
--

INSERT INTO `tbl_blotter` (`id_blotter`, `control_no`, `id_resident`, `qr_code`, `case_no`, `lname`, `fname`, `mi`, `age`, `houseno`, `street`, `brgy`, `municipal`, `blot_photo`, `contact`, `narrative`, `timeapplied`, `status`, `rlname`, `rfname`, `rmi`, `rage`, `rcontact`, `raddress`, `type`, `date`, `time`, `location`, `witness`) VALUES
(1, 'TRBLOTTER-0080', 80, 'uploads/qr_codes/TRBLOTTER-0080.png', '89735', 'MENDOZA', 'ARTHUR', 'ELIZABETH', 34, '36', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09600865636', 'Vandalism reported by complainant.', '2026-04-13 16:22:33', 'PENDING', 'BAUTISTA', 'JANE', 'J', 77, '09970976193', '8870 Taft Ave', 'PUBLIC DISTURBANCE', '2024-07-19', '01:12:20', 'NEAR CHAPEL', 'RELATIVE'),
(2, 'TRBLOTTER-0067', 67, 'uploads/qr_codes/TRBLOTTER-0067.png', '44825', 'CRUZ', 'JOSE', 'FERNANDO', 66, '173', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09129833551', 'Dispute related to unpaid debt.', '2026-05-04 16:22:33', 'PENDING', 'SANTOS', 'LIZA', 'E', 56, '09780845985', '9797 Taft Ave', 'THREAT', '2020-11-27', '04:35:42', 'COMMUNITY CENTER', 'NONE'),
(3, 'TRBLOTTER-0025', 25, 'uploads/qr_codes/TRBLOTTER-0025.png', NULL, 'BAUTISTA', 'XERXES', 'ANDRES', 19, '80', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09152832638', 'Threatening statements reported.', '2026-05-01 16:22:33', 'PENDING', 'SANTOS', 'JOSE', 'H', 29, '09643252007', '6278 Mabini St', 'PHYSICAL INJURY', '2024-07-04', '10:22:22', 'TERMINAL', 'STORE OWNER'),
(4, 'TRBLOTTER-0040', 40, 'uploads/qr_codes/TRBLOTTER-0040.png', '45583', 'VILLAR', 'LIZA', 'MARIE', 17, '40', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09512739941', 'Vandalism reported by complainant.', '2026-04-29 16:22:33', 'PENDING', 'VILLAR', 'MARK', 'C', 62, '09065719158', '990 Mabini St', 'PHYSICAL INJURY', '2025-09-30', '17:26:55', 'BASKETBALL COURT', 'NONE'),
(5, 'TRBLOTTER-0061', 61, 'uploads/qr_codes/TRBLOTTER-0061.png', NULL, 'CRUZ', 'MARIA', 'MARIE', 41, '31', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09393412719', 'Dispute related to unpaid debt.', '2026-05-02 16:22:33', 'PENDING', 'BAUTISTA', 'ROSE', 'C', 53, '09322555197', '8323 Bonifacio St', 'VANDALISM', '2018-07-17', '11:39:26', 'NEAR BARANGAY HALL', 'SECURITY GUARD'),
(6, 'TRBLOTTER-0052', 52, 'uploads/qr_codes/TRBLOTTER-0052.png', '26933', 'NAVARRO', 'MARK', 'CLARA', 68, '15', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09831558463', 'Threatening statements reported.', '2026-04-23 16:22:33', 'PENDING', 'GARCIA', 'LIZA', 'I', 40, '09384159467', '7992 Osmeña Blvd', 'THREAT', '2020-09-01', '09:08:13', 'PUBLIC MARKET', 'STORE OWNER'),
(7, 'TRBLOTTER-0015', 15, 'uploads/qr_codes/TRBLOTTER-0015.png', '86533', 'REYES', 'DAVID', 'CLARA', 64, '206', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09286810392', 'Other complaint requiring barangay mediation.', '2026-04-14 16:22:33', 'PENDING', 'VILLAR', 'JOSE', 'E', 42, '09815774787', '8592 Osmeña Blvd', 'HARASSMENT', '2018-07-07', '22:04:03', 'MAIN ROAD', 'RELATIVE'),
(8, 'TRBLOTTER-0119', 119, 'uploads/qr_codes/TRBLOTTER-0119.png', '80892', 'VILLAR', 'JUAN', 'LUIS', 69, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09473979969', 'Property boundary dispute between neighbors.', '2026-04-08 16:22:33', 'PENDING', 'NAVARRO', 'JANE', 'H', 53, '09817829700', '3196 Bonifacio St', 'THREAT', '2022-06-27', '15:18:42', 'NEAR BARANGAY HALL', 'NEIGHBOR'),
(9, 'TRBLOTTER-0007', 7, 'uploads/qr_codes/TRBLOTTER-0007.png', NULL, 'RAMOS', 'CARLO', 'CLARA', 74, '104', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09527756726', 'Verbal altercation reported in the community.', '2026-04-10 16:22:33', 'PENDING', 'DELA CRUZ', 'CARLO', 'D', 43, '09192941702', '7072 Roxas Blvd', 'HARASSMENT', '2021-10-28', '06:22:58', 'RESIDENTIAL AREA', 'NONE'),
(10, 'TRBLOTTER-0010', 10, 'uploads/qr_codes/TRBLOTTER-0010.png', '94258', 'RAMOS', 'JOHN', 'MIGUEL', 20, '209', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09046418708', 'Threatening statements reported.', '2026-04-24 16:22:33', 'PENDING', 'RAMOS', 'JUAN', 'J', 57, '09400916017', '170 Osmeña Blvd', 'THEFT', '2024-11-06', '16:04:32', 'RESIDENTIAL AREA', 'RELATIVE'),
(11, 'TRBLOTTER-0109', 109, 'uploads/qr_codes/TRBLOTTER-0109.png', '43770', 'MENDOZA', 'PAOLO', 'GRACE', 48, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09161470634', 'Harassment complaint filed by complainant.', '2026-04-11 16:22:33', 'PENDING', 'BAUTISTA', 'JUAN', 'J', 72, '09552504628', '529 JP Rizal St', 'PUBLIC DISTURBANCE', '2020-10-16', '03:38:13', 'NEAR BARANGAY HALL', 'NONE'),
(12, 'TRBLOTTER-0059', 59, 'uploads/qr_codes/TRBLOTTER-0059.png', '73018', 'GARCIA', 'OLIVER', 'ELIZABETH', 10, '72', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09850598079', 'Threatening statements reported.', '2026-04-27 16:22:33', 'PENDING', 'BAUTISTA', 'PAOLO', 'E', 73, '09198371736', '2061 Quezon Ave', 'NOISE COMPLAINT', '2021-06-28', '18:04:22', 'COMMUNITY CENTER', 'BARANGAY TANOD'),
(13, 'TRBLOTTER-0011', 11, 'uploads/qr_codes/TRBLOTTER-0011.png', '64029', 'NAVARRO', 'MARIO', 'GARCIA', 69, '163', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09479126022', 'Dispute related to unpaid debt.', '2026-04-11 16:22:33', 'PENDING', 'SANTOS', 'JOSE', 'I', 42, '09535537426', '4584 JP Rizal St', 'VERBAL ABUSE', '2024-04-18', '20:48:23', 'NEAR CHAPEL', 'NONE'),
(14, 'TRBLOTTER-0068', 68, 'uploads/qr_codes/TRBLOTTER-0068.png', '30516', 'GARCIA', 'AUBREY', 'CLARA', 49, '20', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09490062240', 'Threatening statements reported.', '2026-04-28 16:22:33', 'PENDING', 'BAUTISTA', 'PAOLO', 'E', 65, '09649328068', '8515 Del Pilar St', 'PUBLIC DISTURBANCE', '2025-12-14', '05:09:13', 'RESIDENTIAL AREA', 'NEIGHBOR'),
(15, 'TRBLOTTER-0118', 118, 'uploads/qr_codes/TRBLOTTER-0118.png', '71293', 'MENDOZA', 'CARLO', 'CLARA', 21, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09035091005', 'Threatening statements reported.', '2026-04-14 16:22:33', 'PENDING', 'VILLAR', 'MARIA', 'C', 67, '09313827504', '1024 Taft Ave', 'NOISE COMPLAINT', '2026-03-17', '10:23:05', 'PUBLIC MARKET', 'BARANGAY TANOD'),
(16, 'TRBLOTTER-0001', 1, 'uploads/qr_codes/TRBLOTTER-0001.png', NULL, 'MENDOZA', 'MARK', 'FERNANDO', 48, '34', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09518053173', 'Vandalism reported by complainant.', '2026-04-27 16:22:33', 'UNDER REVIEW', 'DELA CRUZ', 'CARLO', 'J', 56, '09500279613', '5567 Mabini St', 'HARASSMENT', '2017-09-13', '02:19:06', 'NEAR RIVERBANK', 'NEIGHBOR'),
(17, 'TRBLOTTER-0054', 54, 'uploads/qr_codes/TRBLOTTER-0054.png', NULL, 'BAUTISTA', 'LIZA', 'FERNANDO', 33, '212', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09176301766', 'Minor physical altercation reported.', '2026-04-27 16:22:33', 'UNDER REVIEW', 'GARCIA', 'JANE', 'F', 20, '09499245319', '3793 Del Pilar St', 'THREAT', '2025-07-10', '20:14:22', 'RESIDENTIAL AREA', 'BARANGAY TANOD'),
(18, 'TRBLOTTER-0106', 106, 'uploads/qr_codes/TRBLOTTER-0106.png', '58001', 'GARCIA', 'ANA', 'MARIE', 35, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09760707683', 'Other complaint requiring barangay mediation.', '2026-04-28 16:22:33', 'UNDER REVIEW', 'MENDOZA', 'JUAN', 'E', 25, '09317413059', '2063 Rizal Ave', 'THREAT', '2019-11-12', '21:50:30', 'TERMINAL', 'BARANGAY TANOD'),
(19, 'TRBLOTTER-0104', 104, 'uploads/qr_codes/TRBLOTTER-0104.png', '50118', 'BAUTISTA', 'ANNE', 'FERNANDO', 71, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09945333864', 'Noise complaint during late hours.', '2026-05-02 16:22:33', 'UNDER REVIEW', 'DELA CRUZ', 'ROSE', 'A', 62, '09560488592', '5782 Mabini St', 'THEFT', '2016-12-08', '18:20:45', 'RESIDENTIAL AREA', 'PASSERBY'),
(20, 'TRBLOTTER-0110', 110, 'uploads/qr_codes/TRBLOTTER-0110.png', '42055', 'FLORES', 'JANE', 'SOFIA', 30, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09597046623', 'Property boundary dispute between neighbors.', '2026-04-23 16:22:33', 'UNDER REVIEW', 'GARCIA', 'PAOLO', 'A', 31, '09836813472', '5114 Rizal Ave', 'HARASSMENT', '2022-10-24', '16:05:28', 'MAIN ROAD', 'RELATIVE'),
(21, 'TRBLOTTER-0115', 115, 'uploads/qr_codes/TRBLOTTER-0115.png', '59302', 'MENDOZA', 'LIZA', 'ANDRES', 74, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09181860024', 'Noise complaint during late hours.', '2026-05-01 16:22:33', 'UNDER REVIEW', 'REYES', 'JANE', 'B', 56, '09850978425', '3180 Rizal Ave', 'PHYSICAL INJURY', '2025-11-12', '13:02:34', 'SCHOOL AREA', 'NEIGHBOR'),
(22, 'TRBLOTTER-0048', 48, 'uploads/qr_codes/TRBLOTTER-0048.png', '68161', 'RAMOS', 'KAYE', 'GRACE', 73, '99', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09587851868', 'Verbal altercation reported in the community.', '2026-04-26 16:22:33', 'UNDER REVIEW', 'MENDOZA', 'MARK', 'A', 19, '09020988067', '121 Roxas Blvd', 'PUBLIC DISTURBANCE', '2018-10-02', '22:44:15', 'BASKETBALL COURT', 'RELATIVE'),
(23, 'TRBLOTTER-0079', 79, 'uploads/qr_codes/TRBLOTTER-0079.png', '98548', 'SANTOS', 'LIZA', 'ANTONIO', 52, '104', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09612269009', 'Public disturbance reported.', '2026-04-19 16:22:33', 'UNDER REVIEW', 'SANTOS', 'ROSE', 'A', 47, '09400475990', '5334 Quezon Ave', 'HARASSMENT', '2023-12-04', '00:39:03', 'BASKETBALL COURT', 'SECURITY GUARD'),
(24, 'TRBLOTTER-0117', 117, 'uploads/qr_codes/TRBLOTTER-0117.png', '18806', 'SANTOS', 'JOSE', 'ELIZABETH', 38, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09503161663', 'Harassment complaint filed by complainant.', '2026-04-18 16:22:33', 'UNDER REVIEW', 'BAUTISTA', 'PAOLO', 'D', 50, '09572573707', '2254 Quezon Ave', 'THEFT', '2020-02-15', '00:03:09', 'PUBLIC MARKET', 'PASSERBY'),
(25, 'TRBLOTTER-0092', 92, 'uploads/qr_codes/TRBLOTTER-0092.png', NULL, 'RAMOS', 'JOSEFA', 'MIGUEL', 19, '57', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09498725843', 'Minor physical altercation reported.', '2026-04-21 16:22:33', 'UNDER REVIEW', 'REYES', 'JANE', 'A', 41, '09719215924', '4317 Rizal Ave', 'HARASSMENT', '2020-12-15', '13:42:28', 'MAIN ROAD', 'RELATIVE'),
(26, 'TRBLOTTER-0076', 76, 'uploads/qr_codes/TRBLOTTER-0076.png', '95035', 'SANTOS', 'LIZA', 'MIGUEL', 39, '123', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09613958180', 'Dispute related to unpaid debt.', '2026-04-27 16:22:33', 'UNDER REVIEW', 'BAUTISTA', 'MARIA', 'J', 46, '09362565891', '4066 Roxas Blvd', 'NOISE COMPLAINT', '2019-05-02', '23:37:34', 'NEAR RIVERBANK', 'NEIGHBOR'),
(27, 'TRBLOTTER-0093', 93, 'uploads/qr_codes/TRBLOTTER-0093.png', NULL, 'NAVARRO', 'ALEXA', 'GRACE', 68, '63', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09923952484', 'Threatening statements reported.', '2026-05-03 16:22:33', 'UNDER REVIEW', 'NAVARRO', 'PAOLO', 'J', 38, '09914150566', '5564 Rizal Ave', 'NOISE COMPLAINT', '2021-01-25', '01:12:56', 'TERMINAL', 'NEIGHBOR'),
(28, 'TRBLOTTER-0121', 121, 'uploads/qr_codes/TRBLOTTER-0121.png', '37396', 'llloyd', 'Davilla', 'Maiores voluptate ra', 13, 'Rerum perferendis od', 'Proident libero aut', 'East Modern Site', 'Baguio City', NULL, '09611887772', 'Threatening statements reported.', '2026-05-05 16:22:33', 'UNDER REVIEW', 'REYES', 'ANA', 'H', 69, '09017205244', '5126 Taft Ave', 'VERBAL ABUSE', '2020-09-26', '17:57:20', 'NEAR BARANGAY HALL', 'NONE'),
(29, 'TRBLOTTER-0028', 28, 'uploads/qr_codes/TRBLOTTER-0028.png', NULL, 'FLORES', 'JOSE', 'SOFIA', 31, '29', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09475544116', 'Other complaint requiring barangay mediation.', '2026-05-03 16:22:33', 'UNDER REVIEW', 'NAVARRO', 'ANA', 'D', 75, '09702602444', '6195 Roxas Blvd', 'VERBAL ABUSE', '2021-07-24', '02:58:07', 'PUBLIC MARKET', 'FRIEND'),
(30, 'TRBLOTTER-0021', 21, 'uploads/qr_codes/TRBLOTTER-0021.png', NULL, 'GARCIA', 'JORGE', 'LUIS', 23, '132', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09434252431', 'Threatening statements reported.', '2026-04-25 16:22:33', 'UNDER REVIEW', 'SANTOS', 'LIZA', 'D', 21, '09320991039', '4146 Bonifacio St', 'THEFT', '2024-04-29', '02:09:29', 'NEAR RIVERBANK', 'SECURITY GUARD'),
(31, 'TRBLOTTER-0002', 2, 'uploads/qr_codes/TRBLOTTER-0002.png', NULL, 'VILLAR', 'MICHELLE', 'MIGUEL', 30, '122', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09059601777', 'Noise complaint during late hours.', '2026-04-17 16:22:33', 'RECORDED', 'BAUTISTA', 'ANA', 'H', 73, '09246395470', '4589 Taft Ave', 'VANDALISM', '2022-12-27', '11:28:28', 'COMMUNITY CENTER', 'RELATIVE'),
(32, 'TRBLOTTER-0088', 88, 'uploads/qr_codes/TRBLOTTER-0088.png', NULL, 'REYES', 'MAVERICK', 'ELIZABETH', 24, '42', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09620131871', 'Other complaint requiring barangay mediation.', '2026-04-09 16:22:33', 'RECORDED', 'BAUTISTA', 'LIZA', 'F', 43, '09372170244', '5832 National Highway', 'PHYSICAL INJURY', '2017-11-23', '11:31:16', 'NEAR RIVERBANK', 'SECURITY GUARD'),
(33, 'TRBLOTTER-0114', 114, 'uploads/qr_codes/TRBLOTTER-0114.png', '47493', 'SANTOS', 'JOSE', 'MARIE', 25, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09056674378', 'Property boundary dispute between neighbors.', '2026-05-02 16:22:33', 'RECORDED', 'VILLAR', 'JANE', 'D', 66, '09964944575', '3941 Rizal Ave', 'PHYSICAL INJURY', '2018-10-14', '04:35:36', 'TERMINAL', 'STORE OWNER'),
(34, 'TRBLOTTER-0066', 66, 'uploads/qr_codes/TRBLOTTER-0066.png', NULL, 'FLORES', 'JACK', 'LUIS', 18, '199', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09467136964', 'Threatening statements reported.', '2026-04-25 16:22:33', 'RECORDED', 'SANTOS', 'CARLO', 'I', 45, '09637646914', '7954 Rizal Ave', 'PUBLIC DISTURBANCE', '2021-06-30', '14:49:55', 'TERMINAL', 'BARANGAY TANOD'),
(35, 'TRBLOTTER-0008', 8, 'uploads/qr_codes/TRBLOTTER-0008.png', '58706', 'VILLAR', 'JUAN', 'LUIS', 56, '171', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09389588906', 'Property boundary dispute between neighbors.', '2026-05-03 16:22:33', 'RECORDED', 'MENDOZA', 'MARK', 'B', 37, '09216889453', '1081 Osmeña Blvd', 'VERBAL ABUSE', '2016-11-04', '09:09:35', 'NEAR BARANGAY HALL', 'NEIGHBOR'),
(36, 'TRBLOTTER-0006', 6, 'uploads/qr_codes/TRBLOTTER-0006.png', '24026', 'REYES', 'ANA', 'ELIZABETH', 25, '116', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09857378201', 'Dispute related to unpaid debt.', '2026-04-13 16:22:33', 'RECORDED', 'NAVARRO', 'CARLO', 'H', 75, '09502529670', '6384 JP Rizal St', 'NOISE COMPLAINT', '2021-07-04', '21:32:36', 'NEAR BARANGAY HALL', 'RELATIVE'),
(37, 'TRBLOTTER-0031', 31, 'uploads/qr_codes/TRBLOTTER-0031.png', NULL, 'FLORES', 'IAN', 'CLARA', 44, '152', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09057562717', 'Other complaint requiring barangay mediation.', '2026-04-12 16:22:33', 'RECORDED', 'VILLAR', 'MARIA', 'B', 20, '09908180634', '4100 Del Pilar St', 'VANDALISM', '2026-03-18', '20:55:29', 'COMMUNITY CENTER', 'SECURITY GUARD'),
(38, 'TRBLOTTER-0018', 18, 'uploads/qr_codes/TRBLOTTER-0018.png', '85287', 'GARCIA', 'CARLO', 'MIGUEL', 11, '240', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09680949443', 'Harassment complaint filed by complainant.', '2026-04-25 16:22:33', 'RECORDED', 'REYES', 'ANA', 'B', 43, '09778970576', '6052 JP Rizal St', 'HARASSMENT', '2025-06-25', '12:55:35', 'BASKETBALL COURT', 'FRIEND'),
(39, 'TRBLOTTER-0044', 44, 'uploads/qr_codes/TRBLOTTER-0044.png', '74378', 'SANTOS', 'ROSE', 'CLARA', 12, '21', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09147876449', 'Threatening statements reported.', '2026-04-26 16:22:33', 'RECORDED', 'FLORES', 'ROSE', 'C', 75, '09941352401', '8115 Mabini St', 'HARASSMENT', '2016-09-15', '14:55:43', 'MAIN ROAD', 'NEIGHBOR'),
(40, 'TRBLOTTER-0102', 102, 'uploads/qr_codes/TRBLOTTER-0102.png', '66297', 'CRUZ', 'MARK', 'SOFIA', 40, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09358108682', 'Property boundary dispute between neighbors.', '2026-04-26 16:22:33', 'RECORDED', 'NAVARRO', 'JANE', 'C', 37, '09972756699', '9062 JP Rizal St', 'THEFT', '2017-06-04', '10:10:32', 'BASKETBALL COURT', 'SECURITY GUARD'),
(41, 'TRBLOTTER-0045', 45, 'uploads/qr_codes/TRBLOTTER-0045.png', '11860', 'RAMOS', 'XIAN', 'LUIS', 60, '76', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09586070420', 'Dispute related to unpaid debt.', '2026-04-15 16:22:33', 'RECORDED', 'RAMOS', 'JANE', 'E', 40, '09572483450', '7426 Roxas Blvd', 'HARASSMENT', '2018-09-23', '13:28:54', 'SCHOOL AREA', 'SECURITY GUARD'),
(42, 'TRBLOTTER-0030', 30, 'uploads/qr_codes/TRBLOTTER-0030.png', NULL, 'MENDOZA', 'ROSE', 'FERNANDO', 62, '194', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09134044516', 'Threatening statements reported.', '2026-04-22 16:22:33', 'RECORDED', 'MENDOZA', 'ANA', 'A', 20, '09209810687', '9223 Roxas Blvd', 'PHYSICAL INJURY', '2018-08-24', '10:07:31', 'NEAR CHAPEL', 'PASSERBY'),
(43, 'TRBLOTTER-0098', 98, 'uploads/qr_codes/TRBLOTTER-0098.png', NULL, 'BAUTISTA', 'FELIX', 'MARIE', 45, '114', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09338984848', 'Verbal altercation reported in the community.', '2026-05-05 16:22:33', 'RECORDED', 'DELA CRUZ', 'MARIA', 'G', 64, '09926554671', '3158 National Highway', 'VERBAL ABUSE', '2017-11-18', '02:05:32', 'NEAR RIVERBANK', 'NEIGHBOR'),
(44, 'TRBLOTTER-0019', 19, 'uploads/qr_codes/TRBLOTTER-0019.png', '39108', 'BAUTISTA', 'ROSE', 'GRACE', 59, '90', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09288948124', 'Public disturbance reported.', '2026-04-28 16:22:33', 'RECORDED', 'NAVARRO', 'JANE', 'G', 26, '09874102512', '9561 Bonifacio St', 'PUBLIC DISTURBANCE', '2024-12-08', '22:25:08', 'MAIN ROAD', 'RELATIVE'),
(45, 'TRBLOTTER-0074', 74, 'uploads/qr_codes/TRBLOTTER-0074.png', '96307', 'MENDOZA', 'ETHAN', 'LUIS', 74, '232', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09296508640', 'Dispute related to unpaid debt.', '2026-04-18 16:22:33', 'RECORDED', 'NAVARRO', 'MARIA', 'D', 31, '09187727649', '2503 JP Rizal St', 'HARASSMENT', '2022-06-12', '21:02:35', 'MAIN ROAD', 'RELATIVE'),
(46, 'TRBLOTTER-0012', 12, 'uploads/qr_codes/TRBLOTTER-0012.png', '51946', 'REYES', 'PAULA', 'ANDRES', 51, '184', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09688537169', 'Other complaint requiring barangay mediation.', '2026-04-20 16:22:33', 'ONGOING', 'VILLAR', 'MARK', 'D', 36, '09544721218', '7896 Del Pilar St', 'PHYSICAL INJURY', '2025-09-15', '17:10:13', 'COMMUNITY CENTER', 'STORE OWNER'),
(47, 'TRBLOTTER-0041', 41, 'uploads/qr_codes/TRBLOTTER-0041.png', '49164', 'SANTOS', 'ROSE', 'ANDRES', 65, '20', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09359582268', 'Public disturbance reported.', '2026-04-27 16:22:33', 'ONGOING', 'NAVARRO', 'JANE', 'G', 32, '09306092167', '7945 Rizal Ave', 'PUBLIC DISTURBANCE', '2023-08-11', '16:57:32', 'NEAR CHAPEL', 'RELATIVE'),
(48, 'TRBLOTTER-0055', 55, 'uploads/qr_codes/TRBLOTTER-0055.png', NULL, 'NAVARRO', 'ROSE', 'MIGUEL', 15, '103', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09313300492', 'Dispute related to unpaid debt.', '2026-04-23 16:22:33', 'ONGOING', 'DELA CRUZ', 'JANE', 'E', 61, '09151749260', '5774 Quezon Ave', 'VANDALISM', '2017-12-25', '21:40:46', 'NEAR BARANGAY HALL', 'BARANGAY TANOD'),
(49, 'TRBLOTTER-0108', 108, 'uploads/qr_codes/TRBLOTTER-0108.png', '16056', 'CRUZ', 'JUAN', 'ANTONIO', 66, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09997176405', 'Property boundary dispute between neighbors.', '2026-04-28 16:22:33', 'ONGOING', 'MENDOZA', 'ROSE', 'E', 18, '09584725536', '9022 National Highway', 'VERBAL ABUSE', '2025-02-28', '08:35:53', 'BASKETBALL COURT', 'NONE'),
(50, 'TRBLOTTER-0009', 9, 'uploads/qr_codes/TRBLOTTER-0009.png', NULL, 'REYES', 'ANA', 'FERNANDO', 38, '45', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09628126614', 'Dispute related to unpaid debt.', '2026-05-01 16:22:33', 'ONGOING', 'FLORES', 'ANA', 'I', 34, '09804484913', '1772 Quezon Ave', 'THREAT', '2019-01-12', '04:03:41', 'TERMINAL', 'PASSERBY'),
(51, 'TRBLOTTER-0004', 4, 'uploads/qr_codes/TRBLOTTER-0004.png', '72757', 'RAMOS', 'LORENZO', 'ANDRES', 61, '169', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09736623818', 'Property boundary dispute between neighbors.', '2026-04-30 16:22:33', 'ONGOING', 'DELA CRUZ', 'ROSE', 'A', 64, '09676650910', '421 Bonifacio St', 'THREAT', '2022-12-16', '08:46:06', 'NEAR RIVERBANK', 'SECURITY GUARD'),
(52, 'TRBLOTTER-0017', 17, 'uploads/qr_codes/TRBLOTTER-0017.png', '91541', 'NAVARRO', 'JOSE', 'FERNANDO', 28, '37', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09081163468', 'Public disturbance reported.', '2026-04-29 16:22:33', 'ONGOING', 'GARCIA', 'ANA', 'F', 61, '09926287713', '4794 JP Rizal St', 'HARASSMENT', '2022-04-03', '02:05:34', 'MAIN ROAD', 'STORE OWNER'),
(53, 'TRBLOTTER-0064', 64, 'uploads/qr_codes/TRBLOTTER-0064.png', NULL, 'CRUZ', 'MARIA', 'GRACE', 53, '28', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09856594638', 'Minor physical altercation reported.', '2026-04-29 16:22:33', 'ONGOING', 'DELA CRUZ', 'PAOLO', 'C', 58, '09719859383', '5958 Osmeña Blvd', 'THEFT', '2025-05-29', '12:51:44', 'COMMUNITY CENTER', 'RELATIVE'),
(54, 'TRBLOTTER-0097', 97, 'uploads/qr_codes/TRBLOTTER-0097.png', '60689', 'GARCIA', 'JENNA', 'CLARA', 63, '196', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09032093659', 'Public disturbance reported.', '2026-05-02 16:22:33', 'ONGOING', 'SANTOS', 'MARIA', 'E', 72, '09078227514', '6854 Bonifacio St', 'PUBLIC DISTURBANCE', '2016-10-22', '01:13:35', 'COMMUNITY CENTER', 'STORE OWNER'),
(55, 'TRBLOTTER-0043', 43, 'uploads/qr_codes/TRBLOTTER-0043.png', '10920', 'VILLAR', 'CARLO', 'ELIZABETH', 30, '93', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09255860109', 'Noise complaint during late hours.', '2026-05-02 16:22:33', 'ONGOING', 'DELA CRUZ', 'JUAN', 'J', 45, '09556980623', '4143 Quezon Ave', 'THREAT', '2020-05-08', '17:13:17', 'NEAR CHAPEL', 'STORE OWNER'),
(56, 'TRBLOTTER-0053', 53, 'uploads/qr_codes/TRBLOTTER-0053.png', '60762', 'REYES', 'JOSE', 'MARIE', 50, '152', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09217090878', 'Verbal altercation reported in the community.', '2026-04-15 16:22:33', 'ONGOING', 'SANTOS', 'MARK', 'B', 53, '09544927994', '9291 Rizal Ave', 'THEFT', '2023-04-11', '17:33:04', 'NEAR CHAPEL', 'RELATIVE'),
(57, 'TRBLOTTER-0057', 57, 'uploads/qr_codes/TRBLOTTER-0057.png', NULL, 'BAUTISTA', 'CARLA', 'SOFIA', 46, '92', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09789893126', 'Dispute related to unpaid debt.', '2026-04-11 16:22:33', 'ONGOING', 'SANTOS', 'PAOLO', 'F', 39, '09226980454', '735 JP Rizal St', 'PHYSICAL INJURY', '2026-04-27', '08:59:26', 'NEAR RIVERBANK', 'NEIGHBOR'),
(58, 'TRBLOTTER-0086', 86, 'uploads/qr_codes/TRBLOTTER-0086.png', '58503', 'RAMOS', 'MARIA', 'ANDRES', 60, '24', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09335728976', 'Noise complaint during late hours.', '2026-04-12 16:22:33', 'ONGOING', 'RAMOS', 'CARLO', 'C', 26, '09966056306', '4159 Bonifacio St', 'HARASSMENT', '2018-10-30', '18:46:23', 'TERMINAL', 'SECURITY GUARD'),
(59, 'TRBLOTTER-0070', 70, 'uploads/qr_codes/TRBLOTTER-0070.png', '64926', 'CRUZ', 'SAMUEL', 'ANDRES', 13, '86', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09445887633', 'Minor physical altercation reported.', '2026-04-28 16:22:33', 'ONGOING', 'GARCIA', 'ROSE', 'D', 35, '09330480630', '7632 Osmeña Blvd', 'THREAT', '2019-06-12', '22:52:45', 'TERMINAL', 'FRIEND'),
(60, 'TRBLOTTER-0036', 36, 'uploads/qr_codes/TRBLOTTER-0036.png', NULL, 'MENDOZA', 'MARIA', 'SOFIA', 22, '160', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09377096783', 'Dispute related to unpaid debt.', '2026-05-05 16:22:33', 'ONGOING', 'REYES', 'JANE', 'C', 43, '09330215502', '3604 Osmeña Blvd', 'PUBLIC DISTURBANCE', '2021-11-25', '07:04:52', 'PUBLIC MARKET', 'STORE OWNER'),
(61, 'TRBLOTTER-0082', 82, 'uploads/qr_codes/TRBLOTTER-0082.png', '10754', 'SANTOS', 'CHRISTINA', 'LUIS', 65, '227', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09359837659', 'Public disturbance reported.', '2026-04-27 16:22:33', 'RESOLVED', 'VILLAR', 'JOSE', 'H', 72, '09381379366', '1741 National Highway', 'VERBAL ABUSE', '2022-09-07', '12:06:05', 'BASKETBALL COURT', 'FRIEND'),
(62, 'TRBLOTTER-0075', 75, 'uploads/qr_codes/TRBLOTTER-0075.png', '86557', 'FLORES', 'MARIA', 'FERNANDO', 57, '164', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09698235867', 'Vandalism reported by complainant.', '2026-04-22 16:22:33', 'RESOLVED', 'SANTOS', 'ANA', 'B', 18, '09430741578', '1493 Quezon Ave', 'THREAT', '2018-10-19', '07:17:16', 'MAIN ROAD', 'BARANGAY TANOD'),
(63, 'TRBLOTTER-0073', 73, 'uploads/qr_codes/TRBLOTTER-0073.png', NULL, 'SANTOS', 'PAOLO', 'SOFIA', 26, '165', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09362037395', 'Other complaint requiring barangay mediation.', '2026-04-08 16:22:33', 'RESOLVED', 'MENDOZA', 'JANE', 'D', 59, '09486327661', '3357 Mabini St', 'VERBAL ABUSE', '2018-06-01', '16:41:33', 'NEAR BARANGAY HALL', 'RELATIVE'),
(64, 'TRBLOTTER-0060', 60, 'uploads/qr_codes/TRBLOTTER-0060.png', '43683', 'BAUTISTA', 'ELIJAH', 'CLARA', 58, '149', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09265205973', 'Property boundary dispute between neighbors.', '2026-04-26 16:22:33', 'RESOLVED', 'VILLAR', 'ANA', 'C', 23, '09736171573', '4210 Osmeña Blvd', 'PHYSICAL INJURY', '2022-04-12', '09:00:34', 'TERMINAL', 'NEIGHBOR'),
(65, 'TRBLOTTER-0023', 23, 'uploads/qr_codes/TRBLOTTER-0023.png', '69717', 'CRUZ', 'BRACIA', 'CLARA', 54, '185', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09901219192', 'Other complaint requiring barangay mediation.', '2026-05-03 16:22:33', 'RESOLVED', 'BAUTISTA', 'MARK', 'A', 75, '09621921214', '2259 Mabini St', 'HARASSMENT', '2022-04-05', '02:58:12', 'COMMUNITY CENTER', 'FRIEND'),
(66, 'TRBLOTTER-0024', 24, 'uploads/qr_codes/TRBLOTTER-0024.png', '24072', 'GARCIA', 'JAKE', 'MARIE', 36, '27', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09335303829', 'Public disturbance reported.', '2026-04-28 16:22:33', 'RESOLVED', 'NAVARRO', 'JANE', 'F', 77, '09211495329', '917 Osmeña Blvd', 'THREAT', '2018-11-04', '05:16:08', 'NEAR RIVERBANK', 'FRIEND'),
(67, 'TRBLOTTER-0094', 94, 'uploads/qr_codes/TRBLOTTER-0094.png', NULL, 'REYES', 'ENZO', 'SOFIA', 50, '143', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09497719816', 'Property boundary dispute between neighbors.', '2026-04-20 16:22:33', 'RESOLVED', 'DELA CRUZ', 'LIZA', 'H', 22, '09075583750', '1724 JP Rizal St', 'HARASSMENT', '2022-06-23', '23:01:29', 'TERMINAL', 'BARANGAY TANOD'),
(68, 'TRBLOTTER-0081', 81, 'uploads/qr_codes/TRBLOTTER-0081.png', '19058', 'VILLAR', 'ALEXANDER', 'CLARA', 16, '117', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09428946298', 'Vandalism reported by complainant.', '2026-04-29 16:22:33', 'RESOLVED', 'DELA CRUZ', 'PAOLO', 'C', 65, '09256269397', '8990 National Highway', 'PUBLIC DISTURBANCE', '2021-05-25', '16:05:55', 'NEAR RIVERBANK', 'BARANGAY TANOD'),
(69, 'TRBLOTTER-0005', 5, 'uploads/qr_codes/TRBLOTTER-0005.png', NULL, 'VILLAR', 'ROSE', 'ANTONIO', 43, '75', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09859422924', 'Dispute related to unpaid debt.', '2026-04-15 16:22:33', 'RESOLVED', 'RAMOS', 'MARIA', 'G', 48, '09720331388', '574 Bonifacio St', 'VANDALISM', '2017-04-08', '04:02:55', 'PUBLIC MARKET', 'NONE'),
(70, 'TRBLOTTER-0065', 65, 'uploads/qr_codes/TRBLOTTER-0065.png', NULL, 'GARCIA', 'LIZA', 'SOFIA', 36, '107', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09153101577', 'Verbal altercation reported in the community.', '2026-05-05 16:22:33', 'RESOLVED', 'NAVARRO', 'ROSE', 'I', 75, '09093476442', '5933 JP Rizal St', 'HARASSMENT', '2024-05-26', '00:30:04', 'SCHOOL AREA', 'FRIEND'),
(71, 'TRBLOTTER-0035', 35, 'uploads/qr_codes/TRBLOTTER-0035.png', NULL, 'SANTOS', 'JORDAN', 'GRACE', 39, '71', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09314390324', 'Public disturbance reported.', '2026-04-23 16:22:33', 'RESOLVED', 'RAMOS', 'JUAN', 'A', 23, '09192921177', '7143 Roxas Blvd', 'THREAT', '2025-01-15', '04:28:11', 'SCHOOL AREA', 'NEIGHBOR'),
(72, 'TRBLOTTER-0112', 112, 'uploads/qr_codes/TRBLOTTER-0112.png', NULL, 'MENDOZA', 'PAOLO', 'FERNANDO', 61, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09665346410', 'Minor physical altercation reported.', '2026-04-12 16:22:33', 'RESOLVED', 'NAVARRO', 'CARLO', 'H', 69, '09032049011', '6053 Roxas Blvd', 'THREAT', '2022-06-06', '10:45:26', 'NEAR BARANGAY HALL', 'SECURITY GUARD'),
(73, 'TRBLOTTER-0063', 63, 'uploads/qr_codes/TRBLOTTER-0063.png', '73734', 'BAUTISTA', 'MARK', 'MIGUEL', 71, '178', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09375178420', 'Verbal altercation reported in the community.', '2026-04-25 16:22:33', 'RESOLVED', 'RAMOS', 'MARIA', 'D', 28, '09925574128', '1246 Osmeña Blvd', 'THREAT', '2018-11-22', '03:47:13', 'SCHOOL AREA', 'BARANGAY TANOD'),
(74, 'TRBLOTTER-0032', 32, 'uploads/qr_codes/TRBLOTTER-0032.png', '13198', 'CRUZ', 'CARLO', 'MARIE', 27, '175', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09234427730', 'Other complaint requiring barangay mediation.', '2026-05-05 16:22:33', 'RESOLVED', 'REYES', 'PAOLO', 'B', 47, '09066244519', '8312 Roxas Blvd', 'THEFT', '2020-05-27', '02:12:55', 'TERMINAL', 'NONE'),
(75, 'TRBLOTTER-0087', 87, 'uploads/qr_codes/TRBLOTTER-0087.png', '40040', 'VILLAR', 'HARRY', 'ANTONIO', 42, '73', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09882696346', 'Minor physical altercation reported.', '2026-04-28 16:22:33', 'RESOLVED', 'DELA CRUZ', 'CARLO', 'I', 47, '09867603310', '8574 JP Rizal St', 'THREAT', '2024-05-24', '10:13:49', 'SCHOOL AREA', 'RELATIVE'),
(76, 'TRBLOTTER-0056', 56, 'uploads/qr_codes/TRBLOTTER-0056.png', '78071', 'REYES', 'LIAM', 'GRACE', 63, '131', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09219676595', 'Minor physical altercation reported.', '2026-04-26 16:22:33', 'CLOSED', 'RAMOS', 'ANA', 'C', 28, '09200973211', '4697 National Highway', 'THEFT', '2022-09-28', '20:13:55', 'PUBLIC MARKET', 'NEIGHBOR'),
(77, 'TRBLOTTER-0099', 99, 'uploads/qr_codes/TRBLOTTER-0099.png', NULL, 'NAVARRO', 'JOY', 'ANDRES', 27, '231', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09066342098', 'Harassment complaint filed by complainant.', '2026-05-02 16:22:33', 'CLOSED', 'SANTOS', 'PAOLO', 'G', 65, '09148793592', '3698 Quezon Ave', 'PUBLIC DISTURBANCE', '2023-04-04', '20:01:11', 'MAIN ROAD', 'PASSERBY'),
(78, 'TRBLOTTER-0039', 39, 'uploads/qr_codes/TRBLOTTER-0039.png', '24910', 'MENDOZA', 'LUIGI', 'MIGUEL', 34, '226', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09322194549', 'Public disturbance reported.', '2026-04-28 16:22:33', 'CLOSED', 'BAUTISTA', 'LIZA', 'J', 25, '09673246371', '9986 Roxas Blvd', 'THREAT', '2021-12-06', '14:09:18', 'TERMINAL', 'BARANGAY TANOD'),
(79, 'TRBLOTTER-0069', 69, 'uploads/qr_codes/TRBLOTTER-0069.png', '46676', 'FLORES', 'ROSE', 'MARIE', 31, '79', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09814165701', 'Verbal altercation reported in the community.', '2026-04-11 16:22:33', 'CLOSED', 'FLORES', 'ANA', 'I', 34, '09780012257', '716 Rizal Ave', 'THREAT', '2023-02-23', '23:24:10', 'RESIDENTIAL AREA', 'PASSERBY'),
(80, 'TRBLOTTER-0026', 26, 'uploads/qr_codes/TRBLOTTER-0026.png', '70307', 'CRUZ', 'LIZA', 'MIGUEL', 67, '67', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09649618870', 'Dispute related to unpaid debt.', '2026-04-21 16:22:33', 'CLOSED', 'GARCIA', 'LIZA', 'D', 33, '09218004254', '3155 Roxas Blvd', 'HARASSMENT', '2020-07-18', '21:22:22', 'NEAR CHAPEL', 'SECURITY GUARD'),
(81, 'TRBLOTTER-0096', 96, 'uploads/qr_codes/TRBLOTTER-0096.png', NULL, 'NAVARRO', 'JANE', 'ELIZABETH', 14, '206', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09023170983', 'Public disturbance reported.', '2026-04-07 16:22:33', 'CLOSED', 'GARCIA', 'MARK', 'F', 70, '09617772656', '4406 Del Pilar St', 'VANDALISM', '2025-07-13', '03:05:04', 'COMMUNITY CENTER', 'FRIEND'),
(82, 'TRBLOTTER-0051', 51, 'uploads/qr_codes/TRBLOTTER-0051.png', '45925', 'RAMOS', 'LIZA', 'ELIZABETH', 20, '58', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09023321134', 'Dispute related to unpaid debt.', '2026-04-07 16:22:33', 'CLOSED', 'VILLAR', 'CARLO', 'E', 28, '09635691466', '6770 Quezon Ave', 'THEFT', '2022-09-28', '17:24:35', 'SCHOOL AREA', 'FRIEND'),
(83, 'TRBLOTTER-0013', 13, 'uploads/qr_codes/TRBLOTTER-0013.png', NULL, 'RAMOS', 'MARCELLINE', 'ANTONIO', 33, '180', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09428204222', 'Public disturbance reported.', '2026-04-11 16:22:33', 'CLOSED', 'BAUTISTA', 'MARK', 'G', 35, '09379363286', '282 Rizal Ave', 'PUBLIC DISTURBANCE', '2019-12-31', '09:20:02', 'NEAR BARANGAY HALL', 'NONE'),
(84, 'TRBLOTTER-0085', 85, 'uploads/qr_codes/TRBLOTTER-0085.png', NULL, 'REYES', 'JANE', 'GRACE', 11, '99', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09867666719', 'Dispute related to unpaid debt.', '2026-04-20 16:22:33', 'CLOSED', 'BAUTISTA', 'ROSE', 'B', 41, '09406015207', '8586 Rizal Ave', 'THREAT', '2018-08-14', '11:11:11', 'NEAR BARANGAY HALL', 'PASSERBY'),
(85, 'TRBLOTTER-0038', 38, 'uploads/qr_codes/TRBLOTTER-0038.png', NULL, 'SANTOS', 'MARK', 'FERNANDO', 52, '196', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09410227328', 'Noise complaint during late hours.', '2026-04-13 16:22:33', 'CLOSED', 'SANTOS', 'PAOLO', 'I', 76, '09236859633', '2810 JP Rizal St', 'HARASSMENT', '2025-09-25', '10:02:08', 'RESIDENTIAL AREA', 'BARANGAY TANOD'),
(86, 'TRBLOTTER-0111', 111, 'uploads/qr_codes/TRBLOTTER-0111.png', '70188', 'CRUZ', 'MARIA', 'LUIS', 13, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09616896993', 'Threatening statements reported.', '2026-04-09 16:22:33', 'CANCELLED', 'NAVARRO', 'MARIA', 'E', 58, '09099565398', '4910 Bonifacio St', 'THEFT', '2025-08-17', '10:25:28', 'RESIDENTIAL AREA', 'RELATIVE'),
(87, 'TRBLOTTER-0071', 71, 'uploads/qr_codes/TRBLOTTER-0071.png', '29383', 'MENDOZA', 'JANE', 'ANTONIO', 61, '191', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09244801484', 'Noise complaint during late hours.', '2026-05-04 16:22:33', 'CANCELLED', 'NAVARRO', 'ROSE', 'H', 33, '09017187855', '3302 Taft Ave', 'VERBAL ABUSE', '2023-12-27', '03:47:02', 'NEAR BARANGAY HALL', 'SECURITY GUARD'),
(88, 'TRBLOTTER-0050', 50, 'uploads/qr_codes/TRBLOTTER-0050.png', '39963', 'REYES', 'RAUL', 'ANTONIO', 38, '8', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09818474958', 'Public disturbance reported.', '2026-04-16 16:22:33', 'CANCELLED', 'NAVARRO', 'MARK', 'D', 55, '09117696938', '6914 Bonifacio St', 'VANDALISM', '2017-03-06', '05:58:00', 'BASKETBALL COURT', 'PASSERBY'),
(89, 'TRBLOTTER-0103', 103, 'uploads/qr_codes/TRBLOTTER-0103.png', NULL, 'GARCIA', 'JOSE', 'LUIS', 22, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09550250016', 'Dispute related to unpaid debt.', '2026-04-11 16:22:33', 'CANCELLED', 'DELA CRUZ', 'ROSE', 'A', 54, '09979383792', '530 Del Pilar St', 'VANDALISM', '2022-06-16', '12:33:27', 'BASKETBALL COURT', 'PASSERBY'),
(90, 'TRBLOTTER-0078', 78, 'uploads/qr_codes/TRBLOTTER-0078.png', NULL, 'VILLAR', 'JOSEPHINE', 'ANDRES', 69, '245', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09830122845', 'Verbal altercation reported in the community.', '2026-04-14 16:22:33', 'CANCELLED', 'RAMOS', 'JUAN', 'I', 40, '09168128988', '7215 Bonifacio St', 'THEFT', '2021-11-16', '04:21:10', 'SCHOOL AREA', 'BARANGAY TANOD'),
(91, 'TRBLOTTER-0022', 22, 'uploads/qr_codes/TRBLOTTER-0022.png', '78990', 'BAUTISTA', 'JUAN', 'ELIZABETH', 72, '216', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09035028792', 'Harassment complaint filed by complainant.', '2026-04-30 16:22:33', 'CANCELLED', 'BAUTISTA', 'PAOLO', 'D', 56, '09024557995', '1984 Roxas Blvd', 'PUBLIC DISTURBANCE', '2024-01-21', '03:41:19', 'NEAR BARANGAY HALL', 'SECURITY GUARD'),
(92, 'TRBLOTTER-0033', 33, 'uploads/qr_codes/TRBLOTTER-0033.png', '68083', 'MENDOZA', 'JUANA', 'ANDRES', 75, '168', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09311893157', 'Public disturbance reported.', '2026-04-30 16:22:33', 'CANCELLED', 'RAMOS', 'MARK', 'C', 74, '09054793939', '4484 Rizal Ave', 'VERBAL ABUSE', '2016-07-31', '18:12:30', 'NEAR RIVERBANK', 'NONE'),
(93, 'TRBLOTTER-0077', 77, 'uploads/qr_codes/TRBLOTTER-0077.png', '92102', 'MENDOZA', 'LUIS', 'MARIE', 21, '123', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09204032854', 'Dispute related to unpaid debt.', '2026-04-12 16:22:33', 'CANCELLED', 'VILLAR', 'MARK', 'C', 26, '09893533459', '421 Taft Ave', 'NOISE COMPLAINT', '2026-02-10', '13:09:17', 'TERMINAL', 'PASSERBY'),
(94, 'TRBLOTTER-0072', 72, 'uploads/qr_codes/TRBLOTTER-0072.png', '63613', 'FLORES', 'MARITONI', 'GRACE', 44, '198', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09049708792', 'Harassment complaint filed by complainant.', '2026-05-01 16:22:33', 'CANCELLED', 'RAMOS', 'LIZA', 'F', 27, '09071535693', '8985 Mabini St', 'HARASSMENT', '2019-12-29', '02:17:28', 'SCHOOL AREA', 'FRIEND'),
(95, 'TRBLOTTER-0100', 100, 'uploads/qr_codes/TRBLOTTER-0100.png', NULL, 'GARCIA', 'MARIA', 'MIGUEL', 76, '63', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09658620372', 'Dispute related to unpaid debt.', '2026-04-22 16:22:33', 'CANCELLED', 'REYES', 'CARLO', 'G', 33, '09352438808', '9990 Roxas Blvd', 'HARASSMENT', '2019-11-10', '04:00:27', 'NEAR RIVERBANK', 'SECURITY GUARD'),
(96, 'TRBLOTTER-0101', 101, 'uploads/qr_codes/TRBLOTTER-0101.png', NULL, 'BAUTISTA', 'LIZA', 'GRACE', 58, '', '', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09970758842', 'Harassment complaint filed by complainant.', '2026-04-21 16:22:33', 'DELETED', 'FLORES', 'LIZA', 'F', 42, '09237753175', '9856 Mabini St', 'VERBAL ABUSE', '2016-12-03', '08:39:49', 'RESIDENTIAL AREA', 'STORE OWNER'),
(97, 'TRBLOTTER-0047', 47, 'uploads/qr_codes/TRBLOTTER-0047.png', NULL, 'REYES', 'JUANA', 'MIGUEL', 25, '111', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09678923747', 'Vandalism reported by complainant.', '2026-04-10 16:22:33', 'DELETED', 'FLORES', 'ANA', 'F', 21, '09492272163', '2945 Roxas Blvd', 'VERBAL ABUSE', '2021-07-08', '03:11:47', 'MAIN ROAD', 'PASSERBY'),
(98, 'TRBLOTTER-0034', 34, 'uploads/qr_codes/TRBLOTTER-0034.png', '85096', 'FLORES', 'ANA', 'ANTONIO', 57, '65', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09398675834', 'Vandalism reported by complainant.', '2026-04-19 16:22:33', 'DELETED', 'MENDOZA', 'JANE', 'C', 48, '09661172167', '7960 Roxas Blvd', 'NOISE COMPLAINT', '2016-06-27', '03:29:10', 'NEAR CHAPEL', 'RELATIVE'),
(99, 'TRBLOTTER-0058', 58, 'uploads/qr_codes/TRBLOTTER-0058.png', '41033', 'NAVARRO', 'KATE', 'LUIS', 28, '70', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09962054646', 'Property boundary dispute between neighbors.', '2026-04-19 16:22:33', 'DELETED', 'FLORES', 'JUAN', 'C', 27, '09100174410', '94 National Highway', 'HARASSMENT', '2023-07-14', '07:03:25', 'TERMINAL', 'NEIGHBOR'),
(100, 'TRBLOTTER-0089', 89, 'uploads/qr_codes/TRBLOTTER-0089.png', '18531', 'RAMOS', 'MARIA', 'CLARA', 72, '241', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', NULL, '09469515790', 'Property boundary dispute between neighbors.', '2026-04-09 16:22:33', 'DELETED', 'MENDOZA', 'JOSE', 'F', 64, '09396631088', '6442 Rizal Ave', 'PHYSICAL INJURY', '2026-02-23', '10:20:18', 'NEAR BARANGAY HALL', 'NEIGHBOR'),
(128, 'TRBLOTTER-0090', 125, 'uploads/qr_codes/TRBLOTTER-0090.png', NULL, 'QUIPSE', 'MARIA CLAVERIA', 'LUMANOG', NULL, '142', 'DR NAVARRO ALLEY', 'EAST MODERN SITE', 'BAGUIO CITY', NULL, '09701726401', 'SHE THREAT ME AND BLACKMAILING ME DUE WHAT HAPPEN TO ME AND HER BF', '2026-05-15 12:52:39', 'RECORDED', 'DACUMOS', 'CHRISTINE', '', 23, '09260957423', 'SAN LUIS VILLAGE', 'THREAT', '2026-03-05', '23:00:00', 'SAN LUIS VILLAGE', 'JOBERT BATOYOG');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brgyid`
--

CREATE TABLE `tbl_brgyid` (
  `id_brgyid` int(11) DEFAULT NULL,
  `id_resident` int(11) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mi` varchar(255) NOT NULL,
  `houseno` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `municipal` varchar(255) NOT NULL,
  `bplace` varchar(255) NOT NULL,
  `bdate` varchar(255) NOT NULL,
  `res_photo` varchar(255) DEFAULT NULL,
  `inc_lname` varchar(255) NOT NULL,
  `inc_fname` varchar(255) NOT NULL,
  `inc_mi` varchar(255) NOT NULL,
  `inc_contact` varchar(255) NOT NULL,
  `inc_houseno` varchar(255) NOT NULL,
  `inc_street` varchar(255) NOT NULL,
  `inc_brgy` varchar(255) NOT NULL,
  `inc_municipal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bspermit`
--

CREATE TABLE `tbl_bspermit` (
  `id_bspermit` int(11) NOT NULL,
  `rejected_reason` varchar(129) DEFAULT '',
  `control_no` varchar(255) DEFAULT '',
  `qr_code` varchar(255) DEFAULT '',
  `cert_no` varchar(255) NOT NULL,
  `id_resident` int(11) NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `mi` varchar(255) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `bcode` varchar(255) DEFAULT NULL,
  `age` tinyint(4) NOT NULL,
  `bsname` varchar(255) DEFAULT NULL,
  `houseno` varchar(255) DEFAULT NULL,
  `street` varchar(252) DEFAULT NULL,
  `brgy` varchar(255) DEFAULT NULL,
  `municipal` varchar(255) DEFAULT NULL,
  `bsindustry` varchar(255) DEFAULT NULL,
  `aoe` int(11) NOT NULL,
  `status` enum('PENDING','APPROVED','REJECTED','READY FOR PICKUP','CLAIMED','DELETED') DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_bspermit`
--

INSERT INTO `tbl_bspermit` (`id_bspermit`, `rejected_reason`, `control_no`, `qr_code`, `cert_no`, `id_resident`, `lname`, `fname`, `mi`, `contact`, `email`, `bcode`, `age`, `bsname`, `houseno`, `street`, `brgy`, `municipal`, `bsindustry`, `aoe`, `status`) VALUES
(1, '', 'TRBSPERMIT-0001', 'uploads/qr_codes/TRBSPERMIT-0001.png', '', 1, 'MENDOZA', 'MARK', 'FERNANDO', '09000000001', 'RESIDENT0001@EXAMPLE.COM', 'BCODE-000001', 48, 'BS MENDOZA LIZA', '34', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 21, 'PENDING'),
(2, '', 'TRBSPERMIT-0002', 'uploads/qr_codes/TRBSPERMIT-0002.png', '', 2, 'VILLAR', 'MICHELLE', 'MIGUEL', '09000000002', 'RESIDENT0002@EXAMPLE.COM', 'BCODE-000002', 30, 'BS VILLAR MARK', '122', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 22, 'PENDING'),
(3, '', 'TRBSPERMIT-0003', 'uploads/qr_codes/TRBSPERMIT-0003.png', '', 3, 'SANTOS', 'JOSE', 'MARIE', '09000000003', 'RESIDENT0003@EXAMPLE.COM', 'BCODE-000003', 12, 'BS SANTOS JOSE', '7', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 23, 'PENDING'),
(4, '', 'TRBSPERMIT-0004', 'uploads/qr_codes/TRBSPERMIT-0004.png', '', 4, 'RAMOS', 'LORENZO', 'ANDRES', '09000000004', 'RESIDENT0004@EXAMPLE.COM', 'BCODE-000004', 61, 'BS RAMOS LIZA', '169', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 24, 'PENDING'),
(5, '', 'TRBSPERMIT-0005', 'uploads/qr_codes/TRBSPERMIT-0005.png', '', 5, 'VILLAR', 'ROSE', 'ANTONIO', '09000000005', 'RESIDENT0005@EXAMPLE.COM', 'BCODE-000005', 43, 'BS VILLAR ROSE', '75', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 25, 'PENDING'),
(6, '', 'TRBSPERMIT-0006', 'uploads/qr_codes/TRBSPERMIT-0006.png', '', 6, 'REYES', 'ANA', 'ELIZABETH', '09000000006', 'RESIDENT0006@EXAMPLE.COM', 'BCODE-000006', 25, 'BS REYES ANA', '116', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 26, 'PENDING'),
(7, '', 'TRBSPERMIT-0007', 'uploads/qr_codes/TRBSPERMIT-0007.png', '', 7, 'RAMOS', 'CARLO', 'CLARA', '09000000007', 'RESIDENT0007@EXAMPLE.COM', 'BCODE-000007', 74, 'BS RAMOS CARLO', '104', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 27, 'PENDING'),
(8, '', 'TRBSPERMIT-0008', 'uploads/qr_codes/TRBSPERMIT-0008.png', '', 8, 'VILLAR', 'JUAN', 'LUIS', '09000000008', 'RESIDENT0008@EXAMPLE.COM', 'BCODE-000008', 56, 'BS VILLAR JUAN', '171', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 28, 'PENDING'),
(9, '', 'TRBSPERMIT-0009', 'uploads/qr_codes/TRBSPERMIT-0009.png', '', 9, 'REYES', 'ANA', 'FERNANDO', '09000000009', 'RESIDENT0009@EXAMPLE.COM', 'BCODE-000009', 38, 'BS REYES ANA', '45', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 29, 'PENDING'),
(10, '', 'TRBSPERMIT-0010', 'uploads/qr_codes/TRBSPERMIT-0010.png', '', 10, 'RAMOS', 'JOHN', 'MIGUEL', '09000000010', 'RESIDENT0010@EXAMPLE.COM', 'BCODE-000010', 20, 'BS RAMOS JANE', '209', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 30, 'PENDING'),
(11, '', 'TRBSPERMIT-0011', 'uploads/qr_codes/TRBSPERMIT-0011.png', '', 11, 'NAVARRO', 'MARIO', 'GARCIA', '09000000011', 'RESIDENT0011@EXAMPLE.COM', 'BCODE-000011', 69, 'BS NAVARRO MARIA', '163', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 31, 'PENDING'),
(12, '', 'TRBSPERMIT-0012', 'uploads/qr_codes/TRBSPERMIT-0012.png', '', 12, 'REYES', 'PAULA', 'ANDRES', '09000000012', 'RESIDENT0012@EXAMPLE.COM', 'BCODE-000012', 51, 'BS REYES PAOLO', '184', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 32, 'PENDING'),
(13, '', 'TRBSPERMIT-0013', 'uploads/qr_codes/TRBSPERMIT-0013.png', '', 13, 'RAMOS', 'MARCELLINE', 'ANTONIO', '09000000013', 'RESIDENT0013@EXAMPLE.COM', 'BCODE-000013', 33, 'BS RAMOS MARK', '180', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 33, 'PENDING'),
(14, '', 'TRBSPERMIT-0014', 'uploads/qr_codes/TRBSPERMIT-0014.png', '', 14, 'NAVARRO', 'MIKE', 'ELIZABETH', '09000000014', 'RESIDENT0014@EXAMPLE.COM', 'BCODE-000014', 16, 'BS NAVARRO MARIA', '99', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 34, 'PENDING'),
(15, '', 'TRBSPERMIT-0015', 'uploads/qr_codes/TRBSPERMIT-0015.png', '', 15, 'REYES', 'DAVID', 'CLARA', '09000000015', 'RESIDENT0015@EXAMPLE.COM', 'BCODE-000015', 64, 'BS REYES LIZA', '206', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 35, 'PENDING'),
(16, '', 'TRBSPERMIT-0016', 'uploads/qr_codes/TRBSPERMIT-0016.png', '', 16, 'BAUTISTA', 'ROSE', 'MARIE', '09000000016', 'RESIDENT0016@EXAMPLE.COM', 'BCODE-000016', 46, 'BS BAUTISTA ROSE', '231', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 36, 'PENDING'),
(17, '', 'TRBSPERMIT-0017', 'uploads/qr_codes/TRBSPERMIT-0017.png', '', 17, 'NAVARRO', 'JOSE', 'FERNANDO', '09000000017', 'RESIDENT0017@EXAMPLE.COM', 'BCODE-000017', 28, 'BS NAVARRO JOSE', '37', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 37, 'PENDING'),
(18, '', 'TRBSPERMIT-0018', 'uploads/qr_codes/TRBSPERMIT-0018.png', '', 18, 'GARCIA', 'CARLO', 'MIGUEL', '09000000018', 'RESIDENT0018@EXAMPLE.COM', 'BCODE-000018', 11, 'BS GARCIA CARLO', '240', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 38, 'PENDING'),
(19, '', 'TRBSPERMIT-0019', 'uploads/qr_codes/TRBSPERMIT-0019.png', '', 19, 'BAUTISTA', 'ROSE', 'GRACE', '09000000019', 'RESIDENT0019@EXAMPLE.COM', 'BCODE-000019', 59, 'BS BAUTISTA ROSE', '90', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 39, 'PENDING'),
(20, '', 'TRBSPERMIT-0020', 'uploads/qr_codes/TRBSPERMIT-0020.png', '', 20, 'NAVARRO', 'ANA', 'SOFIA', '09000000020', 'RESIDENT0020@EXAMPLE.COM', 'BCODE-000020', 41, 'BS NAVARRO ANA', '231', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 40, 'PENDING'),
(21, '', 'TRBSPERMIT-0021', 'uploads/qr_codes/TRBSPERMIT-0021.png', '', 21, 'GARCIA', 'JORGE', 'LUIS', '09000000021', 'RESIDENT0021@EXAMPLE.COM', 'BCODE-000021', 23, 'BS GARCIA JANE', '132', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 41, 'PENDING'),
(22, '', 'TRBSPERMIT-0022', 'uploads/qr_codes/TRBSPERMIT-0022.png', '', 22, 'BAUTISTA', 'JUAN', 'ELIZABETH', '09000000022', 'RESIDENT0022@EXAMPLE.COM', 'BCODE-000022', 72, 'BS BAUTISTA JUAN', '216', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 42, 'PENDING'),
(23, '', 'TRBSPERMIT-0023', 'uploads/qr_codes/TRBSPERMIT-0023.png', '', 23, 'CRUZ', 'BRACIA', 'CLARA', '09000000023', 'RESIDENT0023@EXAMPLE.COM', 'BCODE-000023', 54, 'BS CRUZ PAOLO', '185', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 43, 'PENDING'),
(24, '', 'TRBSPERMIT-0024', 'uploads/qr_codes/TRBSPERMIT-0024.png', '', 24, 'GARCIA', 'JAKE', 'MARIE', '09000000024', 'RESIDENT0024@EXAMPLE.COM', 'BCODE-000024', 36, 'BS GARCIA JANE', '27', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 44, 'PENDING'),
(25, '', 'TRBSPERMIT-0025', 'uploads/qr_codes/TRBSPERMIT-0025.png', '', 25, 'BAUTISTA', 'XERXES', 'ANDRES', '09000000025', 'RESIDENT0025@EXAMPLE.COM', 'BCODE-000025', 19, 'BS BAUTISTA MARIA', '80', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 45, 'PENDING'),
(26, '', 'TRBSPERMIT-0026', 'uploads/qr_codes/TRBSPERMIT-0026.png', '', 26, 'CRUZ', 'LIZA', 'MIGUEL', '09000000026', 'RESIDENT0026@EXAMPLE.COM', 'BCODE-000026', 67, 'BS CRUZ LIZA', '67', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 46, 'PENDING'),
(27, '', 'TRBSPERMIT-0027', 'uploads/qr_codes/TRBSPERMIT-0027.png', '', 27, 'GARCIA', 'MARCY', 'GRACE', '09000000027', 'RESIDENT0027@EXAMPLE.COM', 'BCODE-000027', 49, 'BS GARCIA MARK', '96', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 47, 'PENDING'),
(28, '', 'TRBSPERMIT-0028', 'uploads/qr_codes/TRBSPERMIT-0028.png', '', 28, 'FLORES', 'JOSE', 'SOFIA', '09000000028', 'RESIDENT0028@EXAMPLE.COM', 'BCODE-000028', 31, 'BS FLORES JOSE', '29', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 48, 'PENDING'),
(29, '', 'TRBSPERMIT-0029', 'uploads/qr_codes/TRBSPERMIT-0029.png', '', 29, 'CRUZ', 'DRAKE', 'LUIS', '09000000029', 'RESIDENT0029@EXAMPLE.COM', 'BCODE-000029', 14, 'BS CRUZ LIZA', '106', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 49, 'PENDING'),
(30, '', 'TRBSPERMIT-0030', 'uploads/qr_codes/TRBSPERMIT-0030.png', '', 30, 'MENDOZA', 'ROSE', 'FERNANDO', '09000000030', 'RESIDENT0030@EXAMPLE.COM', 'BCODE-000030', 62, 'BS MENDOZA ROSE', '194', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 50, 'PENDING'),
(31, '', 'TRBSPERMIT-0031', 'uploads/qr_codes/TRBSPERMIT-0031.png', '', 31, 'FLORES', 'IAN', 'CLARA', '09000000031', 'RESIDENT0031@EXAMPLE.COM', 'BCODE-000031', 44, 'BS FLORES ANA', '152', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 51, 'PENDING'),
(32, '', 'TRBSPERMIT-0032', 'uploads/qr_codes/TRBSPERMIT-0032.png', '', 32, 'CRUZ', 'CARLO', 'MARIE', '09000000032', 'RESIDENT0032@EXAMPLE.COM', 'BCODE-000032', 27, 'BS CRUZ CARLO', '175', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 52, 'PENDING'),
(33, '', 'TRBSPERMIT-0033', 'uploads/qr_codes/TRBSPERMIT-0033.png', '', 33, 'MENDOZA', 'JUANA', 'ANDRES', '09000000033', 'RESIDENT0033@EXAMPLE.COM', 'BCODE-000033', 75, 'BS MENDOZA JUAN', '168', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 53, 'PENDING'),
(34, '', 'TRBSPERMIT-0034', 'uploads/qr_codes/TRBSPERMIT-0034.png', '', 34, 'FLORES', 'ANA', 'ANTONIO', '09000000034', 'RESIDENT0034@EXAMPLE.COM', 'BCODE-000034', 57, 'BS FLORES ANA', '65', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 54, 'PENDING'),
(35, '', 'TRBSPERMIT-0035', 'uploads/qr_codes/TRBSPERMIT-0035.png', '', 35, 'SANTOS', 'JORDAN', 'GRACE', '09000000035', 'RESIDENT0035@EXAMPLE.COM', 'BCODE-000035', 39, 'BS SANTOS JANE', '71', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 55, 'PENDING'),
(36, '', 'TRBSPERMIT-0036', 'uploads/qr_codes/TRBSPERMIT-0036.png', '', 36, 'MENDOZA', 'MARIA', 'SOFIA', '09000000036', 'RESIDENT0036@EXAMPLE.COM', 'BCODE-000036', 22, 'BS MENDOZA MARIA', '160', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 56, 'PENDING'),
(37, '', 'TRBSPERMIT-0037', 'uploads/qr_codes/TRBSPERMIT-0037.png', '', 37, 'FLORES', 'JANINE', 'LUIS', '09000000037', 'RESIDENT0037@EXAMPLE.COM', 'BCODE-000037', 70, 'BS FLORES PAOLO', '85', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 57, 'PENDING'),
(38, '', 'TRBSPERMIT-0038', 'uploads/qr_codes/TRBSPERMIT-0038.png', '', 38, 'SANTOS', 'MARK', 'FERNANDO', '09000000038', 'RESIDENT0038@EXAMPLE.COM', 'BCODE-000038', 52, 'BS SANTOS MARK', '196', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 58, 'PENDING'),
(39, '', 'TRBSPERMIT-0039', 'uploads/qr_codes/TRBSPERMIT-0039.png', '', 39, 'MENDOZA', 'LUIGI', 'MIGUEL', '09000000039', 'RESIDENT0039@EXAMPLE.COM', 'BCODE-000039', 34, 'BS MENDOZA MARIA', '226', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 59, 'PENDING'),
(40, '', 'TRBSPERMIT-0040', 'uploads/qr_codes/TRBSPERMIT-0040.png', '', 40, 'VILLAR', 'LIZA', 'MARIE', '09000000040', 'RESIDENT0040@EXAMPLE.COM', 'BCODE-000040', 17, 'BS VILLAR LIZA', '40', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 60, 'PENDING'),
(41, '', 'TRBSPERMIT-0041', 'uploads/qr_codes/TRBSPERMIT-0041.png', '', 41, 'SANTOS', 'ROSE', 'ANDRES', '09000000041', 'RESIDENT0041@EXAMPLE.COM', 'BCODE-000041', 65, 'BS SANTOS ROSE', '20', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 61, 'APPROVED'),
(42, '', 'TRBSPERMIT-0042', 'uploads/qr_codes/TRBSPERMIT-0042.png', '', 42, 'RAMOS', 'JOSE', 'ANTONIO', '09000000042', 'RESIDENT0042@EXAMPLE.COM', 'BCODE-000042', 47, 'BS RAMOS JOSE', '231', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 62, 'APPROVED'),
(43, '', 'TRBSPERMIT-0043', 'uploads/qr_codes/TRBSPERMIT-0043.png', '', 43, 'VILLAR', 'CARLO', 'ELIZABETH', '09000000043', 'RESIDENT0043@EXAMPLE.COM', 'BCODE-000043', 30, 'BS VILLAR CARLO', '93', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 63, 'APPROVED'),
(44, '', 'TRBSPERMIT-0044', 'uploads/qr_codes/TRBSPERMIT-0044.png', '', 44, 'SANTOS', 'ROSE', 'CLARA', '09000000044', 'RESIDENT0044@EXAMPLE.COM', 'BCODE-000044', 12, 'BS SANTOS ROSE', '21', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 64, 'APPROVED'),
(45, '', 'TRBSPERMIT-0045', 'uploads/qr_codes/TRBSPERMIT-0045.png', '', 45, 'RAMOS', 'XIAN', 'LUIS', '09000000045', 'RESIDENT0045@EXAMPLE.COM', 'BCODE-000045', 60, 'BS RAMOS ANA', '76', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 65, 'APPROVED'),
(46, '', 'TRBSPERMIT-0046', 'uploads/qr_codes/TRBSPERMIT-0046.png', '', 46, 'VILLAR', 'PAULO', 'FERNANDO', '09000000046', 'RESIDENT0046@EXAMPLE.COM', 'BCODE-000046', 42, 'BS VILLAR JANE', '68', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 66, 'APPROVED'),
(47, '', 'TRBSPERMIT-0047', 'uploads/qr_codes/TRBSPERMIT-0047.png', '', 47, 'REYES', 'JUANA', 'MIGUEL', '09000000047', 'RESIDENT0047@EXAMPLE.COM', 'BCODE-000047', 25, 'BS REYES JUAN', '111', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 67, 'APPROVED'),
(48, '', 'TRBSPERMIT-0048', 'uploads/qr_codes/TRBSPERMIT-0048.png', '', 48, 'RAMOS', 'KAYE', 'GRACE', '09000000048', 'RESIDENT0048@EXAMPLE.COM', 'BCODE-000048', 73, 'BS RAMOS PAOLO', '99', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 68, 'APPROVED'),
(49, '', 'TRBSPERMIT-0049', 'uploads/qr_codes/TRBSPERMIT-0049.png', '', 49, 'NAVARRO', 'BRUCE', 'ANDRES', '09000000049', 'RESIDENT0049@EXAMPLE.COM', 'BCODE-000049', 55, 'BS NAVARRO JANE', '161', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 69, 'APPROVED'),
(50, '', 'TRBSPERMIT-0050', 'uploads/qr_codes/TRBSPERMIT-0050.png', '', 50, 'REYES', 'RAUL', 'ANTONIO', '09000000050', 'RESIDENT0050@EXAMPLE.COM', 'BCODE-000050', 38, 'BS REYES MARIA', '8', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 70, 'APPROVED'),
(51, '', 'TRBSPERMIT-0051', 'uploads/qr_codes/TRBSPERMIT-0051.png', '', 51, 'RAMOS', 'LIZA', 'ELIZABETH', '09000000051', 'RESIDENT0051@EXAMPLE.COM', 'BCODE-000051', 20, 'BS RAMOS LIZA', '58', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 71, 'APPROVED'),
(52, '', 'TRBSPERMIT-0052', 'uploads/qr_codes/TRBSPERMIT-0052.png', '', 52, 'NAVARRO', 'MARK', 'CLARA', '09000000052', 'RESIDENT0052@EXAMPLE.COM', 'BCODE-000052', 68, 'BS NAVARRO MARK', '15', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 72, 'APPROVED'),
(53, '', 'TRBSPERMIT-0053', 'uploads/qr_codes/TRBSPERMIT-0053.png', '', 53, 'REYES', 'JOSE', 'MARIE', '09000000053', 'RESIDENT0053@EXAMPLE.COM', 'BCODE-000053', 50, 'BS REYES JOSE', '152', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 73, 'APPROVED'),
(54, '', 'TRBSPERMIT-0054', 'uploads/qr_codes/TRBSPERMIT-0054.png', '', 54, 'BAUTISTA', 'LIZA', 'FERNANDO', '09000000054', 'RESIDENT0054@EXAMPLE.COM', 'BCODE-000054', 33, 'BS BAUTISTA LIZA', '212', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 74, 'APPROVED'),
(55, '', 'TRBSPERMIT-0055', 'uploads/qr_codes/TRBSPERMIT-0055.png', '', 55, 'NAVARRO', 'ROSE', 'MIGUEL', '09000000055', 'RESIDENT0055@EXAMPLE.COM', 'BCODE-000055', 15, 'BS NAVARRO ROSE', '103', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 75, 'APPROVED'),
(56, '', 'TRBSPERMIT-0056', 'uploads/qr_codes/TRBSPERMIT-0056.png', '', 56, 'REYES', 'LIAM', 'GRACE', '09000000056', 'RESIDENT0056@EXAMPLE.COM', 'BCODE-000056', 63, 'BS REYES ANA', '131', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 76, 'READY FOR PICKUP'),
(57, '', 'TRBSPERMIT-0057', 'uploads/qr_codes/TRBSPERMIT-0057.png', '', 57, 'BAUTISTA', 'CARLA', 'SOFIA', '09000000057', 'RESIDENT0057@EXAMPLE.COM', 'BCODE-000057', 46, 'BS BAUTISTA CARLO', '92', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 77, 'READY FOR PICKUP'),
(58, '', 'TRBSPERMIT-0058', 'uploads/qr_codes/TRBSPERMIT-0058.png', '', 58, 'NAVARRO', 'KATE', 'LUIS', '09000000058', 'RESIDENT0058@EXAMPLE.COM', 'BCODE-000058', 28, 'BS NAVARRO JUAN', '70', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 78, 'READY FOR PICKUP'),
(59, '', 'TRBSPERMIT-0059', 'uploads/qr_codes/TRBSPERMIT-0059.png', '', 59, 'GARCIA', 'OLIVER', 'ELIZABETH', '09000000059', 'RESIDENT0059@EXAMPLE.COM', 'BCODE-000059', 10, 'BS GARCIA ANA', '72', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 79, 'READY FOR PICKUP'),
(60, '', 'TRBSPERMIT-0060', 'uploads/qr_codes/TRBSPERMIT-0060.png', '', 60, 'BAUTISTA', 'ELIJAH', 'CLARA', '09000000060', 'RESIDENT0060@EXAMPLE.COM', 'BCODE-000060', 58, 'BS BAUTISTA JANE', '149', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 80, 'READY FOR PICKUP'),
(61, '', 'TRBSPERMIT-0061', 'uploads/qr_codes/TRBSPERMIT-0061.png', '', 61, 'CRUZ', 'MARIA', 'MARIE', '09000000061', 'RESIDENT0061@EXAMPLE.COM', 'BCODE-000061', 41, 'BS CRUZ MARIA', '31', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 81, 'READY FOR PICKUP'),
(62, '', 'TRBSPERMIT-0062', 'uploads/qr_codes/TRBSPERMIT-0062.png', '', 62, 'GARCIA', 'SABRINA', 'ANDRES', '09000000062', 'RESIDENT0062@EXAMPLE.COM', 'BCODE-000062', 23, 'BS GARCIA PAOLO', '204', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 82, 'READY FOR PICKUP'),
(63, '', 'TRBSPERMIT-0063', 'uploads/qr_codes/TRBSPERMIT-0063.png', '', 63, 'BAUTISTA', 'MARK', 'MIGUEL', '09000000063', 'RESIDENT0063@EXAMPLE.COM', 'BCODE-000063', 71, 'BS BAUTISTA MARK', '178', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 83, 'READY FOR PICKUP'),
(64, '', 'TRBSPERMIT-0064', 'uploads/qr_codes/TRBSPERMIT-0064.png', '', 64, 'CRUZ', 'MARIA', 'GRACE', '09000000064', 'RESIDENT0064@EXAMPLE.COM', 'BCODE-000064', 53, 'BS CRUZ MARIA', '28', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 84, 'READY FOR PICKUP'),
(65, '', 'TRBSPERMIT-0065', 'uploads/qr_codes/TRBSPERMIT-0065.png', '', 65, 'GARCIA', 'LIZA', 'SOFIA', '09000000065', 'RESIDENT0065@EXAMPLE.COM', 'BCODE-000065', 36, 'BS GARCIA LIZA', '107', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 85, 'READY FOR PICKUP'),
(66, '', 'TRBSPERMIT-0066', 'uploads/qr_codes/TRBSPERMIT-0066.png', '', 66, 'FLORES', 'JACK', 'LUIS', '09000000066', 'RESIDENT0066@EXAMPLE.COM', 'BCODE-000066', 18, 'BS FLORES ROSE', '199', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 86, 'READY FOR PICKUP'),
(67, '', 'TRBSPERMIT-0067', 'uploads/qr_codes/TRBSPERMIT-0067.png', '', 67, 'CRUZ', 'JOSE', 'FERNANDO', '09000000067', 'RESIDENT0067@EXAMPLE.COM', 'BCODE-000067', 66, 'BS CRUZ JOSE', '173', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 87, 'READY FOR PICKUP'),
(68, '', 'TRBSPERMIT-0068', 'uploads/qr_codes/TRBSPERMIT-0068.png', '', 68, 'GARCIA', 'AUBREY', 'CLARA', '09000000068', 'RESIDENT0068@EXAMPLE.COM', 'BCODE-000068', 49, 'BS GARCIA CARLO', '20', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 88, 'READY FOR PICKUP'),
(69, '', 'TRBSPERMIT-0069', 'uploads/qr_codes/TRBSPERMIT-0069.png', '', 69, 'FLORES', 'ROSE', 'MARIE', '09000000069', 'RESIDENT0069@EXAMPLE.COM', 'BCODE-000069', 31, 'BS FLORES ROSE', '79', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 89, 'READY FOR PICKUP'),
(70, '', 'TRBSPERMIT-0070', 'uploads/qr_codes/TRBSPERMIT-0070.png', '', 70, 'CRUZ', 'SAMUEL', 'ANDRES', '09000000070', 'RESIDENT0070@EXAMPLE.COM', 'BCODE-000070', 13, 'BS CRUZ ANA', '86', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 90, 'READY FOR PICKUP'),
(71, '', 'TRBSPERMIT-0071', 'uploads/qr_codes/TRBSPERMIT-0071.png', '', 71, 'MENDOZA', 'JANE', 'ANTONIO', '09000000071', 'RESIDENT0071@EXAMPLE.COM', 'BCODE-000071', 61, 'BS MENDOZA JANE', '191', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 91, 'CLAIMED'),
(72, '', 'TRBSPERMIT-0072', 'uploads/qr_codes/TRBSPERMIT-0072.png', '', 72, 'FLORES', 'MARITONI', 'GRACE', '09000000072', 'RESIDENT0072@EXAMPLE.COM', 'BCODE-000072', 44, 'BS FLORES JUAN', '198', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 92, 'CLAIMED'),
(73, '', 'TRBSPERMIT-0073', 'uploads/qr_codes/TRBSPERMIT-0073.png', '', 73, 'SANTOS', 'PAOLO', 'SOFIA', '09000000073', 'RESIDENT0073@EXAMPLE.COM', 'BCODE-000073', 26, 'BS SANTOS PAOLO', '165', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 93, 'CLAIMED'),
(74, '', 'TRBSPERMIT-0074', 'uploads/qr_codes/TRBSPERMIT-0074.png', '', 74, 'MENDOZA', 'ETHAN', 'LUIS', '09000000074', 'RESIDENT0074@EXAMPLE.COM', 'BCODE-000074', 74, 'BS MENDOZA JANE', '232', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 94, 'CLAIMED'),
(75, '', 'TRBSPERMIT-0075', 'uploads/qr_codes/TRBSPERMIT-0075.png', '', 75, 'FLORES', 'MARIA', 'FERNANDO', '09000000075', 'RESIDENT0075@EXAMPLE.COM', 'BCODE-000075', 57, 'BS FLORES MARIA', '164', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 95, 'CLAIMED'),
(76, '', 'TRBSPERMIT-0076', 'uploads/qr_codes/TRBSPERMIT-0076.png', '', 76, 'SANTOS', 'LIZA', 'MIGUEL', '09000000076', 'RESIDENT0076@EXAMPLE.COM', 'BCODE-000076', 39, 'BS SANTOS LIZA', '123', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 96, 'CLAIMED'),
(77, '', 'TRBSPERMIT-0077', 'uploads/qr_codes/TRBSPERMIT-0077.png', '', 77, 'MENDOZA', 'LUIS', 'MARIE', '09000000077', 'RESIDENT0077@EXAMPLE.COM', 'BCODE-000077', 21, 'BS MENDOZA MARK', '123', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 97, 'CLAIMED'),
(78, '', 'TRBSPERMIT-0078', 'uploads/qr_codes/TRBSPERMIT-0078.png', '', 78, 'VILLAR', 'JOSEPHINE', 'ANDRES', '09000000078', 'RESIDENT0078@EXAMPLE.COM', 'BCODE-000078', 69, 'BS VILLAR JOSE', '245', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 98, 'CLAIMED'),
(79, '', 'TRBSPERMIT-0079', 'uploads/qr_codes/TRBSPERMIT-0079.png', '', 79, 'SANTOS', 'LIZA', 'ANTONIO', '09000000079', 'RESIDENT0079@EXAMPLE.COM', 'BCODE-000079', 52, 'BS SANTOS LIZA', '104', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 99, 'CLAIMED'),
(80, '', 'TRBSPERMIT-0080', 'uploads/qr_codes/TRBSPERMIT-0080.png', '', 80, 'MENDOZA', 'ARTHUR', 'ELIZABETH', '09000000080', 'RESIDENT0080@EXAMPLE.COM', 'BCODE-000080', 34, 'BS MENDOZA ROSE', '36', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 100, 'CLAIMED'),
(81, '', 'TRBSPERMIT-0081', 'uploads/qr_codes/TRBSPERMIT-0081.png', '', 81, 'VILLAR', 'ALEXANDER', 'CLARA', '09000000081', 'RESIDENT0081@EXAMPLE.COM', 'BCODE-000081', 16, 'BS VILLAR ANA', '117', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 20, 'CLAIMED'),
(82, '', 'TRBSPERMIT-0082', 'uploads/qr_codes/TRBSPERMIT-0082.png', '', 82, 'SANTOS', 'CHRISTINA', 'LUIS', '09000000082', 'RESIDENT0082@EXAMPLE.COM', 'BCODE-000082', 65, 'BS SANTOS CARLO', '227', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 21, 'CLAIMED'),
(83, '', 'TRBSPERMIT-0083', 'uploads/qr_codes/TRBSPERMIT-0083.png', '', 83, 'RAMOS', 'MERIDITH', 'FERNANDO', '09000000083', 'RESIDENT0083@EXAMPLE.COM', 'BCODE-000083', 47, 'BS RAMOS JUAN', '35', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 22, 'CLAIMED'),
(84, '', 'TRBSPERMIT-0084', 'uploads/qr_codes/TRBSPERMIT-0084.png', '', 84, 'VILLAR', 'WILLIAM', 'MIGUEL', '09000000084', 'RESIDENT0084@EXAMPLE.COM', 'BCODE-000084', 29, 'BS VILLAR ANA', '241', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 23, 'CLAIMED'),
(85, '', 'TRBSPERMIT-0085', 'uploads/qr_codes/TRBSPERMIT-0085.png', '', 85, 'REYES', 'JANE', 'GRACE', '09000000085', 'RESIDENT0085@EXAMPLE.COM', 'BCODE-000085', 11, 'BS REYES JANE', '99', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 24, 'CLAIMED'),
(86, '', 'TRBSPERMIT-0086', 'uploads/qr_codes/TRBSPERMIT-0086.png', '', 86, 'RAMOS', 'MARIA', 'ANDRES', '09000000086', 'RESIDENT0086@EXAMPLE.COM', 'BCODE-000086', 60, 'BS RAMOS MARIA', '24', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 25, 'DELETED'),
(87, '', 'TRBSPERMIT-0087', 'uploads/qr_codes/TRBSPERMIT-0087.png', '', 87, 'VILLAR', 'HARRY', 'ANTONIO', '09000000087', 'RESIDENT0087@EXAMPLE.COM', 'BCODE-000087', 42, 'BS VILLAR PAOLO', '73', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 26, 'DELETED'),
(88, '', 'TRBSPERMIT-0088', 'uploads/qr_codes/TRBSPERMIT-0088.png', '', 88, 'REYES', 'MAVERICK', 'ELIZABETH', '09000000088', 'RESIDENT0088@EXAMPLE.COM', 'BCODE-000088', 24, 'BS REYES MARK', '42', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 27, 'DELETED'),
(89, '', 'TRBSPERMIT-0089', 'uploads/qr_codes/TRBSPERMIT-0089.png', '', 89, 'RAMOS', 'MARIA', 'CLARA', '09000000089', 'RESIDENT0089@EXAMPLE.COM', 'BCODE-000089', 72, 'BS RAMOS MARIA', '241', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 28, 'DELETED'),
(90, '', 'TRBSPERMIT-0090', 'uploads/qr_codes/TRBSPERMIT-0090.png', '', 90, 'NAVARRO', 'LIZA', 'MARIE', '09000000090', 'RESIDENT0090@EXAMPLE.COM', 'BCODE-000090', 55, 'BS NAVARRO LIZA', '76', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 29, 'DELETED'),
(91, '', 'TRBSPERMIT-0091', 'uploads/qr_codes/TRBSPERMIT-0091.png', '', 91, 'REYES', 'ADRIAN', 'FERNANDO', '09000000091', 'RESIDENT0091@EXAMPLE.COM', 'BCODE-000091', 37, 'BS REYES ROSE', '157', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 30, 'DELETED'),
(92, '', 'TRBSPERMIT-0092', 'uploads/qr_codes/TRBSPERMIT-0092.png', '', 92, 'RAMOS', 'JOSEFA', 'MIGUEL', '09000000092', 'RESIDENT0092@EXAMPLE.COM', 'BCODE-000092', 19, 'BS RAMOS JOSE', '57', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 31, 'DELETED'),
(93, '', 'TRBSPERMIT-0093', 'uploads/qr_codes/TRBSPERMIT-0093.png', '', 93, 'NAVARRO', 'ALEXA', 'GRACE', '09000000093', 'RESIDENT0093@EXAMPLE.COM', 'BCODE-000093', 68, 'BS NAVARRO CARLO', '63', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 32, 'DELETED'),
(94, '', 'TRBSPERMIT-0094', 'uploads/qr_codes/TRBSPERMIT-0094.png', '', 94, 'REYES', 'ENZO', 'SOFIA', '09000000094', 'RESIDENT0094@EXAMPLE.COM', 'BCODE-000094', 50, 'BS REYES ROSE', '143', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 33, 'DELETED'),
(95, '', 'TRBSPERMIT-0095', 'uploads/qr_codes/TRBSPERMIT-0095.png', '', 95, 'BAUTISTA', 'KAYDEN', 'ANTONIO', '09000000095', 'RESIDENT0095@EXAMPLE.COM', 'BCODE-000095', 32, 'BS BAUTISTA ANA', '27', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 34, 'DELETED'),
(96, '', 'TRBSPERMIT-0096', 'uploads/qr_codes/TRBSPERMIT-0096.png', '', 96, 'NAVARRO', 'JANE', 'ELIZABETH', '09000000096', 'RESIDENT0096@EXAMPLE.COM', 'BCODE-000096', 14, 'BS NAVARRO JANE', '206', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Food', 35, 'DELETED'),
(97, '', 'TRBSPERMIT-0097', 'uploads/qr_codes/TRBSPERMIT-0097.png', '', 97, 'GARCIA', 'JENNA', 'CLARA', '09000000097', 'RESIDENT0097@EXAMPLE.COM', 'BCODE-000097', 63, 'BS GARCIA JUAN', '196', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Electronics', 36, 'DELETED'),
(98, '', 'TRBSPERMIT-0098', 'uploads/qr_codes/TRBSPERMIT-0098.png', '', 98, 'BAUTISTA', 'FELIX', 'MARIE', '09000000098', 'RESIDENT0098@EXAMPLE.COM', 'BCODE-000098', 45, 'BS BAUTISTA PAOLO', '114', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'Services', 37, 'DELETED'),
(99, '', 'TRBSPERMIT-0099', 'uploads/qr_codes/TRBSPERMIT-0099.png', '', 99, 'NAVARRO', 'JOY', 'ANDRES', '09000000099', 'RESIDENT0099@EXAMPLE.COM', 'BCODE-000099', 27, 'BS NAVARRO MARK', '231', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Construction', 38, 'DELETED'),
(100, '', 'TRBSPERMIT-0100', 'uploads/qr_codes/TRBSPERMIT-0100.png', '', 100, 'GARCIA', 'MARIA', 'MIGUEL', '09000000100', 'RESIDENT0100@EXAMPLE.COM', 'BCODE-000100', 76, 'BS GARCIA MARIA', '63', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'Retail', 39, 'DELETED'),
(129, '', 'TRBSPERMIT-0101', 'uploads/qr_codes/TRBSPERMIT-0101.png', '', 125, 'QUIPSE', 'MARIA CLAVERIA', 'LUMANOG', '09701726401', 'genesisizzoparson@gmail.com', '47113', 0, 'RIALTY', '142', 'DR NAVARRO ALLEY', 'EAST MODERN SITE', 'BAGUIO CITY', 'Computer', 197, 'CLAIMED');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clearance`
--

CREATE TABLE `tbl_clearance` (
  `id_clearance` int(11) NOT NULL,
  `rejected_reason` varchar(128) DEFAULT '',
  `control_no` varchar(255) DEFAULT '',
  `qr_code` varchar(255) DEFAULT '',
  `cert_no` varchar(255) DEFAULT NULL,
  `id_resident` int(11) NOT NULL,
  `lname` varchar(255) NOT NULL DEFAULT '',
  `fname` varchar(255) NOT NULL DEFAULT '',
  `mi` varchar(255) NOT NULL DEFAULT '',
  `purpose` varchar(255) NOT NULL DEFAULT '',
  `houseno` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `brgy` varchar(255) NOT NULL DEFAULT '',
  `municipal` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `age` int(11) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `bplace` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `employment_status` enum('Employed','Unemployed') DEFAULT NULL,
  `precinct_no` varchar(50) DEFAULT NULL,
  `resident_since` date DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `ref_name1` varchar(255) DEFAULT NULL,
  `ref_name2` varchar(255) DEFAULT NULL,
  `ref_tel` varchar(50) DEFAULT NULL,
  `clearance_type` enum('NEW','RENEWAL') DEFAULT NULL,
  `date_issued` datetime NOT NULL DEFAULT current_timestamp(),
  `status2` enum('PENDING','APPROVED','REJECTED','READY FOR PICKUP','CLAIMED','DELETED') DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_clearance`
--

INSERT INTO `tbl_clearance` (`id_clearance`, `rejected_reason`, `control_no`, `qr_code`, `cert_no`, `id_resident`, `lname`, `fname`, `mi`, `purpose`, `houseno`, `street`, `brgy`, `municipal`, `status`, `age`, `sex`, `bdate`, `bplace`, `occupation`, `employment_status`, `precinct_no`, `resident_since`, `company_name`, `ref_name1`, `ref_name2`, `ref_tel`, `clearance_type`, `date_issued`, `status2`) VALUES
(1, '', 'TRBRGYCLEARANCE-0001', 'uploads/qr_codes/TRBRGYCLEARANCE-0001.png', NULL, 1, 'MENDOZA', 'MARK', 'FERNANDO', 'Water/Electric service Connection', '34', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 48, 'MALE', '1977-12-18', 'CABANATUAN CITY', 'TEACHER', 'Unemployed', 'P-0219', '2024-03-23', 'ISLA LOGISTICS', 'MARIA SANTOS', 'FERNANDO FLORES', '09079755191', '', '2026-05-05 16:03:35', 'PENDING'),
(2, '', 'TRBRGYCLEARANCE-0002', 'uploads/qr_codes/TRBRGYCLEARANCE-0002.png', NULL, 2, 'VILLAR', 'MICHELLE', 'MIGUEL', 'Business Requirement', '122', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 30, 'FEMALE', '1995-09-07', 'CAUAYAN CITY', 'FISHERFOLK', 'Unemployed', 'P-1558', '2026-01-14', 'SAMPAGUITA ENTERPRISES', 'MARIA SANTOS', 'ELIZABETH VILLAR', '09749909490', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(3, '', 'TRBRGYCLEARANCE-0003', 'uploads/qr_codes/TRBRGYCLEARANCE-0003.png', NULL, 3, 'SANTOS', 'JOSE', 'MARIE', 'Travel Requirement', '7', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 12, 'MALE', '2013-05-27', 'SANTIAGO, ISABELA', 'OFFICE CLERK', '', 'P-9925', '2016-04-18', 'ABC TRADING', 'JUAN DELA CRUZ', 'MIGUEL REYES', '09978420295', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(4, '', 'TRBRGYCLEARANCE-0004', 'uploads/qr_codes/TRBRGYCLEARANCE-0004.png', NULL, 4, 'RAMOS', 'LORENZO', 'ANDRES', 'Business Requirement', '169', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 61, 'MALE', '1965-02-15', 'CABANATUAN CITY', 'TEACHER', 'Employed', 'P-0974', '2017-08-25', 'ABC TRADING', 'PAOLO CRUZ', 'ANDRES CRUZ', '09720050024', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(5, '', 'TRBRGYCLEARANCE-0005', 'uploads/qr_codes/TRBRGYCLEARANCE-0005.png', NULL, 5, 'VILLAR', 'ROSE', 'ANTONIO', 'Business Requirement', '75', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 43, 'FEMALE', '1982-11-05', 'CAUAYAN CITY', 'SECURITY GUARD', '', 'P-3468', '2016-06-13', 'MAHARLIKA MART', 'PAOLO CRUZ', 'GRACE GARCIA', '09771299109', '', '2026-05-05 16:03:35', 'PENDING'),
(6, '', 'TRBRGYCLEARANCE-0006', 'uploads/qr_codes/TRBRGYCLEARANCE-0006.png', NULL, 6, 'REYES', 'ANA', 'ELIZABETH', 'Employment Requirement', '116', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 25, 'FEMALE', '2000-07-25', 'SANTIAGO, ISABELA', 'OFFICE CLERK', 'Employed', 'P-1227', '2026-01-11', 'SAMPAGUITA ENTERPRISES', 'CARLO BAUTISTA', 'PEDRO DELA CRUZ', '09477780685', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(7, '', 'TRBRGYCLEARANCE-0007', 'uploads/qr_codes/TRBRGYCLEARANCE-0007.png', NULL, 7, 'RAMOS', 'CARLO', 'CLARA', 'Employment Requirement', '104', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 74, 'MALE', '1952-04-15', 'CABANATUAN CITY', 'DRIVER', '', 'P-0751', '2019-03-18', 'BAYANI SERVICES', 'ANA GARCIA', 'PEDRO DELA CRUZ', '09222417145', '', '2026-05-05 16:03:35', 'PENDING'),
(8, '', 'TRBRGYCLEARANCE-0008', 'uploads/qr_codes/TRBRGYCLEARANCE-0008.png', NULL, 8, 'VILLAR', 'JUAN', 'LUIS', 'Water/Electric service Connection', '171', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 56, 'MALE', '1970-01-03', 'CAUAYAN CITY', 'VENDOR', 'Employed', 'P-5211', '2024-02-29', 'SUNRISE EATERY', 'ROSE VILLAR', 'CLARA RAMOS', '09327141900', '', '2026-05-05 16:03:35', 'PENDING'),
(9, '', 'TRBRGYCLEARANCE-0009', 'uploads/qr_codes/TRBRGYCLEARANCE-0009.png', NULL, 9, 'REYES', 'ANA', 'FERNANDO', 'Employment Requirement', '45', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 38, 'FEMALE', '1987-09-24', 'SANTIAGO, ISABELA', 'CONSTRUCTION WORKER', 'Unemployed', 'P-3463', '2016-09-11', 'SAMPAGUITA ENTERPRISES', 'ROSE VILLAR', 'PEDRO DELA CRUZ', '09740407127', '', '2026-05-05 16:03:35', 'PENDING'),
(10, '', 'TRBRGYCLEARANCE-0010', 'uploads/qr_codes/TRBRGYCLEARANCE-0010.png', NULL, 10, 'RAMOS', 'JOHN', 'MIGUEL', 'School Requirement', '209', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 20, 'MALE', '2005-06-13', 'CABANATUAN CITY', 'STUDENT', 'Employed', 'P-3937', '2017-08-05', 'GOLDEN HARVEST STORE', 'MARIA SANTOS', 'GRACE GARCIA', '09474337206', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(11, '', 'TRBRGYCLEARANCE-0011', 'uploads/qr_codes/TRBRGYCLEARANCE-0011.png', NULL, 11, 'NAVARRO', 'MARIO', 'GARCIA', 'Loan Application', '163', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 69, 'MALE', '1957-03-04', 'CAUAYAN CITY', 'FISHERFOLK', '', 'P-0222', '2025-06-27', 'BAYANI SERVICES', 'ANA GARCIA', 'ELIZABETH VILLAR', '09347259558', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(12, '', 'TRBRGYCLEARANCE-0012', 'uploads/qr_codes/TRBRGYCLEARANCE-0012.png', NULL, 12, 'REYES', 'PAULA', 'ANDRES', 'School Requirement', '184', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 51, 'FEMALE', '1974-11-22', 'SANTIAGO, ISABELA', 'FARMER', 'Unemployed', 'P-5770', '2025-05-12', 'SAMPAGUITA ENTERPRISES', 'ANA GARCIA', 'ANDRES CRUZ', '09317503131', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(13, '', 'TRBRGYCLEARANCE-0013', 'uploads/qr_codes/TRBRGYCLEARANCE-0013.png', NULL, 13, 'RAMOS', 'MARCELLINE', 'ANTONIO', 'Business Requirement', '180', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 33, 'FEMALE', '1992-08-11', 'CABANATUAN CITY', 'SECURITY GUARD', '', 'P-1410', '2025-04-18', 'ABC TRADING', 'JUAN DELA CRUZ', 'ELIZABETH VILLAR', '09318422936', '', '2026-05-05 16:03:35', 'PENDING'),
(14, '', 'TRBRGYCLEARANCE-0014', 'uploads/qr_codes/TRBRGYCLEARANCE-0014.png', NULL, 14, 'NAVARRO', 'MIKE', 'ELIZABETH', 'Other important transactions.', '99', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 16, 'MALE', '2010-05-01', 'CAUAYAN CITY', 'STUDENT', 'Unemployed', 'P-0051', '2022-07-25', 'MAHARLIKA MART', 'JUAN DELA CRUZ', 'ELIZABETH VILLAR', '09892824560', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(15, '', 'TRBRGYCLEARANCE-0015', 'uploads/qr_codes/TRBRGYCLEARANCE-0015.png', NULL, 15, 'REYES', 'DAVID', 'CLARA', 'Loan Application', '206', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 64, 'MALE', '1962-01-20', 'SANTIAGO, ISABELA', 'VENDOR', '', 'P-2227', '2022-10-26', 'ABC TRADING', 'JOSE REYES', 'PEDRO DELA CRUZ', '09493930064', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(16, '', 'TRBRGYCLEARANCE-0016', 'uploads/qr_codes/TRBRGYCLEARANCE-0016.png', NULL, 16, 'BAUTISTA', 'ROSE', 'MARIE', 'Business Requirement', '231', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 46, 'FEMALE', '1979-10-10', 'BAGUIO CITY', 'TEACHER', '', 'P-7078', '2020-07-27', 'SAMPAGUITA ENTERPRISES', 'JANE FLORES', 'GRACE GARCIA', '09225194053', '', '2026-05-05 16:03:35', 'PENDING'),
(17, '', 'TRBRGYCLEARANCE-0017', 'uploads/qr_codes/TRBRGYCLEARANCE-0017.png', NULL, 17, 'NAVARRO', 'JOSE', 'FERNANDO', 'Employment Requirement', '37', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 28, 'MALE', '1997-06-29', 'QUEZON CITY', 'UNEMPLOYED', '', 'P-1817', '2019-12-10', 'LUNA CONSTRUCTION', 'MARIA SANTOS', 'SOFIA SANTOS', '09949579005', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(18, '', 'TRBRGYCLEARANCE-0018', 'uploads/qr_codes/TRBRGYCLEARANCE-0018.png', NULL, 18, 'GARCIA', 'CARLO', 'MIGUEL', 'School Requirement', '240', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 11, 'MALE', '2015-03-19', 'ILAGAN CITY', 'SECURITY GUARD', 'Unemployed', 'P-8029', '2024-05-23', 'LUNA CONSTRUCTION', 'JUAN DELA CRUZ', 'LUIS NAVARRO', '09639602881', '', '2026-05-05 16:03:35', 'PENDING'),
(19, '', 'TRBRGYCLEARANCE-0019', 'uploads/qr_codes/TRBRGYCLEARANCE-0019.png', NULL, 19, 'BAUTISTA', 'ROSE', 'GRACE', 'Police Clearance Requirement', '90', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 59, 'FEMALE', '1966-12-08', 'BAGUIO CITY', 'UNEMPLOYED', '', 'P-2738', '2025-03-14', 'SAMPAGUITA ENTERPRISES', 'JOSE REYES', 'PEDRO DELA CRUZ', '09344599334', '', '2026-05-05 16:03:35', 'PENDING'),
(20, '', 'TRBRGYCLEARANCE-0020', 'uploads/qr_codes/TRBRGYCLEARANCE-0020.png', NULL, 20, 'NAVARRO', 'ANA', 'SOFIA', 'Police Clearance Requirement', '231', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 41, 'FEMALE', '1984-08-27', 'QUEZON CITY', 'STUDENT', '', 'P-9873', '2020-03-18', 'ABC TRADING', 'LIZA RAMOS', 'GRACE GARCIA', '09233914073', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(21, '', 'TRBRGYCLEARANCE-0021', 'uploads/qr_codes/TRBRGYCLEARANCE-0021.png', NULL, 21, 'GARCIA', 'JORGE', 'LUIS', 'Travel Requirement', '132', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 23, 'MALE', '2002-05-17', 'ILAGAN CITY', 'DRIVER', 'Employed', 'P-5209', '2016-07-10', 'BAYANI SERVICES', 'CARLO BAUTISTA', 'MIGUEL REYES', '09123996201', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(22, '', 'TRBRGYCLEARANCE-0022', 'uploads/qr_codes/TRBRGYCLEARANCE-0022.png', NULL, 22, 'BAUTISTA', 'JUAN', 'ELIZABETH', 'Water/Electric service Connection', '216', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 72, 'MALE', '1954-02-05', 'BAGUIO CITY', 'DRIVER', '', 'P-1961', '2016-07-30', 'BAYANI SERVICES', 'ANA GARCIA', 'SOFIA SANTOS', '09414598376', '', '2026-05-05 16:03:35', 'PENDING'),
(23, '', 'TRBRGYCLEARANCE-0023', 'uploads/qr_codes/TRBRGYCLEARANCE-0023.png', NULL, 23, 'CRUZ', 'BRACIA', 'CLARA', 'Loan Application', '185', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 54, 'FEMALE', '1971-10-26', 'QUEZON CITY', 'OFFICE CLERK', '', 'P-5146', '2025-06-15', 'MAHARLIKA MART', 'JUAN DELA CRUZ', 'LUIS NAVARRO', '09351505168', '', '2026-05-05 16:03:35', 'PENDING'),
(24, '', 'TRBRGYCLEARANCE-0024', 'uploads/qr_codes/TRBRGYCLEARANCE-0024.png', NULL, 24, 'GARCIA', 'JAKE', 'MARIE', 'Business Requirement', '27', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 36, 'MALE', '1989-07-15', 'ILAGAN CITY', 'OFFICE CLERK', '', 'P-7171', '2020-06-21', 'SAMPAGUITA ENTERPRISES', 'JANE FLORES', 'ANTONIO BAUTISTA', '09538061941', '', '2026-05-05 16:03:35', 'PENDING'),
(25, '', 'TRBRGYCLEARANCE-0025', 'uploads/qr_codes/TRBRGYCLEARANCE-0025.png', NULL, 25, 'BAUTISTA', 'XERXES', 'ANDRES', 'School Requirement', '80', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 19, 'MALE', '2007-04-04', 'BAGUIO CITY', 'SECURITY GUARD', '', 'P-4440', '2022-10-14', 'SUNRISE EATERY', 'JANE FLORES', 'LUIS NAVARRO', '09736054262', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(26, '', 'TRBRGYCLEARANCE-0026', 'uploads/qr_codes/TRBRGYCLEARANCE-0026.png', NULL, 26, 'CRUZ', 'LIZA', 'MIGUEL', 'Employment Requirement', '67', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 67, 'FEMALE', '1958-12-24', 'QUEZON CITY', 'DRIVER', '', 'P-3832', '2017-10-25', 'ABC TRADING', 'ROSE VILLAR', 'FERNANDO FLORES', '09439972945', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(27, '', 'TRBRGYCLEARANCE-0027', 'uploads/qr_codes/TRBRGYCLEARANCE-0027.png', NULL, 27, 'GARCIA', 'MARCY', 'GRACE', 'Travel Requirement', '96', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 49, 'FEMALE', '1976-09-12', 'ILAGAN CITY', 'FISHERFOLK', '', 'P-7244', '2018-02-01', 'ISLA LOGISTICS', 'MARIA SANTOS', 'ELIZABETH VILLAR', '09066059287', '', '2026-05-05 16:03:35', 'PENDING'),
(28, '', 'TRBRGYCLEARANCE-0028', 'uploads/qr_codes/TRBRGYCLEARANCE-0028.png', NULL, 28, 'FLORES', 'JOSE', 'SOFIA', 'Employment Requirement', '29', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 31, 'MALE', '1994-06-02', 'BAGUIO CITY', 'SECURITY GUARD', '', 'P-9269', '2023-04-09', 'SAMPAGUITA ENTERPRISES', 'CARLO BAUTISTA', 'MIGUEL REYES', '09228547769', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(29, '', 'TRBRGYCLEARANCE-0029', 'uploads/qr_codes/TRBRGYCLEARANCE-0029.png', NULL, 29, 'CRUZ', 'DRAKE', 'LUIS', 'Business Requirement', '106', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 14, 'MALE', '2012-02-20', 'QUEZON CITY', 'OFFICE CLERK', 'Unemployed', 'P-8687', '2019-01-04', 'ABC TRADING', 'JANE FLORES', 'CLARA RAMOS', '09191241737', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(30, '', 'TRBRGYCLEARANCE-0030', 'uploads/qr_codes/TRBRGYCLEARANCE-0030.png', NULL, 30, 'MENDOZA', 'ROSE', 'FERNANDO', 'Business Requirement', '194', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 62, 'FEMALE', '1963-11-12', 'ILAGAN CITY', 'TEACHER', 'Employed', 'P-0471', '2019-10-13', 'ABC TRADING', 'LIZA RAMOS', 'ANDRES CRUZ', '09793441574', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(31, '', 'TRBRGYCLEARANCE-0031', 'uploads/qr_codes/TRBRGYCLEARANCE-0031.png', NULL, 31, 'FLORES', 'IAN', 'CLARA', 'Employment Requirement', '152', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 44, 'MALE', '1981-08-01', 'BAGUIO CITY', 'TEACHER', '', 'P-6073', '2023-11-24', 'BAYANI SERVICES', 'JUAN DELA CRUZ', 'GRACE GARCIA', '09640343699', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(32, '', 'TRBRGYCLEARANCE-0032', 'uploads/qr_codes/TRBRGYCLEARANCE-0032.png', NULL, 32, 'CRUZ', 'CARLO', 'MARIE', 'School Requirement', '175', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 27, 'MALE', '1999-04-21', 'QUEZON CITY', 'DRIVER', 'Employed', 'P-6189', '2021-10-31', 'BAYANI SERVICES', 'PAOLO CRUZ', 'MIGUEL REYES', '09914603963', '', '2026-05-05 16:03:35', 'PENDING'),
(33, '', 'TRBRGYCLEARANCE-0033', 'uploads/qr_codes/TRBRGYCLEARANCE-0033.png', NULL, 33, 'MENDOZA', 'JUANA', 'ANDRES', 'Business Requirement', '168', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 75, 'FEMALE', '1951-01-10', 'CAUAYAN CITY', 'STUDENT', 'Unemployed', 'P-5269', '2019-03-23', 'ISLA LOGISTICS', 'LIZA RAMOS', 'SOFIA SANTOS', '09866555298', '', '2026-05-05 16:03:35', 'PENDING'),
(34, '', 'TRBRGYCLEARANCE-0034', 'uploads/qr_codes/TRBRGYCLEARANCE-0034.png', NULL, 34, 'FLORES', 'ANA', 'ANTONIO', 'Business Requirement', '65', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 57, 'FEMALE', '1968-09-29', 'SANTIAGO, ISABELA', 'VENDOR', '', 'P-7352', '2018-10-02', 'LUNA CONSTRUCTION', 'LIZA RAMOS', 'ELIZABETH VILLAR', '09769490655', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(35, '', 'TRBRGYCLEARANCE-0035', 'uploads/qr_codes/TRBRGYCLEARANCE-0035.png', NULL, 35, 'SANTOS', 'JORDAN', 'GRACE', 'Employment Requirement', '71', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 39, 'MALE', '1986-06-19', 'CABANATUAN CITY', 'DRIVER', '', 'P-8550', '2017-04-24', 'ISLA LOGISTICS', 'ROSE VILLAR', 'ANTONIO BAUTISTA', '09557257773', '', '2026-05-05 16:03:35', 'PENDING'),
(36, '', 'TRBRGYCLEARANCE-0036', 'uploads/qr_codes/TRBRGYCLEARANCE-0036.png', NULL, 36, 'MENDOZA', 'MARIA', 'SOFIA', 'Water/Electric service Connection', '160', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 22, 'MALE', '2004-03-08', 'CAUAYAN CITY', 'VENDOR', '', 'P-5072', '2019-02-11', 'ABC TRADING', 'MARIA SANTOS', 'ANDRES CRUZ', '09965153167', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(37, '', 'TRBRGYCLEARANCE-0037', 'uploads/qr_codes/TRBRGYCLEARANCE-0037.png', NULL, 37, 'FLORES', 'JANINE', 'LUIS', 'Business Requirement', '85', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 70, 'FEMALE', '1955-11-28', 'SANTIAGO, ISABELA', 'VENDOR', 'Employed', 'P-4031', '2020-01-22', 'ISLA LOGISTICS', 'CARLO BAUTISTA', 'GRACE GARCIA', '09994430786', '', '2026-05-05 16:03:35', 'PENDING'),
(38, '', 'TRBRGYCLEARANCE-0038', 'uploads/qr_codes/TRBRGYCLEARANCE-0038.png', NULL, 38, 'SANTOS', 'MARK', 'FERNANDO', 'Loan Application', '196', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 52, 'MALE', '1973-08-17', 'CABANATUAN CITY', 'STUDENT', '', 'P-4680', '2017-06-15', 'ABC TRADING', 'ANA GARCIA', 'ELIZABETH VILLAR', '09096859278', '', '2026-05-05 16:03:35', 'PENDING'),
(39, '', 'TRBRGYCLEARANCE-0039', 'uploads/qr_codes/TRBRGYCLEARANCE-0039.png', NULL, 39, 'MENDOZA', 'LUIGI', 'MIGUEL', 'Police Clearance Requirement', '226', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 34, 'MALE', '1991-05-07', 'CAUAYAN CITY', 'OFFICE CLERK', 'Unemployed', 'P-9621', '2025-07-10', 'SUNRISE EATERY', 'MARIA SANTOS', 'CLARA RAMOS', '09967314642', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(40, '', 'TRBRGYCLEARANCE-0040', 'uploads/qr_codes/TRBRGYCLEARANCE-0040.png', NULL, 40, 'VILLAR', 'LIZA', 'MARIE', 'Water/Electric service Connection', '40', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 17, 'FEMALE', '2009-01-24', 'SANTIAGO, ISABELA', 'FISHERFOLK', 'Employed', 'P-7846', '2018-11-22', 'BAYANI SERVICES', 'PAOLO CRUZ', 'MIGUEL REYES', '09037622130', 'NEW', '2026-05-05 16:03:35', 'PENDING'),
(41, '', 'TRBRGYCLEARANCE-0041', 'uploads/qr_codes/TRBRGYCLEARANCE-0041.png', NULL, 41, 'SANTOS', 'ROSE', 'ANDRES', 'Police Clearance Requirement', '20', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 65, 'FEMALE', '1960-10-15', 'CABANATUAN CITY', 'UNEMPLOYED', '', 'P-7232', '2024-10-10', 'LUNA CONSTRUCTION', 'PAOLO CRUZ', 'GRACE GARCIA', '09688375172', 'NEW', '2026-05-05 16:03:35', 'APPROVED'),
(42, '', 'TRBRGYCLEARANCE-0042', 'uploads/qr_codes/TRBRGYCLEARANCE-0042.png', NULL, 42, 'RAMOS', 'JOSE', 'ANTONIO', 'School Requirement', '231', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 47, 'MALE', '1978-07-05', 'CAUAYAN CITY', 'FARMER', '', 'P-2425', '2018-12-09', 'ISLA LOGISTICS', 'PAOLO CRUZ', 'CLARA RAMOS', '09532019301', '', '2026-05-05 16:03:35', 'APPROVED'),
(43, '', 'TRBRGYCLEARANCE-0043', 'uploads/qr_codes/TRBRGYCLEARANCE-0043.png', NULL, 43, 'VILLAR', 'CARLO', 'ELIZABETH', 'Travel Requirement', '93', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 30, 'MALE', '1996-03-24', 'SANTIAGO, ISABELA', 'FARMER', 'Unemployed', 'P-3094', '2016-09-08', 'MAHARLIKA MART', 'PAOLO CRUZ', 'CLARA RAMOS', '09620389941', 'NEW', '2026-05-05 16:03:35', 'APPROVED'),
(44, '', 'TRBRGYCLEARANCE-0044', 'uploads/qr_codes/TRBRGYCLEARANCE-0044.png', NULL, 44, 'SANTOS', 'ROSE', 'CLARA', 'Other important transactions.', '21', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 12, 'FEMALE', '2013-12-12', 'CABANATUAN CITY', 'OFFICE CLERK', 'Unemployed', 'P-6764', '2017-08-05', 'BAYANI SERVICES', 'JANE FLORES', 'LUIS NAVARRO', '09986149424', '', '2026-05-05 16:03:35', 'APPROVED'),
(45, '', 'TRBRGYCLEARANCE-0045', 'uploads/qr_codes/TRBRGYCLEARANCE-0045.png', NULL, 45, 'RAMOS', 'XIAN', 'LUIS', 'School Requirement', '76', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 60, 'MALE', '1965-09-02', 'CAUAYAN CITY', 'OFFICE CLERK', '', 'P-0756', '2022-03-23', 'MAHARLIKA MART', 'MARK NAVARRO', 'GRACE GARCIA', '09652017787', 'NEW', '2026-05-05 16:03:35', 'APPROVED'),
(46, '', 'TRBRGYCLEARANCE-0046', 'uploads/qr_codes/TRBRGYCLEARANCE-0046.png', NULL, 46, 'VILLAR', 'PAULO', 'FERNANDO', 'Police Clearance Requirement', '68', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 42, 'MALE', '1983-05-23', 'SANTIAGO, ISABELA', 'DRIVER', 'Unemployed', 'P-8715', '2022-12-07', 'ABC TRADING', 'JOSE REYES', 'SOFIA SANTOS', '09869334402', '', '2026-05-05 16:03:35', 'APPROVED'),
(47, '', 'TRBRGYCLEARANCE-0047', 'uploads/qr_codes/TRBRGYCLEARANCE-0047.png', NULL, 47, 'REYES', 'JUANA', 'MIGUEL', 'Business Requirement', '111', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 25, 'FEMALE', '2001-02-09', 'CABANATUAN CITY', 'SECURITY GUARD', 'Employed', 'P-9526', '2025-12-04', 'BAYANI SERVICES', 'PAOLO CRUZ', 'GRACE GARCIA', '09201377914', 'NEW', '2026-05-05 16:03:35', 'APPROVED'),
(48, '', 'TRBRGYCLEARANCE-0048', 'uploads/qr_codes/TRBRGYCLEARANCE-0048.png', NULL, 48, 'RAMOS', 'KAYE', 'GRACE', 'Travel Requirement', '99', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 73, 'FEMALE', '1952-10-31', 'CAUAYAN CITY', 'FISHERFOLK', '', 'P-5348', '2024-08-07', 'GOLDEN HARVEST STORE', 'CARLO BAUTISTA', 'ANDRES CRUZ', '09526504881', 'NEW', '2026-05-05 16:03:35', 'APPROVED'),
(49, '', 'TRBRGYCLEARANCE-0049', 'uploads/qr_codes/TRBRGYCLEARANCE-0049.png', NULL, 49, 'NAVARRO', 'BRUCE', 'ANDRES', 'School Requirement', '161', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 55, 'MALE', '1970-07-21', 'SANTIAGO, ISABELA', 'DRIVER', '', 'P-8907', '2016-08-08', 'GOLDEN HARVEST STORE', 'JANE FLORES', 'PEDRO DELA CRUZ', '09446009852', 'NEW', '2026-05-05 16:03:35', 'APPROVED'),
(50, '', 'TRBRGYCLEARANCE-0050', 'uploads/qr_codes/TRBRGYCLEARANCE-0050.png', NULL, 50, 'REYES', 'RAUL', 'ANTONIO', 'School Requirement', '8', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 38, 'MALE', '1988-04-10', 'BAGUIO CITY', 'SECURITY GUARD', 'Unemployed', 'P-9014', '2019-07-08', 'SAMPAGUITA ENTERPRISES', 'ANA GARCIA', 'ANTONIO BAUTISTA', '09135073565', '', '2026-05-05 16:03:35', 'APPROVED'),
(51, '', 'TRBRGYCLEARANCE-0051', 'uploads/qr_codes/TRBRGYCLEARANCE-0051.png', NULL, 51, 'RAMOS', 'LIZA', 'ELIZABETH', 'Water/Electric service Connection', '58', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 20, 'FEMALE', '2005-12-29', 'QUEZON CITY', 'TEACHER', 'Unemployed', 'P-2337', '2023-08-24', 'LUNA CONSTRUCTION', 'JOSE REYES', 'ANDRES CRUZ', '09430152540', '', '2026-05-05 16:03:35', 'APPROVED'),
(52, '', 'TRBRGYCLEARANCE-0052', 'uploads/qr_codes/TRBRGYCLEARANCE-0052.png', NULL, 52, 'NAVARRO', 'MARK', 'CLARA', 'Other important transactions.', '15', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 68, 'MALE', '1957-09-19', 'ILAGAN CITY', 'VENDOR', 'Employed', 'P-0991', '2023-03-07', 'GOLDEN HARVEST STORE', 'JOSE REYES', 'LUIS NAVARRO', '09908518416', 'NEW', '2026-05-05 16:03:35', 'APPROVED'),
(53, '', 'TRBRGYCLEARANCE-0053', 'uploads/qr_codes/TRBRGYCLEARANCE-0053.png', NULL, 53, 'REYES', 'JOSE', 'MARIE', 'Police Clearance Requirement', '152', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 50, 'MALE', '1975-06-09', 'BAGUIO CITY', 'DRIVER', 'Unemployed', 'P-7681', '2016-12-26', 'BAYANI SERVICES', 'ROSE VILLAR', 'ANDRES CRUZ', '09680077583', '', '2026-05-05 16:03:35', 'APPROVED'),
(54, '', 'TRBRGYCLEARANCE-0054', 'uploads/qr_codes/TRBRGYCLEARANCE-0054.png', NULL, 54, 'BAUTISTA', 'LIZA', 'FERNANDO', 'Travel Requirement', '212', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 33, 'FEMALE', '1993-02-26', 'QUEZON CITY', 'SECURITY GUARD', 'Unemployed', 'P-0635', '2022-11-30', 'SUNRISE EATERY', 'PAOLO CRUZ', 'ANTONIO BAUTISTA', '09872749307', 'NEW', '2026-05-05 16:03:35', 'APPROVED'),
(55, '', 'TRBRGYCLEARANCE-0055', 'uploads/qr_codes/TRBRGYCLEARANCE-0055.png', NULL, 55, 'NAVARRO', 'ROSE', 'MIGUEL', 'Travel Requirement', '103', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 15, 'FEMALE', '2010-11-16', 'ILAGAN CITY', 'CONSTRUCTION WORKER', 'Employed', 'P-5031', '2017-08-28', 'MAHARLIKA MART', 'ANA GARCIA', 'ANTONIO BAUTISTA', '09812085090', 'NEW', '2026-05-05 16:03:35', 'APPROVED'),
(56, '', 'TRBRGYCLEARANCE-0056', 'uploads/qr_codes/TRBRGYCLEARANCE-0056.png', NULL, 56, 'REYES', 'LIAM', 'GRACE', 'Travel Requirement', '131', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 63, 'MALE', '1962-08-07', 'BAGUIO CITY', 'CONSTRUCTION WORKER', 'Unemployed', 'P-1084', '2022-12-27', 'BAYANI SERVICES', 'LIZA RAMOS', 'FERNANDO FLORES', '09106256732', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(57, '', 'TRBRGYCLEARANCE-0057', 'uploads/qr_codes/TRBRGYCLEARANCE-0057.png', NULL, 57, 'BAUTISTA', 'CARLA', 'SOFIA', 'Travel Requirement', '92', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 46, 'FEMALE', '1980-04-26', 'QUEZON CITY', 'UNEMPLOYED', 'Employed', 'P-2089', '2025-11-06', 'LUNA CONSTRUCTION', 'MARK NAVARRO', 'SOFIA SANTOS', '09333811448', 'NEW', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(58, '', 'TRBRGYCLEARANCE-0058', 'uploads/qr_codes/TRBRGYCLEARANCE-0058.png', NULL, 58, 'NAVARRO', 'KATE', 'LUIS', 'Loan Application', '70', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 28, 'FEMALE', '1998-01-14', 'ILAGAN CITY', 'DRIVER', 'Employed', 'P-5359', '2019-08-05', 'SAMPAGUITA ENTERPRISES', 'CARLO BAUTISTA', 'PEDRO DELA CRUZ', '09165604404', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(59, '', 'TRBRGYCLEARANCE-0059', 'uploads/qr_codes/TRBRGYCLEARANCE-0059.png', NULL, 59, 'GARCIA', 'OLIVER', 'ELIZABETH', 'Loan Application', '72', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 10, 'MALE', '2015-10-04', 'BAGUIO CITY', 'FISHERFOLK', 'Employed', 'P-8672', '2016-10-08', 'GOLDEN HARVEST STORE', 'ROSE VILLAR', 'FERNANDO FLORES', '09248291803', 'NEW', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(60, '', 'TRBRGYCLEARANCE-0060', 'uploads/qr_codes/TRBRGYCLEARANCE-0060.png', NULL, 60, 'BAUTISTA', 'ELIJAH', 'CLARA', 'Travel Requirement', '149', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 58, 'MALE', '1967-06-25', 'QUEZON CITY', 'TEACHER', '', 'P-2349', '2018-04-25', 'BAYANI SERVICES', 'JANE FLORES', 'PEDRO DELA CRUZ', '09296609737', 'NEW', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(61, '', 'TRBRGYCLEARANCE-0061', 'uploads/qr_codes/TRBRGYCLEARANCE-0061.png', NULL, 61, 'CRUZ', 'MARIA', 'MARIE', 'Other important transactions.', '31', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 41, 'FEMALE', '1985-03-14', 'ILAGAN CITY', 'STUDENT', 'Employed', 'P-2610', '2023-07-04', 'LUNA CONSTRUCTION', 'MARIA SANTOS', 'FERNANDO FLORES', '09347908334', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(62, '', 'TRBRGYCLEARANCE-0062', 'uploads/qr_codes/TRBRGYCLEARANCE-0062.png', NULL, 62, 'GARCIA', 'SABRINA', 'ANDRES', 'School Requirement', '204', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 23, 'FEMALE', '2002-12-02', 'BAGUIO CITY', 'DRIVER', 'Unemployed', 'P-5093', '2017-11-17', 'SAMPAGUITA ENTERPRISES', 'ROSE VILLAR', 'PEDRO DELA CRUZ', '09905599620', 'NEW', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(63, '', 'TRBRGYCLEARANCE-0063', 'uploads/qr_codes/TRBRGYCLEARANCE-0063.png', NULL, 63, 'BAUTISTA', 'MARK', 'MIGUEL', 'Other important transactions.', '178', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 71, 'MALE', '1954-08-23', 'QUEZON CITY', 'VENDOR', '', 'P-9770', '2017-05-09', 'LUNA CONSTRUCTION', 'JANE FLORES', 'SOFIA SANTOS', '09101259324', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(64, '', 'TRBRGYCLEARANCE-0064', 'uploads/qr_codes/TRBRGYCLEARANCE-0064.png', NULL, 64, 'CRUZ', 'MARIA', 'GRACE', 'School Requirement', '28', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 53, 'FEMALE', '1972-05-12', 'ILAGAN CITY', 'OFFICE CLERK', '', 'P-4143', '2021-04-06', 'BAYANI SERVICES', 'MARK NAVARRO', 'SOFIA SANTOS', '09451906009', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(65, '', 'TRBRGYCLEARANCE-0065', 'uploads/qr_codes/TRBRGYCLEARANCE-0065.png', NULL, 65, 'GARCIA', 'LIZA', 'SOFIA', 'Police Clearance Requirement', '107', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 36, 'FEMALE', '1990-01-30', 'BAGUIO CITY', 'CONSTRUCTION WORKER', 'Unemployed', 'P-8111', '2016-06-01', 'SUNRISE EATERY', 'LIZA RAMOS', 'PEDRO DELA CRUZ', '09748251180', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(66, '', 'TRBRGYCLEARANCE-0066', 'uploads/qr_codes/TRBRGYCLEARANCE-0066.png', NULL, 66, 'FLORES', 'JACK', 'LUIS', 'Water/Electric service Connection', '199', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 18, 'MALE', '2007-10-20', 'QUEZON CITY', 'SECURITY GUARD', 'Unemployed', 'P-2930', '2022-02-01', 'GOLDEN HARVEST STORE', 'MARK NAVARRO', 'GRACE GARCIA', '09342169152', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(67, '', 'TRBRGYCLEARANCE-0067', 'uploads/qr_codes/TRBRGYCLEARANCE-0067.png', NULL, 67, 'CRUZ', 'JOSE', 'FERNANDO', 'School Requirement', '173', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 66, 'MALE', '1959-07-11', 'CAUAYAN CITY', 'STUDENT', '', 'P-8248', '2024-02-22', 'LUNA CONSTRUCTION', 'JOSE REYES', 'ANTONIO BAUTISTA', '09608003944', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(68, '', 'TRBRGYCLEARANCE-0068', 'uploads/qr_codes/TRBRGYCLEARANCE-0068.png', NULL, 68, 'GARCIA', 'AUBREY', 'CLARA', 'Other important transactions.', '20', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 49, 'FEMALE', '1977-03-30', 'SANTIAGO, ISABELA', 'SECURITY GUARD', 'Employed', 'P-0737', '2019-10-31', 'ISLA LOGISTICS', 'JUAN DELA CRUZ', 'MIGUEL REYES', '09147402724', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(69, '', 'TRBRGYCLEARANCE-0069', 'uploads/qr_codes/TRBRGYCLEARANCE-0069.png', NULL, 69, 'FLORES', 'ROSE', 'MARIE', 'School Requirement', '79', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 31, 'FEMALE', '1994-12-18', 'CABANATUAN CITY', 'UNEMPLOYED', 'Unemployed', 'P-6135', '2025-09-22', 'SUNRISE EATERY', 'JANE FLORES', 'ANTONIO BAUTISTA', '09096003452', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(70, '', 'TRBRGYCLEARANCE-0070', 'uploads/qr_codes/TRBRGYCLEARANCE-0070.png', NULL, 70, 'CRUZ', 'SAMUEL', 'ANDRES', 'Employment Requirement', '86', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 13, 'MALE', '2012-09-06', 'CAUAYAN CITY', 'SECURITY GUARD', 'Employed', 'P-7446', '2025-03-11', 'BAYANI SERVICES', 'MARIA SANTOS', 'PEDRO DELA CRUZ', '09572136951', '', '2026-05-05 16:03:35', 'READY FOR PICKUP'),
(71, '', 'TRBRGYCLEARANCE-0071', 'uploads/qr_codes/TRBRGYCLEARANCE-0071.png', NULL, 71, 'MENDOZA', 'JANE', 'ANTONIO', 'Business Requirement', '191', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 61, 'FEMALE', '1964-05-29', 'SANTIAGO, ISABELA', 'SECURITY GUARD', '', 'P-3330', '2018-12-09', 'SAMPAGUITA ENTERPRISES', 'MARIA SANTOS', 'ANTONIO BAUTISTA', '09762836371', '', '2026-05-05 16:03:35', 'CLAIMED'),
(72, '', 'TRBRGYCLEARANCE-0072', 'uploads/qr_codes/TRBRGYCLEARANCE-0072.png', NULL, 72, 'FLORES', 'MARITONI', 'GRACE', 'Loan Application', '198', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 44, 'FEMALE', '1982-02-16', 'CABANATUAN CITY', 'FISHERFOLK', 'Employed', 'P-3888', '2022-07-17', 'SAMPAGUITA ENTERPRISES', 'ANA GARCIA', 'ANTONIO BAUTISTA', '09406074484', '', '2026-05-05 16:03:35', 'CLAIMED'),
(73, '', 'TRBRGYCLEARANCE-0073', 'uploads/qr_codes/TRBRGYCLEARANCE-0073.png', NULL, 73, 'SANTOS', 'PAOLO', 'SOFIA', 'Police Clearance Requirement', '165', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 26, 'MALE', '1999-11-06', 'CAUAYAN CITY', 'FARMER', '', 'P-9995', '2021-02-11', 'LUNA CONSTRUCTION', 'ANA GARCIA', 'FERNANDO FLORES', '09738846291', '', '2026-05-05 16:03:35', 'CLAIMED'),
(74, '', 'TRBRGYCLEARANCE-0074', 'uploads/qr_codes/TRBRGYCLEARANCE-0074.png', NULL, 74, 'MENDOZA', 'ETHAN', 'LUIS', 'Employment Requirement', '232', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 74, 'MALE', '1951-07-28', 'SANTIAGO, ISABELA', 'TEACHER', '', 'P-2036', '2019-05-20', 'MAHARLIKA MART', 'JUAN DELA CRUZ', 'FERNANDO FLORES', '09517266364', '', '2026-05-05 16:03:35', 'CLAIMED'),
(75, '', 'TRBRGYCLEARANCE-0075', 'uploads/qr_codes/TRBRGYCLEARANCE-0075.png', NULL, 75, 'FLORES', 'MARIA', 'FERNANDO', 'Employment Requirement', '164', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 57, 'FEMALE', '1969-04-16', 'CABANATUAN CITY', 'UNEMPLOYED', 'Employed', 'P-2382', '2020-07-22', 'GOLDEN HARVEST STORE', 'JANE FLORES', 'CLARA RAMOS', '09647538666', '', '2026-05-05 16:03:35', 'CLAIMED'),
(76, '', 'TRBRGYCLEARANCE-0076', 'uploads/qr_codes/TRBRGYCLEARANCE-0076.png', NULL, 76, 'SANTOS', 'LIZA', 'MIGUEL', 'Loan Application', '123', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 39, 'FEMALE', '1987-01-04', 'CAUAYAN CITY', 'OFFICE CLERK', '', 'P-4421', '2022-11-09', 'SUNRISE EATERY', 'ROSE VILLAR', 'SOFIA SANTOS', '09287350114', '', '2026-05-05 16:03:35', 'CLAIMED'),
(77, '', 'TRBRGYCLEARANCE-0077', 'uploads/qr_codes/TRBRGYCLEARANCE-0077.png', NULL, 77, 'MENDOZA', 'LUIS', 'MARIE', 'Water/Electric service Connection', '123', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 21, 'MALE', '2004-09-23', 'SANTIAGO, ISABELA', 'TEACHER', 'Unemployed', 'P-8857', '2020-06-23', 'GOLDEN HARVEST STORE', 'PAOLO CRUZ', 'CLARA RAMOS', '09281939311', '', '2026-05-05 16:03:35', 'CLAIMED'),
(78, '', 'TRBRGYCLEARANCE-0078', 'uploads/qr_codes/TRBRGYCLEARANCE-0078.png', NULL, 78, 'VILLAR', 'JOSEPHINE', 'ANDRES', 'School Requirement', '245', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 69, 'FEMALE', '1956-06-14', 'CABANATUAN CITY', 'DRIVER', 'Employed', 'P-8626', '2025-07-08', 'MAHARLIKA MART', 'CARLO BAUTISTA', 'SOFIA SANTOS', '09609737984', '', '2026-05-05 16:03:35', 'CLAIMED'),
(79, '', 'TRBRGYCLEARANCE-0079', 'uploads/qr_codes/TRBRGYCLEARANCE-0079.png', NULL, 79, 'SANTOS', 'LIZA', 'ANTONIO', 'School Requirement', '104', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 52, 'FEMALE', '1974-03-04', 'CAUAYAN CITY', 'CONSTRUCTION WORKER', 'Employed', 'P-2574', '2019-01-26', 'MAHARLIKA MART', 'JANE FLORES', 'GRACE GARCIA', '09948192940', '', '2026-05-05 16:03:35', 'CLAIMED'),
(80, '', 'TRBRGYCLEARANCE-0080', 'uploads/qr_codes/TRBRGYCLEARANCE-0080.png', NULL, 80, 'MENDOZA', 'ARTHUR', 'ELIZABETH', 'School Requirement', '36', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 34, 'MALE', '1991-11-22', 'SANTIAGO, ISABELA', 'UNEMPLOYED', '', 'P-0865', '2023-02-02', 'BAYANI SERVICES', 'CARLO BAUTISTA', 'ANDRES CRUZ', '09156800162', 'NEW', '2026-05-05 16:03:35', 'CLAIMED'),
(81, '', 'TRBRGYCLEARANCE-0081', 'uploads/qr_codes/TRBRGYCLEARANCE-0081.png', NULL, 81, 'VILLAR', 'ALEXANDER', 'CLARA', 'Travel Requirement', '117', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 16, 'MALE', '2009-08-11', 'CABANATUAN CITY', 'SECURITY GUARD', 'Unemployed', 'P-7406', '2018-01-21', 'ISLA LOGISTICS', 'JANE FLORES', 'SOFIA SANTOS', '09729809082', 'NEW', '2026-05-05 16:03:35', 'CLAIMED'),
(82, '', 'TRBRGYCLEARANCE-0082', 'uploads/qr_codes/TRBRGYCLEARANCE-0082.png', NULL, 82, 'SANTOS', 'CHRISTINA', 'LUIS', 'School Requirement', '227', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 65, 'FEMALE', '1961-05-02', 'CAUAYAN CITY', 'SECURITY GUARD', 'Unemployed', 'P-7059', '2018-09-09', 'SAMPAGUITA ENTERPRISES', 'JUAN DELA CRUZ', 'GRACE GARCIA', '09706389257', 'NEW', '2026-05-05 16:03:35', 'CLAIMED'),
(83, '', 'TRBRGYCLEARANCE-0083', 'uploads/qr_codes/TRBRGYCLEARANCE-0083.png', NULL, 83, 'RAMOS', 'MERIDITH', 'FERNANDO', 'Water/Electric service Connection', '35', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 47, 'FEMALE', '1979-01-20', 'ILAGAN CITY', 'FISHERFOLK', '', 'P-0111', '2025-08-21', 'BAYANI SERVICES', 'JOSE REYES', 'MIGUEL REYES', '09383985068', 'NEW', '2026-05-05 16:03:35', 'CLAIMED'),
(84, '', 'TRBRGYCLEARANCE-0084', 'uploads/qr_codes/TRBRGYCLEARANCE-0084.png', NULL, 84, 'VILLAR', 'WILLIAM', 'MIGUEL', 'Loan Application', '241', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 29, 'MALE', '1996-10-09', 'BAGUIO CITY', 'SECURITY GUARD', '', 'P-1159', '2025-11-30', 'MAHARLIKA MART', 'JUAN DELA CRUZ', 'ANTONIO BAUTISTA', '09205004780', 'NEW', '2026-05-05 16:03:35', 'CLAIMED'),
(85, '', 'TRBRGYCLEARANCE-0085', 'uploads/qr_codes/TRBRGYCLEARANCE-0085.png', NULL, 85, 'REYES', 'JANE', 'GRACE', 'Water/Electric service Connection', '99', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 11, 'FEMALE', '2014-06-29', 'QUEZON CITY', 'OFFICE CLERK', 'Employed', 'P-6146', '2018-04-27', 'GOLDEN HARVEST STORE', 'JOSE REYES', 'FERNANDO FLORES', '09869871196', '', '2026-05-05 16:03:35', 'CLAIMED'),
(86, '', 'TRBRGYCLEARANCE-0086', 'uploads/qr_codes/TRBRGYCLEARANCE-0086.png', NULL, 86, 'RAMOS', 'MARIA', 'ANDRES', 'Business Requirement', '24', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 60, 'FEMALE', '1966-03-20', 'ILAGAN CITY', 'CONSTRUCTION WORKER', '', 'P-0197', '2024-01-19', 'ABC TRADING', 'LIZA RAMOS', 'LUIS NAVARRO', '09850032639', 'NEW', '2026-05-05 16:03:35', 'DELETED'),
(87, '', 'TRBRGYCLEARANCE-0087', 'uploads/qr_codes/TRBRGYCLEARANCE-0087.png', NULL, 87, 'VILLAR', 'HARRY', 'ANTONIO', 'Employment Requirement', '73', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 42, 'MALE', '1983-12-08', 'BAGUIO CITY', 'CONSTRUCTION WORKER', 'Unemployed', 'P-8173', '2025-07-05', 'ISLA LOGISTICS', 'ANA GARCIA', 'MIGUEL REYES', '09850167018', '', '2026-05-05 16:03:35', 'DELETED'),
(88, '', 'TRBRGYCLEARANCE-0088', 'uploads/qr_codes/TRBRGYCLEARANCE-0088.png', NULL, 88, 'REYES', 'MAVERICK', 'ELIZABETH', 'Police Clearance Requirement', '42', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 24, 'MALE', '2001-08-27', 'QUEZON CITY', 'VENDOR', '', 'P-9096', '2024-09-07', 'ABC TRADING', 'ROSE VILLAR', 'FERNANDO FLORES', '09232953130', 'NEW', '2026-05-05 16:03:35', 'DELETED'),
(89, '', 'TRBRGYCLEARANCE-0089', 'uploads/qr_codes/TRBRGYCLEARANCE-0089.png', NULL, 89, 'RAMOS', 'MARIA', 'CLARA', 'Employment Requirement', '241', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 72, 'FEMALE', '1953-05-18', 'ILAGAN CITY', 'FISHERFOLK', '', 'P-7082', '2018-06-03', 'MAHARLIKA MART', 'CARLO BAUTISTA', 'LUIS NAVARRO', '09984021242', '', '2026-05-05 16:03:35', 'DELETED'),
(90, '', 'TRBRGYCLEARANCE-0090', 'uploads/qr_codes/TRBRGYCLEARANCE-0090.png', NULL, 90, 'NAVARRO', 'LIZA', 'MARIE', 'Other important transactions.', '76', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 55, 'FEMALE', '1971-02-05', 'BAGUIO CITY', 'FISHERFOLK', '', 'P-9007', '2025-12-18', 'SUNRISE EATERY', 'MARIA SANTOS', 'GRACE GARCIA', '09422777496', 'NEW', '2026-05-05 16:03:35', 'DELETED'),
(91, '', 'TRBRGYCLEARANCE-0091', 'uploads/qr_codes/TRBRGYCLEARANCE-0091.png', NULL, 91, 'REYES', 'ADRIAN', 'FERNANDO', 'Travel Requirement', '157', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 37, 'MALE', '1988-10-26', 'QUEZON CITY', 'FISHERFOLK', 'Unemployed', 'P-8432', '2025-11-04', 'SAMPAGUITA ENTERPRISES', 'JOSE REYES', 'GRACE GARCIA', '09759548628', '', '2026-05-05 16:03:35', 'DELETED'),
(92, '', 'TRBRGYCLEARANCE-0092', 'uploads/qr_codes/TRBRGYCLEARANCE-0092.png', NULL, 92, 'RAMOS', 'JOSEFA', 'MIGUEL', 'Other important transactions.', '57', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'MARRIED', 19, 'FEMALE', '2006-07-16', 'ILAGAN CITY', 'DRIVER', '', 'P-6686', '2018-02-19', 'ABC TRADING', 'ROSE VILLAR', 'PEDRO DELA CRUZ', '09923827560', 'NEW', '2026-05-05 16:03:35', 'DELETED'),
(93, '', 'TRBRGYCLEARANCE-0093', 'uploads/qr_codes/TRBRGYCLEARANCE-0093.png', NULL, 93, 'NAVARRO', 'ALEXA', 'GRACE', 'Travel Requirement', '63', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'DIVORCED', 68, 'FEMALE', '1958-04-06', 'BAGUIO CITY', 'FARMER', '', 'P-6446', '2017-09-09', 'BAYANI SERVICES', 'MARIA SANTOS', 'FERNANDO FLORES', '09021203650', 'NEW', '2026-05-05 16:03:35', 'DELETED'),
(94, '', 'TRBRGYCLEARANCE-0094', 'uploads/qr_codes/TRBRGYCLEARANCE-0094.png', NULL, 94, 'REYES', 'ENZO', 'SOFIA', 'Water/Electric service Connection', '143', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'IN A RELATIONSHIP', 50, 'MALE', '1975-12-25', 'QUEZON CITY', 'OFFICE CLERK', '', 'P-3885', '2025-07-14', 'GOLDEN HARVEST STORE', 'MARK NAVARRO', 'MIGUEL REYES', '09008791266', 'NEW', '2026-05-05 16:03:35', 'DELETED'),
(95, '', 'TRBRGYCLEARANCE-0095', 'uploads/qr_codes/TRBRGYCLEARANCE-0095.png', NULL, 95, 'BAUTISTA', 'KAYDEN', 'ANTONIO', 'Business Requirement', '27', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 32, 'MALE', '1993-09-13', 'ILAGAN CITY', 'OFFICE CLERK', '', 'P-5628', '2025-07-22', 'SAMPAGUITA ENTERPRISES', 'MARIA SANTOS', 'CLARA RAMOS', '09492102231', '', '2026-05-05 16:03:35', 'DELETED'),
(96, '', 'TRBRGYCLEARANCE-0096', 'uploads/qr_codes/TRBRGYCLEARANCE-0096.png', NULL, 96, 'NAVARRO', 'JANE', 'ELIZABETH', 'School Requirement', '206', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 14, 'FEMALE', '2011-06-03', 'BAGUIO CITY', 'VENDOR', '', 'P-4063', '2024-08-16', 'LUNA CONSTRUCTION', 'LIZA RAMOS', 'LUIS NAVARRO', '09174320024', '', '2026-05-05 16:03:35', 'DELETED'),
(97, '', 'TRBRGYCLEARANCE-0097', 'uploads/qr_codes/TRBRGYCLEARANCE-0097.png', NULL, 97, 'GARCIA', 'JENNA', 'CLARA', 'Water/Electric service Connection', '196', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 63, 'FEMALE', '1963-02-22', 'QUEZON CITY', 'SECURITY GUARD', '', 'P-8102', '2017-04-05', 'ABC TRADING', 'CARLO BAUTISTA', 'PEDRO DELA CRUZ', '09432797089', '', '2026-05-05 16:03:35', 'DELETED'),
(98, '', 'TRBRGYCLEARANCE-0098', 'uploads/qr_codes/TRBRGYCLEARANCE-0098.png', NULL, 98, 'BAUTISTA', 'FELIX', 'MARIE', 'School Requirement', '114', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', 'SINGLE', 45, 'MALE', '1980-11-11', 'ILAGAN CITY', 'FARMER', '', 'P-7145', '2023-07-25', 'GOLDEN HARVEST STORE', 'JOSE REYES', 'ANDRES CRUZ', '09788422072', 'NEW', '2026-05-05 16:03:35', 'DELETED'),
(99, '', 'TRBRGYCLEARANCE-0099', 'uploads/qr_codes/TRBRGYCLEARANCE-0099.png', NULL, 99, 'NAVARRO', 'JOY', 'ANDRES', 'Other important transactions.', '231', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'WIDOWED', 27, 'FEMALE', '1998-08-01', 'BAGUIO CITY', 'CONSTRUCTION WORKER', 'Employed', 'P-7569', '2020-05-25', 'SAMPAGUITA ENTERPRISES', 'LIZA RAMOS', 'LUIS NAVARRO', '09204164553', '', '2026-05-05 16:03:35', 'DELETED'),
(100, '', 'TRBRGYCLEARANCE-0100', 'uploads/qr_codes/TRBRGYCLEARANCE-0100.png', NULL, 100, 'GARCIA', 'MARIA', 'MIGUEL', 'Other important transactions.', '63', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'LIVE-IN', 76, 'FEMALE', '1950-04-22', 'CABANATUAN CITY', 'UNEMPLOYED', 'Employed', 'P-6963', '2024-04-12', 'ISLA LOGISTICS', 'JANE FLORES', 'ELIZABETH VILLAR', '09618699898', 'NEW', '2026-05-05 16:03:35', 'DELETED'),
(128, '', 'TRBRGYCLEARANCE-0101', 'uploads/qr_codes/TRBRGYCLEARANCE-0101.png', NULL, 125, 'QUIPSE', 'MARIA CLAVERIA', 'LUMANOG', 'School/S.S.S Requirements', '142', 'DR NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'In a relationship', 25, 'Female', '2000-10-22', 'SOLANO, NUEVA VIZCAYA', 'STUDENT', 'Unemployed', '125', '2001-01-10', 'N/A', 'ANTHONY QUIPSE', 'SHARON MARCIAL', '442-3545', 'NEW', '2026-05-15 08:36:08', 'PENDING'),
(129, '', 'TRBRGYCLEARANCE-0102', 'uploads/qr_codes/TRBRGYCLEARANCE-0102.png', NULL, 125, 'QUIPSE', 'MARIA CLAVERIA', 'LUMANOG', 'Local Employment', '142', 'DR NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', 'In a relationship', 25, 'Female', '2000-10-22', 'SOLANO, NUEVA VIZCAYA', 'VIRTUAL ASSISTANT', 'Employed', '321', '2001-01-10', 'NMS', 'XIANTINA TORREFIEL', 'VANESSA SCHUYLER', '442-1532', 'NEW', '2026-05-15 08:43:57', 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_family_member`
--

CREATE TABLE `tbl_family_member` (
  `id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `family_lastname` varchar(100) DEFAULT NULL,
  `family_firstname` varchar(100) DEFAULT NULL,
  `family_middleinitial` varchar(10) DEFAULT NULL,
  `relationshipid` int(11) DEFAULT NULL,
  `family_age` int(11) DEFAULT NULL,
  `familycivilid` int(11) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `income` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_indigency`
--

CREATE TABLE `tbl_indigency` (
  `id_indigency` int(11) NOT NULL,
  `rejected_reason` varchar(128) DEFAULT '',
  `control_no` varchar(255) DEFAULT '',
  `qr_code` varchar(255) DEFAULT '',
  `cert_no` varchar(255) NOT NULL,
  `id_resident` int(11) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mi` varchar(255) NOT NULL,
  `bdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `nationality` varchar(255) NOT NULL,
  `houseno` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `municipal` varchar(255) NOT NULL,
  `resident_since` date DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('PENDING','APPROVED','REJECTED','READY FOR PICKUP','CLAIMED','DELETED') DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_indigency`
--

INSERT INTO `tbl_indigency` (`id_indigency`, `rejected_reason`, `control_no`, `qr_code`, `cert_no`, `id_resident`, `lname`, `fname`, `mi`, `bdate`, `age`, `nationality`, `houseno`, `street`, `brgy`, `municipal`, `resident_since`, `purpose`, `date`, `status`) VALUES
(1, '', 'TRINDIGENCY-0001', 'uploads/qr_codes/TRINDIGENCY-0001.png', '', 1, 'MENDOZA', 'MARK', 'FERNANDO', '1977-12-18', 48, 'FILIPINO', '34', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2022-01-03', 'Other important transactions.', '2026-05-14', 'PENDING'),
(2, '', 'TRINDIGENCY-0002', 'uploads/qr_codes/TRINDIGENCY-0002.png', '', 2, 'VILLAR', 'MICHELLE', 'MIGUEL', '1995-09-07', 30, 'FILIPINO', '122', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2017-12-02', 'Other important transactions.', '2026-05-12', 'PENDING'),
(3, '', 'TRINDIGENCY-0003', 'uploads/qr_codes/TRINDIGENCY-0003.png', '', 3, 'SANTOS', 'JOSE', 'MARIE', '2013-05-27', 12, 'FILIPINO', '7', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2026-01-15', 'Financial Transaction', '2026-05-09', 'PENDING'),
(4, '', 'TRINDIGENCY-0004', 'uploads/qr_codes/TRINDIGENCY-0004.png', '', 4, 'RAMOS', 'LORENZO', 'ANDRES', '1965-02-15', 61, 'FILIPINO', '169', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-05-23', 'Financial Transaction', '2026-05-11', 'PENDING'),
(5, '', 'TRINDIGENCY-0005', 'uploads/qr_codes/TRINDIGENCY-0005.png', '', 5, 'VILLAR', 'ROSE', 'ANTONIO', '1982-11-05', 43, 'FILIPINO', '75', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-09-01', 'Scholarship', '2026-05-07', 'PENDING'),
(6, '', 'TRINDIGENCY-0006', 'uploads/qr_codes/TRINDIGENCY-0006.png', '', 6, 'REYES', 'ANA', 'ELIZABETH', '2000-07-25', 25, 'FILIPINO', '116', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2022-02-15', 'Other important transactions.', '2026-05-16', 'PENDING'),
(7, '', 'TRINDIGENCY-0007', 'uploads/qr_codes/TRINDIGENCY-0007.png', '', 7, 'RAMOS', 'CARLO', 'CLARA', '1952-04-15', 74, 'FILIPINO', '104', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2024-06-11', 'Business Establishment', '2026-05-14', 'PENDING'),
(8, '', 'TRINDIGENCY-0008', 'uploads/qr_codes/TRINDIGENCY-0008.png', '', 8, 'VILLAR', 'JUAN', 'LUIS', '1970-01-03', 56, 'FILIPINO', '171', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-02-04', 'Scholarship', '2026-05-06', 'PENDING'),
(9, '', 'TRINDIGENCY-0009', 'uploads/qr_codes/TRINDIGENCY-0009.png', '', 9, 'REYES', 'ANA', 'FERNANDO', '1987-09-24', 38, 'FILIPINO', '45', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2016-12-31', 'Scholarship', '2026-05-18', 'PENDING'),
(10, '', 'TRINDIGENCY-0010', 'uploads/qr_codes/TRINDIGENCY-0010.png', '', 10, 'RAMOS', 'JOHN', 'MIGUEL', '2005-06-13', 20, 'FILIPINO', '209', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2016-09-21', 'Financial Transaction', '2026-05-08', 'PENDING'),
(11, '', 'TRINDIGENCY-0011', 'uploads/qr_codes/TRINDIGENCY-0011.png', '', 11, 'NAVARRO', 'MARIO', 'GARCIA', '1957-03-04', 69, 'FILIPINO', '163', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2016-07-17', 'Financial Transaction', '2026-05-17', 'PENDING'),
(12, '', 'TRINDIGENCY-0012', 'uploads/qr_codes/TRINDIGENCY-0012.png', '', 12, 'REYES', 'PAULA', 'ANDRES', '1974-11-22', 51, 'FILIPINO', '184', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2023-08-31', 'Other important transactions.', '2026-05-08', 'PENDING'),
(13, '', 'TRINDIGENCY-0013', 'uploads/qr_codes/TRINDIGENCY-0013.png', '', 13, 'RAMOS', 'MARCELLINE', 'ANTONIO', '1992-08-11', 33, 'FILIPINO', '180', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2023-02-24', 'Other important transactions.', '2026-05-12', 'PENDING'),
(14, '', 'TRINDIGENCY-0014', 'uploads/qr_codes/TRINDIGENCY-0014.png', '', 14, 'NAVARRO', 'MIKE', 'ELIZABETH', '2010-05-01', 16, 'FILIPINO', '99', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2021-01-08', 'Scholarship', '2026-05-13', 'PENDING'),
(15, '', 'TRINDIGENCY-0015', 'uploads/qr_codes/TRINDIGENCY-0015.png', '', 15, 'REYES', 'DAVID', 'CLARA', '1962-01-20', 64, 'FILIPINO', '206', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2019-04-14', 'Financial Transaction', '2026-05-10', 'PENDING'),
(16, '', 'TRINDIGENCY-0016', 'uploads/qr_codes/TRINDIGENCY-0016.png', '', 16, 'BAUTISTA', 'ROSE', 'MARIE', '1979-10-10', 46, 'FILIPINO', '231', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2019-07-31', 'Business Establishment', '2026-05-18', 'PENDING'),
(17, '', 'TRINDIGENCY-0017', 'uploads/qr_codes/TRINDIGENCY-0017.png', '', 17, 'NAVARRO', 'JOSE', 'FERNANDO', '1997-06-29', 28, 'FILIPINO', '37', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-06-16', 'Job/Employment', '2026-05-14', 'PENDING'),
(18, '', 'TRINDIGENCY-0018', 'uploads/qr_codes/TRINDIGENCY-0018.png', '', 18, 'GARCIA', 'CARLO', 'MIGUEL', '2015-03-19', 11, 'FILIPINO', '240', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2023-04-15', 'Scholarship', '2026-05-05', 'PENDING'),
(19, '', 'TRINDIGENCY-0019', 'uploads/qr_codes/TRINDIGENCY-0019.png', '', 19, 'BAUTISTA', 'ROSE', 'GRACE', '1966-12-08', 59, 'FILIPINO', '90', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2024-10-07', 'Job/Employment', '2026-05-05', 'PENDING'),
(20, '', 'TRINDIGENCY-0020', 'uploads/qr_codes/TRINDIGENCY-0020.png', '', 20, 'NAVARRO', 'ANA', 'SOFIA', '1984-08-27', 41, 'FILIPINO', '231', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2016-12-16', 'Financial Transaction', '2026-05-07', 'PENDING'),
(21, '', 'TRINDIGENCY-0021', 'uploads/qr_codes/TRINDIGENCY-0021.png', '', 21, 'GARCIA', 'JORGE', 'LUIS', '2002-05-17', 23, 'FILIPINO', '132', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2017-03-28', 'Business Establishment', '2026-05-09', 'PENDING'),
(22, '', 'TRINDIGENCY-0022', 'uploads/qr_codes/TRINDIGENCY-0022.png', '', 22, 'BAUTISTA', 'JUAN', 'ELIZABETH', '1954-02-05', 72, 'FILIPINO', '216', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-07-28', 'Scholarship', '2026-05-10', 'PENDING'),
(23, '', 'TRINDIGENCY-0023', 'uploads/qr_codes/TRINDIGENCY-0023.png', '', 23, 'CRUZ', 'BRACIA', 'CLARA', '1971-10-26', 54, 'FILIPINO', '185', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2021-09-23', 'Financial Transaction', '2026-05-07', 'PENDING'),
(24, '', 'TRINDIGENCY-0024', 'uploads/qr_codes/TRINDIGENCY-0024.png', '', 24, 'GARCIA', 'JAKE', 'MARIE', '1989-07-15', 36, 'FILIPINO', '27', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-11-14', 'Job/Employment', '2026-05-13', 'PENDING'),
(25, '', 'TRINDIGENCY-0025', 'uploads/qr_codes/TRINDIGENCY-0025.png', '', 25, 'BAUTISTA', 'XERXES', 'ANDRES', '2007-04-04', 19, 'FILIPINO', '80', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-10-31', 'Business Establishment', '2026-05-07', 'PENDING'),
(26, '', 'TRINDIGENCY-0026', 'uploads/qr_codes/TRINDIGENCY-0026.png', '', 26, 'CRUZ', 'LIZA', 'MIGUEL', '1958-12-24', 67, 'FILIPINO', '67', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-11-04', 'Scholarship', '2026-05-06', 'PENDING'),
(27, '', 'TRINDIGENCY-0027', 'uploads/qr_codes/TRINDIGENCY-0027.png', '', 27, 'GARCIA', 'MARCY', 'GRACE', '1976-09-12', 49, 'FILIPINO', '96', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2024-01-27', 'Other important transactions.', '2026-05-15', 'PENDING'),
(28, '', 'TRINDIGENCY-0028', 'uploads/qr_codes/TRINDIGENCY-0028.png', '', 28, 'FLORES', 'JOSE', 'SOFIA', '1994-06-02', 31, 'FILIPINO', '29', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-08-26', 'Business Establishment', '2026-05-13', 'PENDING'),
(29, '', 'TRINDIGENCY-0029', 'uploads/qr_codes/TRINDIGENCY-0029.png', '', 29, 'CRUZ', 'DRAKE', 'LUIS', '2012-02-20', 14, 'FILIPINO', '106', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-11-20', 'Scholarship', '2026-05-06', 'PENDING'),
(30, '', 'TRINDIGENCY-0030', 'uploads/qr_codes/TRINDIGENCY-0030.png', '', 30, 'MENDOZA', 'ROSE', 'FERNANDO', '1963-11-12', 62, 'FILIPINO', '194', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2021-06-29', 'Scholarship', '2026-05-12', 'PENDING'),
(31, '', 'TRINDIGENCY-0031', 'uploads/qr_codes/TRINDIGENCY-0031.png', '', 31, 'FLORES', 'IAN', 'CLARA', '1981-08-01', 44, 'FILIPINO', '152', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2021-08-23', 'Business Establishment', '2026-05-12', 'PENDING'),
(32, '', 'TRINDIGENCY-0032', 'uploads/qr_codes/TRINDIGENCY-0032.png', '', 32, 'CRUZ', 'CARLO', 'MARIE', '1999-04-21', 27, 'FILIPINO', '175', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2017-01-28', 'Financial Transaction', '2026-05-08', 'PENDING'),
(33, '', 'TRINDIGENCY-0033', 'uploads/qr_codes/TRINDIGENCY-0033.png', '', 33, 'MENDOZA', 'JUANA', 'ANDRES', '1951-01-10', 75, 'FILIPINO', '168', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-10-23', 'Scholarship', '2026-05-13', 'PENDING'),
(34, '', 'TRINDIGENCY-0034', 'uploads/qr_codes/TRINDIGENCY-0034.png', '', 34, 'FLORES', 'ANA', 'ANTONIO', '1968-09-29', 57, 'FILIPINO', '65', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2026-02-24', 'Scholarship', '2026-05-15', 'PENDING'),
(35, '', 'TRINDIGENCY-0035', 'uploads/qr_codes/TRINDIGENCY-0035.png', '', 35, 'SANTOS', 'JORDAN', 'GRACE', '1986-06-19', 39, 'FILIPINO', '71', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-01-12', 'Business Establishment', '2026-05-11', 'PENDING'),
(36, '', 'TRINDIGENCY-0036', 'uploads/qr_codes/TRINDIGENCY-0036.png', '', 36, 'MENDOZA', 'MARIA', 'SOFIA', '2004-03-08', 22, 'FILIPINO', '160', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2021-06-17', 'Job/Employment', '2026-05-13', 'PENDING'),
(37, '', 'TRINDIGENCY-0037', 'uploads/qr_codes/TRINDIGENCY-0037.png', '', 37, 'FLORES', 'JANINE', 'LUIS', '1955-11-28', 70, 'FILIPINO', '85', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-08-09', 'Financial Transaction', '2026-05-18', 'PENDING'),
(38, '', 'TRINDIGENCY-0038', 'uploads/qr_codes/TRINDIGENCY-0038.png', '', 38, 'SANTOS', 'MARK', 'FERNANDO', '1973-08-17', 52, 'FILIPINO', '196', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-11-10', 'Financial Transaction', '2026-05-16', 'PENDING'),
(39, '', 'TRINDIGENCY-0039', 'uploads/qr_codes/TRINDIGENCY-0039.png', '', 39, 'MENDOZA', 'LUIGI', 'MIGUEL', '1991-05-07', 34, 'FILIPINO', '226', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2017-06-05', 'Financial Transaction', '2026-05-07', 'PENDING'),
(40, '', 'TRINDIGENCY-0040', 'uploads/qr_codes/TRINDIGENCY-0040.png', '', 40, 'VILLAR', 'LIZA', 'MARIE', '2009-01-24', 17, 'FILIPINO', '40', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2019-05-16', 'Scholarship', '2026-05-05', 'PENDING'),
(41, '', 'TRINDIGENCY-0041', 'uploads/qr_codes/TRINDIGENCY-0041.png', '', 41, 'SANTOS', 'ROSE', 'ANDRES', '1960-10-15', 65, 'FILIPINO', '20', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2022-07-01', 'Financial Transaction', '2026-05-16', 'APPROVED'),
(42, '', 'TRINDIGENCY-0042', 'uploads/qr_codes/TRINDIGENCY-0042.png', '', 42, 'RAMOS', 'JOSE', 'ANTONIO', '1978-07-05', 47, 'FILIPINO', '231', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2024-07-26', 'Job/Employment', '2026-05-12', 'APPROVED'),
(43, '', 'TRINDIGENCY-0043', 'uploads/qr_codes/TRINDIGENCY-0043.png', '', 43, 'VILLAR', 'CARLO', 'ELIZABETH', '1996-03-24', 30, 'FILIPINO', '93', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2016-11-02', 'Job/Employment', '2026-05-06', 'APPROVED'),
(44, '', 'TRINDIGENCY-0044', 'uploads/qr_codes/TRINDIGENCY-0044.png', '', 44, 'SANTOS', 'ROSE', 'CLARA', '2013-12-12', 12, 'FILIPINO', '21', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2021-08-27', 'Business Establishment', '2026-05-12', 'APPROVED'),
(45, '', 'TRINDIGENCY-0045', 'uploads/qr_codes/TRINDIGENCY-0045.png', '', 45, 'RAMOS', 'XIAN', 'LUIS', '1965-09-02', 60, 'FILIPINO', '76', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-11-30', 'Financial Transaction', '2026-05-11', 'APPROVED'),
(46, '', 'TRINDIGENCY-0046', 'uploads/qr_codes/TRINDIGENCY-0046.png', '', 46, 'VILLAR', 'PAULO', 'FERNANDO', '1983-05-23', 42, 'FILIPINO', '68', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-07-05', 'Job/Employment', '2026-05-08', 'APPROVED'),
(47, '', 'TRINDIGENCY-0047', 'uploads/qr_codes/TRINDIGENCY-0047.png', '', 47, 'REYES', 'JUANA', 'MIGUEL', '2001-02-09', 25, 'FILIPINO', '111', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-07-27', 'Scholarship', '2026-05-06', 'APPROVED'),
(48, '', 'TRINDIGENCY-0048', 'uploads/qr_codes/TRINDIGENCY-0048.png', '', 48, 'RAMOS', 'KAYE', 'GRACE', '1952-10-31', 73, 'FILIPINO', '99', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2021-11-30', 'Other important transactions.', '2026-05-06', 'APPROVED'),
(49, '', 'TRINDIGENCY-0049', 'uploads/qr_codes/TRINDIGENCY-0049.png', '', 49, 'NAVARRO', 'BRUCE', 'ANDRES', '1970-07-21', 55, 'FILIPINO', '161', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-08-19', 'Business Establishment', '2026-05-14', 'APPROVED'),
(50, '', 'TRINDIGENCY-0050', 'uploads/qr_codes/TRINDIGENCY-0050.png', '', 50, 'REYES', 'RAUL', 'ANTONIO', '1988-04-10', 38, 'FILIPINO', '8', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2016-05-16', 'Financial Transaction', '2026-05-16', 'APPROVED'),
(51, '', 'TRINDIGENCY-0051', 'uploads/qr_codes/TRINDIGENCY-0051.png', '', 51, 'RAMOS', 'LIZA', 'ELIZABETH', '2005-12-29', 20, 'FILIPINO', '58', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-07-27', 'Scholarship', '2026-05-18', 'APPROVED'),
(52, '', 'TRINDIGENCY-0052', 'uploads/qr_codes/TRINDIGENCY-0052.png', '', 52, 'NAVARRO', 'MARK', 'CLARA', '1957-09-19', 68, 'FILIPINO', '15', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2017-06-17', 'Business Establishment', '2026-05-13', 'APPROVED'),
(53, '', 'TRINDIGENCY-0053', 'uploads/qr_codes/TRINDIGENCY-0053.png', '', 53, 'REYES', 'JOSE', 'MARIE', '1975-06-09', 50, 'FILIPINO', '152', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2019-07-13', 'Financial Transaction', '2026-05-18', 'APPROVED'),
(54, '', 'TRINDIGENCY-0054', 'uploads/qr_codes/TRINDIGENCY-0054.png', '', 54, 'BAUTISTA', 'LIZA', 'FERNANDO', '1993-02-26', 33, 'FILIPINO', '212', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2019-08-23', 'Job/Employment', '2026-05-17', 'APPROVED'),
(55, '', 'TRINDIGENCY-0055', 'uploads/qr_codes/TRINDIGENCY-0055.png', '', 55, 'NAVARRO', 'ROSE', 'MIGUEL', '2010-11-16', 15, 'FILIPINO', '103', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-01-16', 'Scholarship', '2026-05-12', 'APPROVED'),
(56, '', 'TRINDIGENCY-0056', 'uploads/qr_codes/TRINDIGENCY-0056.png', '', 56, 'REYES', 'LIAM', 'GRACE', '1962-08-07', 63, 'FILIPINO', '131', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2022-04-18', 'Financial Transaction', '2026-05-06', 'READY FOR PICKUP'),
(57, '', 'TRINDIGENCY-0057', 'uploads/qr_codes/TRINDIGENCY-0057.png', '', 57, 'BAUTISTA', 'CARLA', 'SOFIA', '1980-04-26', 46, 'FILIPINO', '92', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-05-29', 'Scholarship', '2026-05-06', 'READY FOR PICKUP'),
(58, '', 'TRINDIGENCY-0058', 'uploads/qr_codes/TRINDIGENCY-0058.png', '', 58, 'NAVARRO', 'KATE', 'LUIS', '1998-01-14', 28, 'FILIPINO', '70', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2016-05-04', 'Job/Employment', '2026-05-12', 'READY FOR PICKUP'),
(59, '', 'TRINDIGENCY-0059', 'uploads/qr_codes/TRINDIGENCY-0059.png', '', 59, 'GARCIA', 'OLIVER', 'ELIZABETH', '2015-10-04', 10, 'FILIPINO', '72', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2022-10-20', 'Business Establishment', '2026-05-06', 'READY FOR PICKUP'),
(60, '', 'TRINDIGENCY-0060', 'uploads/qr_codes/TRINDIGENCY-0060.png', '', 60, 'BAUTISTA', 'ELIJAH', 'CLARA', '1967-06-25', 58, 'FILIPINO', '149', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2024-07-16', 'Financial Transaction', '2026-05-11', 'READY FOR PICKUP'),
(61, '', 'TRINDIGENCY-0061', 'uploads/qr_codes/TRINDIGENCY-0061.png', '', 61, 'CRUZ', 'MARIA', 'MARIE', '1985-03-14', 41, 'FILIPINO', '31', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-10-20', 'Scholarship', '2026-05-11', 'READY FOR PICKUP'),
(62, '', 'TRINDIGENCY-0062', 'uploads/qr_codes/TRINDIGENCY-0062.png', '', 62, 'GARCIA', 'SABRINA', 'ANDRES', '2002-12-02', 23, 'FILIPINO', '204', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2024-10-29', 'Other important transactions.', '2026-05-12', 'READY FOR PICKUP'),
(63, '', 'TRINDIGENCY-0063', 'uploads/qr_codes/TRINDIGENCY-0063.png', '', 63, 'BAUTISTA', 'MARK', 'MIGUEL', '1954-08-23', 71, 'FILIPINO', '178', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2023-08-01', 'Scholarship', '2026-05-07', 'READY FOR PICKUP'),
(64, '', 'TRINDIGENCY-0064', 'uploads/qr_codes/TRINDIGENCY-0064.png', '', 64, 'CRUZ', 'MARIA', 'GRACE', '1972-05-12', 53, 'FILIPINO', '28', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-04-22', 'Scholarship', '2026-05-18', 'READY FOR PICKUP'),
(65, '', 'TRINDIGENCY-0065', 'uploads/qr_codes/TRINDIGENCY-0065.png', '', 65, 'GARCIA', 'LIZA', 'SOFIA', '1990-01-30', 36, 'FILIPINO', '107', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2023-12-22', 'Scholarship', '2026-05-08', 'READY FOR PICKUP'),
(66, '', 'TRINDIGENCY-0066', 'uploads/qr_codes/TRINDIGENCY-0066.png', '', 66, 'FLORES', 'JACK', 'LUIS', '2007-10-20', 18, 'FILIPINO', '199', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2017-12-20', 'Scholarship', '2026-05-17', 'READY FOR PICKUP'),
(67, '', 'TRINDIGENCY-0067', 'uploads/qr_codes/TRINDIGENCY-0067.png', '', 67, 'CRUZ', 'JOSE', 'FERNANDO', '1959-07-11', 66, 'FILIPINO', '173', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-03-07', 'Financial Transaction', '2026-05-13', 'READY FOR PICKUP'),
(68, '', 'TRINDIGENCY-0068', 'uploads/qr_codes/TRINDIGENCY-0068.png', '', 68, 'GARCIA', 'AUBREY', 'CLARA', '1977-03-30', 49, 'FILIPINO', '20', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-03-28', 'Job/Employment', '2026-05-14', 'READY FOR PICKUP'),
(69, '', 'TRINDIGENCY-0069', 'uploads/qr_codes/TRINDIGENCY-0069.png', '', 69, 'FLORES', 'ROSE', 'MARIE', '1994-12-18', 31, 'FILIPINO', '79', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2019-05-06', 'Job/Employment', '2026-05-14', 'READY FOR PICKUP'),
(70, '', 'TRINDIGENCY-0070', 'uploads/qr_codes/TRINDIGENCY-0070.png', '', 70, 'CRUZ', 'SAMUEL', 'ANDRES', '2012-09-06', 13, 'FILIPINO', '86', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2021-08-13', 'Job/Employment', '2026-05-06', 'READY FOR PICKUP'),
(71, '', 'TRINDIGENCY-0071', 'uploads/qr_codes/TRINDIGENCY-0071.png', '', 71, 'MENDOZA', 'JANE', 'ANTONIO', '1964-05-29', 61, 'FILIPINO', '191', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2016-12-23', 'Job/Employment', '2026-05-18', 'CLAIMED'),
(72, '', 'TRINDIGENCY-0072', 'uploads/qr_codes/TRINDIGENCY-0072.png', '', 72, 'FLORES', 'MARITONI', 'GRACE', '1982-02-16', 44, 'FILIPINO', '198', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-09-20', 'Business Establishment', '2026-05-05', 'CLAIMED'),
(73, '', 'TRINDIGENCY-0073', 'uploads/qr_codes/TRINDIGENCY-0073.png', '', 73, 'SANTOS', 'PAOLO', 'SOFIA', '1999-11-06', 26, 'FILIPINO', '165', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-01-07', 'Scholarship', '2026-05-07', 'CLAIMED'),
(74, '', 'TRINDIGENCY-0074', 'uploads/qr_codes/TRINDIGENCY-0074.png', '', 74, 'MENDOZA', 'ETHAN', 'LUIS', '1951-07-28', 74, 'FILIPINO', '232', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-06-24', 'Financial Transaction', '2026-05-06', 'CLAIMED'),
(75, '', 'TRINDIGENCY-0075', 'uploads/qr_codes/TRINDIGENCY-0075.png', '', 75, 'FLORES', 'MARIA', 'FERNANDO', '1969-04-16', 57, 'FILIPINO', '164', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2022-09-02', 'Scholarship', '2026-05-05', 'CLAIMED'),
(76, '', 'TRINDIGENCY-0076', 'uploads/qr_codes/TRINDIGENCY-0076.png', '', 76, 'SANTOS', 'LIZA', 'MIGUEL', '1987-01-04', 39, 'FILIPINO', '123', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2026-02-25', 'Job/Employment', '2026-05-18', 'CLAIMED'),
(77, '', 'TRINDIGENCY-0077', 'uploads/qr_codes/TRINDIGENCY-0077.png', '', 77, 'MENDOZA', 'LUIS', 'MARIE', '2004-09-23', 21, 'FILIPINO', '123', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-06-04', 'Other important transactions.', '2026-05-05', 'CLAIMED'),
(78, '', 'TRINDIGENCY-0078', 'uploads/qr_codes/TRINDIGENCY-0078.png', '', 78, 'VILLAR', 'JOSEPHINE', 'ANDRES', '1956-06-14', 69, 'FILIPINO', '245', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2023-04-23', 'Scholarship', '2026-05-07', 'CLAIMED'),
(79, '', 'TRINDIGENCY-0079', 'uploads/qr_codes/TRINDIGENCY-0079.png', '', 79, 'SANTOS', 'LIZA', 'ANTONIO', '1974-03-04', 52, 'FILIPINO', '104', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2016-08-25', 'Scholarship', '2026-05-11', 'CLAIMED'),
(80, '', 'TRINDIGENCY-0080', 'uploads/qr_codes/TRINDIGENCY-0080.png', '', 80, 'MENDOZA', 'ARTHUR', 'ELIZABETH', '1991-11-22', 34, 'FILIPINO', '36', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2024-08-26', 'Business Establishment', '2026-05-12', 'CLAIMED'),
(81, '', 'TRINDIGENCY-0081', 'uploads/qr_codes/TRINDIGENCY-0081.png', '', 81, 'VILLAR', 'ALEXANDER', 'CLARA', '2009-08-11', 16, 'FILIPINO', '117', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-04-21', 'Business Establishment', '2026-05-07', 'CLAIMED'),
(82, '', 'TRINDIGENCY-0082', 'uploads/qr_codes/TRINDIGENCY-0082.png', '', 82, 'SANTOS', 'CHRISTINA', 'LUIS', '1961-05-02', 65, 'FILIPINO', '227', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-12-22', 'Business Establishment', '2026-05-14', 'CLAIMED'),
(83, '', 'TRINDIGENCY-0083', 'uploads/qr_codes/TRINDIGENCY-0083.png', '', 83, 'RAMOS', 'MERIDITH', 'FERNANDO', '1979-01-20', 47, 'FILIPINO', '35', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-07-04', 'Financial Transaction', '2026-05-10', 'CLAIMED'),
(84, '', 'TRINDIGENCY-0084', 'uploads/qr_codes/TRINDIGENCY-0084.png', '', 84, 'VILLAR', 'WILLIAM', 'MIGUEL', '1996-10-09', 29, 'FILIPINO', '241', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-11-21', 'Business Establishment', '2026-05-16', 'CLAIMED'),
(85, '', 'TRINDIGENCY-0085', 'uploads/qr_codes/TRINDIGENCY-0085.png', '', 85, 'REYES', 'JANE', 'GRACE', '2014-06-29', 11, 'FILIPINO', '99', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2019-04-05', 'Financial Transaction', '2026-05-16', 'CLAIMED'),
(86, '', 'TRINDIGENCY-0086', 'uploads/qr_codes/TRINDIGENCY-0086.png', '', 86, 'RAMOS', 'MARIA', 'ANDRES', '1966-03-20', 60, 'FILIPINO', '24', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-04-06', 'Financial Transaction', '2026-05-13', 'DELETED'),
(87, '', 'TRINDIGENCY-0087', 'uploads/qr_codes/TRINDIGENCY-0087.png', '', 87, 'VILLAR', 'HARRY', 'ANTONIO', '1983-12-08', 42, 'FILIPINO', '73', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '2024-02-17', 'Job/Employment', '2026-05-07', 'DELETED'),
(88, '', 'TRINDIGENCY-0088', 'uploads/qr_codes/TRINDIGENCY-0088.png', '', 88, 'REYES', 'MAVERICK', 'ELIZABETH', '2001-08-27', 24, 'FILIPINO', '42', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-04-27', 'Business Establishment', '2026-05-18', 'DELETED'),
(89, '', 'TRINDIGENCY-0089', 'uploads/qr_codes/TRINDIGENCY-0089.png', '', 89, 'RAMOS', 'MARIA', 'CLARA', '1953-05-18', 72, 'FILIPINO', '241', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2017-10-06', 'Scholarship', '2026-05-18', 'DELETED'),
(90, '', 'TRINDIGENCY-0090', 'uploads/qr_codes/TRINDIGENCY-0090.png', '', 90, 'NAVARRO', 'LIZA', 'MARIE', '1971-02-05', 55, 'FILIPINO', '76', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2024-10-09', 'Job/Employment', '2026-05-12', 'DELETED'),
(91, '', 'TRINDIGENCY-0091', 'uploads/qr_codes/TRINDIGENCY-0091.png', '', 91, 'REYES', 'ADRIAN', 'FERNANDO', '1988-10-26', 37, 'FILIPINO', '157', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-09-06', 'Other important transactions.', '2026-05-14', 'DELETED'),
(92, '', 'TRINDIGENCY-0092', 'uploads/qr_codes/TRINDIGENCY-0092.png', '', 92, 'RAMOS', 'JOSEFA', 'MIGUEL', '2006-07-16', 19, 'FILIPINO', '57', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2025-03-27', 'Financial Transaction', '2026-05-17', 'DELETED'),
(93, '', 'TRINDIGENCY-0093', 'uploads/qr_codes/TRINDIGENCY-0093.png', '', 93, 'NAVARRO', 'ALEXA', 'GRACE', '1958-04-06', 68, 'FILIPINO', '63', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-02-17', 'Financial Transaction', '2026-05-07', 'DELETED'),
(94, '', 'TRINDIGENCY-0094', 'uploads/qr_codes/TRINDIGENCY-0094.png', '', 94, 'REYES', 'ENZO', 'SOFIA', '1975-12-25', 50, 'FILIPINO', '143', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2021-01-06', 'Business Establishment', '2026-05-16', 'DELETED'),
(95, '', 'TRINDIGENCY-0095', 'uploads/qr_codes/TRINDIGENCY-0095.png', '', 95, 'BAUTISTA', 'KAYDEN', 'ANTONIO', '1993-09-13', 32, 'FILIPINO', '27', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '2017-07-01', 'Financial Transaction', '2026-05-15', 'DELETED'),
(96, '', 'TRINDIGENCY-0096', 'uploads/qr_codes/TRINDIGENCY-0096.png', '', 96, 'NAVARRO', 'JANE', 'ELIZABETH', '2011-06-03', 14, 'FILIPINO', '206', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2023-06-14', 'Job/Employment', '2026-05-12', 'DELETED'),
(97, '', 'TRINDIGENCY-0097', 'uploads/qr_codes/TRINDIGENCY-0097.png', '', 97, 'GARCIA', 'JENNA', 'CLARA', '1963-02-22', 63, 'FILIPINO', '196', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2018-02-28', 'Job/Employment', '2026-05-08', 'DELETED'),
(98, '', 'TRINDIGENCY-0098', 'uploads/qr_codes/TRINDIGENCY-0098.png', '', 98, 'BAUTISTA', 'FELIX', 'MARIE', '1980-11-11', 45, 'FILIPINO', '114', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '2022-03-14', 'Business Establishment', '2026-05-09', 'DELETED'),
(99, '', 'TRINDIGENCY-0099', 'uploads/qr_codes/TRINDIGENCY-0099.png', '', 99, 'NAVARRO', 'JOY', 'ANDRES', '1998-08-01', 27, 'FILIPINO', '231', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2017-12-01', 'Business Establishment', '2026-05-05', 'DELETED'),
(100, '', 'TRINDIGENCY-0100', 'uploads/qr_codes/TRINDIGENCY-0100.png', '', 100, 'GARCIA', 'MARIA', 'MIGUEL', '1950-04-22', 76, 'FILIPINO', '63', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '2020-01-16', 'Business Establishment', '2026-05-07', 'DELETED'),
(129, '', 'TRINDIGENCY-0101', 'uploads/qr_codes/TRINDIGENCY-0101.png', '', 125, 'QUIPSE', 'MARIA CLAVERIA', 'LUMANOG', '2000-10-22', 25, 'Filipino', '142', 'DR NAVARRO ALLEY', 'EAST MODERN SITE', 'BAGUIO CITY', '0000-00-00', 'Scholarship', '2026-05-15', 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_officials`
--

CREATE TABLE `tbl_officials` (
  `id_official` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `termstart` date NOT NULL,
  `termend` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `avatar` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_officials`
--

INSERT INTO `tbl_officials` (`id_official`, `name`, `position`, `termstart`, `termend`, `status`, `avatar`) VALUES
(1, 'Hon. Peter G. Bucasan', 'Punong Barangay ', '2023-10-30', '2026-06-28', 'Active', ''),
(2, 'VACANT', 'Sangguniang Kabataan Chairman', '2023-10-30', '2023-10-30', 'Not Active', ''),
(3, 'Claribelle G. Leung', 'Barangay Secretary', '2017-06-06', '2027-09-30', 'Active', ''),
(4, 'Ana Leah S. Buhangin', 'Barangay Treasurer', '2023-06-15', '2025-03-03', '', ''),
(5, 'Romeo C. Santiago', 'Chairperson, Committee on Health & Sanitation', '2024-08-01', '2025-01-08', '', ''),
(6, 'Albert J. Clement', 'Chairman, Committee on Environment (Clean & Green)', '2023-10-30', '2027-01-01', '', ''),
(7, 'Daniel L. Hizon', 'Chairman, Committee on Budget & Appropriation', '2023-10-30', '2027-01-01', '', ''),
(8, 'Fredo C. Mariano', 'Chairman, Committee on Peace & Order', '2023-10-30', '2027-01-01', '', ''),
(9, 'Ricky R. Give Jr.', 'Chairman, Committee on Social Culture & Special Affairs', '2023-10-30', '2027-01-01', '', ''),
(10, 'Bonifacio P. Cruz', 'Chairman, Committee on Infrastructure', '2023-10-30', '2027-01-01', '', ''),
(11, 'Nellie L. Vergara', 'Chairman, Committee on Ways & Means', '2023-10-30', '2027-01-01', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rescert`
--

CREATE TABLE `tbl_rescert` (
  `id_rescert` int(11) NOT NULL,
  `rejected_reason` varchar(129) DEFAULT '',
  `control_no` varchar(255) DEFAULT '',
  `qr_code` varchar(255) DEFAULT '',
  `cert_no` varchar(255) NOT NULL,
  `id_resident` int(11) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mi` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `houseno` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `bdate` date DEFAULT NULL,
  `bplace` varchar(255) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `municipal` varchar(255) NOT NULL,
  `resident_since` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `requirements` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED','READY FOR PICKUP','CLAIMED','DELETED') DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_rescert`
--

INSERT INTO `tbl_rescert` (`id_rescert`, `rejected_reason`, `control_no`, `qr_code`, `cert_no`, `id_resident`, `lname`, `fname`, `mi`, `age`, `nationality`, `occupation`, `contact`, `email`, `houseno`, `street`, `bdate`, `bplace`, `civil_status`, `brgy`, `municipal`, `resident_since`, `date`, `purpose`, `requirements`, `attachment`, `status`) VALUES
(1, '', 'TRRESIDENCY-0001', 'uploads/qr_codes/TRRESIDENCY-0001.png', '', 1, 'MENDOZA', 'MARK', 'FERNANDO', '48', 'FILIPINO', 'FARMER', '09000000001', 'RESIDENT0001@EXAMPLE.COM', '34', 'AMSING RD', '1977-12-18', 'CABANATUAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-16', 'Job/Employment', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(2, '', 'TRRESIDENCY-0002', 'uploads/qr_codes/TRRESIDENCY-0002.png', '', 2, 'VILLAR', 'MICHELLE', 'MIGUEL', '30', 'FILIPINO', 'OFFICE CLERK', '09000000002', 'RESIDENT0002@EXAMPLE.COM', '122', 'LEDESMA STREET', '1995-09-07', 'CAUAYAN CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-09', 'Job/Employment', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(3, '', 'TRRESIDENCY-0003', 'uploads/qr_codes/TRRESIDENCY-0003.png', '', 3, 'SANTOS', 'JOSE', 'MARIE', '12', 'FILIPINO', 'VENDOR', '09000000003', 'RESIDENT0003@EXAMPLE.COM', '7', 'LEDESMA STREET', '2013-05-27', 'SANTIAGO, ISABELA', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-15', 'School Requirement', 'Valid ID,Utility Bill', '', 'PENDING'),
(4, '', 'TRRESIDENCY-0004', 'uploads/qr_codes/TRRESIDENCY-0004.png', '', 4, 'RAMOS', 'LORENZO', 'ANDRES', '61', 'FILIPINO', 'SECURITY GUARD', '09000000004', 'RESIDENT0004@EXAMPLE.COM', '169', 'T. BUGALLON', '1965-02-15', 'CABANATUAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-17', 'School Requirement', 'Cedula', '', 'PENDING'),
(5, '', 'TRRESIDENCY-0005', 'uploads/qr_codes/TRRESIDENCY-0005.png', '', 5, 'VILLAR', 'ROSE', 'ANTONIO', '43', 'FILIPINO', 'TEACHER', '09000000005', 'RESIDENT0005@EXAMPLE.COM', '75', 'AMSING RD', '1982-11-05', 'CAUAYAN CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-05', 'Business Permit', 'Utility Bill', '', 'PENDING'),
(6, '', 'TRRESIDENCY-0006', 'uploads/qr_codes/TRRESIDENCY-0006.png', '', 6, 'REYES', 'ANA', 'ELIZABETH', '25', 'FILIPINO', 'FARMER', '09000000006', 'RESIDENT0006@EXAMPLE.COM', '116', 'T. BUGALLON', '2000-07-25', 'SANTIAGO, ISABELA', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-11', 'Business Permit', 'Utility Bill', '', 'PENDING'),
(7, '', 'TRRESIDENCY-0007', 'uploads/qr_codes/TRRESIDENCY-0007.png', '', 7, 'RAMOS', 'CARLO', 'CLARA', '74', 'FILIPINO', 'TEACHER', '09000000007', 'RESIDENT0007@EXAMPLE.COM', '104', 'LEDESMA STREET', '1952-04-15', 'CABANATUAN CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-13', 'Business Permit', 'Cedula', '', 'PENDING'),
(8, '', 'TRRESIDENCY-0008', 'uploads/qr_codes/TRRESIDENCY-0008.png', '', 8, 'VILLAR', 'JUAN', 'LUIS', '56', 'FILIPINO', 'UNEMPLOYED', '09000000008', 'RESIDENT0008@EXAMPLE.COM', '171', 'DR. NAVARRO ALLEY', '1970-01-03', 'CAUAYAN CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-15', 'School Requirement', 'Valid ID', '', 'PENDING'),
(9, '', 'TRRESIDENCY-0009', 'uploads/qr_codes/TRRESIDENCY-0009.png', '', 9, 'REYES', 'ANA', 'FERNANDO', '38', 'FILIPINO', 'FARMER', '09000000009', 'RESIDENT0009@EXAMPLE.COM', '45', 'DR. NAVARRO ALLEY', '1987-09-24', 'SANTIAGO, ISABELA', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-16', 'School Requirement', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(10, '', 'TRRESIDENCY-0010', 'uploads/qr_codes/TRRESIDENCY-0010.png', '', 10, 'RAMOS', 'JOHN', 'MIGUEL', '20', 'FILIPINO', 'FISHERFOLK', '09000000010', 'RESIDENT0010@EXAMPLE.COM', '209', 'INTERIOR LEDESMA STREET', '2005-06-13', 'CABANATUAN CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-09', 'School Requirement', 'Cedula', '', 'PENDING'),
(11, '', 'TRRESIDENCY-0011', 'uploads/qr_codes/TRRESIDENCY-0011.png', '', 11, 'NAVARRO', 'MARIO', 'GARCIA', '69', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000011', 'RESIDENT0011@EXAMPLE.COM', '163', 'DR. NAVARRO ALLEY', '1957-03-04', 'CAUAYAN CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-15', 'Other important transactions.', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(12, '', 'TRRESIDENCY-0012', 'uploads/qr_codes/TRRESIDENCY-0012.png', '', 12, 'REYES', 'PAULA', 'ANDRES', '51', 'FILIPINO', 'FARMER', '09000000012', 'RESIDENT0012@EXAMPLE.COM', '184', 'LEDESMA STREET', '1974-11-22', 'SANTIAGO, ISABELA', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-05', 'School Requirement', 'Cedula', '', 'PENDING'),
(13, '', 'TRRESIDENCY-0013', 'uploads/qr_codes/TRRESIDENCY-0013.png', '', 13, 'RAMOS', 'MARCELLINE', 'ANTONIO', '33', 'FILIPINO', 'FARMER', '09000000013', 'RESIDENT0013@EXAMPLE.COM', '180', 'T. BUGALLON', '1992-08-11', 'CABANATUAN CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-05', 'School Requirement', 'Valid ID,Utility Bill', '', 'PENDING'),
(14, '', 'TRRESIDENCY-0014', 'uploads/qr_codes/TRRESIDENCY-0014.png', '', 14, 'NAVARRO', 'MIKE', 'ELIZABETH', '16', 'FILIPINO', 'SECURITY GUARD', '09000000014', 'RESIDENT0014@EXAMPLE.COM', '99', 'DR. NAVARRO ALLEY', '2010-05-01', 'CAUAYAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-11', 'Postal ID Application', 'Valid ID', '', 'PENDING'),
(15, '', 'TRRESIDENCY-0015', 'uploads/qr_codes/TRRESIDENCY-0015.png', '', 15, 'REYES', 'DAVID', 'CLARA', '64', 'FILIPINO', 'TEACHER', '09000000015', 'RESIDENT0015@EXAMPLE.COM', '206', 'DR. NAVARRO ALLEY', '1962-01-20', 'SANTIAGO, ISABELA', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-15', 'Job/Employment', 'Valid ID,Utility Bill', '', 'PENDING'),
(16, '', 'TRRESIDENCY-0016', 'uploads/qr_codes/TRRESIDENCY-0016.png', '', 16, 'BAUTISTA', 'ROSE', 'MARIE', '46', 'FILIPINO', 'FARMER', '09000000016', 'RESIDENT0016@EXAMPLE.COM', '231', 'AMSING RD', '1979-10-10', 'BAGUIO CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-14', 'Other important transactions.', 'Valid ID,Utility Bill', '', 'PENDING'),
(17, '', 'TRRESIDENCY-0017', 'uploads/qr_codes/TRRESIDENCY-0017.png', '', 17, 'NAVARRO', 'JOSE', 'FERNANDO', '28', 'FILIPINO', 'TEACHER', '09000000017', 'RESIDENT0017@EXAMPLE.COM', '37', 'LEDESMA STREET', '1997-06-29', 'QUEZON CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-14', 'Business Permit', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(18, '', 'TRRESIDENCY-0018', 'uploads/qr_codes/TRRESIDENCY-0018.png', '', 18, 'GARCIA', 'CARLO', 'MIGUEL', '11', 'FILIPINO', 'VENDOR', '09000000018', 'RESIDENT0018@EXAMPLE.COM', '240', 'LEDESMA STREET', '2015-03-19', 'ILAGAN CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-14', 'Postal ID Application', 'Utility Bill', '', 'PENDING'),
(19, '', 'TRRESIDENCY-0019', 'uploads/qr_codes/TRRESIDENCY-0019.png', '', 19, 'BAUTISTA', 'ROSE', 'GRACE', '59', 'FILIPINO', 'FISHERFOLK', '09000000019', 'RESIDENT0019@EXAMPLE.COM', '90', 'INTERIOR LEDESMA STREET', '1966-12-08', 'BAGUIO CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-12', 'Postal ID Application', 'Utility Bill', '', 'PENDING'),
(20, '', 'TRRESIDENCY-0020', 'uploads/qr_codes/TRRESIDENCY-0020.png', '', 20, 'NAVARRO', 'ANA', 'SOFIA', '41', 'FILIPINO', 'OFFICE CLERK', '09000000020', 'RESIDENT0020@EXAMPLE.COM', '231', 'LEDESMA STREET', '1984-08-27', 'QUEZON CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-17', 'School Requirement', 'Valid ID,Utility Bill', '', 'PENDING'),
(21, '', 'TRRESIDENCY-0021', 'uploads/qr_codes/TRRESIDENCY-0021.png', '', 21, 'GARCIA', 'JORGE', 'LUIS', '23', 'FILIPINO', 'DRIVER', '09000000021', 'RESIDENT0021@EXAMPLE.COM', '132', 'LEDESMA STREET', '2002-05-17', 'ILAGAN CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-13', 'Business Permit', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(22, '', 'TRRESIDENCY-0022', 'uploads/qr_codes/TRRESIDENCY-0022.png', '', 22, 'BAUTISTA', 'JUAN', 'ELIZABETH', '72', 'FILIPINO', 'DRIVER', '09000000022', 'RESIDENT0022@EXAMPLE.COM', '216', 'INTERIOR LEDESMA STREET', '1954-02-05', 'BAGUIO CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-14', 'Other important transactions.', 'Valid ID', '', 'PENDING'),
(23, '', 'TRRESIDENCY-0023', 'uploads/qr_codes/TRRESIDENCY-0023.png', '', 23, 'CRUZ', 'BRACIA', 'CLARA', '54', 'FILIPINO', 'TEACHER', '09000000023', 'RESIDENT0023@EXAMPLE.COM', '185', 'INTERIOR LEDESMA STREET', '1971-10-26', 'QUEZON CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-18', 'Business Permit', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(24, '', 'TRRESIDENCY-0024', 'uploads/qr_codes/TRRESIDENCY-0024.png', '', 24, 'GARCIA', 'JAKE', 'MARIE', '36', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000024', 'RESIDENT0024@EXAMPLE.COM', '27', 'AMSING RD', '1989-07-15', 'ILAGAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-12', 'School Requirement', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(25, '', 'TRRESIDENCY-0025', 'uploads/qr_codes/TRRESIDENCY-0025.png', '', 25, 'BAUTISTA', 'XERXES', 'ANDRES', '19', 'FILIPINO', 'OFFICE CLERK', '09000000025', 'RESIDENT0025@EXAMPLE.COM', '80', 'DR. NAVARRO ALLEY', '2007-04-04', 'BAGUIO CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-10', 'Other important transactions.', 'Valid ID,Utility Bill', '', 'PENDING'),
(26, '', 'TRRESIDENCY-0026', 'uploads/qr_codes/TRRESIDENCY-0026.png', '', 26, 'CRUZ', 'LIZA', 'MIGUEL', '67', 'FILIPINO', 'TEACHER', '09000000026', 'RESIDENT0026@EXAMPLE.COM', '67', 'DR. NAVARRO ALLEY', '1958-12-24', 'QUEZON CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-15', 'Other important transactions.', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(27, '', 'TRRESIDENCY-0027', 'uploads/qr_codes/TRRESIDENCY-0027.png', '', 27, 'GARCIA', 'MARCY', 'GRACE', '49', 'FILIPINO', 'SECURITY GUARD', '09000000027', 'RESIDENT0027@EXAMPLE.COM', '96', 'T. BUGALLON', '1976-09-12', 'ILAGAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-07', 'Job/Employment', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(28, '', 'TRRESIDENCY-0028', 'uploads/qr_codes/TRRESIDENCY-0028.png', '', 28, 'FLORES', 'JOSE', 'SOFIA', '31', 'FILIPINO', 'SECURITY GUARD', '09000000028', 'RESIDENT0028@EXAMPLE.COM', '29', 'T. BUGALLON', '1994-06-02', 'BAGUIO CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-14', 'Business Permit', 'Utility Bill', '', 'PENDING'),
(29, '', 'TRRESIDENCY-0029', 'uploads/qr_codes/TRRESIDENCY-0029.png', '', 29, 'CRUZ', 'DRAKE', 'LUIS', '14', 'FILIPINO', 'STUDENT', '09000000029', 'RESIDENT0029@EXAMPLE.COM', '106', 'INTERIOR LEDESMA STREET', '2012-02-20', 'QUEZON CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-11', 'Postal ID Application', 'Cedula', '', 'PENDING'),
(30, '', 'TRRESIDENCY-0030', 'uploads/qr_codes/TRRESIDENCY-0030.png', '', 30, 'MENDOZA', 'ROSE', 'FERNANDO', '62', 'FILIPINO', 'TEACHER', '09000000030', 'RESIDENT0030@EXAMPLE.COM', '194', 'INTERIOR LEDESMA STREET', '1963-11-12', 'ILAGAN CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-10', 'Business Permit', 'Cedula', '', 'PENDING'),
(31, '', 'TRRESIDENCY-0031', 'uploads/qr_codes/TRRESIDENCY-0031.png', '', 31, 'FLORES', 'IAN', 'CLARA', '44', 'FILIPINO', 'FISHERFOLK', '09000000031', 'RESIDENT0031@EXAMPLE.COM', '152', 'AMSING RD', '1981-08-01', 'BAGUIO CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-17', 'Job/Employment', 'Valid ID,Utility Bill', '', 'PENDING'),
(32, '', 'TRRESIDENCY-0032', 'uploads/qr_codes/TRRESIDENCY-0032.png', '', 32, 'CRUZ', 'CARLO', 'MARIE', '27', 'FILIPINO', 'UNEMPLOYED', '09000000032', 'RESIDENT0032@EXAMPLE.COM', '175', 'AMSING RD', '1999-04-21', 'QUEZON CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-13', 'Business Permit', 'Utility Bill', '', 'PENDING'),
(33, '', 'TRRESIDENCY-0033', 'uploads/qr_codes/TRRESIDENCY-0033.png', '', 33, 'MENDOZA', 'JUANA', 'ANDRES', '75', 'FILIPINO', 'TEACHER', '09000000033', 'RESIDENT0033@EXAMPLE.COM', '168', 'DR. NAVARRO ALLEY', '1951-01-10', 'CAUAYAN CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-17', 'Other important transactions.', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(34, '', 'TRRESIDENCY-0034', 'uploads/qr_codes/TRRESIDENCY-0034.png', '', 34, 'FLORES', 'ANA', 'ANTONIO', '57', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000034', 'RESIDENT0034@EXAMPLE.COM', '65', 'DR. NAVARRO ALLEY', '1968-09-29', 'SANTIAGO, ISABELA', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-18', 'Business Permit', 'Utility Bill', '', 'PENDING'),
(35, '', 'TRRESIDENCY-0035', 'uploads/qr_codes/TRRESIDENCY-0035.png', '', 35, 'SANTOS', 'JORDAN', 'GRACE', '39', 'FILIPINO', 'VENDOR', '09000000035', 'RESIDENT0035@EXAMPLE.COM', '71', 'DR. NAVARRO ALLEY', '1986-06-19', 'CABANATUAN CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-15', 'Business Permit', 'Valid ID', '', 'PENDING'),
(36, '', 'TRRESIDENCY-0036', 'uploads/qr_codes/TRRESIDENCY-0036.png', '', 36, 'MENDOZA', 'MARIA', 'SOFIA', '22', 'FILIPINO', 'VENDOR', '09000000036', 'RESIDENT0036@EXAMPLE.COM', '160', 'DR. NAVARRO ALLEY', '2004-03-08', 'CAUAYAN CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-12', 'School Requirement', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(37, '', 'TRRESIDENCY-0037', 'uploads/qr_codes/TRRESIDENCY-0037.png', '', 37, 'FLORES', 'JANINE', 'LUIS', '70', 'FILIPINO', 'OFFICE CLERK', '09000000037', 'RESIDENT0037@EXAMPLE.COM', '85', 'AMSING RD', '1955-11-28', 'SANTIAGO, ISABELA', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-14', 'Business Permit', 'Valid ID', '', 'PENDING'),
(38, '', 'TRRESIDENCY-0038', 'uploads/qr_codes/TRRESIDENCY-0038.png', '', 38, 'SANTOS', 'MARK', 'FERNANDO', '52', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000038', 'RESIDENT0038@EXAMPLE.COM', '196', 'INTERIOR LEDESMA STREET', '1973-08-17', 'CABANATUAN CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-12', 'Other important transactions.', 'Valid ID,Utility Bill', '', 'PENDING'),
(39, '', 'TRRESIDENCY-0039', 'uploads/qr_codes/TRRESIDENCY-0039.png', '', 39, 'MENDOZA', 'LUIGI', 'MIGUEL', '34', 'FILIPINO', 'FISHERFOLK', '09000000039', 'RESIDENT0039@EXAMPLE.COM', '226', 'T. BUGALLON', '1991-05-07', 'CAUAYAN CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-18', 'Business Permit', 'Valid ID', '', 'PENDING'),
(40, '', 'TRRESIDENCY-0040', 'uploads/qr_codes/TRRESIDENCY-0040.png', '', 40, 'VILLAR', 'LIZA', 'MARIE', '17', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000040', 'RESIDENT0040@EXAMPLE.COM', '40', 'LEDESMA STREET', '2009-01-24', 'SANTIAGO, ISABELA', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-09', 'Job/Employment', 'Homewowners\' Association Endorsement', '', 'PENDING'),
(41, '', 'TRRESIDENCY-0041', 'uploads/qr_codes/TRRESIDENCY-0041.png', '', 41, 'SANTOS', 'ROSE', 'ANDRES', '65', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000041', 'RESIDENT0041@EXAMPLE.COM', '20', 'AMSING RD', '1960-10-15', 'CABANATUAN CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-14', 'Job/Employment', 'Utility Bill', '', 'APPROVED'),
(42, '', 'TRRESIDENCY-0042', 'uploads/qr_codes/TRRESIDENCY-0042.png', '', 42, 'RAMOS', 'JOSE', 'ANTONIO', '47', 'FILIPINO', 'FISHERFOLK', '09000000042', 'RESIDENT0042@EXAMPLE.COM', '231', 'T. BUGALLON', '1978-07-05', 'CAUAYAN CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-18', 'School Requirement', 'Homewowners\' Association Endorsement', '', 'APPROVED'),
(43, '', 'TRRESIDENCY-0043', 'uploads/qr_codes/TRRESIDENCY-0043.png', '', 43, 'VILLAR', 'CARLO', 'ELIZABETH', '30', 'FILIPINO', 'STUDENT', '09000000043', 'RESIDENT0043@EXAMPLE.COM', '93', 'INTERIOR LEDESMA STREET', '1996-03-24', 'SANTIAGO, ISABELA', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-17', 'School Requirement', 'Valid ID', '', 'APPROVED'),
(44, '', 'TRRESIDENCY-0044', 'uploads/qr_codes/TRRESIDENCY-0044.png', '', 44, 'SANTOS', 'ROSE', 'CLARA', '12', 'FILIPINO', 'STUDENT', '09000000044', 'RESIDENT0044@EXAMPLE.COM', '21', 'INTERIOR LEDESMA STREET', '2013-12-12', 'CABANATUAN CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-14', 'Postal ID Application', 'Homewowners\' Association Endorsement', '', 'APPROVED'),
(45, '', 'TRRESIDENCY-0045', 'uploads/qr_codes/TRRESIDENCY-0045.png', '', 45, 'RAMOS', 'XIAN', 'LUIS', '60', 'FILIPINO', 'DRIVER', '09000000045', 'RESIDENT0045@EXAMPLE.COM', '76', 'LEDESMA STREET', '1965-09-02', 'CAUAYAN CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-17', 'Job/Employment', 'Valid ID,Utility Bill', '', 'APPROVED'),
(46, '', 'TRRESIDENCY-0046', 'uploads/qr_codes/TRRESIDENCY-0046.png', '', 46, 'VILLAR', 'PAULO', 'FERNANDO', '42', 'FILIPINO', 'FISHERFOLK', '09000000046', 'RESIDENT0046@EXAMPLE.COM', '68', 'T. BUGALLON', '1983-05-23', 'SANTIAGO, ISABELA', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-11', 'Business Permit', 'Cedula', '', 'APPROVED'),
(47, '', 'TRRESIDENCY-0047', 'uploads/qr_codes/TRRESIDENCY-0047.png', '', 47, 'REYES', 'JUANA', 'MIGUEL', '25', 'FILIPINO', 'FARMER', '09000000047', 'RESIDENT0047@EXAMPLE.COM', '111', 'LEDESMA STREET', '2001-02-09', 'CABANATUAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-16', 'Business Permit', 'Valid ID,Utility Bill', '', 'APPROVED'),
(48, '', 'TRRESIDENCY-0048', 'uploads/qr_codes/TRRESIDENCY-0048.png', '', 48, 'RAMOS', 'KAYE', 'GRACE', '73', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000048', 'RESIDENT0048@EXAMPLE.COM', '99', 'DR. NAVARRO ALLEY', '1952-10-31', 'CAUAYAN CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-18', 'School Requirement', 'Cedula', '', 'APPROVED'),
(49, '', 'TRRESIDENCY-0049', 'uploads/qr_codes/TRRESIDENCY-0049.png', '', 49, 'NAVARRO', 'BRUCE', 'ANDRES', '55', 'FILIPINO', 'VENDOR', '09000000049', 'RESIDENT0049@EXAMPLE.COM', '161', 'DR. NAVARRO ALLEY', '1970-07-21', 'SANTIAGO, ISABELA', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-13', 'Other important transactions.', 'Utility Bill', '', 'APPROVED'),
(50, '', 'TRRESIDENCY-0050', 'uploads/qr_codes/TRRESIDENCY-0050.png', '', 50, 'REYES', 'RAUL', 'ANTONIO', '38', 'FILIPINO', 'FARMER', '09000000050', 'RESIDENT0050@EXAMPLE.COM', '8', 'LEDESMA STREET', '1988-04-10', 'BAGUIO CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-16', 'Business Permit', 'Valid ID,Utility Bill', '', 'APPROVED'),
(51, '', 'TRRESIDENCY-0051', 'uploads/qr_codes/TRRESIDENCY-0051.png', '', 51, 'RAMOS', 'LIZA', 'ELIZABETH', '20', 'FILIPINO', 'TEACHER', '09000000051', 'RESIDENT0051@EXAMPLE.COM', '58', 'T. BUGALLON', '2005-12-29', 'QUEZON CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-10', 'Business Permit', 'Cedula', '', 'APPROVED'),
(52, '', 'TRRESIDENCY-0052', 'uploads/qr_codes/TRRESIDENCY-0052.png', '', 52, 'NAVARRO', 'MARK', 'CLARA', '68', 'FILIPINO', 'TEACHER', '09000000052', 'RESIDENT0052@EXAMPLE.COM', '15', 'AMSING RD', '1957-09-19', 'ILAGAN CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-12', 'Business Permit', 'Valid ID,Utility Bill', '', 'APPROVED'),
(53, '', 'TRRESIDENCY-0053', 'uploads/qr_codes/TRRESIDENCY-0053.png', '', 53, 'REYES', 'JOSE', 'MARIE', '50', 'FILIPINO', 'FARMER', '09000000053', 'RESIDENT0053@EXAMPLE.COM', '152', 'INTERIOR LEDESMA STREET', '1975-06-09', 'BAGUIO CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-05', 'Business Permit', 'Cedula', '', 'APPROVED'),
(54, '', 'TRRESIDENCY-0054', 'uploads/qr_codes/TRRESIDENCY-0054.png', '', 54, 'BAUTISTA', 'LIZA', 'FERNANDO', '33', 'FILIPINO', 'STUDENT', '09000000054', 'RESIDENT0054@EXAMPLE.COM', '212', 'INTERIOR LEDESMA STREET', '1993-02-26', 'QUEZON CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-10', 'Other important transactions.', 'Valid ID,Utility Bill', '', 'APPROVED'),
(55, '', 'TRRESIDENCY-0055', 'uploads/qr_codes/TRRESIDENCY-0055.png', '', 55, 'NAVARRO', 'ROSE', 'MIGUEL', '15', 'FILIPINO', 'STUDENT', '09000000055', 'RESIDENT0055@EXAMPLE.COM', '103', 'DR. NAVARRO ALLEY', '2010-11-16', 'ILAGAN CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-08', 'Business Permit', 'Valid ID,Utility Bill', '', 'APPROVED'),
(56, '', 'TRRESIDENCY-0056', 'uploads/qr_codes/TRRESIDENCY-0056.png', '', 56, 'REYES', 'LIAM', 'GRACE', '63', 'FILIPINO', 'FARMER', '09000000056', 'RESIDENT0056@EXAMPLE.COM', '131', 'INTERIOR LEDESMA STREET', '1962-08-07', 'BAGUIO CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-05', 'Postal ID Application', 'Cedula', '', 'READY FOR PICKUP'),
(57, '', 'TRRESIDENCY-0057', 'uploads/qr_codes/TRRESIDENCY-0057.png', '', 57, 'BAUTISTA', 'CARLA', 'SOFIA', '46', 'FILIPINO', 'FARMER', '09000000057', 'RESIDENT0057@EXAMPLE.COM', '92', 'DR. NAVARRO ALLEY', '1980-04-26', 'QUEZON CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-10', 'Other important transactions.', 'Valid ID', '', 'READY FOR PICKUP'),
(58, '', 'TRRESIDENCY-0058', 'uploads/qr_codes/TRRESIDENCY-0058.png', '', 58, 'NAVARRO', 'KATE', 'LUIS', '28', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000058', 'RESIDENT0058@EXAMPLE.COM', '70', 'LEDESMA STREET', '1998-01-14', 'ILAGAN CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-17', 'Postal ID Application', 'Valid ID,Utility Bill', '', 'READY FOR PICKUP'),
(59, '', 'TRRESIDENCY-0059', 'uploads/qr_codes/TRRESIDENCY-0059.png', '', 59, 'GARCIA', 'OLIVER', 'ELIZABETH', '10', 'FILIPINO', 'DRIVER', '09000000059', 'RESIDENT0059@EXAMPLE.COM', '72', 'DR. NAVARRO ALLEY', '2015-10-04', 'BAGUIO CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-14', 'Job/Employment', 'Valid ID', '', 'READY FOR PICKUP'),
(60, '', 'TRRESIDENCY-0060', 'uploads/qr_codes/TRRESIDENCY-0060.png', '', 60, 'BAUTISTA', 'ELIJAH', 'CLARA', '58', 'FILIPINO', 'FARMER', '09000000060', 'RESIDENT0060@EXAMPLE.COM', '149', 'AMSING RD', '1967-06-25', 'QUEZON CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-08', 'Job/Employment', 'Utility Bill', '', 'READY FOR PICKUP'),
(61, '', 'TRRESIDENCY-0061', 'uploads/qr_codes/TRRESIDENCY-0061.png', '', 61, 'CRUZ', 'MARIA', 'MARIE', '41', 'FILIPINO', 'SECURITY GUARD', '09000000061', 'RESIDENT0061@EXAMPLE.COM', '31', 'AMSING RD', '1985-03-14', 'ILAGAN CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-14', 'School Requirement', 'Valid ID', '', 'READY FOR PICKUP'),
(62, '', 'TRRESIDENCY-0062', 'uploads/qr_codes/TRRESIDENCY-0062.png', '', 62, 'GARCIA', 'SABRINA', 'ANDRES', '23', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000062', 'RESIDENT0062@EXAMPLE.COM', '204', 'T. BUGALLON', '2002-12-02', 'BAGUIO CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-12', 'Postal ID Application', 'Homewowners\' Association Endorsement', '', 'READY FOR PICKUP'),
(63, '', 'TRRESIDENCY-0063', 'uploads/qr_codes/TRRESIDENCY-0063.png', '', 63, 'BAUTISTA', 'MARK', 'MIGUEL', '71', 'FILIPINO', 'DRIVER', '09000000063', 'RESIDENT0063@EXAMPLE.COM', '178', 'DR. NAVARRO ALLEY', '1954-08-23', 'QUEZON CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-12', 'Job/Employment', 'Utility Bill', '', 'READY FOR PICKUP'),
(64, '', 'TRRESIDENCY-0064', 'uploads/qr_codes/TRRESIDENCY-0064.png', '', 64, 'CRUZ', 'MARIA', 'GRACE', '53', 'FILIPINO', 'STUDENT', '09000000064', 'RESIDENT0064@EXAMPLE.COM', '28', 'INTERIOR LEDESMA STREET', '1972-05-12', 'ILAGAN CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-16', 'Business Permit', 'Valid ID,Utility Bill', '', 'READY FOR PICKUP'),
(65, '', 'TRRESIDENCY-0065', 'uploads/qr_codes/TRRESIDENCY-0065.png', '', 65, 'GARCIA', 'LIZA', 'SOFIA', '36', 'FILIPINO', 'OFFICE CLERK', '09000000065', 'RESIDENT0065@EXAMPLE.COM', '107', 'DR. NAVARRO ALLEY', '1990-01-30', 'BAGUIO CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-14', 'School Requirement', 'Valid ID,Utility Bill', '', 'READY FOR PICKUP'),
(66, '', 'TRRESIDENCY-0066', 'uploads/qr_codes/TRRESIDENCY-0066.png', '', 66, 'FLORES', 'JACK', 'LUIS', '18', 'FILIPINO', 'VENDOR', '09000000066', 'RESIDENT0066@EXAMPLE.COM', '199', 'DR. NAVARRO ALLEY', '2007-10-20', 'QUEZON CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-07', 'Other important transactions.', 'Valid ID', '', 'READY FOR PICKUP'),
(67, '', 'TRRESIDENCY-0067', 'uploads/qr_codes/TRRESIDENCY-0067.png', '', 67, 'CRUZ', 'JOSE', 'FERNANDO', '66', 'FILIPINO', 'DRIVER', '09000000067', 'RESIDENT0067@EXAMPLE.COM', '173', 'LEDESMA STREET', '1959-07-11', 'CAUAYAN CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-13', 'Business Permit', 'Homewowners\' Association Endorsement', '', 'READY FOR PICKUP'),
(68, '', 'TRRESIDENCY-0068', 'uploads/qr_codes/TRRESIDENCY-0068.png', '', 68, 'GARCIA', 'AUBREY', 'CLARA', '49', 'FILIPINO', 'TEACHER', '09000000068', 'RESIDENT0068@EXAMPLE.COM', '20', 'T. BUGALLON', '1977-03-30', 'SANTIAGO, ISABELA', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-11', 'Postal ID Application', 'Homewowners\' Association Endorsement', '', 'READY FOR PICKUP'),
(69, '', 'TRRESIDENCY-0069', 'uploads/qr_codes/TRRESIDENCY-0069.png', '', 69, 'FLORES', 'ROSE', 'MARIE', '31', 'FILIPINO', 'UNEMPLOYED', '09000000069', 'RESIDENT0069@EXAMPLE.COM', '79', 'AMSING RD', '1994-12-18', 'CABANATUAN CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-11', 'Other important transactions.', 'Cedula', '', 'READY FOR PICKUP'),
(70, '', 'TRRESIDENCY-0070', 'uploads/qr_codes/TRRESIDENCY-0070.png', '', 70, 'CRUZ', 'SAMUEL', 'ANDRES', '13', 'FILIPINO', 'FARMER', '09000000070', 'RESIDENT0070@EXAMPLE.COM', '86', 'INTERIOR LEDESMA STREET', '2012-09-06', 'CAUAYAN CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-08', 'Other important transactions.', 'Valid ID', '', 'READY FOR PICKUP'),
(71, '', 'TRRESIDENCY-0071', 'uploads/qr_codes/TRRESIDENCY-0071.png', '', 71, 'MENDOZA', 'JANE', 'ANTONIO', '61', 'FILIPINO', 'OFFICE CLERK', '09000000071', 'RESIDENT0071@EXAMPLE.COM', '191', 'T. BUGALLON', '1964-05-29', 'SANTIAGO, ISABELA', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-09', 'Other important transactions.', 'Valid ID,Utility Bill', '', 'CLAIMED'),
(72, '', 'TRRESIDENCY-0072', 'uploads/qr_codes/TRRESIDENCY-0072.png', '', 72, 'FLORES', 'MARITONI', 'GRACE', '44', 'FILIPINO', 'FARMER', '09000000072', 'RESIDENT0072@EXAMPLE.COM', '198', 'DR. NAVARRO ALLEY', '1982-02-16', 'CABANATUAN CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-05', 'Job/Employment', 'Cedula', '', 'CLAIMED'),
(73, '', 'TRRESIDENCY-0073', 'uploads/qr_codes/TRRESIDENCY-0073.png', '', 73, 'SANTOS', 'PAOLO', 'SOFIA', '26', 'FILIPINO', 'TEACHER', '09000000073', 'RESIDENT0073@EXAMPLE.COM', '165', 'LEDESMA STREET', '1999-11-06', 'CAUAYAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-16', 'Business Permit', 'Homewowners\' Association Endorsement', '', 'CLAIMED'),
(74, '', 'TRRESIDENCY-0074', 'uploads/qr_codes/TRRESIDENCY-0074.png', '', 74, 'MENDOZA', 'ETHAN', 'LUIS', '74', 'FILIPINO', 'DRIVER', '09000000074', 'RESIDENT0074@EXAMPLE.COM', '232', 'AMSING RD', '1951-07-28', 'SANTIAGO, ISABELA', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-18', 'Business Permit', 'Cedula', '', 'CLAIMED'),
(75, '', 'TRRESIDENCY-0075', 'uploads/qr_codes/TRRESIDENCY-0075.png', '', 75, 'FLORES', 'MARIA', 'FERNANDO', '57', 'FILIPINO', 'STUDENT', '09000000075', 'RESIDENT0075@EXAMPLE.COM', '164', 'INTERIOR LEDESMA STREET', '1969-04-16', 'CABANATUAN CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-16', 'School Requirement', 'Valid ID,Utility Bill', '', 'CLAIMED'),
(76, '', 'TRRESIDENCY-0076', 'uploads/qr_codes/TRRESIDENCY-0076.png', '', 76, 'SANTOS', 'LIZA', 'MIGUEL', '39', 'FILIPINO', 'TEACHER', '09000000076', 'RESIDENT0076@EXAMPLE.COM', '123', 'DR. NAVARRO ALLEY', '1987-01-04', 'CAUAYAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-09', 'Business Permit', 'Utility Bill', '', 'CLAIMED'),
(77, '', 'TRRESIDENCY-0077', 'uploads/qr_codes/TRRESIDENCY-0077.png', '', 77, 'MENDOZA', 'LUIS', 'MARIE', '21', 'FILIPINO', 'SECURITY GUARD', '09000000077', 'RESIDENT0077@EXAMPLE.COM', '123', 'T. BUGALLON', '2004-09-23', 'SANTIAGO, ISABELA', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-06', 'Other important transactions.', 'Valid ID', 'uploads/1778161674_1777967151_UMID_EMV_sample.jpg', 'CLAIMED'),
(78, '', 'TRRESIDENCY-0078', 'uploads/qr_codes/TRRESIDENCY-0078.png', '', 78, 'VILLAR', 'JOSEPHINE', 'ANDRES', '69', 'FILIPINO', 'FARMER', '09000000078', 'RESIDENT0078@EXAMPLE.COM', '245', 'DR. NAVARRO ALLEY', '1956-06-14', 'CABANATUAN CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-07', 'Postal ID Application', 'Utility Bill', 'uploads/1778161674_1777967151_UMID_EMV_sample.jpg', 'CLAIMED'),
(79, '', 'TRRESIDENCY-0079', 'uploads/qr_codes/TRRESIDENCY-0079.png', '', 79, 'SANTOS', 'LIZA', 'ANTONIO', '52', 'FILIPINO', 'FISHERFOLK', '09000000079', 'RESIDENT0079@EXAMPLE.COM', '104', 'DR. NAVARRO ALLEY', '1974-03-04', 'CAUAYAN CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-08', 'Postal ID Application', 'Homewowners\' Association Endorsement', 'uploads/1778161674_1777967151_UMID_EMV_sample.jpg', 'CLAIMED'),
(80, '', 'TRRESIDENCY-0080', 'uploads/qr_codes/TRRESIDENCY-0080.png', '', 80, 'MENDOZA', 'ARTHUR', 'ELIZABETH', '34', 'FILIPINO', 'STUDENT', '09000000080', 'RESIDENT0080@EXAMPLE.COM', '36', 'AMSING RD', '1991-11-22', 'SANTIAGO, ISABELA', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-08', 'Other important transactions.', 'Utility Bill', 'uploads/1778161674_1777967151_UMID_EMV_sample.jpg', 'CLAIMED'),
(81, '', 'TRRESIDENCY-0081', 'uploads/qr_codes/TRRESIDENCY-0081.png', '', 81, 'VILLAR', 'ALEXANDER', 'CLARA', '16', 'FILIPINO', 'SECURITY GUARD', '09000000081', 'RESIDENT0081@EXAMPLE.COM', '117', 'DR. NAVARRO ALLEY', '2009-08-11', 'CABANATUAN CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-05', 'Other important transactions.', 'Homewowners\' Association Endorsement', 'uploads/1778161674_1777967151_UMID_EMV_sample.jpg', 'CLAIMED'),
(82, '', 'TRRESIDENCY-0082', 'uploads/qr_codes/TRRESIDENCY-0082.png', '', 82, 'SANTOS', 'CHRISTINA', 'LUIS', '65', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000082', 'RESIDENT0082@EXAMPLE.COM', '227', 'INTERIOR LEDESMA STREET', '1961-05-02', 'CAUAYAN CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-10', 'School Requirement', 'Homewowners\' Association Endorsement', 'uploads/1778161674_1777967151_UMID_EMV_sample.jpg', 'CLAIMED'),
(83, '', 'TRRESIDENCY-0083', 'uploads/qr_codes/TRRESIDENCY-0083.png', '', 83, 'RAMOS', 'MERIDITH', 'FERNANDO', '47', 'FILIPINO', 'VENDOR', '09000000083', 'RESIDENT0083@EXAMPLE.COM', '35', 'DR. NAVARRO ALLEY', '1979-01-20', 'ILAGAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-16', 'Other important transactions.', 'Utility Bill', 'uploads/1778161674_1777967151_UMID_EMV_sample.jpg', 'CLAIMED'),
(84, '', 'TRRESIDENCY-0084', 'uploads/qr_codes/TRRESIDENCY-0084.png', '', 84, 'VILLAR', 'WILLIAM', 'MIGUEL', '29', 'FILIPINO', 'FARMER', '09000000084', 'RESIDENT0084@EXAMPLE.COM', '241', 'INTERIOR LEDESMA STREET', '1996-10-09', 'BAGUIO CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-06', 'Other important transactions.', 'Valid ID', 'uploads/1778161674_1777967151_UMID_EMV_sample.jpg', 'CLAIMED'),
(85, '', 'TRRESIDENCY-0085', 'uploads/qr_codes/TRRESIDENCY-0085.png', '', 85, 'REYES', 'JANE', 'GRACE', '11', 'FILIPINO', 'FISHERFOLK', '09000000085', 'RESIDENT0085@EXAMPLE.COM', '99', 'INTERIOR LEDESMA STREET', '2014-06-29', 'QUEZON CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-13', 'Other important transactions.', 'Valid ID', 'uploads/1778161674_1777967151_UMID_EMV_sample.jpg', 'CLAIMED'),
(86, '', 'TRRESIDENCY-0086', 'uploads/qr_codes/TRRESIDENCY-0086.png', '', 86, 'RAMOS', 'MARIA', 'ANDRES', '60', 'FILIPINO', 'FARMER', '09000000086', 'RESIDENT0086@EXAMPLE.COM', '24', 'INTERIOR LEDESMA STREET', '1966-03-20', 'ILAGAN CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-15', 'Job/Employment', 'Valid ID,Utility Bill', NULL, 'DELETED'),
(87, '', 'TRRESIDENCY-0087', 'uploads/qr_codes/TRRESIDENCY-0087.png', '', 87, 'VILLAR', 'HARRY', 'ANTONIO', '42', 'FILIPINO', 'OFFICE CLERK', '09000000087', 'RESIDENT0087@EXAMPLE.COM', '73', 'AMSING RD', '1983-12-08', 'BAGUIO CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-18', 'Job/Employment', 'Valid ID,Utility Bill', '', 'DELETED'),
(88, '', 'TRRESIDENCY-0088', 'uploads/qr_codes/TRRESIDENCY-0088.png', '', 88, 'REYES', 'MAVERICK', 'ELIZABETH', '24', 'FILIPINO', 'FARMER', '09000000088', 'RESIDENT0088@EXAMPLE.COM', '42', 'INTERIOR LEDESMA STREET', '2001-08-27', 'QUEZON CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-13', 'School Requirement', 'Homewowners\' Association Endorsement', '', 'DELETED'),
(89, '', 'TRRESIDENCY-0089', 'uploads/qr_codes/TRRESIDENCY-0089.png', '', 89, 'RAMOS', 'MARIA', 'CLARA', '72', 'FILIPINO', 'DRIVER', '09000000089', 'RESIDENT0089@EXAMPLE.COM', '241', 'INTERIOR LEDESMA STREET', '1953-05-18', 'ILAGAN CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-17', 'Other important transactions.', 'Cedula', '', 'DELETED'),
(90, '', 'TRRESIDENCY-0090', 'uploads/qr_codes/TRRESIDENCY-0090.png', '', 90, 'NAVARRO', 'LIZA', 'MARIE', '55', 'FILIPINO', 'DRIVER', '09000000090', 'RESIDENT0090@EXAMPLE.COM', '76', 'INTERIOR LEDESMA STREET', '1971-02-05', 'BAGUIO CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-15', 'Postal ID Application', 'Cedula', '', 'DELETED'),
(91, '', 'TRRESIDENCY-0091', 'uploads/qr_codes/TRRESIDENCY-0091.png', '', 91, 'REYES', 'ADRIAN', 'FERNANDO', '37', 'FILIPINO', 'TEACHER', '09000000091', 'RESIDENT0091@EXAMPLE.COM', '157', 'T. BUGALLON', '1988-10-26', 'QUEZON CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-07', 'Job/Employment', 'Homewowners\' Association Endorsement', '', 'DELETED'),
(92, '', 'TRRESIDENCY-0092', 'uploads/qr_codes/TRRESIDENCY-0092.png', '', 92, 'RAMOS', 'JOSEFA', 'MIGUEL', '19', 'FILIPINO', 'FISHERFOLK', '09000000092', 'RESIDENT0092@EXAMPLE.COM', '57', 'LEDESMA STREET', '2006-07-16', 'ILAGAN CITY', 'MARRIED', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-18', 'Job/Employment', 'Valid ID', '', 'DELETED'),
(93, '', 'TRRESIDENCY-0093', 'uploads/qr_codes/TRRESIDENCY-0093.png', '', 93, 'NAVARRO', 'ALEXA', 'GRACE', '68', 'FILIPINO', 'VENDOR', '09000000093', 'RESIDENT0093@EXAMPLE.COM', '63', 'LEDESMA STREET', '1958-04-06', 'BAGUIO CITY', 'DIVORCED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-13', 'Business Permit', 'Valid ID', '', 'DELETED'),
(94, '', 'TRRESIDENCY-0094', 'uploads/qr_codes/TRRESIDENCY-0094.png', '', 94, 'REYES', 'ENZO', 'SOFIA', '50', 'FILIPINO', 'FISHERFOLK', '09000000094', 'RESIDENT0094@EXAMPLE.COM', '143', 'T. BUGALLON', '1975-12-25', 'QUEZON CITY', 'IN A RELATIONSHIP', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-17', 'School Requirement', 'Utility Bill', '', 'DELETED'),
(95, '', 'TRRESIDENCY-0095', 'uploads/qr_codes/TRRESIDENCY-0095.png', '', 95, 'BAUTISTA', 'KAYDEN', 'ANTONIO', '32', 'FILIPINO', 'TEACHER', '09000000095', 'RESIDENT0095@EXAMPLE.COM', '27', 'INTERIOR LEDESMA STREET', '1993-09-13', 'ILAGAN CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-14', 'Postal ID Application', 'Valid ID', '', 'DELETED'),
(96, '', 'TRRESIDENCY-0096', 'uploads/qr_codes/TRRESIDENCY-0096.png', '', 96, 'NAVARRO', 'JANE', 'ELIZABETH', '14', 'FILIPINO', 'FARMER', '09000000096', 'RESIDENT0096@EXAMPLE.COM', '206', 'T. BUGALLON', '2011-06-03', 'BAGUIO CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-12', 'School Requirement', 'Cedula', '', 'DELETED'),
(97, '', 'TRRESIDENCY-0097', 'uploads/qr_codes/TRRESIDENCY-0097.png', '', 97, 'GARCIA', 'JENNA', 'CLARA', '63', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000097', 'RESIDENT0097@EXAMPLE.COM', '196', 'DR. NAVARRO ALLEY', '1963-02-22', 'QUEZON CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-08', 'Postal ID Application', 'Homewowners\' Association Endorsement', '', 'DELETED'),
(98, '', 'TRRESIDENCY-0098', 'uploads/qr_codes/TRRESIDENCY-0098.png', '', 98, 'BAUTISTA', 'FELIX', 'MARIE', '45', 'FILIPINO', 'CONSTRUCTION WORKER', '09000000098', 'RESIDENT0098@EXAMPLE.COM', '114', 'T. BUGALLON', '1980-11-11', 'ILAGAN CITY', 'SINGLE', 'EAST MODERNSITE', 'BAGUIO CITY', '6 months to 1 year', '2026-05-10', 'Job/Employment', 'Valid ID,Utility Bill', '', 'DELETED'),
(99, '', 'TRRESIDENCY-0099', 'uploads/qr_codes/TRRESIDENCY-0099.png', '', 99, 'NAVARRO', 'JOY', 'ANDRES', '27', 'FILIPINO', 'FARMER', '09000000099', 'RESIDENT0099@EXAMPLE.COM', '231', 'DR. NAVARRO ALLEY', '1998-08-01', 'BAGUIO CITY', 'WIDOWED', 'EAST MODERNSITE', 'BAGUIO CITY', '1-5 years', '2026-05-13', 'Business Permit', 'Valid ID,Utility Bill', '', 'DELETED'),
(100, '', 'TRRESIDENCY-0100', 'uploads/qr_codes/TRRESIDENCY-0100.png', '', 100, 'GARCIA', 'MARIA', 'MIGUEL', '76', 'FILIPINO', 'VENDOR', '09000000100', 'RESIDENT0100@EXAMPLE.COM', '63', 'DR. NAVARRO ALLEY', '1950-04-22', 'CABANATUAN CITY', 'LIVE-IN', 'EAST MODERNSITE', 'BAGUIO CITY', 'Less than 6 months', '2026-05-09', 'Other important transactions.', 'Valid ID', '', 'DELETED'),
(134, '', 'TRRESIDENCY-0101', 'uploads/qr_codes/TRRESIDENCY-0101.png', '', 125, 'QUIPSE', 'MARIA CLAVERIA', 'LUMANOG', '', 'FILIPINO', 'STUDENT', '09701726401', 'genesisizzoparson@gmail.com', '142', 'DR NAVARRO ALLEY', '2000-10-22', 'SOLANO, NUEVA VIZCAYA', 'In a relationship', 'EAST MODERN SITE', 'BAGUIO CITY', 'More than 5 years', '2026-05-15', 'School Requirement', 'Valid ID', 'uploads/1778820458_NATIONAL ID.jpg', 'READY FOR PICKUP');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_resident`
--

CREATE TABLE `tbl_resident` (
  `id_resident` int(11) NOT NULL,
  `rejected_reason` varchar(128) DEFAULT '',
  `is_walk_in` int(1) DEFAULT 0,
  `qr_code` varchar(255) DEFAULT '',
  `valid1` varchar(128) DEFAULT '',
  `valid2` varchar(128) DEFAULT '',
  `control_no` varchar(128) DEFAULT '',
  `request_status` varchar(50) NOT NULL DEFAULT 'Pending',
  `res_photo` mediumblob DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mi` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `houseno` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `brgy` varchar(255) DEFAULT NULL,
  `municipal` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `bdate` date NOT NULL,
  `bplace` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `family_role` varchar(255) DEFAULT NULL,
  `head_of_family` varchar(10) NOT NULL DEFAULT 'No',
  `voter` varchar(255) DEFAULT NULL,
  `pwd` varchar(10) DEFAULT NULL,
  `indigent` varchar(255) DEFAULT NULL,
  `single_parent` varchar(255) DEFAULT NULL,
  `malnourished` varchar(255) DEFAULT NULL,
  `four_ps` varchar(255) DEFAULT NULL,
  `vaccinated` varchar(255) DEFAULT NULL,
  `pregnancy` varchar(255) DEFAULT NULL,
  `domesticated_animals` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `ip_community` varchar(255) DEFAULT NULL,
  `out_of_school_youth` enum('Yes','No') DEFAULT NULL,
  `lgbtq` enum('Yes','No') DEFAULT NULL,
  `senior_citizen` varchar(50) DEFAULT NULL,
  `psa_registered` varchar(255) DEFAULT NULL,
  `addedby` varchar(255) DEFAULT NULL,
  `s_of_income` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `psa_holder` varchar(255) DEFAULT NULL,
  `psa_correction` varchar(255) DEFAULT NULL,
  `ntnlId` varchar(255) DEFAULT NULL,
  `trees` varchar(255) DEFAULT NULL,
  `farmer` varchar(255) DEFAULT NULL,
  `vegetables` varchar(255) DEFAULT NULL,
  `id1` varchar(255) DEFAULT NULL,
  `id2` varchar(255) DEFAULT NULL,
  `status2` enum('PENDING','APPROVED','REJECTED','READY FOR PICKUP','CLAIMED','DELETED') DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_resident`
--

INSERT INTO `tbl_resident` (`id_resident`, `rejected_reason`, `is_walk_in`, `qr_code`, `valid1`, `valid2`, `control_no`, `request_status`, `res_photo`, `email`, `password`, `lname`, `fname`, `mi`, `age`, `sex`, `status`, `houseno`, `street`, `brgy`, `municipal`, `address`, `contact`, `bdate`, `bplace`, `nationality`, `family_role`, `head_of_family`, `voter`, `pwd`, `indigent`, `single_parent`, `malnourished`, `four_ps`, `vaccinated`, `pregnancy`, `domesticated_animals`, `role`, `ip_community`, `out_of_school_youth`, `lgbtq`, `senior_citizen`, `psa_registered`, `addedby`, `s_of_income`, `occupation`, `psa_holder`, `psa_correction`, `ntnlId`, `trees`, `farmer`, `vegetables`, `id1`, `id2`, `status2`) VALUES
(1, '', 0, '', '', '', 'CN-0001', 'APPROVED', NULL, 'RESIDENT0001@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'MARK', 'FERNANDO', 48, 'MALE', 'WIDOWED', '34', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '34 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09940936664', '1977-12-18', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'IBALOI', 'No', 'No', 'NO', NULL, 'ADMIN', '33621', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'School ID', 'PENDING'),
(2, '', 0, '', '', '', 'CN-0002', 'APPROVED', NULL, 'RESIDENT0002@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'MICHELLE', 'MIGUEL', 30, 'FEMALE', 'LIVE-IN', '122', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '122 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09629957089', '1995-09-07', 'CAUAYAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'MAGUINDANAON', 'No', 'Yes', 'NO', NULL, 'ADMIN', '11496', 'HOUSEWIFE/HOUSEHUSBAND', NULL, NULL, NULL, NULL, NULL, NULL, 'School ID', 'PRC ID', 'APPROVED'),
(3, '', 0, '', '', '', 'CN-0003', 'APPROVED', NULL, 'RESIDENT0003@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'JOSE', 'MARIE', 12, 'MALE', 'SINGLE', '7', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '7 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09226975479', '2013-05-27', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'KAPAMPANGAN', 'No', 'No', 'NO', NULL, 'ADMIN', '1733', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Pag-IBIG ID', 'Postal ID', 'PENDING'),
(4, '', 0, '', '', '', 'CN-0004', 'APPROVED', NULL, 'RESIDENT0004@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'LORENZO', 'ANDRES', 61, 'MALE', 'WIDOWED', '169', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '169 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09945006157', '1965-02-15', 'CABANATUAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'BICOLANO', 'No', 'Yes', 'YES', NULL, 'ADMIN', '236', 'UNEMPLOYED', NULL, NULL, NULL, NULL, NULL, NULL, 'Voter’s ID / Voter’s Certification', 'PhilSys ID (National ID)', 'PENDING'),
(5, '', 0, '', '', '', 'CN-0005', 'APPROVED', NULL, 'RESIDENT0005@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'ROSE', 'ANTONIO', 43, 'FEMALE', 'LIVE-IN', '75', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '75 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09344104378', '1982-11-05', 'CAUAYAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'CEBUANO', 'No', 'No', 'NO', NULL, 'ADMIN', '12165', 'RETIRED', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS ID', 'Driver’s License', 'PENDING'),
(6, '', 0, '', '', '', 'CN-0006', 'APPROVED', NULL, 'RESIDENT0006@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'ANA', 'ELIZABETH', 25, 'FEMALE', 'IN A RELATIONSHIP', '116', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '116 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09585503445', '2000-07-25', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'RESIDENT', 'KAPAMPANGAN', 'No', 'Yes', 'NO', NULL, 'ADMIN', '18477', 'FREELANCER', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'Passport', 'PENDING'),
(7, '', 0, '', '', '', 'CN-0007', 'APPROVED', NULL, 'RESIDENT0007@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'CARLO', 'CLARA', 74, 'MALE', 'MARRIED', '104', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '104 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09895204119', '1952-04-15', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'WARAY', 'No', 'No', 'YES', NULL, 'ADMIN', '25395', 'TEACHER', NULL, NULL, NULL, NULL, NULL, NULL, 'Pag-IBIG ID', 'PRC ID', 'PENDING'),
(8, '', 0, '', '', '', 'CN-0008', 'APPROVED', NULL, 'RESIDENT0008@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'JUAN', 'LUIS', 56, 'MALE', 'DIVORCED', '171', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '171 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09819510292', '1970-01-03', 'CAUAYAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'MARANAO', 'No', 'Yes', 'NO', NULL, 'ADMIN', '1189', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'PRC ID', 'PhilHealth ID', 'PENDING'),
(9, '', 0, '', '', '', 'CN-0009', 'APPROVED', NULL, 'RESIDENT0009@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'ANA', 'FERNANDO', 38, 'FEMALE', 'IN A RELATIONSHIP', '45', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '45 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09411939133', '1987-09-24', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'TAGALOG', 'No', 'No', 'NO', NULL, 'ADMIN', '16512', 'SECURITY GUARD', NULL, NULL, NULL, NULL, NULL, NULL, 'Driver’s License', 'Voter’s ID / Voter’s Certification', 'PENDING'),
(10, '', 0, '', '', '', 'CN-0010', 'APPROVED', NULL, 'RESIDENT0010@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'JOHN', 'MIGUEL', 20, 'MALE', 'MARRIED', '209', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '209 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09401164817', '2005-06-13', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'BICOLANO', 'Yes', 'Yes', 'NO', NULL, 'ADMIN', '1815', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'PhilHealth ID', 'PENDING'),
(11, '', 0, '', '', '', 'CN-0011', 'APPROVED', NULL, 'RESIDENT0011@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'MARIO', 'GARCIA', 69, 'MALE', 'DIVORCED', '163', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '163 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09670006714', '1957-03-04', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'KAPAMPANGAN', 'No', 'No', 'YES', NULL, 'ADMIN', '14320', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS ID', 'Voter’s ID / Voter’s Certification', 'PENDING'),
(12, '', 0, '', '', '', 'CN-0012', 'APPROVED', NULL, 'RESIDENT0012@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'PAULA', 'ANDRES', 51, 'FEMALE', 'LIVE-IN', '184', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '184 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09246539147', '1974-11-22', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'MAGUINDANAON', 'No', 'Yes', 'NO', NULL, 'ADMIN', '15288', 'DRIVER', NULL, NULL, NULL, NULL, NULL, NULL, 'Voter’s ID / Voter’s Certification', 'PRC ID', 'PENDING'),
(13, '', 0, '', '', '', 'CN-0013', 'APPROVED', NULL, 'RESIDENT0013@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'MARCELLINE', 'ANTONIO', 33, 'FEMALE', 'SINGLE', '180', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '180 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09922675621', '1992-08-11', 'CABANATUAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'IBALOI', 'No', 'No', 'NO', NULL, 'ADMIN', '8481', 'RETIRED', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilSys ID (National ID)', 'PhilHealth ID', 'PENDING'),
(14, '', 0, '', '', '', 'CN-0014', 'APPROVED', NULL, 'RESIDENT0014@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'MIKE', 'ELIZABETH', 16, 'MALE', 'WIDOWED', '99', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '99 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09173760695', '2010-05-01', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'MAGUINDANAON', 'Yes', 'Yes', 'NO', NULL, 'ADMIN', '23850', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS ID', 'Driver’s License', 'APPROVED'),
(15, '', 0, '', '', '', 'CN-0015', 'APPROVED', NULL, 'RESIDENT0015@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'DAVID', 'CLARA', 64, 'MALE', 'LIVE-IN', '206', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '206 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09700776636', '1962-01-20', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'WARAY', 'No', 'No', 'YES', NULL, 'ADMIN', '17257', 'SECURITY GUARD', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'PhilSys ID (National ID)', 'PENDING'),
(16, '', 0, '', '', '', 'CN-0016', 'APPROVED', NULL, 'RESIDENT0016@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'ROSE', 'MARIE', 46, 'FEMALE', 'SINGLE', '231', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '231 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09182601126', '1979-10-10', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'TAGALOG', 'No', 'Yes', 'NO', NULL, 'ADMIN', '6667', 'RETIRED', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'PhilHealth ID', 'PENDING'),
(17, '', 0, '', '', '', 'CN-0017', 'APPROVED', NULL, 'RESIDENT0017@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'JOSE', 'FERNANDO', 28, 'MALE', 'WIDOWED', '37', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '37 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09510675751', '1997-06-29', 'QUEZON CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'TAUSUG', 'No', 'No', 'NO', NULL, 'ADMIN', '15877', 'FREELANCER', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'UMID', 'PENDING'),
(18, '', 0, '', '', '', 'CN-0018', 'APPROVED', NULL, 'RESIDENT0018@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'CARLO', 'MIGUEL', 11, 'MALE', 'DIVORCED', '240', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '240 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09105575405', '2015-03-19', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'TAUSUG', 'No', 'Yes', 'NO', NULL, 'ADMIN', '1673', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'School ID', 'SSS ID', 'PENDING'),
(19, '', 0, '', '', '', 'CN-0019', 'APPROVED', NULL, 'RESIDENT0019@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'ROSE', 'GRACE', 59, 'FEMALE', 'IN A RELATIONSHIP', '90', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '90 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09695849799', '1966-12-08', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'BICOLANO', 'No', 'No', 'NO', NULL, 'ADMIN', '1912', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Pag-IBIG ID', 'PhilSys ID (National ID)', 'PENDING'),
(20, '', 0, '', '', '', 'CN-0020', 'APPROVED', NULL, 'RESIDENT0020@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'ANA', 'SOFIA', 41, 'FEMALE', 'MARRIED', '231', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '231 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09362522812', '1984-08-27', 'QUEZON CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'WARAY', 'No', 'Yes', 'NO', NULL, 'ADMIN', '13604', 'DRIVER', NULL, NULL, NULL, NULL, NULL, NULL, 'Postal ID', 'PRC ID', 'PENDING'),
(21, '', 0, '', '', '', 'CN-0021', 'APPROVED', NULL, 'RESIDENT0021@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'JORGE', 'LUIS', 23, 'MALE', 'DIVORCED', '132', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '132 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09525064689', '2002-05-17', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'BICOLANO', 'No', 'No', 'NO', NULL, 'ADMIN', '44454', 'BPO AGENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'Voter’s ID / Voter’s Certification', 'PENDING'),
(22, '', 0, '', '', '', 'CN-0022', 'APPROVED', NULL, 'RESIDENT0022@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'JUAN', 'ELIZABETH', 72, 'MALE', 'IN A RELATIONSHIP', '216', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '216 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09537755039', '1954-02-05', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'WARAY', 'No', 'Yes', 'YES', NULL, 'ADMIN', '1714', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Driver’s License', 'PhilSys ID (National ID)', 'PENDING'),
(23, '', 0, '', '', '', 'CN-0023', 'APPROVED', NULL, 'RESIDENT0023@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'BRACIA', 'CLARA', 54, 'FEMALE', 'MARRIED', '185', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '185 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09113581156', '1971-10-26', 'QUEZON CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'IBALOI', 'No', 'No', 'NO', NULL, 'ADMIN', '11126', 'DRIVER', NULL, NULL, NULL, NULL, NULL, NULL, 'School ID', 'Pag-IBIG ID', 'PENDING'),
(24, '', 0, '', '', '', 'CN-0024', 'APPROVED', NULL, 'RESIDENT0024@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'JAKE', 'MARIE', 36, 'MALE', 'WIDOWED', '27', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '27 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09654640690', '1989-07-15', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'TAUSUG', 'No', 'Yes', 'NO', NULL, 'ADMIN', '23369', 'BPO AGENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Postal ID', 'Driver’s License', 'PENDING'),
(25, '', 0, '', '', '', 'CN-0025', 'APPROVED', NULL, 'RESIDENT0025@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'XERXES', 'ANDRES', 19, 'MALE', 'LIVE-IN', '80', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '80 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09132460014', '2007-04-04', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'ILOCANO', 'No', 'No', 'NO', NULL, 'ADMIN', '1004', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'Company ID', 'PENDING'),
(26, '', 0, '', '', '', 'CN-0026', 'APPROVED', NULL, 'RESIDENT0026@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'LIZA', 'MIGUEL', 67, 'FEMALE', 'SINGLE', '67', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '67 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09398378026', '1958-12-24', 'QUEZON CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'ILOCANO', 'No', 'Yes', 'YES', NULL, 'ADMIN', '12759', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS ID', 'SSS ID', 'PENDING'),
(27, '', 0, '', '', '', 'CN-0027', 'APPROVED', NULL, 'RESIDENT0027@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'MARCY', 'GRACE', 49, 'FEMALE', 'WIDOWED', '96', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '96 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09594510118', '1976-09-12', 'ILAGAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'CHAVACANO', 'No', 'No', 'NO', NULL, 'ADMIN', '13713', 'SECURITY GUARD', NULL, NULL, NULL, NULL, NULL, NULL, 'Driver’s License', 'UMID', 'PENDING'),
(28, '', 0, '', '', '', 'CN-0028', 'APPROVED', NULL, 'RESIDENT0028@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'JOSE', 'SOFIA', 31, 'MALE', 'LIVE-IN', '29', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '29 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09777416541', '1994-06-02', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'HILIGAYNON', 'No', 'Yes', 'NO', NULL, 'ADMIN', '20730', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'Pag-IBIG ID', 'PENDING'),
(29, '', 0, '', '', '', 'CN-0029', 'APPROVED', NULL, 'RESIDENT0029@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'DRAKE', 'LUIS', 14, 'MALE', 'SINGLE', '106', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '106 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09203552379', '2012-02-20', 'QUEZON CITY', 'FILIPINO', NULL, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'BICOLANO', 'No', 'No', 'NO', NULL, 'ADMIN', '10320', 'SECURITY GUARD', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'Passport', 'PENDING'),
(30, '', 0, '', '', '', 'CN-0030', 'APPROVED', NULL, 'RESIDENT0030@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'ROSE', 'FERNANDO', 62, 'FEMALE', 'MARRIED', '194', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '194 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09385512299', '1963-11-12', 'ILAGAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'KAPAMPANGAN', 'No', 'Yes', 'YES', NULL, 'ADMIN', '21809', 'BPO AGENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Pag-IBIG ID', 'Pag-IBIG ID', 'PENDING'),
(31, '', 0, '', '', '', 'CN-0031', 'APPROVED', NULL, 'RESIDENT0031@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'IAN', 'CLARA', 44, 'MALE', 'DIVORCED', '152', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '152 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09316904389', '1981-08-01', 'BAGUIO CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'PANGASINENSE', 'No', 'No', 'NO', NULL, 'ADMIN', '26647', 'BPO AGENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Pag-IBIG ID', 'Voter’s ID / Voter’s Certification', 'PENDING'),
(32, '', 0, '', '', '', 'CN-0032', 'APPROVED', NULL, 'RESIDENT0032@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'CARLO', 'MARIE', 27, 'MALE', 'IN A RELATIONSHIP', '175', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '175 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09327985077', '1999-04-21', 'QUEZON CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'MARANAO', 'No', 'Yes', 'NO', NULL, 'ADMIN', '112', 'UNEMPLOYED', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'PRC ID', 'PENDING'),
(33, '', 0, '', '', '', 'CN-0033', 'APPROVED', NULL, 'RESIDENT0033@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'JUANA', 'ANDRES', 75, 'FEMALE', 'MARRIED', '168', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '168 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09589212244', '1951-01-10', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'BICOLANO', 'No', 'No', 'YES', NULL, 'ADMIN', '39100', 'BPO AGENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Postal ID', 'Postal ID', 'PENDING'),
(34, '', 0, '', '', '', 'CN-0034', 'APPROVED', NULL, 'RESIDENT0034@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'ANA', 'ANTONIO', 57, 'FEMALE', 'DIVORCED', '65', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '65 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09962106019', '1968-09-29', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'CHAVACANO', 'No', 'Yes', 'NO', NULL, 'ADMIN', '483', 'UNEMPLOYED', NULL, NULL, NULL, NULL, NULL, NULL, 'Pag-IBIG ID', 'PhilSys ID (National ID)', 'PENDING'),
(35, '', 0, '', '', '', 'CN-0035', 'APPROVED', NULL, 'RESIDENT0035@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'JORDAN', 'GRACE', 39, 'MALE', 'IN A RELATIONSHIP', '71', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '71 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09242893392', '1986-06-19', 'CABANATUAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'KANKANA-EY', 'No', 'No', 'NO', NULL, 'ADMIN', '684', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Driver’s License', 'Postal ID', 'PENDING'),
(36, '', 0, '', '', '', 'CN-0036', 'APPROVED', NULL, 'RESIDENT0036@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'MARIA', 'SOFIA', 22, 'MALE', 'SINGLE', '160', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '160 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09928148931', '2004-03-08', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'TAUSUG', 'Yes', 'Yes', 'NO', NULL, 'ADMIN', '750', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilHealth ID', 'Pag-IBIG ID', 'PENDING'),
(37, '', 0, '', '', '', 'CN-0037', 'APPROVED', NULL, 'RESIDENT0037@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'JANINE', 'LUIS', 70, 'FEMALE', 'WIDOWED', '85', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '85 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09212064508', '1955-11-28', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'ILOCANO', 'No', 'No', 'YES', NULL, 'ADMIN', '14657', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'Company ID', 'PENDING'),
(38, '', 0, '', '', '', 'CN-0038', 'APPROVED', NULL, 'RESIDENT0038@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'MARK', 'FERNANDO', 52, 'MALE', 'LIVE-IN', '196', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '196 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09875875776', '1973-08-17', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'NONE', 'No', 'Yes', 'NO', NULL, 'ADMIN', '40680', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilSys ID (National ID)', 'Voter’s ID / Voter’s Certification', 'PENDING'),
(39, '', 0, '', '', '', 'CN-0039', 'APPROVED', NULL, 'RESIDENT0039@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'LUIGI', 'MIGUEL', 34, 'MALE', 'SINGLE', '226', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '226 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09943185384', '1991-05-07', 'CAUAYAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'PANGASINENSE', 'No', 'No', 'NO', NULL, 'ADMIN', '1608', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilSys ID (National ID)', 'PhilSys ID (National ID)', 'PENDING'),
(40, '', 0, '', '', '', 'CN-0040', 'APPROVED', NULL, 'RESIDENT0040@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'LIZA', 'MARIE', 17, 'FEMALE', 'WIDOWED', '40', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '40 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09188299624', '2009-01-24', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'IBALOI', 'Yes', 'Yes', 'NO', NULL, 'ADMIN', '12133', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'Postal ID', 'PhilHealth ID', 'PENDING'),
(41, '', 0, '', '', '', 'CN-0041', 'APPROVED', NULL, 'RESIDENT0041@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'ROSE', 'ANDRES', 65, 'FEMALE', 'DIVORCED', '20', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '20 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09711941995', '1960-10-15', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'KANKANA-EY', 'No', 'No', 'YES', NULL, 'ADMIN', '41247', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'PRC ID', 'Postal ID', 'PENDING'),
(42, '', 0, '', '', '', 'CN-0042', 'APPROVED', NULL, 'RESIDENT0042@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'JOSE', 'ANTONIO', 47, 'MALE', 'IN A RELATIONSHIP', '231', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '231 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09194811131', '1978-07-05', 'CAUAYAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'PANGASINENSE', 'No', 'Yes', 'NO', NULL, 'ADMIN', '35234', 'BPO AGENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'PhilHealth ID', 'PENDING'),
(43, '', 0, '', '', '', 'CN-0043', 'APPROVED', NULL, 'RESIDENT0043@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'CARLO', 'ELIZABETH', 30, 'MALE', 'MARRIED', '93', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '93 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09538229698', '1996-03-24', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'WARAY', 'No', 'No', 'NO', NULL, 'ADMIN', '14970', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'Driver’s License', 'UMID', 'PENDING'),
(44, '', 0, '', '', '', 'CN-0044', 'APPROVED', NULL, 'RESIDENT0044@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'ROSE', 'CLARA', 12, 'FEMALE', 'DIVORCED', '21', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '21 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09206715125', '2013-12-12', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'HILIGAYNON', 'No', 'Yes', 'NO', NULL, 'ADMIN', '16573', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'SSS ID', 'PENDING'),
(45, '', 0, '', '', '', 'CN-0045', 'APPROVED', NULL, 'RESIDENT0045@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'XIAN', 'LUIS', 60, 'MALE', 'IN A RELATIONSHIP', '76', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '76 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09218886560', '1965-09-02', 'CAUAYAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'TAUSUG', 'No', 'No', 'YES', NULL, 'ADMIN', '17546', 'SARI-SARI STORE OWNER', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilSys ID (National ID)', 'PRC ID', 'PENDING'),
(46, '', 0, '', '', '', 'CN-0046', 'APPROVED', NULL, 'RESIDENT0046@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'PAULO', 'FERNANDO', 42, 'MALE', 'MARRIED', '68', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '68 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09374287451', '1983-05-23', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'WARAY', 'No', 'Yes', 'NO', NULL, 'ADMIN', '20140', 'BPO AGENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Driver’s License', 'Postal ID', 'PENDING'),
(47, '', 0, '', '', '', 'CN-0047', 'APPROVED', NULL, 'RESIDENT0047@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'JUANA', 'MIGUEL', 25, 'FEMALE', 'WIDOWED', '111', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '111 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09214777605', '2001-02-09', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'TAGALOG', 'No', 'No', 'NO', NULL, 'ADMIN', '36038', 'BPO AGENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'Company ID', 'PENDING'),
(48, '', 0, '', '', '', 'CN-0048', 'APPROVED', NULL, 'RESIDENT0048@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'KAYE', 'GRACE', 73, 'FEMALE', 'LIVE-IN', '99', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '99 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09751025699', '1952-10-31', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'TAGALOG', 'No', 'Yes', 'YES', NULL, 'ADMIN', '24771', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'PRC ID', 'PENDING'),
(49, '', 0, '', '', '', 'CN-0049', 'APPROVED', NULL, 'RESIDENT0049@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'BRUCE', 'ANDRES', 55, 'MALE', 'SINGLE', '161', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '161 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09310795710', '1970-07-21', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'CEBUANO', 'No', 'No', 'NO', NULL, 'ADMIN', '5296', 'RETIRED', NULL, NULL, NULL, NULL, NULL, NULL, 'Postal ID', 'PRC ID', 'PENDING'),
(50, '', 0, '', '', '', 'CN-0050', 'APPROVED', NULL, 'RESIDENT0050@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'RAUL', 'ANTONIO', 38, 'MALE', 'WIDOWED', '8', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '8 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09100901479', '1988-04-10', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'WARAY', 'No', 'Yes', 'NO', NULL, 'ADMIN', '15757', 'DRIVER', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'Company ID', 'PENDING'),
(51, '', 0, '', '', '', 'CN-0051', 'APPROVED', NULL, 'RESIDENT0051@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'LIZA', 'ELIZABETH', 20, 'FEMALE', 'LIVE-IN', '58', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '58 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09372120294', '2005-12-29', 'QUEZON CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'TAGALOG', 'No', 'No', 'NO', NULL, 'ADMIN', '1684', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS ID', 'Driver’s License', 'PENDING'),
(52, '', 0, '', '', '', 'CN-0052', 'APPROVED', NULL, 'RESIDENT0052@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'MARK', 'CLARA', 68, 'MALE', 'SINGLE', '15', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '15 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09557897061', '1957-09-19', 'ILAGAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'NONE', 'No', 'Yes', 'YES', NULL, 'ADMIN', '221', 'UNEMPLOYED', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'UMID', 'PENDING'),
(53, '', 0, '', '', '', 'CN-0053', 'APPROVED', NULL, 'RESIDENT0053@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'JOSE', 'MARIE', 50, 'MALE', 'MARRIED', '152', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '152 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09673124455', '1975-06-09', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'HILIGAYNON', 'No', 'No', 'NO', NULL, 'ADMIN', '16876', 'FREELANCER', NULL, NULL, NULL, NULL, NULL, NULL, 'Postal ID', 'UMID', 'PENDING'),
(54, '', 0, '', '', '', 'CN-0054', 'APPROVED', NULL, 'RESIDENT0054@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'LIZA', 'FERNANDO', 33, 'FEMALE', 'DIVORCED', '212', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '212 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09691931119', '1993-02-26', 'QUEZON CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'IBALOI', 'No', 'Yes', 'NO', NULL, 'ADMIN', '10331', 'DRIVER', NULL, NULL, NULL, NULL, NULL, NULL, 'Voter’s ID / Voter’s Certification', 'PRC ID', 'PENDING'),
(55, '', 0, '', '', '', 'CN-0055', 'APPROVED', NULL, 'RESIDENT0055@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'ROSE', 'MIGUEL', 15, 'FEMALE', 'IN A RELATIONSHIP', '103', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '103 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09440282258', '2010-11-16', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'ILOCANO', 'No', 'No', 'NO', NULL, 'ADMIN', '1920', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'PRC ID', 'PhilHealth ID', 'APPROVED'),
(56, '', 0, '', '', '', 'CN-0056', 'APPROVED', NULL, 'RESIDENT0056@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'LIAM', 'GRACE', 63, 'MALE', 'MARRIED', '131', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '131 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09925617962', '1962-08-07', 'BAGUIO CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'HILIGAYNON', 'No', 'Yes', 'YES', NULL, 'ADMIN', '15605', 'FREELANCER', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilSys ID (National ID)', 'Company ID', 'PENDING'),
(57, '', 0, '', '', '', 'CN-0057', 'APPROVED', NULL, 'RESIDENT0057@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'CARLA', 'SOFIA', 46, 'FEMALE', 'DIVORCED', '92', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '92 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09507243067', '1980-04-26', 'QUEZON CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'CEBUANO', 'No', 'No', 'NO', NULL, 'ADMIN', '11948', 'FREELANCER', NULL, NULL, NULL, NULL, NULL, NULL, 'School ID', 'Voter’s ID / Voter’s Certification', 'PENDING'),
(58, '', 0, '', '', '', 'CN-0058', 'APPROVED', NULL, 'RESIDENT0058@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'KATE', 'LUIS', 28, 'FEMALE', 'IN A RELATIONSHIP', '70', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '70 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09559361477', '1998-01-14', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'BICOLANO', 'No', 'Yes', 'NO', NULL, 'ADMIN', '17437', 'SECURITY GUARD', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'PRC ID', 'PENDING'),
(59, '', 0, '', '', '', 'CN-0059', 'APPROVED', NULL, 'RESIDENT0059@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'OLIVER', 'ELIZABETH', 10, 'MALE', 'SINGLE', '72', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '72 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09275078213', '2015-10-04', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'HILIGAYNON', 'No', 'No', 'NO', NULL, 'ADMIN', '1597', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'Driver’s License', 'PENDING'),
(60, '', 0, '', '', '', 'CN-0060', 'APPROVED', NULL, 'RESIDENT0060@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'ELIJAH', 'CLARA', 58, 'MALE', 'WIDOWED', '149', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '149 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09497306661', '1967-06-25', 'QUEZON CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'CHAVACANO', 'No', 'Yes', 'NO', NULL, 'ADMIN', '426', 'UNEMPLOYED', NULL, NULL, NULL, NULL, NULL, NULL, 'Voter’s ID / Voter’s Certification', 'Postal ID', 'PENDING'),
(61, '', 0, '', '', '', 'CN-0061', 'APPROVED', NULL, 'RESIDENT0061@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'MARIA', 'MARIE', 41, 'FEMALE', 'LIVE-IN', '31', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '31 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09661298697', '1985-03-14', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'KANKANA-EY', 'No', 'No', 'NO', NULL, 'ADMIN', '19251', 'HOUSEWIFE/HOUSEHUSBAND', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'PhilHealth ID', 'PENDING'),
(62, '', 0, '', '', '', 'CN-0062', 'APPROVED', NULL, 'RESIDENT0062@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'SABRINA', 'ANDRES', 23, 'FEMALE', 'SINGLE', '204', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '204 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09814573528', '2002-12-02', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'MARANAO', 'Yes', 'Yes', 'NO', NULL, 'ADMIN', '14089', 'DRIVER', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS ID', 'Driver’s License', 'PENDING'),
(63, '', 0, '', '', '', 'CN-0063', 'APPROVED', NULL, 'RESIDENT0063@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'MARK', 'MIGUEL', 71, 'MALE', 'WIDOWED', '178', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '178 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09188971582', '1954-08-23', 'QUEZON CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'MARANAO', 'No', 'No', 'YES', NULL, 'ADMIN', '10779', 'HOUSEWIFE/HOUSEHUSBAND', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilSys ID (National ID)', 'PhilSys ID (National ID)', 'PENDING'),
(64, '', 0, '', '', '', 'CN-0064', 'APPROVED', NULL, 'RESIDENT0064@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'MARIA', 'GRACE', 53, 'FEMALE', 'LIVE-IN', '28', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '28 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09201137349', '1972-05-12', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'WARAY', 'No', 'Yes', 'NO', NULL, 'ADMIN', '19315', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'Driver’s License', 'UMID', 'PENDING'),
(65, '', 0, '', '', '', 'CN-0065', 'APPROVED', NULL, 'RESIDENT0065@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'LIZA', 'SOFIA', 36, 'FEMALE', 'IN A RELATIONSHIP', '107', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '107 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09338772029', '1990-01-30', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'BICOLANO', 'No', 'No', 'NO', NULL, 'ADMIN', '44069', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'Pag-IBIG ID', 'UMID', 'PENDING'),
(66, '', 0, '', '', '', 'CN-0066', 'APPROVED', NULL, 'RESIDENT0066@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'JACK', 'LUIS', 18, 'MALE', 'MARRIED', '199', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '199 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09990448125', '2007-10-20', 'QUEZON CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'HILIGAYNON', 'Yes', 'Yes', 'NO', NULL, 'ADMIN', '528', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'School ID', 'PENDING'),
(67, '', 0, '', '', '', 'CN-0067', 'APPROVED', NULL, 'RESIDENT0067@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'JOSE', 'FERNANDO', 66, 'MALE', 'DIVORCED', '173', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '173 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09235924571', '1959-07-11', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'MAGUINDANAON', 'No', 'No', 'YES', NULL, 'ADMIN', '25194', 'BPO AGENT', NULL, NULL, NULL, NULL, NULL, NULL, 'School ID', 'PhilSys ID (National ID)', 'PENDING'),
(68, '', 0, '', '', '', 'CN-0068', 'APPROVED', NULL, 'RESIDENT0068@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'AUBREY', 'CLARA', 49, 'FEMALE', 'IN A RELATIONSHIP', '20', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '20 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09808278504', '1977-03-30', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'ILOCANO', 'No', 'Yes', 'NO', NULL, 'ADMIN', '19775', 'SARI-SARI STORE OWNER', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS ID', 'SSS ID', 'PENDING'),
(69, '', 0, '', '', '', 'CN-0069', 'APPROVED', NULL, 'RESIDENT0069@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'ROSE', 'MARIE', 31, 'FEMALE', 'MARRIED', '79', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '79 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09533618837', '1994-12-18', 'CABANATUAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'WARAY', 'No', 'No', 'NO', NULL, 'ADMIN', '12831', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'PRC ID', 'Pag-IBIG ID', 'PENDING'),
(70, '', 0, '', '', '', 'CN-0070', 'APPROVED', NULL, 'RESIDENT0070@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'SAMUEL', 'ANDRES', 13, 'MALE', 'DIVORCED', '86', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '86 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09143258703', '2012-09-06', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'BICOLANO', 'No', 'Yes', 'NO', NULL, 'ADMIN', '1207', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'UMID', 'APPROVED'),
(71, '', 0, '', '', '', 'CN-0071', 'APPROVED', NULL, 'RESIDENT0071@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'JANE', 'ANTONIO', 61, 'FEMALE', 'LIVE-IN', '191', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '191 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09815437028', '1964-05-29', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'WARAY', 'No', 'No', 'YES', NULL, 'ADMIN', '1263', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'PRC ID', 'Pag-IBIG ID', 'PENDING'),
(72, '', 0, '', '', '', 'CN-0072', 'APPROVED', NULL, 'RESIDENT0072@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'MARITONI', 'GRACE', 44, 'FEMALE', 'SINGLE', '198', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '198 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09847409062', '1982-02-16', 'CABANATUAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'WARAY', 'No', 'Yes', 'NO', NULL, 'ADMIN', '695', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Postal ID', 'Driver’s License', 'PENDING'),
(73, '', 0, '', '', '', 'CN-0073', 'APPROVED', NULL, 'RESIDENT0073@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'PAOLO', 'SOFIA', 26, 'MALE', 'WIDOWED', '165', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '165 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09790734257', '1999-11-06', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'TAUSUG', 'No', 'No', 'NO', NULL, 'ADMIN', '6240', 'RETIRED', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'Passport', 'PENDING'),
(74, '', 0, '', '', '', 'CN-0074', 'APPROVED', NULL, 'RESIDENT0074@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'ETHAN', 'LUIS', 74, 'MALE', 'LIVE-IN', '232', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '232 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09411444129', '1951-07-28', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'HILIGAYNON', 'No', 'Yes', 'YES', NULL, 'ADMIN', '25741', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilHealth ID', 'Pag-IBIG ID', 'PENDING'),
(75, '', 0, '', '', '', 'CN-0075', 'APPROVED', NULL, 'RESIDENT0075@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'MARIA', 'FERNANDO', 57, 'FEMALE', 'SINGLE', '164', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '164 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09485017901', '1969-04-16', 'CABANATUAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'CHAVACANO', 'No', 'No', 'NO', NULL, 'ADMIN', '1663', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Driver’s License', 'School ID', 'APPROVED'),
(76, '', 0, '', '', '', 'CN-0076', 'APPROVED', NULL, 'RESIDENT0076@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'LIZA', 'MIGUEL', 39, 'FEMALE', 'WIDOWED', '123', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '123 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09190757147', '1987-01-04', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'TAGALOG', 'No', 'Yes', 'NO', NULL, 'ADMIN', '190', 'UNEMPLOYED', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'Pag-IBIG ID', 'PENDING'),
(77, '', 0, '', '', '', 'CN-0077', 'APPROVED', NULL, 'RESIDENT0077@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'LUIS', 'MARIE', 21, 'MALE', 'DIVORCED', '123', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '123 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09298732060', '2004-09-23', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'TAUSUG', 'No', 'No', 'NO', NULL, 'ADMIN', '1440', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Voter’s ID / Voter’s Certification', 'PRC ID', 'APPROVED'),
(78, '', 0, '', '', '', 'CN-0078', 'APPROVED', NULL, 'RESIDENT0078@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'JOSEPHINE', 'ANDRES', 69, 'FEMALE', 'IN A RELATIONSHIP', '245', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '245 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09821388888', '1956-06-14', 'CABANATUAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'WARAY', 'No', 'Yes', 'YES', NULL, 'ADMIN', '560', 'UNEMPLOYED', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS ID', 'PhilSys ID (National ID)', 'PENDING'),
(79, '', 0, '', '', '', 'CN-0079', 'APPROVED', NULL, 'RESIDENT0079@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'LIZA', 'ANTONIO', 52, 'FEMALE', 'MARRIED', '104', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '104 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09410748290', '1974-03-04', 'CAUAYAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'IBALOI', 'No', 'No', 'NO', NULL, 'ADMIN', '19085', 'HOUSEWIFE/HOUSEHUSBAND', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'PhilSys ID (National ID)', 'PENDING'),
(80, '', 0, '', '', '', 'CN-0080', 'APPROVED', NULL, 'RESIDENT0080@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'ARTHUR', 'ELIZABETH', 34, 'MALE', 'DIVORCED', '36', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '36 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09389574815', '1991-11-22', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'MARANAO', 'No', 'Yes', 'NO', NULL, 'ADMIN', '43416', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'UMID', 'Pag-IBIG ID', 'APPROVED'),
(81, '', 0, '', '', '', 'CN-0081', 'APPROVED', NULL, 'RESIDENT0081@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'ALEXANDER', 'CLARA', 16, 'MALE', 'IN A RELATIONSHIP', '117', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '117 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09615629233', '2009-08-11', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'PANGASINENSE', 'No', 'No', 'NO', NULL, 'ADMIN', '1867', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilHealth ID', 'Passport', 'PENDING'),
(82, '', 0, '', '', '', 'CN-0082', 'APPROVED', NULL, 'RESIDENT0082@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'CHRISTINA', 'LUIS', 65, 'FEMALE', 'MARRIED', '227', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '227 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09909421746', '1961-05-02', 'CAUAYAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'IBALOI', 'No', 'Yes', 'YES', NULL, 'ADMIN', '38728', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'SSS ID', 'APPROVED'),
(83, '', 0, '', '', '', 'CN-0083', 'APPROVED', NULL, 'RESIDENT0083@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'MERIDITH', 'FERNANDO', 47, 'FEMALE', 'WIDOWED', '35', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '35 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09800221065', '1979-01-20', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'KANKANA-EY', 'No', 'No', 'NO', NULL, 'ADMIN', '10', 'UNEMPLOYED', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'Postal ID', 'PENDING'),
(84, '', 0, '', '', '', 'CN-0084', 'APPROVED', NULL, 'RESIDENT0084@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'WILLIAM', 'MIGUEL', 29, 'MALE', 'LIVE-IN', '241', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '241 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09272840113', '1996-10-09', 'BAGUIO CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'TAUSUG', 'No', 'Yes', 'NO', NULL, 'ADMIN', '13038', 'RETIRED', NULL, NULL, NULL, NULL, NULL, NULL, 'Postal ID', 'PhilSys ID (National ID)', 'PENDING'),
(85, '', 0, '', '', '', 'CN-0085', 'APPROVED', NULL, 'RESIDENT0085@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'JANE', 'GRACE', 11, 'FEMALE', 'SINGLE', '99', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '99 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09663537399', '2014-06-29', 'QUEZON CITY', 'FILIPINO', NULL, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'MAGUINDANAON', 'No', 'No', 'NO', NULL, 'ADMIN', '1983', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS ID', 'Driver’s License', 'APPROVED');
INSERT INTO `tbl_resident` (`id_resident`, `rejected_reason`, `is_walk_in`, `qr_code`, `valid1`, `valid2`, `control_no`, `request_status`, `res_photo`, `email`, `password`, `lname`, `fname`, `mi`, `age`, `sex`, `status`, `houseno`, `street`, `brgy`, `municipal`, `address`, `contact`, `bdate`, `bplace`, `nationality`, `family_role`, `head_of_family`, `voter`, `pwd`, `indigent`, `single_parent`, `malnourished`, `four_ps`, `vaccinated`, `pregnancy`, `domesticated_animals`, `role`, `ip_community`, `out_of_school_youth`, `lgbtq`, `senior_citizen`, `psa_registered`, `addedby`, `s_of_income`, `occupation`, `psa_holder`, `psa_correction`, `ntnlId`, `trees`, `farmer`, `vegetables`, `id1`, `id2`, `status2`) VALUES
(86, '', 0, '', '', '', 'CN-0086', 'APPROVED', NULL, 'RESIDENT0086@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'MARIA', 'ANDRES', 60, 'FEMALE', 'WIDOWED', '24', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '24 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09599166685', '1966-03-20', 'ILAGAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'NONE', 'No', 'Yes', 'YES', NULL, 'ADMIN', '14381', 'FREELANCER', NULL, NULL, NULL, NULL, NULL, NULL, 'School ID', 'PRC ID', 'PENDING'),
(87, '', 0, '', '', '', 'CN-0087', 'APPROVED', NULL, 'RESIDENT0087@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'HARRY', 'ANTONIO', 42, 'MALE', 'LIVE-IN', '73', 'AMSING RD', 'EAST MODERNSITE', 'BAGUIO CITY', '73 AMSING RD, EAST MODERNSITE, BAGUIO CITY', '09905221257', '1983-12-08', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'CEBUANO', 'No', 'No', 'NO', NULL, 'ADMIN', '16926', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'Postal ID', 'Voter’s ID / Voter’s Certification', 'PENDING'),
(88, '', 0, '', '', '', 'CN-0088', 'APPROVED', NULL, 'RESIDENT0088@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'MAVERICK', 'ELIZABETH', 24, 'MALE', 'SINGLE', '42', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '42 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09828606260', '2001-08-27', 'QUEZON CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'CEBUANO', 'Yes', 'Yes', 'NO', NULL, 'ADMIN', '18418', 'SARI-SARI STORE OWNER', NULL, NULL, NULL, NULL, NULL, NULL, 'Pag-IBIG ID', 'PRC ID', 'PENDING'),
(89, '', 0, '', '', '', 'CN-0089', 'APPROVED', NULL, 'RESIDENT0089@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'MARIA', 'CLARA', 72, 'FEMALE', 'MARRIED', '241', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '241 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09427367558', '1953-05-18', 'ILAGAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'IBALOI', 'No', 'No', 'YES', NULL, 'ADMIN', '11156', 'HOUSEWIFE/HOUSEHUSBAND', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'PhilSys ID (National ID)', 'PENDING'),
(90, '', 0, '', '', '', 'CN-0090', 'APPROVED', NULL, 'RESIDENT0090@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'LIZA', 'MARIE', 55, 'FEMALE', 'DIVORCED', '76', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '76 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09451019035', '1971-02-05', 'BAGUIO CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'KAPAMPANGAN', 'No', 'Yes', 'NO', NULL, 'ADMIN', '17105', 'SECURITY GUARD', NULL, NULL, NULL, NULL, NULL, NULL, 'Company ID', 'School ID', 'APPROVED'),
(91, '', 0, '', '', '', 'CN-0091', 'APPROVED', NULL, 'RESIDENT0091@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'ADRIAN', 'FERNANDO', 37, 'MALE', 'IN A RELATIONSHIP', '157', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '157 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09872992532', '1988-10-26', 'QUEZON CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'IBALOI', 'No', 'No', 'NO', NULL, 'ADMIN', '17637', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'UMID', 'PENDING'),
(92, '', 0, '', '', '', 'CN-0092', 'APPROVED', NULL, 'RESIDENT0092@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'RAMOS', 'JOSEFA', 'MIGUEL', 19, 'FEMALE', 'MARRIED', '57', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '57 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09211905584', '2006-07-16', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'RESIDENT', 'HILIGAYNON', 'Yes', 'Yes', 'NO', NULL, 'ADMIN', '1530', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'PRC ID', 'Passport', 'PENDING'),
(93, '', 0, '', '', '', 'CN-0093', 'APPROVED', NULL, 'RESIDENT0093@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'ALEXA', 'GRACE', 68, 'FEMALE', 'DIVORCED', '63', 'LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '63 LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09140550352', '1958-04-06', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'WARAY', 'No', 'No', 'YES', NULL, 'ADMIN', '23575', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'School ID', 'Company ID', 'PENDING'),
(94, '', 0, '', '', '', 'CN-0094', 'APPROVED', NULL, 'RESIDENT0094@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'REYES', 'ENZO', 'SOFIA', 50, 'MALE', 'IN A RELATIONSHIP', '143', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '143 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09867035035', '1975-12-25', 'QUEZON CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'TAGALOG', 'No', 'Yes', 'NO', NULL, 'ADMIN', '16546', 'CONSTRUCTION WORKER', NULL, NULL, NULL, NULL, NULL, NULL, 'PRC ID', 'School ID', 'PENDING'),
(95, '', 0, '', '', '', 'CN-0095', 'APPROVED', NULL, 'RESIDENT0095@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'KAYDEN', 'ANTONIO', 32, 'MALE', 'SINGLE', '27', 'INTERIOR LEDESMA STREET', 'EAST MODERNSITE', 'BAGUIO CITY', '27 INTERIOR LEDESMA STREET, EAST MODERNSITE, BAGUIO CITY', '09213524149', '1993-09-13', 'ILAGAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'NONE', 'No', 'No', 'NO', NULL, 'ADMIN', '18131', 'FREELANCER', NULL, NULL, NULL, NULL, NULL, NULL, 'Voter’s ID / Voter’s Certification', 'Driver’s License', 'APPROVED'),
(96, '', 0, '', '', '', 'CN-0096', 'APPROVED', NULL, 'RESIDENT0096@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'JANE', 'ELIZABETH', 14, 'FEMALE', 'WIDOWED', '206', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '206 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09166515668', '2011-06-03', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'WARAY', 'No', 'Yes', 'NO', NULL, 'ADMIN', '885', 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilSys ID (National ID)', 'School ID', 'PENDING'),
(97, '', 0, '', '', '', 'CN-0097', 'APPROVED', NULL, 'RESIDENT0097@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'JENNA', 'CLARA', 63, 'FEMALE', 'LIVE-IN', '196', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '196 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09992005918', '1963-02-22', 'QUEZON CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'TAUSUG', 'No', 'No', 'YES', NULL, 'ADMIN', '17044', 'SARI-SARI STORE OWNER', NULL, NULL, NULL, NULL, NULL, NULL, 'PhilSys ID (National ID)', 'Passport', 'PENDING'),
(98, '', 0, '', '', '', 'CN-0098', 'APPROVED', NULL, 'RESIDENT0098@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'FELIX', 'MARIE', 45, 'MALE', 'SINGLE', '114', 'T. BUGALLON', 'EAST MODERNSITE', 'BAGUIO CITY', '114 T. BUGALLON, EAST MODERNSITE, BAGUIO CITY', '09760482618', '1980-11-11', 'ILAGAN CITY', 'FILIPINO', NULL, 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'BICOLANO', 'No', 'Yes', 'NO', NULL, 'ADMIN', '14965', 'RETIRED', NULL, NULL, NULL, NULL, NULL, NULL, 'Passport', 'Company ID', 'PENDING'),
(99, '', 0, '', '', '', 'CN-0099', 'APPROVED', NULL, 'RESIDENT0099@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'NAVARRO', 'JOY', 'ANDRES', 27, 'FEMALE', 'WIDOWED', '231', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '231 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09726395364', '1998-08-01', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'RESIDENT', 'KAPAMPANGAN', 'No', 'No', 'NO', NULL, 'ADMIN', '38040', 'GOVERNMENT EMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, 'PRC ID', 'Postal ID', 'PENDING'),
(100, '', 0, '', '', '', 'CN-0100', 'APPROVED', NULL, 'RESIDENT0100@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'MARIA', 'MIGUEL', 76, 'FEMALE', 'LIVE-IN', '63', 'DR. NAVARRO ALLEY', 'EAST MODERNSITE', 'BAGUIO CITY', '63 DR. NAVARRO ALLEY, EAST MODERNSITE, BAGUIO CITY', '09350528995', '1950-04-22', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'RESIDENT', 'MAGUINDANAON', 'No', 'Yes', 'YES', NULL, 'ADMIN', '15421', 'HOUSEWIFE/HOUSEHUSBAND', NULL, NULL, NULL, NULL, NULL, NULL, 'PRC ID', 'School ID', 'APPROVED'),
(101, '', 0, '', '', '', 'CN-0101', 'PENDING', NULL, 'RESIDENT0101@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'LIZA', 'GRACE', 58, 'MALE', 'IN A RELATIONSHIP', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1968-01-10', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING'),
(102, '', 0, '', '', '', 'CN-0102', 'PENDING', NULL, 'RESIDENT0102@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'MARK', 'SOFIA', 40, 'MALE', 'MARRIED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1985-09-29', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(103, '', 0, '', '', '', 'CN-0103', 'PENDING', NULL, 'RESIDENT0103@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'JOSE', 'LUIS', 22, 'FEMALE', 'DIVORCED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '2003-06-19', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING'),
(104, '', 0, '', '', '', 'CN-0104', 'PENDING', NULL, 'RESIDENT0104@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'BAUTISTA', 'ANNE', 'FERNANDO', 71, 'FEMALE', 'IN A RELATIONSHIP', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1955-03-10', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'YES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(105, '', 0, '', '', '', 'CN-0105', 'PENDING', NULL, 'RESIDENT0105@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'ROSE', 'CLARA', 53, 'MALE', 'MARRIED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1972-11-27', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING'),
(106, '', 0, '', '', '', 'CN-0106', 'PENDING', NULL, 'RESIDENT0106@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'GARCIA', 'ANA', 'MARIE', 35, 'FEMALE', 'WIDOWED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1990-08-17', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING'),
(107, '', 0, '', '', '', 'CN-0107', 'PENDING', NULL, 'RESIDENT0107@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'CATHY', 'ANDRES', 17, 'FEMALE', 'LIVE-IN', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '2008-05-06', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(108, '', 0, '', '', '', 'CN-0108', 'PENDING', NULL, 'RESIDENT0108@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'JUAN', 'ANTONIO', 66, 'MALE', 'SINGLE', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1960-01-26', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'YES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(109, '', 0, '', '', '', 'CN-0109', 'PENDING', NULL, 'RESIDENT0109@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'PAOLO', 'GRACE', 48, 'MALE', 'WIDOWED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1977-10-15', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(110, '', 0, '', '', '', 'CN-0110', 'PENDING', NULL, 'RESIDENT0110@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'JANE', 'SOFIA', 30, 'FEMALE', 'LIVE-IN', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1995-07-05', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(111, 'LACK OF INFORMATION', 0, '', '', '', 'CN-0111', 'REJECTED', NULL, 'RESIDENT0111@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'CRUZ', 'MARIA', 'LUIS', 13, 'FEMALE', 'SINGLE', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '2013-03-24', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(112, 'FAKE OR SUSPICIOUS INFORMATION', 0, '', '', '', 'CN-0112', 'REJECTED', NULL, 'RESIDENT0112@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'PAOLO', 'FERNANDO', 61, 'MALE', 'MARRIED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1964-12-14', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'YES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(113, 'INVALID VALID ID', 0, '', '', '', 'CN-0113', 'REJECTED', NULL, 'RESIDENT0113@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'MARK', 'MIGUEL', 43, 'FEMALE', 'DIVORCED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1982-09-03', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(114, 'INCORRECT RESIDENT ADDRESS', 0, '', '', '', 'CN-0114', 'REJECTED', NULL, 'RESIDENT0114@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'JOSE', 'MARIE', 25, 'FEMALE', 'IN A RELATIONSHIP', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '2000-05-23', 'SANTIAGO, ISABELA', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(115, 'INVALID CONTACT INFORMATION', 0, '', '', '', 'CN-0115', 'REJECTED', NULL, 'RESIDENT0115@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'LIZA', 'ANDRES', 74, 'MALE', 'MARRIED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1952-02-12', 'CABANATUAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'YES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(116, 'THE ADDRESS DOESNT MATCH IN YOUR VALID ID', 0, '', '', '', 'CN-0116', 'REJECTED', NULL, 'RESIDENT0116@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'FLORES', 'ROSE', 'ANTONIO', 56, 'MALE', 'DIVORCED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1969-11-01', 'CAUAYAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING'),
(117, NULL, 0, '', '', '', 'CN-0117', 'APPROVED', NULL, 'RESIDENT0117@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'JOSE', 'ELIZABETH', 38, 'FEMALE', 'IN A RELATIONSHIP', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1987-07-22', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(118, 'MISMATCH OF INFORMATION', 0, '', '', '', 'CN-0118', 'REJECTED', NULL, 'RESIDENT0118@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'MENDOZA', 'CARLO', 'CLARA', 21, 'FEMALE', 'SINGLE', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '2005-04-10', 'BAGUIO CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(119, 'UNCLEAR UPLOADED DOCUMENTS', 0, '', '', '', 'CN-0119', 'REJECTED', NULL, 'RESIDENT0119@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'VILLAR', 'JUAN', 'LUIS', 69, 'MALE', 'WIDOWED', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1956-12-30', 'QUEZON CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'YES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(120, 'INCOMPLETE PERSONAL INFORMATION', 0, '', '', '', 'CN-0120', 'REJECTED', NULL, 'RESIDENT0120@EXAMPLE.COM', 'f8461b554d59b3014e8ff5165dc62fac', 'SANTOS', 'ANA', 'FERNANDO', 51, 'FEMALE', 'LIVE-IN', NULL, NULL, 'EAST MODERNSITE', 'BAGUIO CITY', NULL, NULL, '1974-09-19', 'ILAGAN CITY', 'FILIPINO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RESIDENT', NULL, NULL, NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELETED'),
(125, '', 0, 'uploads/qr_codes/CN-0121.png', 'PhilSys ID (National ID)', 'PhilHealth ID', 'CN-0121', 'approved', NULL, 'genesisizzoparson@gmail.com', '9fd6c0b51277d106e7ae73d037f4572b', 'QUIPSE', 'MARIA CLAVERIA', 'LUMANOG', 25, 'Female', 'Single', '142', 'DR NAVARRO ALLEY', 'EAST MODERN SITE', 'BAGUIO CITY', NULL, '09701726401', '2000-10-22', 'SOLANO, NUEVA VIZCAYA', 'Filipino', NULL, 'No', 'Yes', '', '', 'Yes', NULL, '', NULL, '', NULL, 'resident', NULL, '', 'Yes', '', NULL, NULL, '10,000', 'STUDENT', 'Yes', 'No', '', 'No', NULL, 'No', 'ID1_69fd89599bc76.jpg', 'ID2_69fd89599c27d.jpg', 'PENDING'),
(126, '', 1, 'uploads/qr_codes/CN-0122.png', 'PhilSys ID (National ID)', 'Passport', 'CN-0122', 'approved', NULL, 'abc@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'ABDSA', 'ASDSADSA', 'DAS', 25, 'Female', 'Single', '213', 'ABC', 'EAST MODERN SITE', 'BAGUIO CITY', NULL, '566', '2000-10-25', 'BAGUIO CITY', 'Filipino', NULL, 'No', '', '', '', '', NULL, '', NULL, '', NULL, 'resident', NULL, '', '', '', NULL, NULL, '10,000', 'STUDENT', 'Yes', 'No', '', 'No', NULL, 'No', 'ID1_6a06b0fc66e3f.png', 'ID2_6a06b0fc6743a.png', 'APPROVED');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_services`
--

CREATE TABLE `tbl_services` (
  `id_services` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `requires` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `image_service` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_services`
--

INSERT INTO `tbl_services` (`id_services`, `title`, `description`, `fees`, `requires`, `status`, `image_service`) VALUES
(1, 'BARANGAY CLEARANCE', '', 35.00, 'CEDULA', 'Active', 'uploads/clearance.png'),
(4, 'CERTIFICATE OF RESIDENCY', '', 35.00, 'CEDULA & BRGY CLEARANCE', 'Active', 'uploads/residency.png'),
(5, 'CERTIFICATE OF INDIGENCY', '', 35.00, 'CEDULA', 'Active', 'uploads/indigency.png'),
(6, 'BUSINESS CLEARANCE', '', 35.00, 'CEDULA', 'Active', 'uploads/busper.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT '',
  `term_started` date DEFAULT NULL,
  `term_ended` date DEFAULT NULL,
  `position` varchar(128) DEFAULT '',
  `status` enum('Active','Inactive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`id`, `fullname`, `term_started`, `term_ended`, `position`, `status`) VALUES
(1, 'Cassidy Cantu', '1998-01-01', '2002-01-12', 'Et sunt blanditiis d', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_travelpermit`
--

CREATE TABLE `tbl_travelpermit` (
  `id_travel` int(11) NOT NULL,
  `id_resident` int(11) NOT NULL,
  `prev_owner` varchar(255) NOT NULL,
  `breed` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `brgy` varchar(50) NOT NULL,
  `municipal` varchar(50) NOT NULL,
  `buyers_name` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_travelpermit`
--

INSERT INTO `tbl_travelpermit` (`id_travel`, `id_resident`, `prev_owner`, `breed`, `gender`, `color`, `destination`, `date`, `brgy`, `municipal`, `buyers_name`, `purpose`) VALUES
(2, 44, 'Reyes Hannah Joy', 'Sheep', 'Female', 'Spotted', 'Farm', '2024-03-25', 'Yuson', 'Guimba', 'Charmaine Joyce Coloma', 'Breeding');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mi` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `addedby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family0ca76`
--

CREATE TABLE `tmp_add_family0ca76` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family1c4b1`
--

CREATE TABLE `tmp_add_family1c4b1` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family2ac23`
--

CREATE TABLE `tmp_add_family2ac23` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family2c52a`
--

CREATE TABLE `tmp_add_family2c52a` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family4c46e`
--

CREATE TABLE `tmp_add_family4c46e` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family5a58a`
--

CREATE TABLE `tmp_add_family5a58a` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family5be16`
--

CREATE TABLE `tmp_add_family5be16` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family7bd43`
--

CREATE TABLE `tmp_add_family7bd43` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family8dcb7`
--

CREATE TABLE `tmp_add_family8dcb7` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family9a553`
--

CREATE TABLE `tmp_add_family9a553` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family11a2c`
--

CREATE TABLE `tmp_add_family11a2c` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family40d48`
--

CREATE TABLE `tmp_add_family40d48` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family43c74`
--

CREATE TABLE `tmp_add_family43c74` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family48aac`
--

CREATE TABLE `tmp_add_family48aac` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family57b13`
--

CREATE TABLE `tmp_add_family57b13` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family85ed4`
--

CREATE TABLE `tmp_add_family85ed4` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family88c11`
--

CREATE TABLE `tmp_add_family88c11` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family95e69`
--

CREATE TABLE `tmp_add_family95e69` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family123ee`
--

CREATE TABLE `tmp_add_family123ee` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family252aa`
--

CREATE TABLE `tmp_add_family252aa` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family515ee`
--

CREATE TABLE `tmp_add_family515ee` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family608ab`
--

CREATE TABLE `tmp_add_family608ab` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family640ee`
--

CREATE TABLE `tmp_add_family640ee` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family992ad`
--

CREATE TABLE `tmp_add_family992ad` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family9927c`
--

CREATE TABLE `tmp_add_family9927c` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family30256`
--

CREATE TABLE `tmp_add_family30256` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family39825`
--

CREATE TABLE `tmp_add_family39825` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family47949`
--

CREATE TABLE `tmp_add_family47949` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family55139`
--

CREATE TABLE `tmp_add_family55139` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family62044`
--

CREATE TABLE `tmp_add_family62044` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family62960`
--

CREATE TABLE `tmp_add_family62960` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family73079`
--

CREATE TABLE `tmp_add_family73079` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family74055`
--

CREATE TABLE `tmp_add_family74055` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_family88830`
--

CREATE TABLE `tmp_add_family88830` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familya7db0`
--

CREATE TABLE `tmp_add_familya7db0` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familya8ce3`
--

CREATE TABLE `tmp_add_familya8ce3` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familya767e`
--

CREATE TABLE `tmp_add_familya767e` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familya1269`
--

CREATE TABLE `tmp_add_familya1269` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familya6251`
--

CREATE TABLE `tmp_add_familya6251` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyaeb45`
--

CREATE TABLE `tmp_add_familyaeb45` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyb82b2`
--

CREATE TABLE `tmp_add_familyb82b2` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyb8051`
--

CREATE TABLE `tmp_add_familyb8051` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyb8451`
--

CREATE TABLE `tmp_add_familyb8451` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familybe74d`
--

CREATE TABLE `tmp_add_familybe74d` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyce4da`
--

CREATE TABLE `tmp_add_familyce4da` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyd26ec`
--

CREATE TABLE `tmp_add_familyd26ec` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyd78d7`
--

CREATE TABLE `tmp_add_familyd78d7` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyd6692`
--

CREATE TABLE `tmp_add_familyd6692` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyd6792`
--

CREATE TABLE `tmp_add_familyd6792` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familye0d1a`
--

CREATE TABLE `tmp_add_familye0d1a` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familye0856`
--

CREATE TABLE `tmp_add_familye0856` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familye8065`
--

CREATE TABLE `tmp_add_familye8065` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyecba3`
--

CREATE TABLE `tmp_add_familyecba3` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_add_familyed937`
--

CREATE TABLE `tmp_add_familyed937` (
  `id` int(11) NOT NULL,
  `family_lastname` varchar(128) DEFAULT '',
  `family_firstname` varchar(128) DEFAULT '',
  `family_middleinitial` varchar(128) DEFAULT '',
  `relationshipid` varchar(128) DEFAULT '0',
  `family_age` varchar(128) DEFAULT '',
  `familycivilid` varchar(128) DEFAULT '0',
  `occupation` varchar(128) DEFAULT '',
  `income` varchar(128) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure for view `masked_users`
--
DROP TABLE IF EXISTS `masked_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u680385054_bmis`@`127.0.0.1` SQL SECURITY DEFINER VIEW `masked_users`  AS SELECT 1 AS `id_user`, 1 AS `masked_email`, 1 AS `masked_password`, 1 AS `masked_lname`, 1 AS `masked_fname`, 1 AS `masked_address`, 1 AS `masked_position` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_analytics_cache`
--
ALTER TABLE `ai_analytics_cache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cache_key` (`cache_key`);

--
-- Indexes for table `approval`
--
ALTER TABLE `approval`
  ADD PRIMARY KEY (`id_approval`);

--
-- Indexes for table `brgy_info`
--
ALTER TABLE `brgy_info`
  ADD PRIMARY KEY (`id_brgy_info`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id_position`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id_system`);

--
-- Indexes for table `tbl_activities`
--
ALTER TABLE `tbl_activities`
  ADD PRIMARY KEY (`id_activity`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tbl_announcement`
--
ALTER TABLE `tbl_announcement`
  ADD PRIMARY KEY (`id_announcement`);

--
-- Indexes for table `tbl_blotter`
--
ALTER TABLE `tbl_blotter`
  ADD PRIMARY KEY (`id_blotter`);

--
-- Indexes for table `tbl_bspermit`
--
ALTER TABLE `tbl_bspermit`
  ADD PRIMARY KEY (`id_bspermit`);

--
-- Indexes for table `tbl_clearance`
--
ALTER TABLE `tbl_clearance`
  ADD PRIMARY KEY (`id_clearance`);

--
-- Indexes for table `tbl_family_member`
--
ALTER TABLE `tbl_family_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_indigency`
--
ALTER TABLE `tbl_indigency`
  ADD PRIMARY KEY (`id_indigency`);

--
-- Indexes for table `tbl_officials`
--
ALTER TABLE `tbl_officials`
  ADD PRIMARY KEY (`id_official`);

--
-- Indexes for table `tbl_rescert`
--
ALTER TABLE `tbl_rescert`
  ADD PRIMARY KEY (`id_rescert`);

--
-- Indexes for table `tbl_resident`
--
ALTER TABLE `tbl_resident`
  ADD PRIMARY KEY (`id_resident`);

--
-- Indexes for table `tbl_services`
--
ALTER TABLE `tbl_services`
  ADD PRIMARY KEY (`id_services`);

--
-- Indexes for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_travelpermit`
--
ALTER TABLE `tbl_travelpermit`
  ADD PRIMARY KEY (`id_travel`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tmp_add_family0ca76`
--
ALTER TABLE `tmp_add_family0ca76`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family1c4b1`
--
ALTER TABLE `tmp_add_family1c4b1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family2ac23`
--
ALTER TABLE `tmp_add_family2ac23`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family2c52a`
--
ALTER TABLE `tmp_add_family2c52a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family4c46e`
--
ALTER TABLE `tmp_add_family4c46e`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family5a58a`
--
ALTER TABLE `tmp_add_family5a58a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family5be16`
--
ALTER TABLE `tmp_add_family5be16`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family7bd43`
--
ALTER TABLE `tmp_add_family7bd43`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family8dcb7`
--
ALTER TABLE `tmp_add_family8dcb7`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family9a553`
--
ALTER TABLE `tmp_add_family9a553`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family11a2c`
--
ALTER TABLE `tmp_add_family11a2c`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family40d48`
--
ALTER TABLE `tmp_add_family40d48`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family43c74`
--
ALTER TABLE `tmp_add_family43c74`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family48aac`
--
ALTER TABLE `tmp_add_family48aac`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family57b13`
--
ALTER TABLE `tmp_add_family57b13`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family85ed4`
--
ALTER TABLE `tmp_add_family85ed4`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family88c11`
--
ALTER TABLE `tmp_add_family88c11`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family95e69`
--
ALTER TABLE `tmp_add_family95e69`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family123ee`
--
ALTER TABLE `tmp_add_family123ee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family252aa`
--
ALTER TABLE `tmp_add_family252aa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family515ee`
--
ALTER TABLE `tmp_add_family515ee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family608ab`
--
ALTER TABLE `tmp_add_family608ab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family640ee`
--
ALTER TABLE `tmp_add_family640ee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family992ad`
--
ALTER TABLE `tmp_add_family992ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family9927c`
--
ALTER TABLE `tmp_add_family9927c`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family30256`
--
ALTER TABLE `tmp_add_family30256`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family39825`
--
ALTER TABLE `tmp_add_family39825`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family47949`
--
ALTER TABLE `tmp_add_family47949`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family55139`
--
ALTER TABLE `tmp_add_family55139`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family62044`
--
ALTER TABLE `tmp_add_family62044`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family62960`
--
ALTER TABLE `tmp_add_family62960`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family73079`
--
ALTER TABLE `tmp_add_family73079`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family74055`
--
ALTER TABLE `tmp_add_family74055`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_family88830`
--
ALTER TABLE `tmp_add_family88830`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familya7db0`
--
ALTER TABLE `tmp_add_familya7db0`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familya8ce3`
--
ALTER TABLE `tmp_add_familya8ce3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familya767e`
--
ALTER TABLE `tmp_add_familya767e`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familya1269`
--
ALTER TABLE `tmp_add_familya1269`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familya6251`
--
ALTER TABLE `tmp_add_familya6251`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyaeb45`
--
ALTER TABLE `tmp_add_familyaeb45`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyb82b2`
--
ALTER TABLE `tmp_add_familyb82b2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyb8051`
--
ALTER TABLE `tmp_add_familyb8051`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyb8451`
--
ALTER TABLE `tmp_add_familyb8451`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familybe74d`
--
ALTER TABLE `tmp_add_familybe74d`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyce4da`
--
ALTER TABLE `tmp_add_familyce4da`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyd26ec`
--
ALTER TABLE `tmp_add_familyd26ec`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyd78d7`
--
ALTER TABLE `tmp_add_familyd78d7`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyd6692`
--
ALTER TABLE `tmp_add_familyd6692`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyd6792`
--
ALTER TABLE `tmp_add_familyd6792`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familye0d1a`
--
ALTER TABLE `tmp_add_familye0d1a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familye0856`
--
ALTER TABLE `tmp_add_familye0856`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familye8065`
--
ALTER TABLE `tmp_add_familye8065`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyecba3`
--
ALTER TABLE `tmp_add_familyecba3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_add_familyed937`
--
ALTER TABLE `tmp_add_familyed937`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_analytics_cache`
--
ALTER TABLE `ai_analytics_cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `approval`
--
ALTER TABLE `approval`
  MODIFY `id_approval` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brgy_info`
--
ALTER TABLE `brgy_info`
  MODIFY `id_brgy_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id_system` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_activities`
--
ALTER TABLE `tbl_activities`
  MODIFY `id_activity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_announcement`
--
ALTER TABLE `tbl_announcement`
  MODIFY `id_announcement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_blotter`
--
ALTER TABLE `tbl_blotter`
  MODIFY `id_blotter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `tbl_bspermit`
--
ALTER TABLE `tbl_bspermit`
  MODIFY `id_bspermit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `tbl_clearance`
--
ALTER TABLE `tbl_clearance`
  MODIFY `id_clearance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `tbl_family_member`
--
ALTER TABLE `tbl_family_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_indigency`
--
ALTER TABLE `tbl_indigency`
  MODIFY `id_indigency` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `tbl_officials`
--
ALTER TABLE `tbl_officials`
  MODIFY `id_official` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_rescert`
--
ALTER TABLE `tbl_rescert`
  MODIFY `id_rescert` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `tbl_resident`
--
ALTER TABLE `tbl_resident`
  MODIFY `id_resident` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `tbl_services`
--
ALTER TABLE `tbl_services`
  MODIFY `id_services` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_travelpermit`
--
ALTER TABLE `tbl_travelpermit`
  MODIFY `id_travel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tmp_add_family0ca76`
--
ALTER TABLE `tmp_add_family0ca76`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family1c4b1`
--
ALTER TABLE `tmp_add_family1c4b1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family2ac23`
--
ALTER TABLE `tmp_add_family2ac23`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family2c52a`
--
ALTER TABLE `tmp_add_family2c52a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family4c46e`
--
ALTER TABLE `tmp_add_family4c46e`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family5a58a`
--
ALTER TABLE `tmp_add_family5a58a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family5be16`
--
ALTER TABLE `tmp_add_family5be16`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family7bd43`
--
ALTER TABLE `tmp_add_family7bd43`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family8dcb7`
--
ALTER TABLE `tmp_add_family8dcb7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family9a553`
--
ALTER TABLE `tmp_add_family9a553`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family11a2c`
--
ALTER TABLE `tmp_add_family11a2c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family40d48`
--
ALTER TABLE `tmp_add_family40d48`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family43c74`
--
ALTER TABLE `tmp_add_family43c74`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family48aac`
--
ALTER TABLE `tmp_add_family48aac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family57b13`
--
ALTER TABLE `tmp_add_family57b13`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family85ed4`
--
ALTER TABLE `tmp_add_family85ed4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family88c11`
--
ALTER TABLE `tmp_add_family88c11`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family95e69`
--
ALTER TABLE `tmp_add_family95e69`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family123ee`
--
ALTER TABLE `tmp_add_family123ee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family252aa`
--
ALTER TABLE `tmp_add_family252aa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family515ee`
--
ALTER TABLE `tmp_add_family515ee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family608ab`
--
ALTER TABLE `tmp_add_family608ab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family640ee`
--
ALTER TABLE `tmp_add_family640ee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family992ad`
--
ALTER TABLE `tmp_add_family992ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family9927c`
--
ALTER TABLE `tmp_add_family9927c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family30256`
--
ALTER TABLE `tmp_add_family30256`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family39825`
--
ALTER TABLE `tmp_add_family39825`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family47949`
--
ALTER TABLE `tmp_add_family47949`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family55139`
--
ALTER TABLE `tmp_add_family55139`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family62044`
--
ALTER TABLE `tmp_add_family62044`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family62960`
--
ALTER TABLE `tmp_add_family62960`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family73079`
--
ALTER TABLE `tmp_add_family73079`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family74055`
--
ALTER TABLE `tmp_add_family74055`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_family88830`
--
ALTER TABLE `tmp_add_family88830`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familya7db0`
--
ALTER TABLE `tmp_add_familya7db0`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familya8ce3`
--
ALTER TABLE `tmp_add_familya8ce3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familya767e`
--
ALTER TABLE `tmp_add_familya767e`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familya1269`
--
ALTER TABLE `tmp_add_familya1269`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familya6251`
--
ALTER TABLE `tmp_add_familya6251`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyaeb45`
--
ALTER TABLE `tmp_add_familyaeb45`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyb82b2`
--
ALTER TABLE `tmp_add_familyb82b2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyb8051`
--
ALTER TABLE `tmp_add_familyb8051`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyb8451`
--
ALTER TABLE `tmp_add_familyb8451`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familybe74d`
--
ALTER TABLE `tmp_add_familybe74d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyce4da`
--
ALTER TABLE `tmp_add_familyce4da`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyd26ec`
--
ALTER TABLE `tmp_add_familyd26ec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyd78d7`
--
ALTER TABLE `tmp_add_familyd78d7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyd6692`
--
ALTER TABLE `tmp_add_familyd6692`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyd6792`
--
ALTER TABLE `tmp_add_familyd6792`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familye0d1a`
--
ALTER TABLE `tmp_add_familye0d1a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familye0856`
--
ALTER TABLE `tmp_add_familye0856`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familye8065`
--
ALTER TABLE `tmp_add_familye8065`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyecba3`
--
ALTER TABLE `tmp_add_familyecba3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_add_familyed937`
--
ALTER TABLE `tmp_add_familyed937`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
