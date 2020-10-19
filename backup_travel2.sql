-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bintang_travel
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airlines` (
  `code_icao` varchar(3) NOT NULL DEFAULT '',
  `code_iata` varchar(2) DEFAULT NULL,
  `shortname` varchar(16) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `icon_url` varchar(50) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_icao`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlines`
--

LOCK TABLES `airlines` WRITE;
/*!40000 ALTER TABLE `airlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlines2`
--

DROP TABLE IF EXISTS `airlines2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airlines2` (
  `id` varchar(225) DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `datein` date DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlines2`
--

LOCK TABLES `airlines2` WRITE;
/*!40000 ALTER TABLE `airlines2` DISABLE KEYS */;
/*!40000 ALTER TABLE `airlines2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport` (
  `country` varchar(255) DEFAULT NULL,
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name_airport` varchar(255) DEFAULT NULL,
  `code_route` varchar(4) DEFAULT NULL,
  `airport_code` varchar(4) DEFAULT NULL,
  `id_expres` int(5) DEFAULT NULL,
  `icao` varchar(4) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `altitude` int(11) DEFAULT NULL,
  `timezone` float DEFAULT NULL,
  `dst` char(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `parent` varchar(4) DEFAULT NULL,
  `airline` varchar(4) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `from_popular` double DEFAULT 0,
  `to_popular` double DEFAULT 0,
  PRIMARY KEY (`no`) USING BTREE,
  KEY `iata` (`code_route`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport2`
--

DROP TABLE IF EXISTS `airport2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport2` (
  `country` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name_airport` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `code_route` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `airport_code` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `id_expres` int(5) DEFAULT NULL,
  `icao` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `altitude` int(11) DEFAULT NULL,
  `timezone` float DEFAULT NULL,
  `dst` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `parent` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `airline` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `Type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `from_popular` double DEFAULT 0,
  `to_popular` double DEFAULT 0,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport2`
--

LOCK TABLES `airport2` WRITE;
/*!40000 ALTER TABLE `airport2` DISABLE KEYS */;
/*!40000 ALTER TABLE `airport2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airports` (
  `airport_code` varchar(4) NOT NULL DEFAULT '',
  `airport_name` varchar(100) DEFAULT NULL,
  `airport_group` varchar(4) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `airport_type` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`airport_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `available_detail_schedule`
--

DROP TABLE IF EXISTS `available_detail_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `available_detail_schedule` (
  `available_detail_id` int(11) NOT NULL,
  `flight_class` varchar(255) NOT NULL,
  `price` double(12,2) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`available_detail_id`) USING BTREE,
  KEY `fk_available_detail` (`schedule_id`) USING BTREE,
  CONSTRAINT `fk_available_detail` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_list` (`schedule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_detail_schedule`
--

LOCK TABLES `available_detail_schedule` WRITE;
/*!40000 ALTER TABLE `available_detail_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `available_detail_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(40) NOT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_flight_list`
--

DROP TABLE IF EXISTS `booking_flight_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_flight_list` (
  `id_booking_flight_list` int(11) NOT NULL AUTO_INCREMENT,
  `booking_code` varchar(20) NOT NULL,
  `code` varchar(2) NOT NULL,
  `date_depart` date NOT NULL,
  `area_depart` varchar(20) NOT NULL,
  `flight_id` varchar(20) NOT NULL,
  `area_arrive` varchar(20) NOT NULL,
  `time_depart` varchar(11) NOT NULL,
  `time_arrive` varchar(11) NOT NULL,
  PRIMARY KEY (`id_booking_flight_list`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_flight_list`
--

LOCK TABLES `booking_flight_list` WRITE;
/*!40000 ALTER TABLE `booking_flight_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_flight_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_passenger_list`
--

DROP TABLE IF EXISTS `booking_passenger_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_passenger_list` (
  `id_booking_passenger` int(11) NOT NULL AUTO_INCREMENT,
  `booking_code` varchar(20) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `passenger_type` varchar(20) DEFAULT NULL,
  `ticket_no` varchar(20) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_booking_passenger`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_passenger_list`
--

LOCK TABLES `booking_passenger_list` WRITE;
/*!40000 ALTER TABLE `booking_passenger_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_passenger_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_result`
--

DROP TABLE IF EXISTS `booking_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_result` (
  `id_booking_result` int(11) NOT NULL AUTO_INCREMENT,
  `booking_code` varchar(20) NOT NULL,
  `time_limit` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_price` int(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `base_fare` int(20) NOT NULL,
  `tax` int(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `flight_from` varchar(5) NOT NULL,
  `flight_to` varchar(5) NOT NULL,
  PRIMARY KEY (`id_booking_result`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_result`
--

LOCK TABLES `booking_result` WRITE;
/*!40000 ALTER TABLE `booking_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) DEFAULT NULL,
  `prov_id` int(11) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `idcompany` varchar(255) DEFAULT NULL,
  `idbussinestype` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `companyaddress` varchar(255) DEFAULT NULL,
  `companyaddress2` varchar(255) DEFAULT NULL,
  `companyaddress3` varchar(255) DEFAULT NULL,
  `companyaddress4` varchar(255) DEFAULT NULL,
  `companyaddress5` varchar(255) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(255) DEFAULT NULL,
  `userin` varchar(255) DEFAULT NULL,
  `usermod` varchar(255) DEFAULT NULL,
  `datein` varchar(255) DEFAULT NULL,
  `datemod` varchar(255) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `curfinanceyear` varchar(255) DEFAULT NULL,
  `lastmonthfinanceyear` varchar(255) DEFAULT NULL,
  `conversionmonth` varchar(255) DEFAULT NULL,
  `numaccperiod` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `idlocation` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `deleted` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `config_name` varchar(20) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  PRIMARY KEY (`config_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmation`
--

DROP TABLE IF EXISTS `confirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confirmation` (
  `confirmation_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_channel_id` varchar(50) NOT NULL,
  `nomor_rekening` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `amount_paid` int(20) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `invoice_id` varchar(50) NOT NULL,
  PRIMARY KEY (`confirmation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmation`
--

LOCK TABLES `confirmation` WRITE;
/*!40000 ALTER TABLE `confirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departure`
--

DROP TABLE IF EXISTS `departure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departure` (
  `departure_id` varchar(255) DEFAULT NULL,
  `depart_name` varchar(255) DEFAULT NULL,
  `depart_desc` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deleted` varchar(255) DEFAULT NULL,
  `userin` varchar(255) DEFAULT NULL,
  `datein` varchar(255) DEFAULT NULL,
  `usermod` varchar(255) DEFAULT NULL,
  `datemod` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departure`
--

LOCK TABLES `departure` WRITE;
/*!40000 ALTER TABLE `departure` DISABLE KEYS */;
/*!40000 ALTER TABLE `departure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit_member`
--

DROP TABLE IF EXISTS `deposit_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_member` (
  `id_deposit` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `current_balance` decimal(12,2) DEFAULT NULL,
  `new_balance` decimal(12,2) DEFAULT NULL,
  `datein` date DEFAULT NULL,
  PRIMARY KEY (`id_deposit`),
  KEY `fkdeposit_user_id` (`user_id`),
  CONSTRAINT `fkdeposit_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_member`
--

LOCK TABLES `deposit_member` WRITE;
/*!40000 ALTER TABLE `deposit_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination` (
  `destination_id` varchar(255) DEFAULT NULL,
  `dest_name` varchar(255) DEFAULT NULL,
  `dest_desc` varchar(255) DEFAULT NULL,
  `region_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deleted` varchar(255) DEFAULT NULL,
  `userin` varchar(255) DEFAULT NULL,
  `datein` varchar(255) DEFAULT NULL,
  `usermod` varchar(255) DEFAULT NULL,
  `datemod` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extention`
--

DROP TABLE IF EXISTS `extention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extention` (
  `extention_id` varchar(255) DEFAULT NULL,
  `extention_name` varchar(255) DEFAULT NULL,
  `extention_desc` varchar(255) DEFAULT NULL,
  `premium` varchar(255) DEFAULT NULL,
  `suminsured` varchar(255) DEFAULT NULL,
  `items` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deleted` varchar(255) DEFAULT NULL,
  `userin` varchar(255) DEFAULT NULL,
  `datein` varchar(255) DEFAULT NULL,
  `usermod` varchar(255) DEFAULT NULL,
  `datemod` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extention`
--

LOCK TABLES `extention` WRITE;
/*!40000 ALTER TABLE `extention` DISABLE KEYS */;
/*!40000 ALTER TABLE `extention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_detail_response`
--

DROP TABLE IF EXISTS `flight_detail_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_detail_response` (
  `flight_detail_id` int(32) NOT NULL,
  `airline_code` varchar(255) DEFAULT NULL,
  `flight_number` varchar(255) DEFAULT NULL,
  `fd_depart_time` varchar(255) DEFAULT NULL,
  `fd_arrival_time` varchar(255) DEFAULT NULL,
  `fd_origin` varchar(255) DEFAULT NULL,
  `fd_destination` varchar(255) DEFAULT NULL,
  `schedule_id` int(32) DEFAULT NULL,
  PRIMARY KEY (`flight_detail_id`) USING BTREE,
  KEY `fK_flight_detail_schedule` (`schedule_id`) USING BTREE,
  CONSTRAINT `fK_flight_detail_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_list` (`schedule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_detail_response`
--

LOCK TABLES `flight_detail_response` WRITE;
/*!40000 ALTER TABLE `flight_detail_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_detail_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_schedule`
--

DROP TABLE IF EXISTS `flight_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_schedule` (
  `airlineID` varchar(2) DEFAULT NULL,
  `jiDepartTime` datetime DEFAULT NULL,
  `jiArrivalTime` datetime DEFAULT NULL,
  `category` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_schedule`
--

LOCK TABLES `flight_schedule` WRITE;
/*!40000 ALTER TABLE `flight_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakakses`
--

DROP TABLE IF EXISTS `hakakses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakakses` (
  `sys_menu_id` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `edit` varchar(255) DEFAULT NULL,
  `delete` varchar(255) DEFAULT NULL,
  `usermod` varchar(255) DEFAULT NULL,
  `datemod` varchar(255) DEFAULT NULL,
  `add` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakakses`
--

LOCK TABLES `hakakses` WRITE;
/*!40000 ALTER TABLE `hakakses` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakakses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import`
--

DROP TABLE IF EXISTS `import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import` (
  `import_id` varchar(255) DEFAULT NULL,
  `import_no` varchar(255) DEFAULT NULL,
  `userin` varchar(255) DEFAULT NULL,
  `datein` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import`
--

LOCK TABLES `import` WRITE;
/*!40000 ALTER TABLE `import` DISABLE KEYS */;
/*!40000 ALTER TABLE `import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_data`
--

DROP TABLE IF EXISTS `import_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_data` (
  `import_data_id` varchar(255) DEFAULT NULL,
  `import_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_data`
--

LOCK TABLES `import_data` WRITE;
/*!40000 ALTER TABLE `import_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginlog`
--

DROP TABLE IF EXISTS `loginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginlog` (
  `pegawainid` varchar(255) DEFAULT NULL,
  `jammasuk` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL,
  `is_referral` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `robot` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `agent_string` varchar(255) DEFAULT NULL,
  `userin` varchar(255) DEFAULT NULL,
  `usermod` varchar(255) DEFAULT NULL,
  `datein` varchar(255) DEFAULT NULL,
  `datemod` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(255) DEFAULT NULL,
  `loginlogid` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginlog`
--

LOCK TABLES `loginlog` WRITE;
/*!40000 ALTER TABLE `loginlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_city`
--

DROP TABLE IF EXISTS `master_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_city` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `id_country` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_city`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_city`
--

LOCK TABLES `master_city` WRITE;
/*!40000 ALTER TABLE `master_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_id` int(32) NOT NULL AUTO_INCREMENT,
  `member_code` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `invoice_logo` varchar(255) DEFAULT NULL,
  `photo_profile` varchar(255) DEFAULT NULL,
  `photo_card_id` varchar(255) DEFAULT NULL,
  `user_id` int(32) DEFAULT NULL,
  `user_type_id` int(32) DEFAULT NULL,
  `upline_id` int(32) DEFAULT NULL,
  `balance_deposit` decimal(12,2) DEFAULT NULL,
  `phone_number` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `fkmember_user_id` (`user_id`),
  KEY `fkmember_user_type_id` (`user_type_id`),
  CONSTRAINT `fkmember_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkmember_user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,NULL,'test@test.com','test test','test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,305,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_link` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `sort` smallint(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT 1,
  `icon` varchar(255) DEFAULT NULL,
  `display` smallint(6) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Profile','profile',0,1,1,'/assets/icons/fam/user.png',NULL,NULL),(2,'Berita Agen','news',0,2,1,'/assets/icons/fam/newspaper.png',NULL,NULL),(3,'Markup Downline','markup',0,3,1,'/assets/icons/fam/chart_curve.png',NULL,NULL),(4,'Markup Airline',NULL,3,1,1,NULL,NULL,NULL),(5,'Markup Topup&PPOB',NULL,3,2,1,NULL,NULL,NULL),(6,'Markup Kapal Laut',NULL,3,3,1,NULL,NULL,NULL),(7,'Markup Sewa Mobil',NULL,3,4,1,NULL,NULL,NULL),(8,'Markup Travel',NULL,3,5,1,NULL,NULL,NULL),(9,'Markup Bus',NULL,3,6,1,NULL,NULL,NULL),(10,'Markup Cargo',NULL,3,7,1,NULL,NULL,NULL),(11,'Accounting','accounting',0,4,1,'/assets/icons/fam/accounting.png',NULL,NULL),(12,'Mutasi',NULL,11,5,1,NULL,NULL,NULL),(13,'Depoit','deposit',0,6,1,'/assets/icons/fam/coins.png',NULL,NULL),(14,'Transaksi','transaction',0,7,1,'/assets/icons/fam/transaction.png',NULL,NULL),(15,'Transaksi Airline',NULL,14,1,1,NULL,NULL,NULL),(16,'Transaksi Topup&PPOB',NULL,14,2,1,NULL,NULL,NULL),(17,'Transaksi Kapal Laut',NULL,14,3,1,NULL,NULL,NULL),(18,'Transaksi Sewa Mobil',NULL,14,4,1,NULL,NULL,NULL),(19,'Transaksi Travel',NULL,14,5,1,NULL,NULL,NULL),(20,'Transaksi Bus',NULL,14,6,1,NULL,NULL,NULL),(21,'Transaksi Cargo',NULL,14,7,1,NULL,NULL,NULL),(22,'Laporan ','report',0,8,1,'/assets/icons/fam/business-report.png',NULL,NULL),(23,'Laporan Transaksi',NULL,22,1,1,NULL,NULL,NULL),(24,'CashBack',NULL,22,2,1,NULL,NULL,NULL),(25,'Bonus dan Komisi',NULL,22,3,1,NULL,NULL,NULL),(26,'Laporan Komisi Product',NULL,22,4,1,NULL,NULL,NULL),(27,'Daftarkan Downline','downline',0,2,1,'/assets/icons/fam/chart_organisation.png',NULL,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nation`
--

DROP TABLE IF EXISTS `nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nation` (
  `id_nation` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id_nation`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nation`
--

LOCK TABLES `nation` WRITE;
/*!40000 ALTER TABLE `nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `nation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `national_phone_code`
--

DROP TABLE IF EXISTS `national_phone_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `national_phone_code` (
  `code_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `iso_code` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `national_phone_code`
--

LOCK TABLES `national_phone_code` WRITE;
/*!40000 ALTER TABLE `national_phone_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `national_phone_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(255) DEFAULT NULL,
  `news_content` longtext DEFAULT NULL,
  `news_desc` varchar(255) DEFAULT NULL,
  `news_keyword` text DEFAULT NULL,
  `status` smallint(1) DEFAULT 1 COMMENT '1. Published 2. Draft 3. Trashed',
  `deleted` smallint(1) DEFAULT NULL,
  `userin` int(255) DEFAULT NULL,
  `datein` datetime DEFAULT NULL,
  `usermod` int(11) DEFAULT NULL,
  `datemod` datetime DEFAULT NULL,
  `news_image` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Info','AGAR BISA MENGGUNAKAN APLIKASI BINTANG WISATA TOUR TRAVEL, USER DIWAJIBKAN DEPOSIT MINIMAL 300RB. TERIMA KASIH (22 September 2019)\r\nMULAI TANGGAL 27 JANUARI DEPOSIT HANYA BISA DILAKUKAN PADA JAM 07.00 - 21.00 , DEPOSIT YANG MASUK SETELAH JAM 21 . 00 AKAN DI PROSES KE ESOKAN HARINYA. TERIMA KASIH (17 September 2019)\r\nSETELAH MELAKUKAN DEPOSIT . SEGERA KONFIRMASI KE NOMER WA 08111111752 (17 September 2019)',NULL,'info',1,NULL,NULL,NULL,NULL,NULL,NULL),(10,'Promo','SIAPA LAGI YANG MAU UNTUNG JUTAAN RUPIAH SETIAP BULANNYA? (22 September 2019)\r\nSIAPA LAGI YANG MAU UNTUNG JUTAAN RUPIAH SETIAP BULANNYA..! Wujudkan semua impian Anda dengan menjadi mitra BINTANG WISATA\r\n\r\nJangan pernah sia-siakan peluang emas ini\r\nSegera Gabung Menjadi Mitra BINTANG WISATA Sekarang Juga\r\n\r\nIni Dia Layanan Yang Bisa Membantu Anda Mendapatkan Keuntungan Jutaan Rupiah\r\nRatusan ribu BINTANG WISATA telah membuktikan, mampu menghasilkan jutaan rupiah setiap bulannya, tanpa harus mengeluarkan banyak modal.\r\n\r\nSIAPA LAGI YANG MAU UNTUNG JUTAAN RUPIAH SETIAP BULANNYA..! Wujudkan semua impian Anda dengan menjadi mitra BINTANG WISATA (22 September 2019)',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_comment`
--

DROP TABLE IF EXISTS `news_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_comment` (
  `news_comment_id` varchar(255) DEFAULT NULL,
  `news_id` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deleted` varchar(255) DEFAULT NULL,
  `userin` varchar(255) DEFAULT NULL,
  `datein` varchar(255) DEFAULT NULL,
  `usermod` varchar(255) DEFAULT NULL,
  `datemod` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_comment`
--

LOCK TABLES `news_comment` WRITE;
/*!40000 ALTER TABLE `news_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `prod_id` smallint(1) NOT NULL,
  `prod_code` varchar(2) NOT NULL DEFAULT '',
  `prod_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`prod_id`,`prod_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'F','FLIGHT'),(2,'TP','TOPUP'),(3,'PB','PPOB');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_list`
--

DROP TABLE IF EXISTS `schedule_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_list` (
  `schedule_id` int(11) NOT NULL,
  `airline_id` varchar(2) DEFAULT NULL,
  `depart_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `arrival_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `origin` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `sum_price` double(12,0) DEFAULT NULL,
  `journey_reference` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_list`
--

LOCK TABLES `schedule_list` WRITE;
/*!40000 ALTER TABLE `schedule_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `settingsid` int(11) NOT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_keywords` varchar(255) DEFAULT NULL,
  `site_lang` smallint(1) DEFAULT 1,
  `logo` varchar(255) DEFAULT NULL,
  `email_inbox` varchar(255) DEFAULT NULL,
  `materai_fee` float(12,2) DEFAULT NULL,
  `policy_fee_international` float(12,2) DEFAULT NULL,
  `policy_fee_domestic` decimal(12,2) DEFAULT NULL,
  `cs_email1` varchar(50) DEFAULT NULL,
  `cs_email2` varchar(50) DEFAULT NULL,
  `cs_phone1` varchar(50) DEFAULT NULL,
  `cs_phone2` varchar(50) DEFAULT NULL,
  `cs_phone3` varchar(50) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `min_age_extra_premi` smallint(2) DEFAULT NULL,
  `max_age_extra_premi` smallint(2) DEFAULT NULL,
  `percent_extra_premi` float(12,0) DEFAULT NULL,
  `sender_mail_address` varchar(50) DEFAULT NULL,
  `virtual_account_fee_cust` decimal(12,2) DEFAULT NULL,
  `virtual_account_fee_sni` decimal(12,2) DEFAULT NULL,
  `credit_card_fee_mdr_cust` decimal(12,1) DEFAULT NULL,
  `credit_card_fee_trx_cust` decimal(12,2) DEFAULT NULL,
  `credit_card_fee_trx_sni` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`settingsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider_image`
--

DROP TABLE IF EXISTS `slider_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slider_image` (
  `slider_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `slider_image_title` varchar(225) DEFAULT NULL,
  `slider_image_file` varchar(500) DEFAULT NULL,
  `status` smallint(1) DEFAULT 1 COMMENT '1. Active 2. Non Active',
  `deleted` smallint(1) DEFAULT 0,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `order` int(1) DEFAULT NULL,
  PRIMARY KEY (`slider_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider_image`
--

LOCK TABLES `slider_image` WRITE;
/*!40000 ALTER TABLE `slider_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `user_type_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  KEY `user_type_id` (`user_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'admin'),(2,'member');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `dateregistered` datetime DEFAULT NULL,
  `dateactivated` datetime DEFAULT NULL,
  `deleted` smallint(1) DEFAULT 0 COMMENT '1: Deleted',
  `userin` int(255) DEFAULT NULL,
  `datein` datetime DEFAULT NULL,
  `usermod` int(255) DEFAULT NULL,
  `datemod` datetime DEFAULT NULL,
  `status` smallint(1) DEFAULT 1 COMMENT '1. Active 2. Inactive 3. Blocked',
  `token_forgot_pass` varchar(255) DEFAULT NULL,
  `send_mail_status` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (305,2,'test@test.com','123','test@test.com','test','tezt','123',NULL,NULL,NULL,'2020-05-20 23:05:38',NULL,0,NULL,'2020-05-20 23:05:38',NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19 21:32:41
