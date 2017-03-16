-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 192.168.1.113    Database: koha_name
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accountlines`
--

DROP TABLE IF EXISTS `accountlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountlines` (
  `accountlines_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `accountno` smallint(6) NOT NULL DEFAULT '0',
  `itemnumber` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(28,6) DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `dispute` mediumtext COLLATE utf8_unicode_ci,
  `accounttype` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amountoutstanding` decimal(28,6) DEFAULT NULL,
  `lastincrement` decimal(28,6) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notify_id` int(11) NOT NULL DEFAULT '0',
  `notify_level` int(2) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`accountlines_id`),
  KEY `acctsborridx` (`borrowernumber`),
  KEY `timeidx` (`timestamp`),
  KEY `itemnumber` (`itemnumber`),
  CONSTRAINT `accountlines_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accountlines_ibfk_2` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountlines`
--

LOCK TABLES `accountlines` WRITE;
/*!40000 ALTER TABLE `accountlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountoffsets`
--

DROP TABLE IF EXISTS `accountoffsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountoffsets` (
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `accountno` smallint(6) NOT NULL DEFAULT '0',
  `offsetaccount` smallint(6) NOT NULL DEFAULT '0',
  `offsetamount` decimal(28,6) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `accountoffsets_ibfk_1` (`borrowernumber`),
  CONSTRAINT `accountoffsets_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountoffsets`
--

LOCK TABLES `accountoffsets` WRITE;
/*!40000 ALTER TABLE `accountoffsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountoffsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_logs`
--

DROP TABLE IF EXISTS `action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_logs` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL DEFAULT '0',
  `module` text COLLATE utf8_unicode_ci,
  `action` text COLLATE utf8_unicode_ci,
  `object` int(11) DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `interface` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `timestamp_idx` (`timestamp`),
  KEY `user_idx` (`user`),
  KEY `module_idx` (`module`(255)),
  KEY `action_idx` (`action`(255)),
  KEY `object_idx` (`object`),
  KEY `info_idx` (`info`(255)),
  KEY `interface` (`interface`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_logs`
--

LOCK TABLES `action_logs` WRITE;
/*!40000 ALTER TABLE `action_logs` DISABLE KEYS */;
INSERT INTO `action_logs` VALUES (1,'2017-03-07 12:59:14',0,'CATALOGUING','ADD',1,'biblio','intranet');
/*!40000 ALTER TABLE `action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additional_field_values`
--

DROP TABLE IF EXISTS `additional_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_record` (`field_id`,`record_id`),
  CONSTRAINT `afv_fk` FOREIGN KEY (`field_id`) REFERENCES `additional_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_field_values`
--

LOCK TABLES `additional_field_values` WRITE;
/*!40000 ALTER TABLE `additional_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `additional_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additional_fields`
--

DROP TABLE IF EXISTS `additional_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authorised_value_category` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `marcfield` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fields_uniq` (`tablename`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_fields`
--

LOCK TABLES `additional_fields` WRITE;
/*!40000 ALTER TABLE `additional_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `additional_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert` (
  `alertid` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `externalid` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`alertid`),
  KEY `borrowernumber` (`borrowernumber`),
  KEY `type` (`type`,`externalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anonymous_stats`
--

DROP TABLE IF EXISTS `anonymous_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anonymous_stats` (
  `old_issue_id` int(11) NOT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `returnbranch` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `age` int(3) DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homebranch` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`old_issue_id`),
  KEY `stats_itemidx` (`itemnumber`),
  KEY `stats_ageidx` (`age`),
  KEY `stats_sexidx` (`sex`),
  KEY `stats_zipidx` (`zipcode`),
  KEY `stats_returnbranchidx` (`returnbranch`),
  KEY `stats_homebranchidx` (`homebranch`),
  KEY `stats_catidx` (`categorycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anonymous_stats`
--

LOCK TABLES `anonymous_stats` WRITE;
/*!40000 ALTER TABLE `anonymous_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `anonymous_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbasket`
--

DROP TABLE IF EXISTS `aqbasket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbasket` (
  `basketno` int(11) NOT NULL AUTO_INCREMENT,
  `basketname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` mediumtext COLLATE utf8_unicode_ci,
  `booksellernote` mediumtext COLLATE utf8_unicode_ci,
  `contractnumber` int(11) DEFAULT NULL,
  `creationdate` date DEFAULT NULL,
  `closedate` date DEFAULT NULL,
  `booksellerid` int(11) NOT NULL DEFAULT '1',
  `authorisedby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `booksellerinvoicenumber` mediumtext COLLATE utf8_unicode_ci,
  `basketgroupid` int(11) DEFAULT NULL,
  `deliveryplace` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingplace` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_standing` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`basketno`),
  KEY `booksellerid` (`booksellerid`),
  KEY `basketgroupid` (`basketgroupid`),
  KEY `contractnumber` (`contractnumber`),
  KEY `authorisedby` (`authorisedby`),
  KEY `aqbasket_ibfk_4` (`branch`),
  CONSTRAINT `aqbasket_ibfk_1` FOREIGN KEY (`booksellerid`) REFERENCES `aqbooksellers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `aqbasket_ibfk_2` FOREIGN KEY (`contractnumber`) REFERENCES `aqcontract` (`contractnumber`),
  CONSTRAINT `aqbasket_ibfk_3` FOREIGN KEY (`basketgroupid`) REFERENCES `aqbasketgroups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `aqbasket_ibfk_4` FOREIGN KEY (`branch`) REFERENCES `branches` (`branchcode`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbasket`
--

LOCK TABLES `aqbasket` WRITE;
/*!40000 ALTER TABLE `aqbasket` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbasket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbasketgroups`
--

DROP TABLE IF EXISTS `aqbasketgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbasketgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  `booksellerid` int(11) NOT NULL,
  `deliveryplace` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `freedeliveryplace` text COLLATE utf8_unicode_ci,
  `deliverycomment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingplace` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booksellerid` (`booksellerid`),
  CONSTRAINT `aqbasketgroups_ibfk_1` FOREIGN KEY (`booksellerid`) REFERENCES `aqbooksellers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbasketgroups`
--

LOCK TABLES `aqbasketgroups` WRITE;
/*!40000 ALTER TABLE `aqbasketgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbasketgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbasketusers`
--

DROP TABLE IF EXISTS `aqbasketusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbasketusers` (
  `basketno` int(11) NOT NULL,
  `borrowernumber` int(11) NOT NULL,
  PRIMARY KEY (`basketno`,`borrowernumber`),
  KEY `aqbasketusers_ibfk_2` (`borrowernumber`),
  CONSTRAINT `aqbasketusers_ibfk_1` FOREIGN KEY (`basketno`) REFERENCES `aqbasket` (`basketno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aqbasketusers_ibfk_2` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbasketusers`
--

LOCK TABLES `aqbasketusers` WRITE;
/*!40000 ALTER TABLE `aqbasketusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbasketusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbooksellers`
--

DROP TABLE IF EXISTS `aqbooksellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbooksellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `address1` mediumtext COLLATE utf8_unicode_ci,
  `address2` mediumtext COLLATE utf8_unicode_ci,
  `address3` mediumtext COLLATE utf8_unicode_ci,
  `address4` mediumtext COLLATE utf8_unicode_ci,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accountnumber` mediumtext COLLATE utf8_unicode_ci,
  `othersupplier` mediumtext COLLATE utf8_unicode_ci,
  `currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `booksellerfax` mediumtext COLLATE utf8_unicode_ci,
  `notes` mediumtext COLLATE utf8_unicode_ci,
  `bookselleremail` mediumtext COLLATE utf8_unicode_ci,
  `booksellerurl` mediumtext COLLATE utf8_unicode_ci,
  `postal` mediumtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `listprice` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoiceprice` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gstreg` tinyint(4) DEFAULT NULL,
  `listincgst` tinyint(4) DEFAULT NULL,
  `invoiceincgst` tinyint(4) DEFAULT NULL,
  `tax_rate` decimal(6,4) DEFAULT NULL,
  `discount` float(6,4) DEFAULT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliverytime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listprice` (`listprice`),
  KEY `invoiceprice` (`invoiceprice`),
  KEY `name` (`name`(255)),
  CONSTRAINT `aqbooksellers_ibfk_1` FOREIGN KEY (`listprice`) REFERENCES `currency` (`currency`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aqbooksellers_ibfk_2` FOREIGN KEY (`invoiceprice`) REFERENCES `currency` (`currency`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbooksellers`
--

LOCK TABLES `aqbooksellers` WRITE;
/*!40000 ALTER TABLE `aqbooksellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbooksellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbudgetborrowers`
--

DROP TABLE IF EXISTS `aqbudgetborrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbudgetborrowers` (
  `budget_id` int(11) NOT NULL,
  `borrowernumber` int(11) NOT NULL,
  PRIMARY KEY (`budget_id`,`borrowernumber`),
  KEY `aqbudgetborrowers_ibfk_2` (`borrowernumber`),
  CONSTRAINT `aqbudgetborrowers_ibfk_1` FOREIGN KEY (`budget_id`) REFERENCES `aqbudgets` (`budget_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aqbudgetborrowers_ibfk_2` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbudgetborrowers`
--

LOCK TABLES `aqbudgetborrowers` WRITE;
/*!40000 ALTER TABLE `aqbudgetborrowers` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbudgetborrowers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbudgetperiods`
--

DROP TABLE IF EXISTS `aqbudgetperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbudgetperiods` (
  `budget_period_id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_period_startdate` date NOT NULL,
  `budget_period_enddate` date NOT NULL,
  `budget_period_active` tinyint(1) DEFAULT '0',
  `budget_period_description` mediumtext COLLATE utf8_unicode_ci,
  `budget_period_total` decimal(28,6) DEFAULT NULL,
  `budget_period_locked` tinyint(1) DEFAULT NULL,
  `sort1_authcat` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort2_authcat` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`budget_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbudgetperiods`
--

LOCK TABLES `aqbudgetperiods` WRITE;
/*!40000 ALTER TABLE `aqbudgetperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbudgetperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbudgets`
--

DROP TABLE IF EXISTS `aqbudgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbudgets` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_parent_id` int(11) DEFAULT NULL,
  `budget_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget_branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget_amount` decimal(28,6) DEFAULT '0.000000',
  `budget_encumb` decimal(28,6) DEFAULT '0.000000',
  `budget_expend` decimal(28,6) DEFAULT '0.000000',
  `budget_notes` mediumtext COLLATE utf8_unicode_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `budget_period_id` int(11) DEFAULT NULL,
  `sort1_authcat` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort2_authcat` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget_owner_id` int(11) DEFAULT NULL,
  `budget_permission` int(1) DEFAULT '0',
  PRIMARY KEY (`budget_id`),
  KEY `budget_parent_id` (`budget_parent_id`),
  KEY `budget_code` (`budget_code`),
  KEY `budget_branchcode` (`budget_branchcode`),
  KEY `budget_period_id` (`budget_period_id`),
  KEY `budget_owner_id` (`budget_owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbudgets`
--

LOCK TABLES `aqbudgets` WRITE;
/*!40000 ALTER TABLE `aqbudgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbudgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbudgets_planning`
--

DROP TABLE IF EXISTS `aqbudgets_planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbudgets_planning` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_id` int(11) NOT NULL,
  `budget_period_id` int(11) NOT NULL,
  `estimated_amount` decimal(28,6) DEFAULT NULL,
  `authcat` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `authvalue` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `display` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`plan_id`),
  KEY `budget_period_id` (`budget_period_id`),
  KEY `aqbudgets_planning_ifbk_1` (`budget_id`),
  CONSTRAINT `aqbudgets_planning_ifbk_1` FOREIGN KEY (`budget_id`) REFERENCES `aqbudgets` (`budget_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbudgets_planning`
--

LOCK TABLES `aqbudgets_planning` WRITE;
/*!40000 ALTER TABLE `aqbudgets_planning` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbudgets_planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqcontacts`
--

DROP TABLE IF EXISTS `aqcontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqcontacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altphone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` mediumtext COLLATE utf8_unicode_ci,
  `orderacquisition` tinyint(1) NOT NULL DEFAULT '0',
  `claimacquisition` tinyint(1) NOT NULL DEFAULT '0',
  `claimissues` tinyint(1) NOT NULL DEFAULT '0',
  `acqprimary` tinyint(1) NOT NULL DEFAULT '0',
  `serialsprimary` tinyint(1) NOT NULL DEFAULT '0',
  `booksellerid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booksellerid_aqcontacts_fk` (`booksellerid`),
  CONSTRAINT `booksellerid_aqcontacts_fk` FOREIGN KEY (`booksellerid`) REFERENCES `aqbooksellers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqcontacts`
--

LOCK TABLES `aqcontacts` WRITE;
/*!40000 ALTER TABLE `aqcontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqcontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqcontract`
--

DROP TABLE IF EXISTS `aqcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqcontract` (
  `contractnumber` int(11) NOT NULL AUTO_INCREMENT,
  `contractstartdate` date DEFAULT NULL,
  `contractenddate` date DEFAULT NULL,
  `contractname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contractdescription` mediumtext COLLATE utf8_unicode_ci,
  `booksellerid` int(11) NOT NULL,
  PRIMARY KEY (`contractnumber`),
  KEY `booksellerid_fk1` (`booksellerid`),
  CONSTRAINT `booksellerid_fk1` FOREIGN KEY (`booksellerid`) REFERENCES `aqbooksellers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqcontract`
--

LOCK TABLES `aqcontract` WRITE;
/*!40000 ALTER TABLE `aqcontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqcontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqinvoices`
--

DROP TABLE IF EXISTS `aqinvoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqinvoices` (
  `invoiceid` int(11) NOT NULL AUTO_INCREMENT,
  `invoicenumber` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `booksellerid` int(11) NOT NULL,
  `shipmentdate` date DEFAULT NULL,
  `billingdate` date DEFAULT NULL,
  `closedate` date DEFAULT NULL,
  `shipmentcost` decimal(28,6) DEFAULT NULL,
  `shipmentcost_budgetid` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoiceid`),
  KEY `aqinvoices_fk_aqbooksellerid` (`booksellerid`),
  KEY `edifact_msg_fk` (`message_id`),
  KEY `aqinvoices_fk_shipmentcost_budgetid` (`shipmentcost_budgetid`),
  CONSTRAINT `aqinvoices_fk_aqbooksellerid` FOREIGN KEY (`booksellerid`) REFERENCES `aqbooksellers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aqinvoices_fk_shipmentcost_budgetid` FOREIGN KEY (`shipmentcost_budgetid`) REFERENCES `aqbudgets` (`budget_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `edifact_msg_fk` FOREIGN KEY (`message_id`) REFERENCES `edifact_messages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqinvoices`
--

LOCK TABLES `aqinvoices` WRITE;
/*!40000 ALTER TABLE `aqinvoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqinvoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqorder_users`
--

DROP TABLE IF EXISTS `aqorder_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqorder_users` (
  `ordernumber` int(11) NOT NULL,
  `borrowernumber` int(11) NOT NULL,
  PRIMARY KEY (`ordernumber`,`borrowernumber`),
  KEY `aqorder_users_ibfk_2` (`borrowernumber`),
  CONSTRAINT `aqorder_users_ibfk_1` FOREIGN KEY (`ordernumber`) REFERENCES `aqorders` (`ordernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aqorder_users_ibfk_2` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqorder_users`
--

LOCK TABLES `aqorder_users` WRITE;
/*!40000 ALTER TABLE `aqorder_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqorder_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqorders`
--

DROP TABLE IF EXISTS `aqorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqorders` (
  `ordernumber` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` int(11) DEFAULT NULL,
  `entrydate` date DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listprice` decimal(28,6) DEFAULT NULL,
  `datereceived` date DEFAULT NULL,
  `invoiceid` int(11) DEFAULT NULL,
  `freight` decimal(28,6) DEFAULT NULL,
  `unitprice` decimal(28,6) DEFAULT NULL,
  `unitprice_tax_excluded` decimal(28,6) DEFAULT NULL,
  `unitprice_tax_included` decimal(28,6) DEFAULT NULL,
  `quantityreceived` smallint(6) NOT NULL DEFAULT '0',
  `datecancellationprinted` date DEFAULT NULL,
  `cancellationreason` text COLLATE utf8_unicode_ci,
  `order_internalnote` mediumtext COLLATE utf8_unicode_ci,
  `order_vendornote` mediumtext COLLATE utf8_unicode_ci,
  `purchaseordernumber` mediumtext COLLATE utf8_unicode_ci,
  `basketno` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rrp` decimal(13,2) DEFAULT NULL,
  `rrp_tax_excluded` decimal(28,6) DEFAULT NULL,
  `rrp_tax_included` decimal(28,6) DEFAULT NULL,
  `ecost` decimal(13,2) DEFAULT NULL,
  `ecost_tax_excluded` decimal(28,6) DEFAULT NULL,
  `ecost_tax_included` decimal(28,6) DEFAULT NULL,
  `tax_rate_bak` decimal(6,4) DEFAULT NULL,
  `tax_rate_on_ordering` decimal(6,4) DEFAULT NULL,
  `tax_rate_on_receiving` decimal(6,4) DEFAULT NULL,
  `tax_value_bak` decimal(28,6) DEFAULT NULL,
  `tax_value_on_ordering` decimal(28,6) DEFAULT NULL,
  `tax_value_on_receiving` decimal(28,6) DEFAULT NULL,
  `discount` float(6,4) DEFAULT NULL,
  `budget_id` int(11) NOT NULL,
  `budgetdate` date DEFAULT NULL,
  `sort1` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort2` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort1_authcat` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort2_authcat` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uncertainprice` tinyint(1) DEFAULT NULL,
  `claims_count` int(11) DEFAULT '0',
  `claimed_date` date DEFAULT NULL,
  `subscriptionid` int(11) DEFAULT NULL,
  `parent_ordernumber` int(11) DEFAULT NULL,
  `orderstatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT 'new',
  `line_item_id` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliers_reference_number` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliers_reference_qualifier` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliers_report` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ordernumber`),
  KEY `basketno` (`basketno`),
  KEY `biblionumber` (`biblionumber`),
  KEY `budget_id` (`budget_id`),
  KEY `parent_ordernumber` (`parent_ordernumber`),
  KEY `orderstatus` (`orderstatus`),
  KEY `aqorders_ibfk_3` (`invoiceid`),
  KEY `aqorders_subscriptionid` (`subscriptionid`),
  KEY `aqorders_currency` (`currency`),
  CONSTRAINT `aqorders_budget_id_fk` FOREIGN KEY (`budget_id`) REFERENCES `aqbudgets` (`budget_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aqorders_currency` FOREIGN KEY (`currency`) REFERENCES `currency` (`currency`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `aqorders_ibfk_1` FOREIGN KEY (`basketno`) REFERENCES `aqbasket` (`basketno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aqorders_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `aqorders_ibfk_3` FOREIGN KEY (`invoiceid`) REFERENCES `aqinvoices` (`invoiceid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `aqorders_subscriptionid` FOREIGN KEY (`subscriptionid`) REFERENCES `subscription` (`subscriptionid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqorders`
--

LOCK TABLES `aqorders` WRITE;
/*!40000 ALTER TABLE `aqorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqorders_items`
--

DROP TABLE IF EXISTS `aqorders_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqorders_items` (
  `ordernumber` int(11) NOT NULL,
  `itemnumber` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`itemnumber`),
  KEY `ordernumber` (`ordernumber`),
  CONSTRAINT `aqorders_items_ibfk_1` FOREIGN KEY (`ordernumber`) REFERENCES `aqorders` (`ordernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqorders_items`
--

LOCK TABLES `aqorders_items` WRITE;
/*!40000 ALTER TABLE `aqorders_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqorders_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqorders_transfers`
--

DROP TABLE IF EXISTS `aqorders_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqorders_transfers` (
  `ordernumber_from` int(11) DEFAULT NULL,
  `ordernumber_to` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ordernumber_from` (`ordernumber_from`),
  UNIQUE KEY `ordernumber_to` (`ordernumber_to`),
  CONSTRAINT `aqorders_transfers_ordernumber_from` FOREIGN KEY (`ordernumber_from`) REFERENCES `aqorders` (`ordernumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `aqorders_transfers_ordernumber_to` FOREIGN KEY (`ordernumber_to`) REFERENCES `aqorders` (`ordernumber`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqorders_transfers`
--

LOCK TABLES `aqorders_transfers` WRITE;
/*!40000 ALTER TABLE `aqorders_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqorders_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_requests`
--

DROP TABLE IF EXISTS `article_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `biblionumber` int(11) NOT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `author` text COLLATE utf8_unicode_ci,
  `volume` text COLLATE utf8_unicode_ci,
  `issue` text COLLATE utf8_unicode_ci,
  `date` text COLLATE utf8_unicode_ci,
  `pages` text COLLATE utf8_unicode_ci,
  `chapters` text COLLATE utf8_unicode_ci,
  `patron_notes` text COLLATE utf8_unicode_ci,
  `status` enum('PENDING','PROCESSING','COMPLETED','CANCELED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `notes` text COLLATE utf8_unicode_ci,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrowernumber` (`borrowernumber`),
  KEY `biblionumber` (`biblionumber`),
  KEY `itemnumber` (`itemnumber`),
  KEY `branchcode` (`branchcode`),
  CONSTRAINT `article_requests_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_requests_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_requests_ibfk_3` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `article_requests_ibfk_4` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_requests`
--

LOCK TABLES `article_requests` WRITE;
/*!40000 ALTER TABLE `article_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio_alerts`
--

DROP TABLE IF EXISTS `audio_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audio_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precedence` smallint(5) unsigned NOT NULL,
  `selector` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `precedence` (`precedence`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_alerts`
--

LOCK TABLES `audio_alerts` WRITE;
/*!40000 ALTER TABLE `audio_alerts` DISABLE KEYS */;
INSERT INTO `audio_alerts` VALUES (1,1,'.audio-alert-action','opening.ogg'),(2,2,'.audio-alert-warning','critical.ogg'),(3,3,'.audio-alert-success','beep.ogg');
/*!40000 ALTER TABLE `audio_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_header`
--

DROP TABLE IF EXISTS `auth_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_header` (
  `authid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authtypecode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `datecreated` date DEFAULT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `origincode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authtrees` mediumtext COLLATE utf8_unicode_ci,
  `marc` blob,
  `linkid` bigint(20) DEFAULT NULL,
  `marcxml` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`authid`),
  KEY `origincode` (`origincode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_header`
--

LOCK TABLES `auth_header` WRITE;
/*!40000 ALTER TABLE `auth_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_subfield_structure`
--

DROP TABLE IF EXISTS `auth_subfield_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_subfield_structure` (
  `authtypecode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagfield` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagsubfield` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `liblibrarian` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `libopac` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `tab` tinyint(1) DEFAULT NULL,
  `authorised_value` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value_builder` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seealso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isurl` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(3) NOT NULL DEFAULT '0',
  `linkid` tinyint(1) NOT NULL DEFAULT '0',
  `kohafield` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `frameworkcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultvalue` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`authtypecode`,`tagfield`,`tagsubfield`),
  KEY `tab` (`authtypecode`,`tab`),
  CONSTRAINT `auth_subfield_structure_ibfk_1` FOREIGN KEY (`authtypecode`) REFERENCES `auth_types` (`authtypecode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_subfield_structure`
--

LOCK TABLES `auth_subfield_structure` WRITE;
/*!40000 ALTER TABLE `auth_subfield_structure` DISABLE KEYS */;
INSERT INTO `auth_subfield_structure` VALUES ('','000','@','fixed length control field','fixed length control field',0,1,0,NULL,NULL,NULL,0,0,0,'','',NULL),('','001','@','control field','control field',0,1,0,'','','',0,0,0,'','',NULL),('','005','@','control field','control field',0,0,0,'','','',0,0,0,'','',NULL),('','015','@','ISADN','ISADN',0,0,0,'','','',0,0,0,'','',NULL),('','035','a','System Control Number','System Control Number',0,0,0,'','','',0,-5,0,'','',NULL),('','035','z','Cancelled or invalid control number','Cancelled or invalid control number',1,0,0,'','','',0,-5,0,'','',NULL),('','100','a','General Processing Data','General Processing Data',0,1,1,'','','',0,-5,0,'','',NULL),('','101','a','Language used by the Entity','Language used by the Entity',0,0,1,'','','',0,-5,0,'','',NULL),('','102','a','Country of Nationality','Country of Nationality',1,0,1,'','','',0,-5,0,'','',NULL),('','102','b','Locality','Locality',1,0,1,'','','',0,-5,0,'','',NULL),('','106','a','One Character Code','One Character Code',0,0,1,'','','',0,-5,0,'','',NULL),('','120','a','Coded data: personal names','Coded data: personal names',0,0,1,'','','',0,-5,0,'','',NULL),('','123','d','Co-ordinates: Westernmost Longitude','Co-ordinates: Westernmost Longitude',0,0,1,'','','',0,-5,0,'','',NULL),('','123','e','Co-ordinates: Easternmost Longitude','Co-ordinates: Easternmost Longitude',0,0,1,'','','',0,-5,0,'','',NULL),('','123','f','Co-ordinates: Nothernmost Latitude','Co-ordinates: Nothernmost Latitude',0,0,1,'','','',0,-5,0,'','',NULL),('','123','g','Co-ordinates: Southernmost Latitude','Co-ordinates: Southernmost Latitude',0,0,1,'','','',0,-5,0,'','',NULL),('','150','a','Name Processing Data','Name Processing Data',0,0,1,'','','',0,-5,0,'','',NULL),('','152','a','Cataloguing Rules','Cataloguing Rules',0,0,1,'','','',0,-5,0,'','',NULL),('','152','b','Subject System','Subject System',0,0,1,'','','',0,-5,0,'','',NULL),('','154','a','Title Processing Data','Title Processing Data',0,0,1,'','','',0,-5,0,'','',NULL),('','160','a','Geographic Area Code','Geographic Area Code',1,0,1,'','','',0,-5,0,'','',NULL),('','200','4','Relator Code','Relator Code',1,0,2,'','','',0,0,0,'','',NULL),('','200','7','Script','Script',0,0,2,'','','',0,0,0,'','',NULL),('','200','8','Language of Cataloguing','Language of Cataloguing',0,0,2,'','','',0,0,0,'','',NULL),('','200','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','200','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','200','c','Additions to Name Other than Dates','Additions to Name Other than Dates',0,0,2,'','','',0,0,0,'','',NULL),('','200','d','Roman Numerals','Roman Numerals',0,0,2,'','','',0,0,0,'','',NULL),('','200','f','Dates','Dates',0,0,2,'','','',0,0,0,'','',NULL),('','200','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,2,'','','',0,0,0,'','',NULL),('','200','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','200','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','200','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','200','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','210','4','Relator Code','Relator Code',1,0,2,'','','',0,0,0,'','',NULL),('','210','7','Script','Script',0,0,2,'','','',0,0,0,'','',NULL),('','210','8','Language of Cataloguing','Language of Cataloguing',0,0,2,'','','',0,0,0,'','',NULL),('','210','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','210','b','Subdivision','Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','210','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,2,'','','',0,0,0,'','',NULL),('','210','d','Number of Meeting','Number of Meeting',0,0,2,'','','',0,0,0,'','',NULL),('','210','e','Location of Meeting','Location of Meeting',0,0,2,'','','',0,0,0,'','',NULL),('','210','f','Date of Meeting','Date of Meeting',0,0,2,'','','',0,0,0,'','',NULL),('','210','g','Inverted Element','Inverted Element',0,0,2,'','','',0,0,0,'','',NULL),('','210','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,2,'','','',0,0,0,'','',NULL),('','210','j','Form Subdivision','Form Subdivision',0,0,2,'',NULL,'',0,0,0,'','',NULL),('','210','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','210','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','210','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','215','7','Script','Script',0,0,2,'','','',0,0,0,'','',NULL),('','215','8','Language of Cataloguing','Language of Cataloguing',0,0,2,'','','',0,0,0,'','',NULL),('','215','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','215','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','215','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','215','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','215','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','216','7','Script','Script',0,0,2,'','','',0,0,0,'','',NULL),('','216','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','216','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','216','c','Qualification','Qualification',1,0,2,'','','',0,0,0,'','',NULL),('','216','f','Dates','Dates',0,0,2,'','','',0,0,0,'','',NULL),('','216','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','216','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','216','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','216','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','220','4','Relator Code','Relator Code',1,0,2,'','','',0,0,0,'','',NULL),('','220','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','220','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','220','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','220','f','Dates','Dates',0,0,2,'','','',0,0,0,'','',NULL),('','220','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','220','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','220','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','220','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','230','7','Script','Script',0,0,2,'','','',0,0,0,'','',NULL),('','230','8','Language of Cataloguing','Language of Cataloguing',0,0,2,'','','',0,0,0,'','',NULL),('','230','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','230','b','General Material Designation','General Material Designation',1,0,2,'','','',0,0,0,'','',NULL),('','230','h','Number of Section or Part','Number of Section or Part',1,0,2,'','','',0,0,0,'','',NULL),('','230','i','Name of Section or Part','Name of Section or Part',1,0,2,'','','',0,0,0,'','',NULL),('','230','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','230','k','Date of Publication','Date of Publication',0,0,2,'','','',0,0,0,'','',NULL),('','230','l','Form Subheading','Form Subheading',0,0,2,'','','',0,0,0,'','',NULL),('','230','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,2,'','','',0,0,0,'','',NULL),('','230','n','Miscellaneous Information','Miscellaneous Information',0,0,2,'',NULL,'',0,0,0,'','',NULL),('','230','q','Version (or Date of Version)','Version (or Date of Version)',0,0,2,'','','',0,0,0,'','',NULL),('','230','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,2,'','','',0,0,0,'','',NULL),('','230','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,2,'','','',0,0,0,'','',NULL),('','230','u','Key (for Music)','Key (for Music)',0,0,2,'','','',0,0,0,'','',NULL),('','230','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,2,'','','',0,0,0,'','',NULL),('','230','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','230','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','230','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','235','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','235','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','235','a','Collective Uniform Title','Collective Uniform Title',0,0,2,'','','',0,0,0,'','',NULL),('','235','b','General Material Designation','General Material Designation',1,0,2,'','','',0,0,0,'','',NULL),('','235','e','Collective Uniform Subtitle','Collective Uniform Subtitle',0,0,2,'','','',0,0,0,'','',NULL),('','235','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','235','k','Date of Publication','Date of Publication',0,0,2,'','','',0,0,0,'','',NULL),('','235','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,2,'','','',0,0,0,'','',NULL),('','235','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,2,'','','',0,0,0,'','',NULL),('','235','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,2,'','','',0,0,0,'','',NULL),('','235','u','Key (for Music)','Key (for Music)',0,0,2,'','','',0,0,0,'','',NULL),('','235','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,2,'','','',0,0,0,'','',NULL),('','235','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','235','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','235','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','240','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','240','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','240','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','240','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','240','t','Title','Title',0,0,2,'','','',0,0,0,'','',NULL),('','240','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','240','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','240','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','245','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','245','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','245','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','245','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','245','t','Title','Title',0,0,2,'','','',0,0,0,'','',NULL),('','245','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','245','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','245','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','250','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','250','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','250','a','Topical Subject','Topical Subject',0,0,2,'','','',0,0,0,'','',NULL),('','250','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','250','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','250','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','250','z','Chronological Subdivision','Chronological Subdivision',0,0,2,'','','',0,0,0,'','',NULL),('','260','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','260','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','260','a','Country','Country',0,0,2,'','','',0,0,0,'','',NULL),('','260','b','State or Province, etc.','State or Province, etc.',0,0,2,'','','',0,0,0,'','',NULL),('','260','c','County','County',0,0,2,'','','',0,0,0,'','',NULL),('','260','d','City','City',0,0,2,'','','',0,0,0,'','',NULL),('','280','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','280','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'','',NULL),('','280','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'','',NULL),('','280','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','280','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','280','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','280','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'','',NULL),('','300','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'','',NULL),('','300','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'','',NULL),('','300','a','Information Note','Information Note',0,0,3,'','','',0,-5,0,'','',NULL),('','305','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'','',NULL),('','305','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'','',NULL),('','305','a','Instruction Phrase','Instruction Phrase',1,0,3,'','','',0,-5,0,'','',NULL),('','305','b','Heading Referred','Heading Referred',1,0,3,'','','',0,-5,0,'','',NULL),('','310','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'','',NULL),('','310','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'','',NULL),('','310','a','Instruction Phrase','Instruction Phrase',0,0,3,'','','',0,-5,0,'','',NULL),('','310','b','Heading Referred','Heading Referred',1,0,3,'','','',0,-5,0,'','',NULL),('','320','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'','',NULL),('','320','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'',NULL,'',0,0,0,'','',NULL),('','320','a','General Explanatory Reference Note','General Explanatory Reference Note',1,0,3,'','','',0,-5,0,'','',NULL),('','330','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'','',NULL),('','330','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'','',NULL),('','330','a','General Scope Note','General Scope Note',0,0,3,'','','',0,-5,0,'','',NULL),('','340','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'','',NULL),('','340','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'','',NULL),('','340','a','Biographical or Activity Note','Biographical or Activity Note',0,0,3,'','','',0,-5,0,'','',NULL),('','356','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'','',NULL),('','356','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'','',NULL),('','356','a','Geographical Note','Geographical Note',0,0,3,'','','',0,-5,0,'','',NULL),('','400','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','400','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','400','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','400','4','Relator Code','Relator Code',1,0,4,'','','',0,0,0,'','',NULL),('','400','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','400','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','400','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','400','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','400','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','400','c','Additions to Name Other than Dates','Additions to Name Other than Dates',0,0,4,'','','',0,0,0,'','',NULL),('','400','d','Roman Numerals','Roman Numerals',0,0,4,'','','',0,0,0,'','',NULL),('','400','f','Dates','Dates',0,0,4,'','','',0,0,0,'','',NULL),('','400','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,4,'','','',0,0,0,'','',NULL),('','400','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','400','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','400','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','400','z','Chronological Subdivision','Chronological Subdivision',0,0,4,'','','',0,0,0,'','',NULL),('','410','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','410','2','sub','sub',0,0,4,'','','',0,0,0,'','',NULL),('','410','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','410','4','Relator Code','Relator Code',1,0,4,'','','',0,0,0,'','',NULL),('','410','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','410','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','410','7','scr','scr',0,0,4,'','','',0,0,0,'','',NULL),('','410','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','410','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','410','b','Subdivision','Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','410','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,4,'','','',0,0,0,'','',NULL),('','410','d','Number of Meeting and/or Part of Meeting','Number of Meeting and/or Part of Meeting',0,0,4,'','','',0,0,0,'','',NULL),('','410','e','Location of Meeting','Location of Meeting',0,0,4,'','','',0,0,0,'','',NULL),('','410','f','Date of Meeting','Date of Meeting',0,0,4,'','','',0,0,0,'','',NULL),('','410','g','Inverted Element','Inverted Element',0,0,4,'','','',0,0,0,'','',NULL),('','410','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,4,'','','',0,0,0,'','',NULL),('','410','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','410','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','410','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','410','z','Chronological Subdivision','Chronological Subdivision',0,0,4,'','','',0,0,0,'','',NULL),('','415','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','415','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','415','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','415','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','415','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','415','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','415','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','415','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','415','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','415','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','415','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','415','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','416','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','416','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','416','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','416','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','416','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','416','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','416','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','416','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','416','c','Qualification','Qualification',1,0,4,'','','',0,0,0,'','',NULL),('','416','f','Dates','Dates',0,0,4,'','','',0,0,0,'','',NULL),('','416','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','416','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','416','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','416','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','420','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','420','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','420','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','420','4','Relator Code','Relator Code',1,0,4,'','','',0,0,0,'','',NULL),('','420','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','420','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','420','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','420','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'',NULL,'',0,0,0,'','',NULL),('','420','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','420','f','Dates','Dates',0,0,4,'','','',0,0,0,'','',NULL),('','420','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','420','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','420','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','420','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','430','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','430','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','430','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','430','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','430','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','430','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','430','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','430','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','430','b','General Material Designation','General Material Designation',1,0,4,'','','',0,0,0,'','',NULL),('','430','h','Number of Section or Part','Number of Section or Part',1,0,4,'','','',0,0,0,'','',NULL),('','430','i','Name of Section or Part','Name of Section or Part',1,0,4,'','','',0,0,0,'','',NULL),('','430','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','430','k','Date of Publication','Date of Publication',0,0,4,'','','',0,0,0,'','',NULL),('','430','l','Form Subheading','Form Subheading',0,0,4,'','','',0,0,0,'','',NULL),('','430','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,4,'','','',0,0,0,'','',NULL),('','430','n','Miscellaneous Information','Miscellaneous Information',0,0,4,'','','',0,0,0,'','',NULL),('','430','q','Version (or Date of Version)','Version (or Date of Version)',0,0,4,'','','',0,0,0,'','',NULL),('','430','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,4,'','','',0,0,0,'','',NULL),('','430','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,4,'','','',0,0,0,'','',NULL),('','430','u','Key (for Music)','Key (for Music)',0,0,4,'','','',0,0,0,'','',NULL),('','430','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,4,'','','',0,0,0,'','',NULL),('','430','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','430','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','430','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','440','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','440','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','440','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','440','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','440','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','440','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','440','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','440','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','440','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','440','t','Title','Title',0,0,4,'','','',0,0,0,'','',NULL),('','440','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','440','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','440','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','445','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','445','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','445','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','445','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','445','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','445','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','445','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','445','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','445','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','445','t','Title','Title',0,0,4,'','','',0,0,0,'','',NULL),('','445','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','445','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','445','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','450','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','450','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','450','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','450','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','450','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','450','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','450','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','450','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','450','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','450','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','450','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','450','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','460','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','460','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','460','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','460','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','460','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','460','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','460','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','460','a','Country','Country',0,0,4,'','','',0,0,0,'','',NULL),('','460','b','State or Province, etc.','State or Province, etc.',0,0,4,'','','',0,0,0,'','',NULL),('','460','c','Country','Country',0,0,4,'','','',0,0,0,'','',NULL),('','460','d','City','City',0,0,4,'','','',0,0,0,'','',NULL),('','480','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'','',NULL),('','480','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'','',NULL),('','480','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'','',NULL),('','480','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'','',NULL),('','480','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'','',NULL),('','480','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','480','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'','',NULL),('','480','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'','',NULL),('','480','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','480','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','480','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','480','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'','',NULL),('','500','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','500','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','500','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','500','4','Relator Code','Relator Code',1,0,5,'','','',0,0,0,'','',NULL),('','500','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','500','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','500','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','500','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','500','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','500','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','500','c','Additions to Name Other than Dates','Additions to Name Other than Dates',1,0,5,'','','',0,0,0,'','',NULL),('','500','d','Roman Numerals','Roman Numerals',0,0,5,'','','',0,0,0,'','',NULL),('','500','f','Dates','Dates',0,0,5,'','','',0,0,0,'','',NULL),('','500','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,5,'','','',0,0,0,'','',NULL),('','500','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','500','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','500','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','500','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','510','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','510','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','510','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','510','4','Relator Code','Relator Code',1,0,5,'','','',0,0,0,'','',NULL),('','510','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','510','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','510','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','510','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','510','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','510','b','Subdivision','Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','510','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,5,'','','',0,0,0,'','',NULL),('','510','d','Number of Meeting and/or Part of Meeting','Number of Meeting and/or Part of Meeting',0,0,5,'','','',0,0,0,'','',NULL),('','510','e','Location of Meeting','Location of Meeting',0,0,5,'','','',0,0,0,'','',NULL),('','510','f','Date of Meeting','Date of Meeting',0,0,5,'','','',0,0,0,'','',NULL),('','510','g','Inverted Element','Inverted Element',0,0,5,'','','',0,0,0,'','',NULL),('','510','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,5,'','','',0,0,0,'','',NULL),('','510','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','510','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','510','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','510','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','515','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','515','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','515','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','515','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','515','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','515','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','515','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','515','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','515','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','515','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','515','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','516','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','516','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','516','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','516','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','516','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','516','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','516','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','516','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','516','c','Qualification','Qualification',1,0,5,'','','',0,0,0,'','',NULL),('','516','f','Dates','Dates',0,0,5,'','','',0,0,0,'','',NULL),('','516','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','516','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','516','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','516','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','520','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','520','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','520','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','520','4','Relator Code','Relator Code',1,0,5,'','','',0,0,0,'','',NULL),('','520','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','520','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','520','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','520','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','520','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','520','f','Dates','Dates',0,0,5,'','','',0,0,0,'','',NULL),('','520','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','520','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','520','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','520','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','530','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','530','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','530','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','530','5','tra','tra',0,0,5,'','','',0,0,0,'','',NULL),('','530','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','530','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','530','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','530','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','530','b','General Material Designation','General Material Designation',1,0,5,'','','',0,0,0,'','',NULL),('','530','h','Number of Section or Part','Number of Section or Part',0,0,5,'','','',0,0,0,'','',NULL),('','530','i','Name of Section or Part','Name of Section or Part',1,0,5,'','','',0,0,0,'','',NULL),('','530','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','530','k','Date de Publication','Date de Publication',0,0,5,'','','',0,0,0,'','',NULL),('','530','l','Form Subheading','Form Subheading',0,0,5,'','','',0,0,0,'','',NULL),('','530','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,5,'','','',0,0,0,'','',NULL),('','530','n','Miscellaneous Information','Miscellaneous Information',1,0,5,'','','',0,0,0,'','',NULL),('','530','q','Version (or Date of Version)','Version (or Date of Version)',0,0,5,'','','',0,0,0,'','',NULL),('','530','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,5,'','','',0,0,0,'','',NULL),('','530','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,5,'','','',0,0,0,'','',NULL),('','530','u','Key (for Music)','Key (for Music)',0,0,5,'','','',0,0,0,'','',NULL),('','530','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,5,'','','',0,0,0,'','',NULL),('','530','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','530','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','530','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','540','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','540','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','540','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','540','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','540','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','540','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','540','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','540','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','540','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','540','t','Title','Title',0,0,5,'','','',0,0,0,'','',NULL),('','540','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','540','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','540','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','545','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','545','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','545','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','545','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','545','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','545','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','545','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','545','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','545','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','545','t','Title','Title',0,0,5,'','','',0,0,0,'','',NULL),('','545','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','545','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','545','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','550','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','550','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','550','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','550','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','550','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','550','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','550','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','550','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','550','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','550','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','550','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','550','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','560','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','560','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','560','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','560','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','560','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','560','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','560','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','560','a','Country','Country',0,0,5,'','','',0,0,0,'','',NULL),('','560','b','State or Province, etc.','State or Province, etc.',0,0,5,'','','',0,0,0,'','',NULL),('','560','c','County','County',0,0,5,'','','',0,0,0,'','',NULL),('','560','d','City','City',0,0,5,'','','',0,0,0,'','',NULL),('','580','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'','',NULL),('','580','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'','',NULL),('','580','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'','',NULL),('','580','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'','',NULL),('','580','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'','',NULL),('','580','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','580','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'','',NULL),('','580','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'','',NULL),('','580','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','580','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','580','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','580','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'','',NULL),('','675','3','Authority Code Number (Link to Classification Format)','Authority Code Number (Link to Classification Format)',0,0,6,'','','',0,-5,0,'','',NULL),('','675','a','UDC Number, Single or Beginning of a Range','UDC Number, Single or Beginning of a Range',0,0,6,'','','',0,-5,0,'','',NULL),('','675','b','UDC Number, End of a Range','UDC Number, End of a Range',0,0,6,'','','',0,-5,0,'','',NULL),('','675','c','Explanatory Terms','Explanatory Terms',0,0,6,'','','',0,-5,0,'','',NULL),('','675','v','UDC Edition','UDC Edition',0,0,6,'','','',0,-5,0,'','',NULL),('','675','z','Language of Edition','Language of Edition',0,0,6,'','','',0,-5,0,'','',NULL),('','676','3','Authority Code Number (Link to Classification Format)','Authority Code Number (Link to Classification Format)',0,0,6,'','','',0,-5,0,'','',NULL),('','676','a','DDC Number, Single or Beginning of a Range','DDC Number, Single or Beginning of a Range',0,0,6,'','','',0,-5,0,'','',NULL),('','676','b','DDC Number, End of a Range','DDC Number, End of a Range',0,0,6,'','','',0,-5,0,'','',NULL),('','676','c','Explanatory Terms','Explanatory Terms',0,0,6,'','','',0,-5,0,'','',NULL),('','676','v','DDC Edition','DDC Edition',0,0,6,'','','',0,-5,0,'','',NULL),('','676','z','Language of Edition','Language of Edition',0,0,6,'','','',0,-5,0,'','',NULL),('','680','3','Authority Code Number (Link to Classification Format)','Authority Code Number (Link to Classification Format)',0,0,6,'','','',0,-5,0,'','',NULL),('','680','a','LC Number, Single or Beginning of a Range','LC Number, Single or Beginning of a Range',0,0,6,'','','',0,-5,0,'','',NULL),('','680','b','LC Number, End of a Range','LC Number, End of a Range',0,0,6,'','','',0,-5,0,'','',NULL),('','680','c','Explanatory Terms','Explanatory Terms',0,0,6,'','','',0,-5,0,'','',NULL),('','686','2','Subject System Code','Subject System Code',0,0,6,'',NULL,'',0,0,0,'','',NULL),('','686','a','Class Number, Single or Beginning of a Range','Class Number, Single or Beginning of a Range',0,0,6,'','','',0,-5,0,'','',NULL),('','686','b','Class Number, End of a Range','Class Number, End of a Range',0,0,6,'','','',0,-5,0,'','',NULL),('','686','c','Explanatory Terms','Explanatory Terms',0,0,6,'','','',0,-5,0,'','',NULL),('','700','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','700','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','700','4','Relator Code','Relator Code',1,0,7,'','','',0,-5,0,'','',NULL),('','700','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','700','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','700','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','700','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','700','c','Additions to Name Other than Dates','Additions to Name Other than Dates',0,0,7,'','','',0,-5,0,'','',NULL),('','700','d','Roman Numerals','Roman Numerals',0,0,7,'','','',0,-5,0,'','',NULL),('','700','f','Dates','Dates',0,0,7,'','','',0,-5,0,'','',NULL),('','700','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,7,'','','',0,-5,0,'','',NULL),('','700','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','700','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','700','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','700','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','710','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','710','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','710','4','Relator Code','Relator Code',1,0,7,'','','',0,-5,0,'','',NULL),('','710','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','710','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','710','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','710','b','Subdivision','Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','710','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,7,'','','',0,-5,0,'','',NULL),('','710','d','Number of Meeting and/or Part of Meeting','Number of Meeting and/or Part of Meeting',0,0,7,'','','',0,-5,0,'','',NULL),('','710','e','Location of Meeting','Location of Meeting',0,0,7,'','','',0,-5,0,'','',NULL),('','710','f','Date of Meeting','Date of Meeting',0,0,7,'','','',0,-5,0,'','',NULL),('','710','g','Inverted Element','Inverted Element',0,0,7,'','','',0,-5,0,'','',NULL),('','710','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,7,'','','',0,-5,0,'','',NULL),('','710','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','710','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','710','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','710','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','715','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','715','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','715','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','715','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','715','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','715','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','715','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','715','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','715','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','716','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','716','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','716','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','716','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','716','a','Entry Element (Data Element)','Entry Element (Data Element)',0,0,7,'','','',0,-5,0,'','',NULL),('','716','c','Qualification','Qualification',1,0,7,'','','',0,-5,0,'','',NULL),('','716','f','Dates','Dates',0,0,7,'','','',0,-5,0,'','',NULL),('','716','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','716','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','716','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','716','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','720','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','720','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','720','4','Relator Code','Relator Code',1,0,7,'','','',0,-5,0,'','',NULL),('','720','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','720','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','720','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','720','f','Dates','Dates',0,0,7,'','','',0,-5,0,'','',NULL),('','720','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','720','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','720','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','720','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','730','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','730','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','730','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','730','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','730','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','730','b','General Material Designation','General Material Designation',1,0,7,'','','',0,-5,0,'','',NULL),('','730','h','Number of Section or Part','Number of Section or Part',1,0,7,'','','',0,-5,0,'','',NULL),('','730','i','Name of Section or Part','Name of Section or Part',1,0,7,'','','',0,-5,0,'','',NULL),('','730','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','730','k','Date of Publication','Date of Publication',0,0,7,'','','',0,-5,0,'','',NULL),('','730','l','Form Subheading','Form Subheading',0,0,7,'','','',0,-5,0,'','',NULL),('','730','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,7,'','','',0,-5,0,'','',NULL),('','730','n','Miscellaneous Information','Miscellaneous Information',0,0,7,'','','',0,-5,0,'','',NULL),('','730','q','Version (or Date of Version)','Version (or Date of Version)',0,0,7,'','','',0,-5,0,'','',NULL),('','730','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,7,'','','',0,-5,0,'','',NULL),('','730','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,7,'','','',0,-5,0,'','',NULL),('','730','u','Key (for Music)','Key (for Music)',0,0,7,'','','',0,-5,0,'','',NULL),('','730','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,7,'','','',0,-5,0,'','',NULL),('','730','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','730','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','730','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','740','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','740','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','740','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','740','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','740','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','740','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','740','t','Title','Title',0,0,7,'','','',0,-5,0,'','',NULL),('','740','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','740','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','740','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','745','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','745','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','745','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','745','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','745','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','745','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','745','t','Title','Title',0,0,7,'','','',0,-5,0,'','',NULL),('','745','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','745','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','745','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','750','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','750','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','750','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','750','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','750','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','750','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','750','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','750','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','750','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','760','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','760','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','760','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','760','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','760','a','Country','Country',0,0,7,'','','',0,-5,0,'','',NULL),('','760','b','State or Province, etc.','State or Province, etc.',0,0,7,'','','',0,-5,0,'','',NULL),('','760','c','County','County',0,0,7,'','','',0,-5,0,'','',NULL),('','760','d','City','City',0,0,7,'','','',0,-5,0,'','',NULL),('','780','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'','',NULL),('','780','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'','',NULL),('','780','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','780','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'','',NULL),('','780','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'','',NULL),('','780','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','780','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','780','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'','',NULL),('','780','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'','',NULL),('','801','a','Country','Country',0,0,8,'','','',0,-5,0,'','',NULL),('','801','b','Agency','Agency',0,0,8,'','','',0,-5,0,'','',NULL),('','801','c','Date of Latest Transaction','Date of Latest Transaction',0,0,8,'','','',0,-5,0,'','',NULL),('','810','a','Citation','Citation',0,0,8,'','','',0,-5,0,'','',NULL),('','810','b','Information Found','Information Found',0,0,8,'','','',0,-5,0,'','',NULL),('','815','a','Citation','Citation',1,0,8,'','','',0,-5,0,'','',NULL),('','820','a','Note Text','Note Text',1,0,8,'','','',0,-5,0,'','',NULL),('','825','a','Note Text','Note Text',0,0,8,'','','',0,-5,0,'','',NULL),('','830','a','Note Text','Note Text',1,0,8,'','','',0,-5,0,'','',NULL),('','835','a','Note Text','Note Text',1,0,8,'','','',0,-5,0,'','',NULL),('','835','b','Replacement Heading','Replacement Heading',0,0,8,'','','',0,-5,0,'','',NULL),('','835','d','Date of the Transaction','Date of the Transaction',0,0,8,'','','',0,-5,0,'','',NULL),('','836','b','Replaced Heading','Replaced Heading',0,0,8,'','','',0,-5,0,'','',NULL),('','836','d','Date of the Transaction','Date of the Transaction',0,0,8,'','','',0,-5,0,'','',NULL),('','856','a','Host Name','Host Name',1,0,8,'','','',0,-5,0,'','',NULL),('','856','b','Access Number','Access Number',1,0,8,'','','',0,-5,0,'','',NULL),('','856','c','Compression Information','Compression Information',1,0,8,'','','',0,-5,0,'','',NULL),('','856','d','Path','Path',1,0,8,'','','',0,-5,0,'','',NULL),('','856','e','Date and Hour of Consultation and Access (YYYMMDDHHMM)','Date and Hour of Consultation and Access (YYYMMDDHHMM)',0,0,8,'','','',0,-5,0,'','',NULL),('','856','f','Electronic Name','Electronic Name',1,0,8,'','','',0,-5,0,'','',NULL),('','856','g','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,8,'','','',0,-5,0,'','',NULL),('','856','h','Processor of Request','Processor of Request',0,0,8,'','','',0,-5,0,'','',NULL),('','856','i','Instruction','Instruction',1,0,8,'','','',0,-5,0,'','',NULL),('','856','j','Bits per Second','Bits per Second',0,0,8,'','','',0,-5,0,'','',NULL),('','856','k','Password','Password',0,0,8,'','','',0,-5,0,'','',NULL),('','856','l','Login/Logoff','Login/Logoff',0,0,8,'','','',0,-5,0,'','',NULL),('','856','m','Contact for Access Assistance','Contact for Access Assistance',1,0,8,'','','',0,-5,0,'','',NULL),('','856','n','Name of Location of Host in Subfield $a','Name of Location of Host in Subfield $a',0,0,8,'','','',0,-5,0,'','',NULL),('','856','o','Operating System','Operating System',0,0,8,'','','',0,-5,0,'','',NULL),('','856','p','Port','Port',0,0,8,'','','',0,-5,0,'','',NULL),('','856','q','Electronic Format Type','Electronic Format Type',0,0,8,'','','',0,-5,0,'','',NULL),('','856','r','Settings','Settings',0,0,8,'','','',0,-5,0,'','',NULL),('','856','s','File Size','File Size',1,0,8,'','','',0,-5,0,'','',NULL),('','856','t','Terminal Emulation','Terminal Emulation',1,0,8,'','','',0,-5,0,'','',NULL),('','856','u','Uniform Address Locator (URL)','Uniform Address Locator (URL)',0,0,8,'','','',0,-5,0,'','',NULL),('','856','v','Hours Access Method Available','Hours Access Method Available',1,0,8,'','','',0,-5,0,'','',NULL),('','856','w','Record Control Number','Record Control Number',1,0,8,'','','',0,-5,0,'','',NULL),('','856','x','Nonpublic Note','Nonpublic Note',0,0,8,'','','',0,-5,0,'','',NULL),('','856','y','Access Method','Access Method',0,0,8,'','','',0,-5,0,'','',NULL),('','856','z','Public Note','Public Note',1,0,8,'','','',0,-5,0,'','',NULL),('','886','2','System Code','System Code',0,0,8,'','','',0,-5,0,'','',NULL),('','886','a','Tag of the Source Format Field','Tag of the Source Format Field',1,0,8,'','','',0,-5,0,'','',NULL),('','886','b','Indicators and Subfields of the Source Format Field','Indicators and Subfields of the Source Format Field',1,0,8,'','','',0,-5,0,'','',NULL);
/*!40000 ALTER TABLE `auth_subfield_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_tag_structure`
--

DROP TABLE IF EXISTS `auth_tag_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_tag_structure` (
  `authtypecode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagfield` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `liblibrarian` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `libopac` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `authorised_value` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`authtypecode`,`tagfield`),
  CONSTRAINT `auth_tag_structure_ibfk_1` FOREIGN KEY (`authtypecode`) REFERENCES `auth_types` (`authtypecode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tag_structure`
--

LOCK TABLES `auth_tag_structure` WRITE;
/*!40000 ALTER TABLE `auth_tag_structure` DISABLE KEYS */;
INSERT INTO `auth_tag_structure` VALUES ('','000','Record Label','Record Label',0,1,NULL),('','001','Record Identifier','Record Identifier',0,1,''),('','005','Version Identifier','Version Identifier',0,0,''),('','015','International Standard Authority Data Number (ISADN)','International Standard Authority Data Number (ISADN)',0,0,''),('','035','Other System Control Number','Other System Control Number',0,0,''),('','100','General Processing Data','General Processing Data',0,1,''),('','101','Language of the Entity','Language of the Entity',0,0,''),('','102','Nationality of the Entity','Nationality of the Entity',0,0,''),('','106','Coded Data Field: Personal/Coroprate/Family Name/Trademark Used as Subject Heading','Coded Data Field: Personal/Coroprate/Family Name/Trademark Used as Subject Heading',0,0,''),('','120','Coded Data Field: Personal Name','Coded Data Field: Personal Name',0,0,''),('','123','Coded Data Field: Territorial or Geographical Name','Coded Data Field: Territorial or Geographical Name',1,0,''),('','150','Coded Data Field: Corporate Name','Coded Data Field: Corporate Name',0,0,''),('','152','Rules','Rules',0,0,''),('','154','Coded Data Field: Uniform Titles','Coded Data Field: Uniform Titles',0,0,''),('','160','Geographic Area Code','Geographic Area Code',0,0,''),('','200','Heading - Personal Name','Heading - Personal Name',1,0,''),('','210','Heading - Corporate Body Name','Heading - Corporate Body Name',1,0,''),('','215','Heading - Territorial or Geographical Name','Heading - Territorial or Geographical Name',1,0,''),('','216','Heading - Trademark','Heading - Trademark',1,0,''),('','220','Heading - Family Name','Heading - Family Name',1,0,''),('','230','Heading - Uniform Title','Heading - Uniform Title',1,0,''),('','235','Heading - Collective Uniform Title','Heading - Collective Uniform Title',0,0,''),('','240','Heading - Name/Title','Heading - Name/Title',1,0,''),('','245','Heading - Name/Collective Uniform Title','Heading - Name/Collective Uniform Title',0,0,''),('','250','Heading - Topical Subject','Heading - Topical Subject',1,0,''),('','260','Heading - Place Access','Heading - Place Access',1,0,''),('','280','Heading - Form, Genre or Physical Characteristics','Heading - Form, Genre or Physical Characteristics',0,0,''),('','300','Information Note','Information Note',1,0,''),('','305','Textual See Also Reference Note','Textual See Also Reference Note',1,0,''),('','310','Textual See Reference Note','Textual See Reference Note',1,0,''),('','320','General Explanatory Reference Note','General Explanatory Reference Note',1,0,''),('','330','General Scope Note','General Scope Note',1,0,''),('','340','Biography and Activity Note','Biography and Activity Note',1,0,''),('','356','Geographical Note','Geographical Note',0,0,''),('','400','See Reference Tracing - Personal Name','See Reference Tracing - Personal Name',0,0,''),('','410','See Reference Tracing - Corporate Body Name','See Reference Tracing - Corporate Body Name',1,0,''),('','415','See Reference Tracing - Territorial or Geographical Name','See Reference Tracing - Territorial or Geographical Name',0,0,''),('','416','See Reference Tracing - Trademark','See Reference Tracing - Trademark',1,0,''),('','420','See Reference Tracing - Family Name','See Reference Tracing - Family Name',1,0,''),('','430','See Reference Tracing - Uniform Title','See Reference Tracing - Uniform Title',1,0,''),('','440','See Reference Tracing - Name/Title','See Reference Tracing - Name/Title',0,0,''),('','445','See Reference Tracing - Name/Collective Uniform Title','See Reference Tracing - Name/Collective Uniform Title',1,0,''),('','450','See Reference Tracing - Topical Subject','See Reference Tracing - Topical Subject',1,0,''),('','460','See Reference Tracing - Place Access','See Reference Tracing - Place Access',1,0,''),('','480','See Reference Tracing - Form Genre or Physical Characteristics','See Reference Tracing - Form Genre or Physical Characteristics',0,0,''),('','500','See Also Reference Tracing - Personal Name','See Also Reference Tracing - Personal Name',1,0,''),('','510','See Also Reference Tracing - Corporate Body Name','See Also Reference Tracing - Corporate Body Name',1,0,''),('','515','See Also Reference Tracing - Territorial or Geographical Name','See Also Reference Tracing - Territorial or Geographical Name',1,0,''),('','516','See Also Reference Tracing - Trademark','See Also Reference Tracing - Trademark',1,0,''),('','520','See Also Reference Tracing - Family Name','See Also Reference Tracing - Family Name',1,0,''),('','530','See Also Reference Tracing - Uniform Title','See Also Reference Tracing - Uniform Title',1,0,''),('','540','See Also Reference Tracing - Name/Title','See Also Reference Tracing - Name/Title',1,0,''),('','545','See Also Reference Tracing - Name/Collective Uniform Title','See Also Reference Tracing - Name/Collective Uniform Title',1,0,''),('','550','See Also Reference Tracing - Topical Subject','See Also Reference Tracing - Topical Subject',1,0,''),('','560','See Also Reference Tracing - Place Access','See Also Reference Tracing - Place Access',1,0,''),('','580','See Also Reference Tracing - Form, Genre or Physical Characteristics','See Also Reference Tracing - Form, Genre or Physical Characteristics',1,0,''),('','675','Universal Decimal Classification (UDC)','Universal Decimal Classification (UDC)',1,0,''),('','676','Dewey Decimal Classification (DDC)','Dewey Decimal Classification (DDC)',1,0,''),('','680','Library of Congress Classification (LCC)','Library of Congress Classification (LCC)',1,0,''),('','686','Other Classification Numbers','Other Classification Numbers',1,0,''),('','700','Linking Heading - Personal Name','Linking Heading - Personal Name',1,0,''),('','710','Linking Heading - Corporate Body Name','Linking Heading - Corporate Body Name',1,0,''),('','715','Linking Heading - Territorial or Geographical Name','Linking Heading - Territorial or Geographical Name',1,0,''),('','716','Linking Heading - Trademark','Linking Heading - Trademark',1,0,''),('','720','Linking Heading - Family Name','Linking Heading - Family Name',1,0,''),('','730','Linking Heading - Uniform Title','Linking Heading - Uniform Title',1,0,''),('','740','Linking Heading - Name/title','Linking Heading - Name/title',1,0,''),('','745','Linking Heading - Name/Collective Uniform Title','Linking Heading - Name/Collective Uniform Title',1,0,''),('','750','Linking Heading - Topical Subject','Linking Heading - Topical Subject',1,0,''),('','760','Linking Heading - Place Access','Linking Heading - Place Access',1,0,''),('','780','Linking Heading - Form, Genre or Physical Characteristics','Linking Heading - Form, Genre or Physical Characteristics',1,0,''),('','801','Originating Source','Originating Source',0,0,''),('','810','Source Data Found','Source Data Found',1,0,''),('','815','Source Data Not Found','Source Data Not Found',0,0,''),('','820','Usage or Scope Information','Usage or Scope Information',1,0,''),('','825','Example Under Note','Example Under Note',1,0,''),('','830','General Cataloguer&#039s Note','General Cataloguer&#039s Note',1,0,''),('','835','Deleted Heading Information','Deleted Heading Information',1,0,''),('','836','Replaced Heading Information','Replaced Heading Information',1,0,''),('','856','Electronic Location and Access','Electronic Location and Access',1,0,''),('','886','Data Not Connected From Source Format','Data Not Connected From Source Format',1,0,'');
/*!40000 ALTER TABLE `auth_tag_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_types`
--

DROP TABLE IF EXISTS `auth_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_types` (
  `authtypecode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authtypetext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `auth_tag_to_report` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`authtypecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_types`
--

LOCK TABLES `auth_types` WRITE;
/*!40000 ALTER TABLE `auth_types` DISABLE KEYS */;
INSERT INTO `auth_types` VALUES ('','Default','','');
/*!40000 ALTER TABLE `auth_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorised_value_categories`
--

DROP TABLE IF EXISTS `authorised_value_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorised_value_categories` (
  `category_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorised_value_categories`
--

LOCK TABLES `authorised_value_categories` WRITE;
/*!40000 ALTER TABLE `authorised_value_categories` DISABLE KEYS */;
INSERT INTO `authorised_value_categories` VALUES (''),('Asort1'),('Asort2'),('BOR_NOTES'),('branches'),('Bsort1'),('Bsort2'),('CAND'),('CCODE'),('cn_source'),('COUNTRY'),('DAMAGED'),('DEPARTMENT'),('ETAT'),('HINGS_AS'),('HINGS_C'),('HINGS_PF'),('HINGS_RD'),('HINGS_UT'),('HSBND_FREQ'),('ITEMTYPECAT'),('itemtypes'),('LANG'),('LOC'),('LOST'),('MANUAL_INV'),('NOT_LOAN'),('OPAC_SUG'),('ORDER_CANCELLATION_REASON'),('qualif'),('RELTERMS'),('REPORT_GROUP'),('REPORT_SUBGROUP'),('RESTRICTED'),('SIP_MEDIA_TYPE'),('STACK'),('SUGGEST'),('SUGGEST_FORMAT'),('SUGGEST_STATUS'),('TERM'),('WITHDRAWN'),('YES_NO');
/*!40000 ALTER TABLE `authorised_value_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorised_values`
--

DROP TABLE IF EXISTS `authorised_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorised_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `authorised_value` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lib` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lib_opac` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageurl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`category`),
  KEY `lib` (`lib`),
  KEY `auth_value_idx` (`authorised_value`),
  CONSTRAINT `authorised_values_authorised_values_category` FOREIGN KEY (`category`) REFERENCES `authorised_value_categories` (`category_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorised_values`
--

LOCK TABLES `authorised_values` WRITE;
/*!40000 ALTER TABLE `authorised_values` DISABLE KEYS */;
INSERT INTO `authorised_values` VALUES (1,'HSBND_FREQ','EW','Every week',NULL,NULL),(2,'LOST','1','Perdido',NULL,'');
/*!40000 ALTER TABLE `authorised_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorised_values_branches`
--

DROP TABLE IF EXISTS `authorised_values_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorised_values_branches` (
  `av_id` int(11) NOT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  KEY `av_id` (`av_id`),
  KEY `branchcode` (`branchcode`),
  CONSTRAINT `authorised_values_branches_ibfk_1` FOREIGN KEY (`av_id`) REFERENCES `authorised_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `authorised_values_branches_ibfk_2` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorised_values_branches`
--

LOCK TABLES `authorised_values_branches` WRITE;
/*!40000 ALTER TABLE `authorised_values_branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorised_values_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblio`
--

DROP TABLE IF EXISTS `biblio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio` (
  `biblionumber` int(11) NOT NULL AUTO_INCREMENT,
  `frameworkcode` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author` mediumtext COLLATE utf8_unicode_ci,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `unititle` mediumtext COLLATE utf8_unicode_ci,
  `notes` mediumtext COLLATE utf8_unicode_ci,
  `serial` tinyint(1) DEFAULT NULL,
  `seriestitle` mediumtext COLLATE utf8_unicode_ci,
  `copyrightdate` smallint(6) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datecreated` date NOT NULL,
  `abstract` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`biblionumber`),
  KEY `blbnoidx` (`biblionumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio`
--

LOCK TABLES `biblio` WRITE;
/*!40000 ALTER TABLE `biblio` DISABLE KEYS */;
INSERT INTO `biblio` VALUES (1,'MON','Departamento de Catequese do Patriarcado de Lisboa','O menino Jesus',NULL,NULL,0,NULL,NULL,'2017-03-07 12:59:13','2017-03-07',NULL);
/*!40000 ALTER TABLE `biblio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblio_framework`
--

DROP TABLE IF EXISTS `biblio_framework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio_framework` (
  `frameworkcode` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `frameworktext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`frameworkcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_framework`
--

LOCK TABLES `biblio_framework` WRITE;
/*!40000 ALTER TABLE `biblio_framework` DISABLE KEYS */;
INSERT INTO `biblio_framework` VALUES ('MON','Monografia');
/*!40000 ALTER TABLE `biblio_framework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioimages`
--

DROP TABLE IF EXISTS `biblioimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblioimages` (
  `imagenumber` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` int(11) NOT NULL,
  `mimetype` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `imagefile` mediumblob NOT NULL,
  `thumbnail` mediumblob NOT NULL,
  PRIMARY KEY (`imagenumber`),
  KEY `bibliocoverimage_fk1` (`biblionumber`),
  CONSTRAINT `bibliocoverimage_fk1` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioimages`
--

LOCK TABLES `biblioimages` WRITE;
/*!40000 ALTER TABLE `biblioimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `biblioimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioitems`
--

DROP TABLE IF EXISTS `biblioitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblioitems` (
  `biblioitemnumber` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `volume` mediumtext COLLATE utf8_unicode_ci,
  `number` mediumtext COLLATE utf8_unicode_ci,
  `itemtype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isbn` mediumtext COLLATE utf8_unicode_ci,
  `issn` mediumtext COLLATE utf8_unicode_ci,
  `ean` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publicationyear` text COLLATE utf8_unicode_ci,
  `publishercode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volumedate` date DEFAULT NULL,
  `volumedesc` text COLLATE utf8_unicode_ci,
  `collectiontitle` mediumtext COLLATE utf8_unicode_ci,
  `collectionissn` text COLLATE utf8_unicode_ci,
  `collectionvolume` mediumtext COLLATE utf8_unicode_ci,
  `editionstatement` text COLLATE utf8_unicode_ci,
  `editionresponsibility` text COLLATE utf8_unicode_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `illus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` mediumtext COLLATE utf8_unicode_ci,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lccn` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `cn_source` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_class` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_item` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_suffix` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_sort` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agerestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalissues` int(10) DEFAULT NULL,
  `marcxml` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`biblioitemnumber`),
  KEY `bibinoidx` (`biblioitemnumber`),
  KEY `bibnoidx` (`biblionumber`),
  KEY `itemtype_idx` (`itemtype`),
  KEY `isbn` (`isbn`(255)),
  KEY `issn` (`issn`(255)),
  KEY `publishercode` (`publishercode`),
  CONSTRAINT `biblioitems_ibfk_1` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioitems`
--

LOCK TABLES `biblioitems` WRITE;
/*!40000 ALTER TABLE `biblioitems` DISABLE KEYS */;
INSERT INTO `biblioitems` VALUES (1,1,NULL,NULL,NULL,'9727665756 | 9727666892',NULL,NULL,'2002','Impala,',NULL,NULL,NULL,NULL,NULL,'1<U+00AA> ed',NULL,'2017-03-07 12:59:13','il.','2 v.',NULL,'26 cm','Ranholas - Sintra',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<record\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n    xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n  <leader>01105cam a2200313   4500</leader>\n  <controlfield tag=\"001\">1</controlfield>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">9727665756</subfield>\n  </datafield>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">9727666892</subfield>\n  </datafield>\n  <datafield tag=\"021\" ind1=\" \" ind2=\" \">\n    <subfield code=\"b\">185369/02</subfield>\n  </datafield>\n  <datafield tag=\"021\" ind1=\" \" ind2=\" \">\n    <subfield code=\"b\">205381/04</subfield>\n  </datafield>\n  <datafield tag=\"090\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">1</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">20030319g20022004c  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"106\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">r</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">O menino Jesus</subfield>\n    <subfield code=\"f\">Departamento de Catequese do Patriarcado de Lisboa</subfield>\n    <subfield code=\"g\">il. Fernando Gerardo</subfield>\n  </datafield>\n  <datafield tag=\"205\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">1&lt;U+00AA&gt; ed</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Ranholas - Sintra</subfield>\n    <subfield code=\"c\">Impala,</subfield>\n    <subfield code=\"d\">2002-2004</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">2 v.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">26 cm</subfield>\n  </datafield>\n  <datafield tag=\"327\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">[1&lt;U+00BA&gt; v.]: O menino Jesus nasceu... - 32 p.</subfield>\n    <subfield code=\"a\">2&lt;U+00BA&gt; v.: O menino Jesus fez-se homem. - 2004. - 32 p.</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">087.5</subfield>\n    <subfield code=\"v\">BN</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">232</subfield>\n    <subfield code=\"v\">BN</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Gerardo,</subfield>\n    <subfield code=\"b\">Fernando</subfield>\n  </datafield>\n  <datafield tag=\"710\" ind1=\"0\" ind2=\"1\">\n    <subfield code=\"a\">Lisboa.</subfield>\n    <subfield code=\"b\">Patriarcado.</subfield>\n    <subfield code=\"b\">Departamento de Catequese</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Portugal</subfield>\n    <subfield code=\"b\">UEBIB</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"859\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Capa</subfield>\n  </datafield>\n</record>\n');
/*!40000 ALTER TABLE `biblioitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_attribute_types`
--

DROP TABLE IF EXISTS `borrower_attribute_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_attribute_types` (
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `repeatable` tinyint(1) NOT NULL DEFAULT '0',
  `unique_id` tinyint(1) NOT NULL DEFAULT '0',
  `opac_display` tinyint(1) NOT NULL DEFAULT '0',
  `staff_searchable` tinyint(1) NOT NULL DEFAULT '0',
  `authorised_value_category` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `category_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`code`),
  KEY `auth_val_cat_idx` (`authorised_value_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_attribute_types`
--

LOCK TABLES `borrower_attribute_types` WRITE;
/*!40000 ALTER TABLE `borrower_attribute_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_attribute_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_attribute_types_branches`
--

DROP TABLE IF EXISTS `borrower_attribute_types_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_attribute_types_branches` (
  `bat_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b_branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `bat_code` (`bat_code`),
  KEY `b_branchcode` (`b_branchcode`),
  CONSTRAINT `borrower_attribute_types_branches_ibfk_1` FOREIGN KEY (`bat_code`) REFERENCES `borrower_attribute_types` (`code`) ON DELETE CASCADE,
  CONSTRAINT `borrower_attribute_types_branches_ibfk_2` FOREIGN KEY (`b_branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_attribute_types_branches`
--

LOCK TABLES `borrower_attribute_types_branches` WRITE;
/*!40000 ALTER TABLE `borrower_attribute_types_branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_attribute_types_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_attributes`
--

DROP TABLE IF EXISTS `borrower_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_attributes` (
  `borrowernumber` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `borrowernumber` (`borrowernumber`),
  KEY `code_attribute` (`code`,`attribute`),
  CONSTRAINT `borrower_attributes_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrower_attributes_ibfk_2` FOREIGN KEY (`code`) REFERENCES `borrower_attribute_types` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_attributes`
--

LOCK TABLES `borrower_attributes` WRITE;
/*!40000 ALTER TABLE `borrower_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_debarments`
--

DROP TABLE IF EXISTS `borrower_debarments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_debarments` (
  `borrower_debarment_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `expiration` date DEFAULT NULL,
  `type` enum('SUSPENSION','OVERDUES','MANUAL','DISCHARGE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'MANUAL',
  `comment` text COLLATE utf8_unicode_ci,
  `manager_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`borrower_debarment_id`),
  KEY `borrowernumber` (`borrowernumber`),
  CONSTRAINT `borrower_debarments_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_debarments`
--

LOCK TABLES `borrower_debarments` WRITE;
/*!40000 ALTER TABLE `borrower_debarments` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_debarments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_files`
--

DROP TABLE IF EXISTS `borrower_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_content` longblob NOT NULL,
  `date_uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_id`),
  KEY `borrowernumber` (`borrowernumber`),
  CONSTRAINT `borrower_files_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_files`
--

LOCK TABLES `borrower_files` WRITE;
/*!40000 ALTER TABLE `borrower_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_message_preferences`
--

DROP TABLE IF EXISTS `borrower_message_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_message_preferences` (
  `borrower_message_preference_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `categorycode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_attribute_id` int(11) DEFAULT '0',
  `days_in_advance` int(11) DEFAULT '0',
  `wants_digest` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`borrower_message_preference_id`),
  KEY `borrowernumber` (`borrowernumber`),
  KEY `categorycode` (`categorycode`),
  KEY `message_attribute_id` (`message_attribute_id`),
  CONSTRAINT `borrower_message_preferences_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrower_message_preferences_ibfk_2` FOREIGN KEY (`message_attribute_id`) REFERENCES `message_attributes` (`message_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrower_message_preferences_ibfk_3` FOREIGN KEY (`categorycode`) REFERENCES `categories` (`categorycode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_message_preferences`
--

LOCK TABLES `borrower_message_preferences` WRITE;
/*!40000 ALTER TABLE `borrower_message_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_message_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_message_transport_preferences`
--

DROP TABLE IF EXISTS `borrower_message_transport_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_message_transport_preferences` (
  `borrower_message_preference_id` int(11) NOT NULL DEFAULT '0',
  `message_transport_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`borrower_message_preference_id`,`message_transport_type`),
  KEY `message_transport_type` (`message_transport_type`),
  CONSTRAINT `borrower_message_transport_preferences_ibfk_1` FOREIGN KEY (`borrower_message_preference_id`) REFERENCES `borrower_message_preferences` (`borrower_message_preference_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrower_message_transport_preferences_ibfk_2` FOREIGN KEY (`message_transport_type`) REFERENCES `message_transport_types` (`message_transport_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_message_transport_preferences`
--

LOCK TABLES `borrower_message_transport_preferences` WRITE;
/*!40000 ALTER TABLE `borrower_message_transport_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_message_transport_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_modifications`
--

DROP TABLE IF EXISTS `borrower_modifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_modifications` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `cardnumber` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` mediumtext COLLATE utf8_unicode_ci,
  `firstname` text COLLATE utf8_unicode_ci,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `othernames` mediumtext COLLATE utf8_unicode_ci,
  `initials` text COLLATE utf8_unicode_ci,
  `streetnumber` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `streettype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `address2` text COLLATE utf8_unicode_ci,
  `city` mediumtext COLLATE utf8_unicode_ci,
  `state` text COLLATE utf8_unicode_ci,
  `zipcode` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8_unicode_ci,
  `email` mediumtext COLLATE utf8_unicode_ci,
  `phone` text COLLATE utf8_unicode_ci,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` mediumtext COLLATE utf8_unicode_ci,
  `emailpro` text COLLATE utf8_unicode_ci,
  `phonepro` text COLLATE utf8_unicode_ci,
  `B_streetnumber` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_streettype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_address2` text COLLATE utf8_unicode_ci,
  `B_city` mediumtext COLLATE utf8_unicode_ci,
  `B_state` text COLLATE utf8_unicode_ci,
  `B_zipcode` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_country` text COLLATE utf8_unicode_ci,
  `B_email` text COLLATE utf8_unicode_ci,
  `B_phone` mediumtext COLLATE utf8_unicode_ci,
  `dateofbirth` date DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categorycode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateenrolled` date DEFAULT NULL,
  `dateexpiry` date DEFAULT NULL,
  `gonenoaddress` tinyint(1) DEFAULT NULL,
  `lost` tinyint(1) DEFAULT NULL,
  `debarred` date DEFAULT NULL,
  `debarredcomment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactname` mediumtext COLLATE utf8_unicode_ci,
  `contactfirstname` text COLLATE utf8_unicode_ci,
  `contacttitle` text COLLATE utf8_unicode_ci,
  `guarantorid` int(11) DEFAULT NULL,
  `borrowernotes` mediumtext COLLATE utf8_unicode_ci,
  `relationship` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) DEFAULT NULL,
  `userid` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opacnote` mediumtext COLLATE utf8_unicode_ci,
  `contactnote` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort1` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort2` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactfirstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactsurname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactaddress1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactaddress2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactaddress3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactstate` text COLLATE utf8_unicode_ci,
  `altcontactzipcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactcountry` text COLLATE utf8_unicode_ci,
  `altcontactphone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smsalertnumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `privacy` int(11) DEFAULT NULL,
  PRIMARY KEY (`verification_token`,`borrowernumber`),
  KEY `verification_token` (`verification_token`),
  KEY `borrowernumber` (`borrowernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_modifications`
--

LOCK TABLES `borrower_modifications` WRITE;
/*!40000 ALTER TABLE `borrower_modifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_modifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_password_recovery`
--

DROP TABLE IF EXISTS `borrower_password_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_password_recovery` (
  `borrowernumber` int(11) NOT NULL,
  `uuid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `valid_until` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`borrowernumber`),
  KEY `borrowernumber` (`borrowernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_password_recovery`
--

LOCK TABLES `borrower_password_recovery` WRITE;
/*!40000 ALTER TABLE `borrower_password_recovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_password_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_sync`
--

DROP TABLE IF EXISTS `borrower_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_sync` (
  `borrowersyncid` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `synctype` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `sync` tinyint(1) NOT NULL DEFAULT '0',
  `syncstatus` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastsync` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hashed_pin` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`borrowersyncid`),
  KEY `borrowernumber` (`borrowernumber`),
  CONSTRAINT `borrower_sync_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_sync`
--

LOCK TABLES `borrower_sync` WRITE;
/*!40000 ALTER TABLE `borrower_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowers`
--

DROP TABLE IF EXISTS `borrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowers` (
  `borrowernumber` int(11) NOT NULL AUTO_INCREMENT,
  `cardnumber` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `firstname` text COLLATE utf8_unicode_ci,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `othernames` mediumtext COLLATE utf8_unicode_ci,
  `initials` text COLLATE utf8_unicode_ci,
  `streetnumber` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `streettype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `address2` text COLLATE utf8_unicode_ci,
  `city` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `state` text COLLATE utf8_unicode_ci,
  `zipcode` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8_unicode_ci,
  `email` mediumtext COLLATE utf8_unicode_ci,
  `phone` text COLLATE utf8_unicode_ci,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` mediumtext COLLATE utf8_unicode_ci,
  `emailpro` text COLLATE utf8_unicode_ci,
  `phonepro` text COLLATE utf8_unicode_ci,
  `B_streetnumber` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_streettype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_address2` text COLLATE utf8_unicode_ci,
  `B_city` mediumtext COLLATE utf8_unicode_ci,
  `B_state` text COLLATE utf8_unicode_ci,
  `B_zipcode` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_country` text COLLATE utf8_unicode_ci,
  `B_email` text COLLATE utf8_unicode_ci,
  `B_phone` mediumtext COLLATE utf8_unicode_ci,
  `dateofbirth` date DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dateenrolled` date DEFAULT NULL,
  `dateexpiry` date DEFAULT NULL,
  `gonenoaddress` tinyint(1) DEFAULT NULL,
  `lost` tinyint(1) DEFAULT NULL,
  `debarred` date DEFAULT NULL,
  `debarredcomment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactname` mediumtext COLLATE utf8_unicode_ci,
  `contactfirstname` text COLLATE utf8_unicode_ci,
  `contacttitle` text COLLATE utf8_unicode_ci,
  `guarantorid` int(11) DEFAULT NULL,
  `borrowernotes` mediumtext COLLATE utf8_unicode_ci,
  `relationship` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) DEFAULT NULL,
  `userid` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opacnote` mediumtext COLLATE utf8_unicode_ci,
  `contactnote` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort1` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort2` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactfirstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactsurname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactaddress1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactaddress2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactaddress3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactstate` text COLLATE utf8_unicode_ci,
  `altcontactzipcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactcountry` text COLLATE utf8_unicode_ci,
  `altcontactphone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smsalertnumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sms_provider_id` int(11) DEFAULT NULL,
  `privacy` int(11) NOT NULL DEFAULT '1',
  `privacy_guarantor_checkouts` tinyint(1) NOT NULL DEFAULT '0',
  `checkprevcheckout` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inherit',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastseen` datetime DEFAULT NULL,
  PRIMARY KEY (`borrowernumber`),
  UNIQUE KEY `cardnumber` (`cardnumber`),
  UNIQUE KEY `userid` (`userid`),
  KEY `categorycode` (`categorycode`),
  KEY `branchcode` (`branchcode`),
  KEY `guarantorid` (`guarantorid`),
  KEY `surname_idx` (`surname`(255)),
  KEY `firstname_idx` (`firstname`(255)),
  KEY `othernames_idx` (`othernames`(255)),
  KEY `sms_provider_id` (`sms_provider_id`),
  CONSTRAINT `borrowers_ibfk_1` FOREIGN KEY (`categorycode`) REFERENCES `categories` (`categorycode`),
  CONSTRAINT `borrowers_ibfk_2` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`),
  CONSTRAINT `borrowers_ibfk_3` FOREIGN KEY (`sms_provider_id`) REFERENCES `sms_providers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowers`
--

LOCK TABLES `borrowers` WRITE;
/*!40000 ALTER TABLE `borrowers` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_borrower_circ_rules`
--

DROP TABLE IF EXISTS `branch_borrower_circ_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_borrower_circ_rules` (
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `maxissueqty` int(4) DEFAULT NULL,
  `maxonsiteissueqty` int(4) DEFAULT NULL,
  PRIMARY KEY (`categorycode`,`branchcode`),
  KEY `branch_borrower_circ_rules_ibfk_2` (`branchcode`),
  CONSTRAINT `branch_borrower_circ_rules_ibfk_1` FOREIGN KEY (`categorycode`) REFERENCES `categories` (`categorycode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branch_borrower_circ_rules_ibfk_2` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_borrower_circ_rules`
--

LOCK TABLES `branch_borrower_circ_rules` WRITE;
/*!40000 ALTER TABLE `branch_borrower_circ_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_borrower_circ_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_item_rules`
--

DROP TABLE IF EXISTS `branch_item_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_item_rules` (
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `itemtype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `holdallowed` tinyint(1) DEFAULT NULL,
  `hold_fulfillment_policy` enum('any','homebranch','holdingbranch') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'any',
  `returnbranch` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`itemtype`,`branchcode`),
  KEY `branch_item_rules_ibfk_2` (`branchcode`),
  CONSTRAINT `branch_item_rules_ibfk_1` FOREIGN KEY (`itemtype`) REFERENCES `itemtypes` (`itemtype`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branch_item_rules_ibfk_2` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_item_rules`
--

LOCK TABLES `branch_item_rules` WRITE;
/*!40000 ALTER TABLE `branch_item_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_item_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_transfer_limits`
--

DROP TABLE IF EXISTS `branch_transfer_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_transfer_limits` (
  `limitId` int(8) NOT NULL AUTO_INCREMENT,
  `toBranch` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fromBranch` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `itemtype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ccode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`limitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_transfer_limits`
--

LOCK TABLES `branch_transfer_limits` WRITE;
/*!40000 ALTER TABLE `branch_transfer_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_transfer_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branchcategories`
--

DROP TABLE IF EXISTS `branchcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branchcategories` (
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categoryname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codedescription` mediumtext COLLATE utf8_unicode_ci,
  `categorytype` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_in_pulldown` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categorycode`),
  KEY `show_in_pulldown` (`show_in_pulldown`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchcategories`
--

LOCK TABLES `branchcategories` WRITE;
/*!40000 ALTER TABLE `branchcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `branchname` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `branchaddress1` mediumtext COLLATE utf8_unicode_ci,
  `branchaddress2` mediumtext COLLATE utf8_unicode_ci,
  `branchaddress3` mediumtext COLLATE utf8_unicode_ci,
  `branchzip` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branchcity` mediumtext COLLATE utf8_unicode_ci,
  `branchstate` mediumtext COLLATE utf8_unicode_ci,
  `branchcountry` text COLLATE utf8_unicode_ci,
  `branchphone` mediumtext COLLATE utf8_unicode_ci,
  `branchfax` mediumtext COLLATE utf8_unicode_ci,
  `branchemail` mediumtext COLLATE utf8_unicode_ci,
  `branchreplyto` mediumtext COLLATE utf8_unicode_ci,
  `branchreturnpath` mediumtext COLLATE utf8_unicode_ci,
  `branchurl` mediumtext COLLATE utf8_unicode_ci,
  `issuing` tinyint(4) DEFAULT NULL,
  `branchip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branchprinter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branchnotes` mediumtext COLLATE utf8_unicode_ci,
  `opac_info` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branchrelations`
--

DROP TABLE IF EXISTS `branchrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branchrelations` (
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`branchcode`,`categorycode`),
  KEY `branchcode` (`branchcode`),
  KEY `categorycode` (`categorycode`),
  CONSTRAINT `branchrelations_ibfk_1` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branchrelations_ibfk_2` FOREIGN KEY (`categorycode`) REFERENCES `branchcategories` (`categorycode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchrelations`
--

LOCK TABLES `branchrelations` WRITE;
/*!40000 ALTER TABLE `branchrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branchtransfers`
--

DROP TABLE IF EXISTS `branchtransfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branchtransfers` (
  `itemnumber` int(11) NOT NULL DEFAULT '0',
  `datesent` datetime DEFAULT NULL,
  `frombranch` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `datearrived` datetime DEFAULT NULL,
  `tobranch` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comments` mediumtext COLLATE utf8_unicode_ci,
  KEY `frombranch` (`frombranch`),
  KEY `tobranch` (`tobranch`),
  KEY `itemnumber` (`itemnumber`),
  CONSTRAINT `branchtransfers_ibfk_1` FOREIGN KEY (`frombranch`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branchtransfers_ibfk_2` FOREIGN KEY (`tobranch`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branchtransfers_ibfk_3` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchtransfers`
--

LOCK TABLES `branchtransfers` WRITE;
/*!40000 ALTER TABLE `branchtransfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchtransfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser`
--

DROP TABLE IF EXISTS `browser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser` (
  `level` int(11) NOT NULL,
  `classification` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number` bigint(20) NOT NULL,
  `endnode` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser`
--

LOCK TABLES `browser` WRITE;
/*!40000 ALTER TABLE `browser` DISABLE KEYS */;
/*!40000 ALTER TABLE `browser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `enrolmentperiod` smallint(6) DEFAULT NULL,
  `enrolmentperioddate` date DEFAULT NULL,
  `upperagelimit` smallint(6) DEFAULT NULL,
  `dateofbirthrequired` tinyint(1) DEFAULT NULL,
  `finetype` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bulk` tinyint(1) DEFAULT NULL,
  `enrolmentfee` decimal(28,6) DEFAULT NULL,
  `overduenoticerequired` tinyint(1) DEFAULT NULL,
  `issuelimit` smallint(6) DEFAULT NULL,
  `reservefee` decimal(28,6) DEFAULT NULL,
  `hidelostitems` tinyint(1) NOT NULL DEFAULT '0',
  `category_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `BlockExpiredPatronOpacActions` tinyint(1) NOT NULL DEFAULT '-1',
  `default_privacy` enum('default','never','forever') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `checkprevcheckout` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inherit',
  PRIMARY KEY (`categorycode`),
  UNIQUE KEY `categorycode` (`categorycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_branches`
--

DROP TABLE IF EXISTS `categories_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_branches` (
  `categorycode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `categorycode` (`categorycode`),
  KEY `branchcode` (`branchcode`),
  CONSTRAINT `categories_branches_ibfk_1` FOREIGN KEY (`categorycode`) REFERENCES `categories` (`categorycode`) ON DELETE CASCADE,
  CONSTRAINT `categories_branches_ibfk_2` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_branches`
--

LOCK TABLES `categories_branches` WRITE;
/*!40000 ALTER TABLE `categories_branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city_state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_zipcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_sort_rules`
--

DROP TABLE IF EXISTS `class_sort_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_sort_rules` (
  `class_sort_rule` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `sort_routine` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`class_sort_rule`),
  UNIQUE KEY `class_sort_rule_idx` (`class_sort_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_sort_rules`
--

LOCK TABLES `class_sort_rules` WRITE;
/*!40000 ALTER TABLE `class_sort_rules` DISABLE KEYS */;
INSERT INTO `class_sort_rules` VALUES ('dewey','Standard sortering for DDK','Dewey'),('generic','Generelle sorteringsregler','Generic'),('lcc','Standard sortering for LCC','LCC');
/*!40000 ALTER TABLE `class_sort_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_sources`
--

DROP TABLE IF EXISTS `class_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_sources` (
  `cn_source` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `used` tinyint(4) NOT NULL DEFAULT '0',
  `class_sort_rule` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`cn_source`),
  UNIQUE KEY `cn_source_idx` (`cn_source`),
  KEY `used_idx` (`used`),
  KEY `class_source_ibfk_1` (`class_sort_rule`),
  CONSTRAINT `class_source_ibfk_1` FOREIGN KEY (`class_sort_rule`) REFERENCES `class_sort_rules` (`class_sort_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_sources`
--

LOCK TABLES `class_sources` WRITE;
/*!40000 ALTER TABLE `class_sources` DISABLE KEYS */;
INSERT INTO `class_sources` VALUES ('anscr','ANSCR (Lydopptak)',0,'generic'),('ddc','Dewey desimalklassifikasjon',1,'dewey'),('lcc','Library of Congress klassifikasjon',1,'lcc'),('sudocs','SuDoc klassifikasjon (U.S. GPO)',0,'generic'),('udc','Universell desimalklassifikasjon',0,'generic'),('z','Andre klassifikasjonsskjema',0,'generic');
/*!40000 ALTER TABLE `class_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `colId` int(11) NOT NULL AUTO_INCREMENT,
  `colTitle` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `colDesc` text COLLATE utf8_unicode_ci NOT NULL,
  `colBranchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`colId`),
  KEY `collections_ibfk_1` (`colBranchcode`),
  CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`colBranchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_tracking`
--

DROP TABLE IF EXISTS `collections_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_tracking` (
  `collections_tracking_id` int(11) NOT NULL AUTO_INCREMENT,
  `colId` int(11) NOT NULL DEFAULT '0' COMMENT 'collections.colId',
  `itemnumber` int(11) NOT NULL DEFAULT '0' COMMENT 'items.itemnumber',
  PRIMARY KEY (`collections_tracking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_tracking`
--

LOCK TABLES `collections_tracking` WRITE;
/*!40000 ALTER TABLE `collections_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `columns_settings`
--

DROP TABLE IF EXISTS `columns_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_settings` (
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `columnname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cannot_be_toggled` int(1) NOT NULL DEFAULT '0',
  `is_hidden` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`module`,`page`,`tablename`,`columnname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_settings`
--

LOCK TABLES `columns_settings` WRITE;
/*!40000 ALTER TABLE `columns_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_instructors`
--

DROP TABLE IF EXISTS `course_instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_instructors` (
  `course_id` int(11) NOT NULL,
  `borrowernumber` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`borrowernumber`),
  KEY `borrowernumber` (`borrowernumber`),
  CONSTRAINT `course_instructors_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_instructors_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_instructors`
--

LOCK TABLES `course_instructors` WRITE;
/*!40000 ALTER TABLE `course_instructors` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_items`
--

DROP TABLE IF EXISTS `course_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_items` (
  `ci_id` int(11) NOT NULL AUTO_INCREMENT,
  `itemnumber` int(11) NOT NULL,
  `itype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ccode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holdingbranch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ci_id`),
  UNIQUE KEY `itemnumber` (`itemnumber`),
  KEY `holdingbranch` (`holdingbranch`),
  CONSTRAINT `course_items_ibfk_1` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_items_ibfk_2` FOREIGN KEY (`holdingbranch`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_items`
--

LOCK TABLES `course_items` WRITE;
/*!40000 ALTER TABLE `course_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_reserves`
--

DROP TABLE IF EXISTS `course_reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_reserves` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `ci_id` int(11) NOT NULL,
  `staff_note` mediumtext COLLATE utf8_unicode_ci,
  `public_note` mediumtext COLLATE utf8_unicode_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cr_id`),
  UNIQUE KEY `pseudo_key` (`course_id`,`ci_id`),
  KEY `course_id` (`course_id`),
  KEY `course_reserves_ibfk_2` (`ci_id`),
  CONSTRAINT `course_reserves_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `course_reserves_ibfk_2` FOREIGN KEY (`ci_id`) REFERENCES `course_items` (`ci_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_reserves`
--

LOCK TABLES `course_reserves` WRITE;
/*!40000 ALTER TABLE `course_reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `section` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_note` mediumtext COLLATE utf8_unicode_ci,
  `public_note` mediumtext COLLATE utf8_unicode_ci,
  `students_count` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_batches`
--

DROP TABLE IF EXISTS `creator_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creator_batches` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) NOT NULL DEFAULT '1',
  `item_number` int(11) DEFAULT NULL,
  `borrower_number` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NB',
  `creator` char(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Labels',
  PRIMARY KEY (`label_id`),
  KEY `branch_fk_constraint` (`branch_code`),
  KEY `item_fk_constraint` (`item_number`),
  KEY `borrower_fk_constraint` (`borrower_number`),
  CONSTRAINT `creator_batches_ibfk_1` FOREIGN KEY (`borrower_number`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `creator_batches_ibfk_2` FOREIGN KEY (`branch_code`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE,
  CONSTRAINT `creator_batches_ibfk_3` FOREIGN KEY (`item_number`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_batches`
--

LOCK TABLES `creator_batches` WRITE;
/*!40000 ALTER TABLE `creator_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `creator_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_images`
--

DROP TABLE IF EXISTS `creator_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creator_images` (
  `image_id` int(4) NOT NULL AUTO_INCREMENT,
  `imagefile` mediumblob,
  `image_name` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT',
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `image_name_index` (`image_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_images`
--

LOCK TABLES `creator_images` WRITE;
/*!40000 ALTER TABLE `creator_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `creator_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_layouts`
--

DROP TABLE IF EXISTS `creator_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creator_layouts` (
  `layout_id` int(4) NOT NULL AUTO_INCREMENT,
  `barcode_type` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'CODE39',
  `start_label` int(2) NOT NULL DEFAULT '1',
  `printing_type` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BAR',
  `layout_name` char(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT',
  `guidebox` int(1) DEFAULT '0',
  `oblique_title` int(1) DEFAULT '1',
  `font` char(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'TR',
  `font_size` int(4) NOT NULL DEFAULT '10',
  `units` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'POINT',
  `callnum_split` int(1) DEFAULT '0',
  `text_justify` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `format_string` varchar(210) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'barcode',
  `layout_xml` text COLLATE utf8_unicode_ci NOT NULL,
  `creator` char(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Labels',
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_layouts`
--

LOCK TABLES `creator_layouts` WRITE;
/*!40000 ALTER TABLE `creator_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `creator_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_templates`
--

DROP TABLE IF EXISTS `creator_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creator_templates` (
  `template_id` int(4) NOT NULL AUTO_INCREMENT,
  `profile_id` int(4) DEFAULT NULL,
  `template_code` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT TEMPLATE',
  `template_desc` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default description',
  `page_width` float NOT NULL DEFAULT '0',
  `page_height` float NOT NULL DEFAULT '0',
  `label_width` float NOT NULL DEFAULT '0',
  `label_height` float NOT NULL DEFAULT '0',
  `top_text_margin` float NOT NULL DEFAULT '0',
  `left_text_margin` float NOT NULL DEFAULT '0',
  `top_margin` float NOT NULL DEFAULT '0',
  `left_margin` float NOT NULL DEFAULT '0',
  `cols` int(2) NOT NULL DEFAULT '0',
  `rows` int(2) NOT NULL DEFAULT '0',
  `col_gap` float NOT NULL DEFAULT '0',
  `row_gap` float NOT NULL DEFAULT '0',
  `units` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'POINT',
  `creator` char(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Labels',
  PRIMARY KEY (`template_id`),
  KEY `template_profile_fk_constraint` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_templates`
--

LOCK TABLES `creator_templates` WRITE;
/*!40000 ALTER TABLE `creator_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `creator_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `symbol` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isocode` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rate` float(15,5) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_borrower_circ_rules`
--

DROP TABLE IF EXISTS `default_borrower_circ_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_borrower_circ_rules` (
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `maxissueqty` int(4) DEFAULT NULL,
  `maxonsiteissueqty` int(4) DEFAULT NULL,
  PRIMARY KEY (`categorycode`),
  CONSTRAINT `borrower_borrower_circ_rules_ibfk_1` FOREIGN KEY (`categorycode`) REFERENCES `categories` (`categorycode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_borrower_circ_rules`
--

LOCK TABLES `default_borrower_circ_rules` WRITE;
/*!40000 ALTER TABLE `default_borrower_circ_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_borrower_circ_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_branch_circ_rules`
--

DROP TABLE IF EXISTS `default_branch_circ_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_branch_circ_rules` (
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `maxissueqty` int(4) DEFAULT NULL,
  `maxonsiteissueqty` int(4) DEFAULT NULL,
  `holdallowed` tinyint(1) DEFAULT NULL,
  `hold_fulfillment_policy` enum('any','homebranch','holdingbranch') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'any',
  `returnbranch` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`branchcode`),
  CONSTRAINT `default_branch_circ_rules_ibfk_1` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_branch_circ_rules`
--

LOCK TABLES `default_branch_circ_rules` WRITE;
/*!40000 ALTER TABLE `default_branch_circ_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_branch_circ_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_branch_item_rules`
--

DROP TABLE IF EXISTS `default_branch_item_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_branch_item_rules` (
  `itemtype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `holdallowed` tinyint(1) DEFAULT NULL,
  `hold_fulfillment_policy` enum('any','homebranch','holdingbranch') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'any',
  `returnbranch` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`itemtype`),
  CONSTRAINT `default_branch_item_rules_ibfk_1` FOREIGN KEY (`itemtype`) REFERENCES `itemtypes` (`itemtype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_branch_item_rules`
--

LOCK TABLES `default_branch_item_rules` WRITE;
/*!40000 ALTER TABLE `default_branch_item_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_branch_item_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_circ_rules`
--

DROP TABLE IF EXISTS `default_circ_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_circ_rules` (
  `singleton` enum('singleton') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'singleton',
  `maxissueqty` int(4) DEFAULT NULL,
  `maxonsiteissueqty` int(4) DEFAULT NULL,
  `holdallowed` int(1) DEFAULT NULL,
  `hold_fulfillment_policy` enum('any','homebranch','holdingbranch') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'any',
  `returnbranch` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`singleton`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_circ_rules`
--

LOCK TABLES `default_circ_rules` WRITE;
/*!40000 ALTER TABLE `default_circ_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_circ_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletedbiblio`
--

DROP TABLE IF EXISTS `deletedbiblio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletedbiblio` (
  `biblionumber` int(11) NOT NULL AUTO_INCREMENT,
  `frameworkcode` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author` mediumtext COLLATE utf8_unicode_ci,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `unititle` mediumtext COLLATE utf8_unicode_ci,
  `notes` mediumtext COLLATE utf8_unicode_ci,
  `serial` tinyint(1) DEFAULT NULL,
  `seriestitle` mediumtext COLLATE utf8_unicode_ci,
  `copyrightdate` smallint(6) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datecreated` date NOT NULL,
  `abstract` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`biblionumber`),
  KEY `blbnoidx` (`biblionumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedbiblio`
--

LOCK TABLES `deletedbiblio` WRITE;
/*!40000 ALTER TABLE `deletedbiblio` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletedbiblio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletedbiblioitems`
--

DROP TABLE IF EXISTS `deletedbiblioitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletedbiblioitems` (
  `biblioitemnumber` int(11) NOT NULL DEFAULT '0',
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `volume` mediumtext COLLATE utf8_unicode_ci,
  `number` mediumtext COLLATE utf8_unicode_ci,
  `itemtype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isbn` mediumtext COLLATE utf8_unicode_ci,
  `issn` mediumtext COLLATE utf8_unicode_ci,
  `ean` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publicationyear` text COLLATE utf8_unicode_ci,
  `publishercode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volumedate` date DEFAULT NULL,
  `volumedesc` text COLLATE utf8_unicode_ci,
  `collectiontitle` mediumtext COLLATE utf8_unicode_ci,
  `collectionissn` text COLLATE utf8_unicode_ci,
  `collectionvolume` mediumtext COLLATE utf8_unicode_ci,
  `editionstatement` text COLLATE utf8_unicode_ci,
  `editionresponsibility` text COLLATE utf8_unicode_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `illus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` mediumtext COLLATE utf8_unicode_ci,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lccn` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `cn_source` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_class` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_item` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_suffix` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_sort` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agerestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalissues` int(10) DEFAULT NULL,
  `marcxml` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`biblioitemnumber`),
  KEY `bibinoidx` (`biblioitemnumber`),
  KEY `bibnoidx` (`biblionumber`),
  KEY `itemtype_idx` (`itemtype`),
  KEY `isbn` (`isbn`(255)),
  KEY `publishercode` (`publishercode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedbiblioitems`
--

LOCK TABLES `deletedbiblioitems` WRITE;
/*!40000 ALTER TABLE `deletedbiblioitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletedbiblioitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletedborrowers`
--

DROP TABLE IF EXISTS `deletedborrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletedborrowers` (
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `cardnumber` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `firstname` text COLLATE utf8_unicode_ci,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `othernames` mediumtext COLLATE utf8_unicode_ci,
  `initials` text COLLATE utf8_unicode_ci,
  `streetnumber` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `streettype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `address2` text COLLATE utf8_unicode_ci,
  `city` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `state` text COLLATE utf8_unicode_ci,
  `zipcode` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8_unicode_ci,
  `email` mediumtext COLLATE utf8_unicode_ci,
  `phone` text COLLATE utf8_unicode_ci,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` mediumtext COLLATE utf8_unicode_ci,
  `emailpro` text COLLATE utf8_unicode_ci,
  `phonepro` text COLLATE utf8_unicode_ci,
  `B_streetnumber` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_streettype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_address2` text COLLATE utf8_unicode_ci,
  `B_city` mediumtext COLLATE utf8_unicode_ci,
  `B_state` text COLLATE utf8_unicode_ci,
  `B_zipcode` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_country` text COLLATE utf8_unicode_ci,
  `B_email` text COLLATE utf8_unicode_ci,
  `B_phone` mediumtext COLLATE utf8_unicode_ci,
  `dateofbirth` date DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dateenrolled` date DEFAULT NULL,
  `dateexpiry` date DEFAULT NULL,
  `gonenoaddress` tinyint(1) DEFAULT NULL,
  `lost` tinyint(1) DEFAULT NULL,
  `debarred` date DEFAULT NULL,
  `debarredcomment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactname` mediumtext COLLATE utf8_unicode_ci,
  `contactfirstname` text COLLATE utf8_unicode_ci,
  `contacttitle` text COLLATE utf8_unicode_ci,
  `guarantorid` int(11) DEFAULT NULL,
  `borrowernotes` mediumtext COLLATE utf8_unicode_ci,
  `relationship` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) DEFAULT NULL,
  `userid` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opacnote` mediumtext COLLATE utf8_unicode_ci,
  `contactnote` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort1` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort2` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactfirstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactsurname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactaddress1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactaddress2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactaddress3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactstate` text COLLATE utf8_unicode_ci,
  `altcontactzipcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altcontactcountry` text COLLATE utf8_unicode_ci,
  `altcontactphone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smsalertnumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sms_provider_id` int(11) DEFAULT NULL,
  `privacy` int(11) NOT NULL DEFAULT '1',
  `privacy_guarantor_checkouts` tinyint(1) NOT NULL DEFAULT '0',
  `checkprevcheckout` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inherit',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastseen` datetime DEFAULT NULL,
  KEY `borrowernumber` (`borrowernumber`),
  KEY `cardnumber` (`cardnumber`),
  KEY `sms_provider_id` (`sms_provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedborrowers`
--

LOCK TABLES `deletedborrowers` WRITE;
/*!40000 ALTER TABLE `deletedborrowers` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletedborrowers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleteditems`
--

DROP TABLE IF EXISTS `deleteditems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleteditems` (
  `itemnumber` int(11) NOT NULL DEFAULT '0',
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `biblioitemnumber` int(11) NOT NULL DEFAULT '0',
  `barcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateaccessioned` date DEFAULT NULL,
  `booksellerid` mediumtext COLLATE utf8_unicode_ci,
  `homebranch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `replacementprice` decimal(8,2) DEFAULT NULL,
  `replacementpricedate` date DEFAULT NULL,
  `datelastborrowed` date DEFAULT NULL,
  `datelastseen` date DEFAULT NULL,
  `stack` tinyint(1) DEFAULT NULL,
  `notforloan` tinyint(1) NOT NULL DEFAULT '0',
  `damaged` tinyint(1) NOT NULL DEFAULT '0',
  `itemlost` tinyint(1) NOT NULL DEFAULT '0',
  `itemlost_on` datetime DEFAULT NULL,
  `withdrawn` tinyint(1) NOT NULL DEFAULT '0',
  `withdrawn_on` datetime DEFAULT NULL,
  `itemcallnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coded_location_qualifier` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issues` smallint(6) DEFAULT NULL,
  `renewals` smallint(6) DEFAULT NULL,
  `reserves` smallint(6) DEFAULT NULL,
  `restricted` tinyint(1) DEFAULT NULL,
  `itemnotes` mediumtext COLLATE utf8_unicode_ci,
  `itemnotes_nonpublic` mediumtext COLLATE utf8_unicode_ci,
  `holdingbranch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paidfor` mediumtext COLLATE utf8_unicode_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanent_location` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onloan` date DEFAULT NULL,
  `cn_source` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_sort` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ccode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `materials` text COLLATE utf8_unicode_ci,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `more_subfields_xml` longtext COLLATE utf8_unicode_ci,
  `enumchron` text COLLATE utf8_unicode_ci,
  `copynumber` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stocknumber` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_status` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`itemnumber`),
  KEY `delitembarcodeidx` (`barcode`),
  KEY `delitemstocknumberidx` (`stocknumber`),
  KEY `delitembinoidx` (`biblioitemnumber`),
  KEY `delitembibnoidx` (`biblionumber`),
  KEY `delhomebranch` (`homebranch`),
  KEY `delholdingbranch` (`holdingbranch`),
  KEY `itype_idx` (`itype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleteditems`
--

LOCK TABLES `deleteditems` WRITE;
/*!40000 ALTER TABLE `deleteditems` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleteditems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discharges`
--

DROP TABLE IF EXISTS `discharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discharges` (
  `discharge_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrower` int(11) DEFAULT NULL,
  `needed` timestamp NULL DEFAULT NULL,
  `validated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`discharge_id`),
  KEY `borrower_discharges_ibfk1` (`borrower`),
  CONSTRAINT `borrower_discharges_ibfk1` FOREIGN KEY (`borrower`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discharges`
--

LOCK TABLES `discharges` WRITE;
/*!40000 ALTER TABLE `discharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `discharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edifact_ean`
--

DROP TABLE IF EXISTS `edifact_ean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edifact_ean` (
  `ee_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ean` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_code_qualifier` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '14',
  PRIMARY KEY (`ee_id`),
  KEY `efk_branchcode` (`branchcode`),
  CONSTRAINT `efk_branchcode` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edifact_ean`
--

LOCK TABLES `edifact_ean` WRITE;
/*!40000 ALTER TABLE `edifact_ean` DISABLE KEYS */;
/*!40000 ALTER TABLE `edifact_ean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edifact_messages`
--

DROP TABLE IF EXISTS `edifact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edifact_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `transfer_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `edi_acct` int(11) DEFAULT NULL,
  `status` text COLLATE utf8_unicode_ci,
  `basketno` int(11) DEFAULT NULL,
  `raw_msg` mediumtext COLLATE utf8_unicode_ci,
  `filename` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `vendorid` (`vendor_id`),
  KEY `ediacct` (`edi_acct`),
  KEY `basketno` (`basketno`),
  CONSTRAINT `emfk_basketno` FOREIGN KEY (`basketno`) REFERENCES `aqbasket` (`basketno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emfk_edi_acct` FOREIGN KEY (`edi_acct`) REFERENCES `vendor_edi_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emfk_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `aqbooksellers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edifact_messages`
--

LOCK TABLES `edifact_messages` WRITE;
/*!40000 ALTER TABLE `edifact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `edifact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_format`
--

DROP TABLE IF EXISTS `export_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_format` (
  `export_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `csv_separator` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `field_separator` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `subfield_separator` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `encoding` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'marc',
  PRIMARY KEY (`export_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used for CSV export';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_format`
--

LOCK TABLES `export_format` WRITE;
/*!40000 ALTER TABLE `export_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldmapping`
--

DROP TABLE IF EXISTS `fieldmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frameworkcode` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldcode` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `subfieldcode` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldmapping`
--

LOCK TABLES `fieldmapping` WRITE;
/*!40000 ALTER TABLE `fieldmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hold_fill_targets`
--

DROP TABLE IF EXISTS `hold_fill_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hold_fill_targets` (
  `borrowernumber` int(11) NOT NULL,
  `biblionumber` int(11) NOT NULL,
  `itemnumber` int(11) NOT NULL,
  `source_branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_level_request` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemnumber`),
  KEY `bib_branch` (`biblionumber`,`source_branchcode`),
  KEY `hold_fill_targets_ibfk_1` (`borrowernumber`),
  KEY `hold_fill_targets_ibfk_4` (`source_branchcode`),
  CONSTRAINT `hold_fill_targets_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hold_fill_targets_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hold_fill_targets_ibfk_3` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hold_fill_targets_ibfk_4` FOREIGN KEY (`source_branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hold_fill_targets`
--

LOCK TABLES `hold_fill_targets` WRITE;
/*!40000 ALTER TABLE `hold_fill_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `hold_fill_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housebound_profile`
--

DROP TABLE IF EXISTS `housebound_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housebound_profile` (
  `borrowernumber` int(11) NOT NULL,
  `day` text COLLATE utf8_unicode_ci NOT NULL,
  `frequency` text COLLATE utf8_unicode_ci NOT NULL,
  `fav_itemtypes` text COLLATE utf8_unicode_ci,
  `fav_subjects` text COLLATE utf8_unicode_ci,
  `fav_authors` text COLLATE utf8_unicode_ci,
  `referral` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`borrowernumber`),
  CONSTRAINT `housebound_profile_bnfk` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housebound_profile`
--

LOCK TABLES `housebound_profile` WRITE;
/*!40000 ALTER TABLE `housebound_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `housebound_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housebound_role`
--

DROP TABLE IF EXISTS `housebound_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housebound_role` (
  `borrowernumber_id` int(11) NOT NULL,
  `housebound_chooser` tinyint(1) NOT NULL DEFAULT '0',
  `housebound_deliverer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`borrowernumber_id`),
  CONSTRAINT `houseboundrole_bnfk` FOREIGN KEY (`borrowernumber_id`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housebound_role`
--

LOCK TABLES `housebound_role` WRITE;
/*!40000 ALTER TABLE `housebound_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `housebound_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housebound_visit`
--

DROP TABLE IF EXISTS `housebound_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housebound_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `appointment_date` date DEFAULT NULL,
  `day_segment` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooser_brwnumber` int(11) DEFAULT NULL,
  `deliverer_brwnumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `houseboundvisit_bnfk` (`borrowernumber`),
  KEY `houseboundvisit_bnfk_1` (`chooser_brwnumber`),
  KEY `houseboundvisit_bnfk_2` (`deliverer_brwnumber`),
  CONSTRAINT `houseboundvisit_bnfk` FOREIGN KEY (`borrowernumber`) REFERENCES `housebound_profile` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `houseboundvisit_bnfk_1` FOREIGN KEY (`chooser_brwnumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `houseboundvisit_bnfk_2` FOREIGN KEY (`deliverer_brwnumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housebound_visit`
--

LOCK TABLES `housebound_visit` WRITE;
/*!40000 ALTER TABLE `housebound_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `housebound_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_auths`
--

DROP TABLE IF EXISTS `import_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_auths` (
  `import_record_id` int(11) NOT NULL,
  `matched_authid` int(11) DEFAULT NULL,
  `control_number` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorized_heading` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_source` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `import_auths_ibfk_1` (`import_record_id`),
  KEY `matched_authid` (`matched_authid`),
  CONSTRAINT `import_auths_ibfk_1` FOREIGN KEY (`import_record_id`) REFERENCES `import_records` (`import_record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_auths`
--

LOCK TABLES `import_auths` WRITE;
/*!40000 ALTER TABLE `import_auths` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_auths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_batches`
--

DROP TABLE IF EXISTS `import_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_batches` (
  `import_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `matcher_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_records` int(11) NOT NULL DEFAULT '0',
  `num_items` int(11) NOT NULL DEFAULT '0',
  `upload_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `overlay_action` enum('replace','create_new','use_template','ignore') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'create_new',
  `nomatch_action` enum('create_new','ignore') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'create_new',
  `item_action` enum('always_add','add_only_for_matches','add_only_for_new','ignore','replace') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always_add',
  `import_status` enum('staging','staged','importing','imported','reverting','reverted','cleaned') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'staging',
  `batch_type` enum('batch','z3950','webservice') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'batch',
  `record_type` enum('biblio','auth','holdings') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'biblio',
  `file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`import_batch_id`),
  KEY `branchcode` (`branchcode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_batches`
--

LOCK TABLES `import_batches` WRITE;
/*!40000 ALTER TABLE `import_batches` DISABLE KEYS */;
INSERT INTO `import_batches` VALUES (1,NULL,NULL,NULL,0,0,'2017-03-07 12:51:53','create_new','create_new','always_add','staged','z3950','biblio','BIBLIOTECA NACIONAL',NULL);
/*!40000 ALTER TABLE `import_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_biblios`
--

DROP TABLE IF EXISTS `import_biblios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_biblios` (
  `import_record_id` int(11) NOT NULL,
  `matched_biblionumber` int(11) DEFAULT NULL,
  `control_number` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_source` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isbn` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issn` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_items` tinyint(1) NOT NULL DEFAULT '0',
  KEY `import_biblios_ibfk_1` (`import_record_id`),
  KEY `matched_biblionumber` (`matched_biblionumber`),
  KEY `title` (`title`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `import_biblios_ibfk_1` FOREIGN KEY (`import_record_id`) REFERENCES `import_records` (`import_record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_biblios`
--

LOCK TABLES `import_biblios` WRITE;
/*!40000 ALTER TABLE `import_biblios` DISABLE KEYS */;
INSERT INTO `import_biblios` VALUES (1,NULL,NULL,NULL,'Educação cirúrgica básica','Valdemar Cardoso',NULL,NULL,0),(2,NULL,NULL,NULL,'Electron microscope studies on the morphology and origin of cytoplasmic annulate lamellae in normal oocytes of the golden hamste','Rogério dos Santos Cardoso Teixeira',NULL,NULL,0),(3,NULL,NULL,NULL,'Polipose gástrica múltipla e carcinoma do estômago','M. Cardoso de Oliveira, Aníbal Justiniano',NULL,NULL,0),(4,NULL,NULL,NULL,'A cicatriz','Hermínia Cardoso',NULL,NULL,0),(5,NULL,NULL,NULL,'Contribuição para o conhecimento dos coccinelídeos de Angola','Armando Américo Cardoso Raimundo, Maria Luísa Gomes Alves',NULL,NULL,0),(6,NULL,NULL,NULL,'O racionalismo e o problema histórico da filosofia','Tito Cardoso Cunha',NULL,NULL,0),(7,NULL,NULL,NULL,'A autoridade e a participação nos pequenos grupos','Brigitte Detry Cardoso e Cunha',NULL,NULL,0),(8,NULL,NULL,NULL,'O imposto profissional','António Manuel Cardoso Mota',NULL,NULL,0),(9,NULL,NULL,NULL,'Gramática individualizada','Idalina e J. Almeida Cardoso',NULL,NULL,0),(10,NULL,NULL,NULL,'O que sabemos?','Idalina e J. Almeida Cardoso',NULL,NULL,0),(11,NULL,NULL,NULL,'Geoquímica do Cu, Zn, Co, Ni, Cr em solos da região de Morais, NE transmontano, Portugal','Edmundo M. Cardoso Fonseca, J. M. Santos Oliveira',NULL,NULL,0),(12,NULL,NULL,NULL,'Contribuição para o estudo do óleo essencial de laranja doce \"Compal\"','A. Proença da Cunha, Odete Rodrigues Roque, J. Cardoso do Vale',NULL,NULL,0),(13,NULL,NULL,NULL,'Manual de corte Oliva','Oliva Comercial',NULL,NULL,0),(14,NULL,NULL,NULL,'Corpo de delito','Eusébio Cardoso Martins',NULL,NULL,0),(15,NULL,NULL,NULL,'Meu silêncio de palavras...','Luís Cardoso de Menezes',NULL,NULL,0),(16,NULL,NULL,NULL,'S. Gonçalo de Amarante','António Cardoso',NULL,NULL,0),(17,NULL,NULL,NULL,'Paulo VI ante a regulação dos nascimentos','Cardoso de Almeida... [et al.]',NULL,NULL,0),(18,NULL,NULL,NULL,'Ultrastrutura das \"Tigh junctions\" na camada granulosa nos folículos ováricos de criceto dourado','Rogério dos Santos Cardoso Teixeira',NULL,NULL,0),(19,NULL,NULL,NULL,'Púrpura trombocitopénica idiopática na doença de Hodgkin','Valdemar Cardoso, J. Sousa Rodrigues, M. Graça Castelo Branco',NULL,NULL,0),(20,NULL,NULL,NULL,'Edema agudo do pulmão num serviço de cuidados intensivos','A. Paes Cardoso... [et al.]',NULL,NULL,0),(21,NULL,NULL,NULL,'O menino Jesus','Departamento de Catequese do Patriarcado de Lisboa','9727665756',NULL,0);
/*!40000 ALTER TABLE `import_biblios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_items`
--

DROP TABLE IF EXISTS `import_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_items` (
  `import_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_record_id` int(11) NOT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('error','staged','imported','reverted','ignored') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'staged',
  `marcxml` longtext COLLATE utf8_unicode_ci NOT NULL,
  `import_error` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`import_items_id`),
  KEY `import_items_ibfk_1` (`import_record_id`),
  KEY `itemnumber` (`itemnumber`),
  KEY `branchcode` (`branchcode`),
  CONSTRAINT `import_items_ibfk_1` FOREIGN KEY (`import_record_id`) REFERENCES `import_records` (`import_record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_items`
--

LOCK TABLES `import_items` WRITE;
/*!40000 ALTER TABLE `import_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_record_matches`
--

DROP TABLE IF EXISTS `import_record_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_record_matches` (
  `import_record_id` int(11) NOT NULL,
  `candidate_match_id` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  KEY `record_score` (`import_record_id`,`score`),
  CONSTRAINT `import_record_matches_ibfk_1` FOREIGN KEY (`import_record_id`) REFERENCES `import_records` (`import_record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_record_matches`
--

LOCK TABLES `import_record_matches` WRITE;
/*!40000 ALTER TABLE `import_record_matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_record_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_records`
--

DROP TABLE IF EXISTS `import_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_records` (
  `import_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_batch_id` int(11) NOT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `record_sequence` int(11) NOT NULL DEFAULT '0',
  `upload_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_date` date DEFAULT NULL,
  `marc` longblob NOT NULL,
  `marcxml` longtext COLLATE utf8_unicode_ci NOT NULL,
  `marcxml_old` longtext COLLATE utf8_unicode_ci NOT NULL,
  `record_type` enum('biblio','auth','holdings') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'biblio',
  `overlay_status` enum('no_match','auto_match','manual_match','match_applied') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no_match',
  `status` enum('error','staged','imported','reverted','items_reverted','ignored') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'staged',
  `import_error` mediumtext COLLATE utf8_unicode_ci,
  `encoding` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `z3950random` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`import_record_id`),
  KEY `branchcode` (`branchcode`),
  KEY `batch_sequence` (`import_batch_id`,`record_sequence`),
  KEY `batch_id_record_type` (`import_batch_id`,`record_type`),
  CONSTRAINT `import_records_ifbk_1` FOREIGN KEY (`import_batch_id`) REFERENCES `import_batches` (`import_batch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_records`
--

LOCK TABLES `import_records` WRITE;
/*!40000 ALTER TABLE `import_records` DISABLE KEYS */;
INSERT INTO `import_records` VALUES (1,1,NULL,1,'2017-03-07 12:51:53',NULL,'00577cam a2200205  0450000100040000000500170000403500120002109500170003310000410005010100080009110200070009920000700010621000600017621500160023630500320025267500220028480100160030699800180032270000310034021819981110171800.0  a(bn)218  aPTBN00000224  a19790701d1979    m  y0pory5003    ba0 apor  aPT1 aEducação cirúrgica básicaepré-graduaçãofValdemar Cardoso  a[S.l.cs.n.,dD.L. 1979]ePorto :gTip. Costa Carregal)  a6 p.d23 cm  aSep. Jornal do Médico, 100  a377/378vmedzpor 0aPTbBNgRPC  aFSE01 - 00224 1aCardoso,bValdemar,f1932-','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00577cam a2200205  04500</leader>\n  <controlfield tag=\"001\">218</controlfield>\n  <controlfield tag=\"005\">19981110171800.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)218</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00000224</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19790701d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Educação cirúrgica básica</subfield>\n    <subfield code=\"e\">pré-graduação</subfield>\n    <subfield code=\"f\">Valdemar Cardoso</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">[S.l.</subfield>\n    <subfield code=\"c\">s.n.,</subfield>\n    <subfield code=\"d\">D.L. 1979]</subfield>\n    <subfield code=\"e\">Porto :</subfield>\n    <subfield code=\"g\">Tip. Costa Carregal)</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">6 p.</subfield>\n    <subfield code=\"d\">23 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Jornal do Médico, 100</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">377/378</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE01 - 00224</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cardoso,</subfield>\n    <subfield code=\"b\">Valdemar,</subfield>\n    <subfield code=\"f\">1932-</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(2,1,NULL,2,'2017-03-07 12:51:57',NULL,'00900cam a2200229  04500001000400000003009500004005001700099035001200116095001700128100004100145101000800186102000700194200019500201210005900396215002200455305005800477675001800535801001600553966003200569998001800601700005100619279http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&uri=full=3100024<U+007E>!279<U+007E>!019981110172000.0  a(bn)279  aPTBN00000287  a19790701d1979    m  y0pory5003    ba0 aeng  aPT1 aElectron microscope studies on the morphology and origin of cytoplasmic annulate lamellae in normal oocytes of the golden hamster (Mesocricetus auratus)fRogério dos Santos Cardoso Teixeira  a[S.l.cs.n.,dD.L. 1979]eCoimbra :gImpr. de Coimbra)  a28 p.cil.d23 cm  aSep. Folia Anatomica Universitatis Conimbrigensis, 45  a578vmedzpor 0aPTbBNgRPC  lBNmFGMONsS.A. 52402 V.x1  aFSE01 - 00287 1aTeixeira,bRogério dos Santos Cardoso,f1932-','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00900cam a2200229  04500</leader>\n  <controlfield tag=\"001\">279</controlfield>\n  <controlfield tag=\"003\">http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&amp;uri=full=3100024&lt;U+007E&gt;!279&lt;U+007E&gt;!0</controlfield>\n  <controlfield tag=\"005\">19981110172000.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)279</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00000287</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19790701d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">eng</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Electron microscope studies on the morphology and origin of cytoplasmic annulate lamellae in normal oocytes of the golden hamster (Mesocricetus auratus)</subfield>\n    <subfield code=\"f\">Rogério dos Santos Cardoso Teixeira</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">[S.l.</subfield>\n    <subfield code=\"c\">s.n.,</subfield>\n    <subfield code=\"d\">D.L. 1979]</subfield>\n    <subfield code=\"e\">Coimbra :</subfield>\n    <subfield code=\"g\">Impr. de Coimbra)</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">28 p.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">23 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Folia Anatomica Universitatis Conimbrigensis, 45</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">578</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">S.A. 52402 V.</subfield>\n    <subfield code=\"x\">1</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE01 - 00287</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Teixeira,</subfield>\n    <subfield code=\"b\">Rogério dos Santos Cardoso,</subfield>\n    <subfield code=\"f\">1932-</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(3,1,NULL,3,'2017-03-07 12:51:58',NULL,'00810cam a2200241  04500001000400000003009500004005001700099035001200116095001700128100004100145101000800186102000700194200010200201210006000303215002200363305003200385675001800417801001600435966003200451998001800483700003700501701003000538331http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&uri=full=3100024<U+007E>!331<U+007E>!019981110172100.0  a(bn)331  aPTBN00000339  a19790701d1979    m  y0pory5003    ba0 apor  aPT1 aPolipose gástrica múltipla e carcinoma do estômagofM. Cardoso de Oliveira, Aníbal Justiniano  a[S.l.cs.n.,dD.L. 1979]ePorto :gTip. Costa Carregal)  a11 p.cil.d23 cm  aSep. Jornal do Médico, 100  a616vmedzpor 0aPTbBNgRPC  lBNmFGMONsS.A. 52407 V.x1  aFSE01 - 00339 1aOliveira,bM. Cardoso de,f1939- 1aJustiniano,bAníbal4070','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00810cam a2200241  04500</leader>\n  <controlfield tag=\"001\">331</controlfield>\n  <controlfield tag=\"003\">http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&amp;uri=full=3100024&lt;U+007E&gt;!331&lt;U+007E&gt;!0</controlfield>\n  <controlfield tag=\"005\">19981110172100.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)331</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00000339</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19790701d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Polipose gástrica múltipla e carcinoma do estômago</subfield>\n    <subfield code=\"f\">M. Cardoso de Oliveira, Aníbal Justiniano</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">[S.l.</subfield>\n    <subfield code=\"c\">s.n.,</subfield>\n    <subfield code=\"d\">D.L. 1979]</subfield>\n    <subfield code=\"e\">Porto :</subfield>\n    <subfield code=\"g\">Tip. Costa Carregal)</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">11 p.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">23 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Jornal do Médico, 100</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">616</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">S.A. 52407 V.</subfield>\n    <subfield code=\"x\">1</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE01 - 00339</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Oliveira,</subfield>\n    <subfield code=\"b\">M. Cardoso de,</subfield>\n    <subfield code=\"f\">1939-</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Justiniano,</subfield>\n    <subfield code=\"b\">Aníbal</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(4,1,NULL,4,'2017-03-07 12:52:00',NULL,'00505cam a2200193  0450000100040000000500170000403500120002109500170003310000410005010100080009110200070009920000380010621000550014421500230019967500310022280100160025399800180026970000240028748920020308123200.0  a(bn)489  aPTBN00000502  a19790701d1979    m  y0pory5003    ba0 apor  aPT1 aA cicatrizfHermínia Cardoso  a[S.l.cs.n.],d1979eLisboa :gSociedade Astória)  a201, [2] p.d19 cm  a821.134.3-31\"19\"vmedzpor 0aPTbBNgRPC  aFSE01 - 00502 1aCardoso,bHermínia','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00505cam a2200193  04500</leader>\n  <controlfield tag=\"001\">489</controlfield>\n  <controlfield tag=\"005\">20020308123200.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)489</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00000502</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19790701d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">A cicatriz</subfield>\n    <subfield code=\"f\">Hermínia Cardoso</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">[S.l.</subfield>\n    <subfield code=\"c\">s.n.],</subfield>\n    <subfield code=\"d\">1979</subfield>\n    <subfield code=\"e\">Lisboa :</subfield>\n    <subfield code=\"g\">Sociedade Astória)</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">201, [2] p.</subfield>\n    <subfield code=\"d\">19 cm</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">821.134.3-31\"19\"</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE01 - 00502</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cardoso,</subfield>\n    <subfield code=\"b\">Hermínia</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(5,1,NULL,5,'2017-03-07 12:52:01',NULL,'00777cam a2200229  0450000100040000000500170000403500120002109500170003310000410005010100080009110200070009920001290010621000540023521500190028930500370030832700700034567500220041580100160043799800180045370000400047170100360051180619981110173400.0  a(bn)806  aPTBN00000823  a19800501d1980    m  y0pory5003    ba0 apor  aPT1 aContribuição para o conhecimento dos coccinelídeos de AngolafArmando Américo Cardoso Raimundo, Maria Luísa Gomes Alves  a[S.l.cs.n.,dD.L. 1980]eLisboa :gTip. Silvas)-  av.cil.d30 cm  aSep. Garcia de Orta: Sér. Zool.0 a1<U+00BA> v.: p. 23-39, 11 p. Sep. Garcia de Orta: Sér. Zool., 7  a592/599vmedzpor 0aPTbBNgRPC  aFSE02 - 00194 1aRaimundo,bArmando Américo Cardoso 1aAlves,bMaria Luísa Gomes4070','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00777cam a2200229  04500</leader>\n  <controlfield tag=\"001\">806</controlfield>\n  <controlfield tag=\"005\">19981110173400.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)806</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00000823</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800501d1980    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Contribuição para o conhecimento dos coccinelídeos de Angola</subfield>\n    <subfield code=\"f\">Armando Américo Cardoso Raimundo, Maria Luísa Gomes Alves</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">[S.l.</subfield>\n    <subfield code=\"c\">s.n.,</subfield>\n    <subfield code=\"d\">D.L. 1980]</subfield>\n    <subfield code=\"e\">Lisboa :</subfield>\n    <subfield code=\"g\">Tip. Silvas)-</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">v.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">30 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Garcia de Orta: Sér. Zool.</subfield>\n  </datafield>\n  <datafield tag=\"327\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">1&lt;U+00BA&gt; v.: p. 23-39, 11 p. Sep. Garcia de Orta: Sér. Zool., 7</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">592/599</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE02 - 00194</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Raimundo,</subfield>\n    <subfield code=\"b\">Armando Américo Cardoso</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Alves,</subfield>\n    <subfield code=\"b\">Maria Luísa Gomes</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(6,1,NULL,6,'2017-03-07 12:52:02',NULL,'00708cam a2200229  045000010005000000030096000050050017001010350013001180950017001311000041001481010008001891020007001972000080002042100042002842150022003263050020003486750017003688010016003859660032004019980018004337000027004511129http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&uri=full=3100024<U+007E>!1129<U+007E>!019981110174400.0  a(bn)1129  aPTBN00001154  a19800101d1980    km y0pory5003    ba0 apor  aPT1 aO racionalismo e o problema histórico da filosofiafTito Cardoso Cunha  aCoimbracFac. de Letras,d[D.L. 1980]  ap. 457-473d25 cm  aSep. Biblos, 55  a16vmedzpor 0aPTbBNgRPC  lBNmFGMONsS.A. 53402 V.x1  aFSE03 - 00062 1aCunha,bTito Cardoso e','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00708cam a2200229  04500</leader>\n  <controlfield tag=\"001\">1129</controlfield>\n  <controlfield tag=\"003\">http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&amp;uri=full=3100024&lt;U+007E&gt;!1129&lt;U+007E&gt;!0</controlfield>\n  <controlfield tag=\"005\">19981110174400.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1129</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001154</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1980    km y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">O racionalismo e o problema histórico da filosofia</subfield>\n    <subfield code=\"f\">Tito Cardoso Cunha</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Coimbra</subfield>\n    <subfield code=\"c\">Fac. de Letras,</subfield>\n    <subfield code=\"d\">[D.L. 1980]</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">p. 457-473</subfield>\n    <subfield code=\"d\">25 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Biblos, 55</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">16</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">S.A. 53402 V.</subfield>\n    <subfield code=\"x\">1</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00062</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cunha,</subfield>\n    <subfield code=\"b\">Tito Cardoso e</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(7,1,NULL,7,'2017-03-07 12:52:05',NULL,'00581cam a2200205  04500001000500000005001700005035001300022095001700035100004100052101000800093102000700101200009200108210004200200215003000242305002000272675001800292801001600310998001800326700003100344115319981110174500.0  a(bn)1153  aPTBN00001179  a19800101d1980    km y0pory5003    ba0 apor  aPT1 aA autoridade e a participação nos pequenos gruposfBrigitte Detry Cardoso e Cunha  aCoimbracFac. de Letras,d[D.L. 1980]  ap. 625-645, [1] p.d25 cm  aSep. Biblos, 55  a301vmedzpor 0aPTbBNgRPC  aFSE03 - 00087 1aCunha,bBrigitte Cardoso e','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00581cam a2200205  04500</leader>\n  <controlfield tag=\"001\">1153</controlfield>\n  <controlfield tag=\"005\">19981110174500.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1153</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001179</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1980    km y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">A autoridade e a participação nos pequenos grupos</subfield>\n    <subfield code=\"f\">Brigitte Detry Cardoso e Cunha</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Coimbra</subfield>\n    <subfield code=\"c\">Fac. de Letras,</subfield>\n    <subfield code=\"d\">[D.L. 1980]</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">p. 625-645, [1] p.</subfield>\n    <subfield code=\"d\">25 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Biblos, 55</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">301</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00087</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cunha,</subfield>\n    <subfield code=\"b\">Brigitte Cardoso e</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(8,1,NULL,8,'2017-03-07 12:52:07',NULL,'00661cam a2200229  0450000500170000003500130001709500170003010000410004710100080008810200070009620000970010320500170020021000360021721500180025350000250027167500180029670200400031471000140035480100160036896600290038499800180041319981110174600.0  a(bn)1215  aPTBN00001242  a19800101d1979    m  y0pory5003    ba0 apor  aPT1 aO imposto profissionalelegislação, notas e comentáriosfAntónio Manuel Cardoso Mota  a3<U+00AA> ed  aCoimbracCoimbra Editora,d1979  a450 p.d23 cm00aLeis, decretos, etc.  a351vmedzpor 1aMota,bAntónio Manuel Cardoso434001aPortugal. 0aPTbBNgRPC  lBNmFGMONsS.C. 47134 V.  aFSE03 - 00150','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00661cam a2200229  04500</leader>\n  <controlfield tag=\"005\">19981110174600.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1215</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001242</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">O imposto profissional</subfield>\n    <subfield code=\"e\">legislação, notas e comentários</subfield>\n    <subfield code=\"f\">António Manuel Cardoso Mota</subfield>\n  </datafield>\n  <datafield tag=\"205\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">3&lt;U+00AA&gt; ed</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Coimbra</subfield>\n    <subfield code=\"c\">Coimbra Editora,</subfield>\n    <subfield code=\"d\">1979</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">450 p.</subfield>\n    <subfield code=\"d\">23 cm</subfield>\n  </datafield>\n  <datafield tag=\"500\" ind1=\"0\" ind2=\"0\">\n    <subfield code=\"a\">Leis, decretos, etc.</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">351</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Mota,</subfield>\n    <subfield code=\"b\">António Manuel Cardoso</subfield>\n    <subfield code=\"4\">340</subfield>\n  </datafield>\n  <datafield tag=\"710\" ind1=\"0\" ind2=\"1\">\n    <subfield code=\"a\">Portugal.</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">S.C. 47134 V.</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00150</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(9,1,NULL,9,'2017-03-07 12:52:08',NULL,'00586cam a2200205  04500001000500000005001700005035001300022095001700035100004100052101000800093102000700101200009500108210003800203215002300241675002200264801001600286998001800302700003000320701003000350124519981110174700.0  a(bn)1245  aPTBN00001273  a19800101d1979    m  y0pory5003    ba0 apor  aPT1 aGramática individualizadaefichas de iniciação gramaticalfIdalina e J. Almeida Cardoso  a[Porto]cFigueirinhas,dimp. 1979  a120 p.cil.d24 cm  a372/373vmedzpor 0aPTbBNgRPC  aFSE03 - 00181 1aCardoso,bIdalina Almeida 1aCardoso,bJ. Almeida4070','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00586cam a2200205  04500</leader>\n  <controlfield tag=\"001\">1245</controlfield>\n  <controlfield tag=\"005\">19981110174700.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1245</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001273</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Gramática individualizada</subfield>\n    <subfield code=\"e\">fichas de iniciação gramatical</subfield>\n    <subfield code=\"f\">Idalina e J. Almeida Cardoso</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">[Porto]</subfield>\n    <subfield code=\"c\">Figueirinhas,</subfield>\n    <subfield code=\"d\">imp. 1979</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">120 p.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">24 cm</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">372/373</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00181</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cardoso,</subfield>\n    <subfield code=\"b\">Idalina Almeida</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cardoso,</subfield>\n    <subfield code=\"b\">J. Almeida</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(10,1,NULL,10,'2017-03-07 12:52:09',NULL,'00552cam a2200205  04500001000500000005001700005035001300022095001700035100004100052101000800093102000700101200006900108210003600177215001700213675002200230700003000252701003000282801001600312998001800328124719981110174700.0  a(bn)1247  aPTBN00001275  a19800101d1979    m  y0pory5003    ba0 apor  aPT1 aO que sabemos?efichas de trabalhofIdalina e J. Almeida Cardoso  aPortocFigueirinhas,dimp. 1979  a68 p.d24 cm  a372/373vmedzpor 1aCardoso,bIdalina Almeida 1aCardoso,bJ. Almeida4070 0aPTbBNgRPC  aFSE03 - 00183','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00552cam a2200205  04500</leader>\n  <controlfield tag=\"001\">1247</controlfield>\n  <controlfield tag=\"005\">19981110174700.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1247</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001275</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">O que sabemos?</subfield>\n    <subfield code=\"e\">fichas de trabalho</subfield>\n    <subfield code=\"f\">Idalina e J. Almeida Cardoso</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Porto</subfield>\n    <subfield code=\"c\">Figueirinhas,</subfield>\n    <subfield code=\"d\">imp. 1979</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">68 p.</subfield>\n    <subfield code=\"d\">24 cm</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">372/373</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cardoso,</subfield>\n    <subfield code=\"b\">Idalina Almeida</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cardoso,</subfield>\n    <subfield code=\"b\">J. Almeida</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00183</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(11,1,NULL,11,'2017-03-07 12:52:10',NULL,'00859cam a2200241  045000010005000000030096000050050017001010350013001180950017001311000041001481010008001891020007001972000146002042100049003502150027003993050049004266750018004758010016004939660032005099980018005417000025005597010033005841302http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&uri=full=3100024<U+007E>!1302<U+007E>!019981110174800.0  a(bn)1302  aPTBN00001331  a19800101d1979    m  y0pory5003    ba0 apor  aPT1 aGeoquímica do Cu, Zn, Co, Ni, Cr em solos da região de Morais, NE transmontano, PortugalfEdmundo M. Cardoso Fonseca, J. M. Santos Oliveira  aLisboacServ. Geológicos de Portugal,d1979  ap. 133-150cil.d23 cm  aSep. Comunicações Serv. Geol. Portugal, 64  a550vmedzpor 0aPTbBNgRPC  lBNmFGMONsS.A. 53324 V.x1  aFSE03 - 00239 1aFonseca,bE. Cardoso 1aOliveira,bJ. M. Santos4070','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00859cam a2200241  04500</leader>\n  <controlfield tag=\"001\">1302</controlfield>\n  <controlfield tag=\"003\">http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&amp;uri=full=3100024&lt;U+007E&gt;!1302&lt;U+007E&gt;!0</controlfield>\n  <controlfield tag=\"005\">19981110174800.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1302</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001331</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Geoquímica do Cu, Zn, Co, Ni, Cr em solos da região de Morais, NE transmontano, Portugal</subfield>\n    <subfield code=\"f\">Edmundo M. Cardoso Fonseca, J. M. Santos Oliveira</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Lisboa</subfield>\n    <subfield code=\"c\">Serv. Geológicos de Portugal,</subfield>\n    <subfield code=\"d\">1979</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">p. 133-150</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">23 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Comunicações Serv. Geol. Portugal, 64</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">550</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">S.A. 53324 V.</subfield>\n    <subfield code=\"x\">1</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00239</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Fonseca,</subfield>\n    <subfield code=\"b\">E. Cardoso</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Oliveira,</subfield>\n    <subfield code=\"b\">J. M. Santos</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(12,1,NULL,12,'2017-03-07 12:52:11',NULL,'00913cam a2200253  045000010005000000030096000050050017001010350013001180950017001311000041001481010008001891020007001972000142002042100065003462150022004113050034004336750018004677000035004857010026005208010016005469660032005629980018005947010047006121327http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&uri=full=3100024<U+007E>!1327<U+007E>!020020315135300.0  a(bn)1327  aPTBN00001357  a19800101d1980    km y0pory5003    ba0 apor  aPT1 aContribuição para o estudo do óleo essencial de laranja doce \"Compal\"fA. Proença da Cunha, Odete Rodrigues Roque, J. Cardoso do Vale  a[S.l.cs.n.,dD.L. 1980]eLisboa :gEd. Gráfica Portuguesa)  ap. 185-200d24 cm  aSep. Rev. Port. Farmácia, 29  a615vmedzpor 1aCunha,bA. Proença da,f1931- 1aRoque,bOdete R.4070 0aPTbBNgRPC  lBNmFGMONsS.A. 53351 V.x1  aFSE03 - 00265 1aVale,bJosé Baeta Cardoso do,f1911-4070','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00913cam a2200253  04500</leader>\n  <controlfield tag=\"001\">1327</controlfield>\n  <controlfield tag=\"003\">http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&amp;uri=full=3100024&lt;U+007E&gt;!1327&lt;U+007E&gt;!0</controlfield>\n  <controlfield tag=\"005\">20020315135300.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1327</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001357</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1980    km y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Contribuição para o estudo do óleo essencial de laranja doce \"Compal\"</subfield>\n    <subfield code=\"f\">A. Proença da Cunha, Odete Rodrigues Roque, J. Cardoso do Vale</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">[S.l.</subfield>\n    <subfield code=\"c\">s.n.,</subfield>\n    <subfield code=\"d\">D.L. 1980]</subfield>\n    <subfield code=\"e\">Lisboa :</subfield>\n    <subfield code=\"g\">Ed. Gráfica Portuguesa)</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">p. 185-200</subfield>\n    <subfield code=\"d\">24 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Rev. Port. Farmácia, 29</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">615</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cunha,</subfield>\n    <subfield code=\"b\">A. Proença da,</subfield>\n    <subfield code=\"f\">1931-</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Roque,</subfield>\n    <subfield code=\"b\">Odete R.</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">S.A. 53351 V.</subfield>\n    <subfield code=\"x\">1</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00265</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Vale,</subfield>\n    <subfield code=\"b\">José Baeta Cardoso do,</subfield>\n    <subfield code=\"f\">1911-</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(13,1,NULL,13,'2017-03-07 12:52:12',NULL,'00613cam a2200229  04500001000500000005001700005035001300022095001700035100004100052101000800093102000700101200006400108205001100172210003900183215002700222675002700249801001600276966001800292998001800310702003500328710002000363137019981110175000.0  a(bn)1370  aPTBN00001400  a19800101d1979    m  y0pory5003    ba0 apor  aPT1 aManual de corte OlivafOliva Comercialgil. Alberto Cardoso  a11a ed  aPortocOliva Comercial,dimp. 1979  a78, [1] p.cil.d30 cm  a646/649(035)vmedzpor 0aPTbBNgRPC  sS.A. 53298 V.  aFSE03 - 00308 1aCardoso,bAlberto,f1918-444002aOliva Comercial','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00613cam a2200229  04500</leader>\n  <controlfield tag=\"001\">1370</controlfield>\n  <controlfield tag=\"005\">19981110175000.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1370</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001400</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Manual de corte Oliva</subfield>\n    <subfield code=\"f\">Oliva Comercial</subfield>\n    <subfield code=\"g\">il. Alberto Cardoso</subfield>\n  </datafield>\n  <datafield tag=\"205\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">11a ed</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Porto</subfield>\n    <subfield code=\"c\">Oliva Comercial,</subfield>\n    <subfield code=\"d\">imp. 1979</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">78, [1] p.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">30 cm</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">646/649(035)</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"s\">S.A. 53298 V.</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00308</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cardoso,</subfield>\n    <subfield code=\"b\">Alberto,</subfield>\n    <subfield code=\"f\">1918-</subfield>\n    <subfield code=\"4\">440</subfield>\n  </datafield>\n  <datafield tag=\"710\" ind1=\"0\" ind2=\"2\">\n    <subfield code=\"a\">Oliva Comercial</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(14,1,NULL,14,'2017-03-07 12:52:12',NULL,'00535cam a2200205  04500001000500000005001700005035001300022095001700035100004100052101000800093102000700101200004600108210002800154215002200182225003000204675003000234801001600264998001800280700003100298151819981110175500.0  a(bn)1518  aPTBN00001556  a19800101d1978    m  y0pory5003    ba0 apor  aPT1 aCorpo de delitofEusébio Cardoso Martins  aLisboacCentelha,d1978  a57, [3] p.d18 cm2 aPoesia do nosso tempov22  a821.134.3-1\"19\"vmedzpor 0aPTbBNgRPC  aFSE03 - 00464 1aMartins,bEusébio Cardoso','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00535cam a2200205  04500</leader>\n  <controlfield tag=\"001\">1518</controlfield>\n  <controlfield tag=\"005\">19981110175500.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1518</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001556</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1978    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Corpo de delito</subfield>\n    <subfield code=\"f\">Eusébio Cardoso Martins</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Lisboa</subfield>\n    <subfield code=\"c\">Centelha,</subfield>\n    <subfield code=\"d\">1978</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">57, [3] p.</subfield>\n    <subfield code=\"d\">18 cm</subfield>\n  </datafield>\n  <datafield tag=\"225\" ind1=\"2\" ind2=\" \">\n    <subfield code=\"a\">Poesia do nosso tempo</subfield>\n    <subfield code=\"v\">22</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">821.134.3-1\"19\"</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00464</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Martins,</subfield>\n    <subfield code=\"b\">Eusébio Cardoso</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(15,1,NULL,15,'2017-03-07 12:52:13',NULL,'00541cam a2200193  04500001000500000005001700005035001300022095001700035100004100052101000800093102000700101200005900108210006300167215002200230675003000252801001600282998001800298700003100316151919981110175500.0  a(bn)1519  aPTBN00001557  a19800101d1979    m  y0pory5003    ba0 apor  aPT1 aMeu silêncio de palavras...fLuís Cardoso de Menezes  aLisboac[s.n.],dimp. 1979eLisboa :gTipocronomia Aguiar)  a79, [1] p.d20 cm  a821.134.3-1\"19\"vmedzpor 0aPTbBNgRPC  aFSE03 - 00465 1aMeneses,bLuís Cardoso de','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00541cam a2200193  04500</leader>\n  <controlfield tag=\"001\">1519</controlfield>\n  <controlfield tag=\"005\">19981110175500.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1519</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001557</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19800101d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Meu silêncio de palavras...</subfield>\n    <subfield code=\"f\">Luís Cardoso de Menezes</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Lisboa</subfield>\n    <subfield code=\"c\">[s.n.],</subfield>\n    <subfield code=\"d\">imp. 1979</subfield>\n    <subfield code=\"e\">Lisboa :</subfield>\n    <subfield code=\"g\">Tipocronomia Aguiar)</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">79, [1] p.</subfield>\n    <subfield code=\"d\">20 cm</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">821.134.3-1\"19\"</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE03 - 00465</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Meneses,</subfield>\n    <subfield code=\"b\">Luís Cardoso de</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(16,1,NULL,16,'2017-03-07 12:52:14',NULL,'00824cam a22002291 045000010005000000030096000050050017001010350013001180950017001311000041001481010008001891020007001972000139002042100039003432150035003825320030004176750025004478010016004729660029004889980018005177000059005351675http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&uri=full=3100024<U+007E>!1675<U+007E>!019981110175900.0  a(bn)1675  aPTBN00001718  a19930322d1978    m  d0pory5003    ba0 apor  aPT1 aS. Gonçalo de Amaranteelenda e históriaeo seu cultoeiconografia amarantinaeexposição biblo-iconográficafAntónio Cardoso  aAmarantecCâmara Municipal,d1978  a48 p., [17] f. il.cil.d24 cm12aSão Gonçalo de Amarante  a01vmedzpor3287995 0aPTbBNgRPC  lBNmRESIMPsRES. 2712 V.  aFSE04 - 00003 1aCarvalho,bAntónio Cardoso Pinheiro de,f1932-379066','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00824cam a22002291 04500</leader>\n  <controlfield tag=\"001\">1675</controlfield>\n  <controlfield tag=\"003\">http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&amp;uri=full=3100024&lt;U+007E&gt;!1675&lt;U+007E&gt;!0</controlfield>\n  <controlfield tag=\"005\">19981110175900.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1675</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001718</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19930322d1978    m  d0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">S. Gonçalo de Amarante</subfield>\n    <subfield code=\"e\">lenda e história</subfield>\n    <subfield code=\"e\">o seu culto</subfield>\n    <subfield code=\"e\">iconografia amarantina</subfield>\n    <subfield code=\"e\">exposição biblo-iconográfica</subfield>\n    <subfield code=\"f\">António Cardoso</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Amarante</subfield>\n    <subfield code=\"c\">Câmara Municipal,</subfield>\n    <subfield code=\"d\">1978</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">48 p., [17] f. il.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">24 cm</subfield>\n  </datafield>\n  <datafield tag=\"532\" ind1=\"1\" ind2=\"2\">\n    <subfield code=\"a\">São Gonçalo de Amarante</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">01</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n    <subfield code=\"3\">287995</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">RESIMP</subfield>\n    <subfield code=\"s\">RES. 2712 V.</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE04 - 00003</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Carvalho,</subfield>\n    <subfield code=\"b\">António Cardoso Pinheiro de,</subfield>\n    <subfield code=\"f\">1932-</subfield>\n    <subfield code=\"3\">79066</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(17,1,NULL,17,'2017-03-07 12:52:15',NULL,'00522cam a22001931 04500001000500000005001700005035001300022095001700035100004100052101000800093102000700101200008000108210003100188215002800219675001700247801001600264998001800280701003000298174219981110180100.0  a(bn)1742  aPTBN00001786  a19890325d1979    m  y0pory5003    ba0 apor  aPT1 aPaulo VI ante a regulação dos nascimentosfCardoso de Almeida... [et al.]  aLisboacFranciscana,d1979  a142, [1] p.cil.d20 cm  a26vmedzpor 0aPTbBNgRPC  aFSE04 - 00071 1aAlmeida,bCardoso de4070','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00522cam a22001931 04500</leader>\n  <controlfield tag=\"001\">1742</controlfield>\n  <controlfield tag=\"005\">19981110180100.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1742</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001786</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19890325d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Paulo VI ante a regulação dos nascimentos</subfield>\n    <subfield code=\"f\">Cardoso de Almeida... [et al.]</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Lisboa</subfield>\n    <subfield code=\"c\">Franciscana,</subfield>\n    <subfield code=\"d\">1979</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">142, [1] p.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">20 cm</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">26</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE04 - 00071</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Almeida,</subfield>\n    <subfield code=\"b\">Cardoso de</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(18,1,NULL,18,'2017-03-07 12:52:16',NULL,'00849cam a2200229  045000010005000000030096000050050017001010350013001180950017001311000041001481010008001891020007001972000141002042100061003452150022004063050059004286750018004877000051005058010016005569660029005729980018006011930http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&uri=full=3100024<U+007E>!1930<U+007E>!019981110180600.0  a(bn)1930  aPTBN00001976  a19790301d1979    m  y0pory5003    ba0 apor  aPT1 aUltrastrutura das \"Tigh junctions\" na camada granulosa nos folículos ováricos de criceto douradofRogério dos Santos Cardoso Teixeira  aCoimbrac[s.n.,dD.L. 1979]eCoimbra :gImp. de Coimbra)  a18 p.cil.d24 cm  aSep. Folia Anatómica Universitatis Conimbrigensis, 46  a591vmedzpor 1aTeixeira,bRogério dos Santos Cardoso,f1932- 0aPTbBNgRPC  lBNmFGMONsS.A. 51900 V.  aFSE04 - 00261','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00849cam a2200229  04500</leader>\n  <controlfield tag=\"001\">1930</controlfield>\n  <controlfield tag=\"003\">http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&amp;uri=full=3100024&lt;U+007E&gt;!1930&lt;U+007E&gt;!0</controlfield>\n  <controlfield tag=\"005\">19981110180600.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1930</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00001976</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19790301d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Ultrastrutura das \"Tigh junctions\" na camada granulosa nos folículos ováricos de criceto dourado</subfield>\n    <subfield code=\"f\">Rogério dos Santos Cardoso Teixeira</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Coimbra</subfield>\n    <subfield code=\"c\">[s.n.,</subfield>\n    <subfield code=\"d\">D.L. 1979]</subfield>\n    <subfield code=\"e\">Coimbra :</subfield>\n    <subfield code=\"g\">Imp. de Coimbra)</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">18 p.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">24 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Folia Anatómica Universitatis Conimbrigensis, 46</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">591</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Teixeira,</subfield>\n    <subfield code=\"b\">Rogério dos Santos Cardoso,</subfield>\n    <subfield code=\"f\">1932-</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">S.A. 51900 V.</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE04 - 00261</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(19,1,NULL,19,'2017-03-07 12:52:16',NULL,'00877cam a2200253  045000010005000000030096000050050017001010350013001180950017001311000041001481010008001891020007001972000129002042100060003332150021003933050031004146750018004457000031004638010016004949660029005109980018005397010030005577010036005871968http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&uri=full=3100024<U+007E>!1968<U+007E>!019981110180700.0  a(bn)1968  aPTBN00002015  a19790301d1979    m  y0pory5003    ba0 apor  aPT1 aPúrpura trombocitopénica idiopática na doença de HodgkinfValdemar Cardoso, J. Sousa Rodrigues, M. Graça Castelo Branco  a[S.l.cs.n.,dD.L. 1979]ePorto :gTip. Costa Carregal)  a6, [2] p.d23 cm  aSep. Jornal do Médico, 99  a616vmedzpor 1aCardoso,bValdemar,f1932- 0aPTbBNgRPC  lBNmFGMONsS.A. 51912 V.  aFSE04 - 00300 1aRodrigues,bJ. Sousa4070 1aCastelo Branco,bM. Graça4070','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00877cam a2200253  04500</leader>\n  <controlfield tag=\"001\">1968</controlfield>\n  <controlfield tag=\"003\">http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&amp;uri=full=3100024&lt;U+007E&gt;!1968&lt;U+007E&gt;!0</controlfield>\n  <controlfield tag=\"005\">19981110180700.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1968</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00002015</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19790301d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Púrpura trombocitopénica idiopática na doença de Hodgkin</subfield>\n    <subfield code=\"f\">Valdemar Cardoso, J. Sousa Rodrigues, M. Graça Castelo Branco</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">[S.l.</subfield>\n    <subfield code=\"c\">s.n.,</subfield>\n    <subfield code=\"d\">D.L. 1979]</subfield>\n    <subfield code=\"e\">Porto :</subfield>\n    <subfield code=\"g\">Tip. Costa Carregal)</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">6, [2] p.</subfield>\n    <subfield code=\"d\">23 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. Jornal do Médico, 99</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">616</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cardoso,</subfield>\n    <subfield code=\"b\">Valdemar,</subfield>\n    <subfield code=\"f\">1932-</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">S.A. 51912 V.</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE04 - 00300</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Rodrigues,</subfield>\n    <subfield code=\"b\">J. Sousa</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Castelo Branco,</subfield>\n    <subfield code=\"b\">M. Graça</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(20,1,NULL,20,'2017-03-07 12:52:17',NULL,'00736cam a2200229  045000010005000000030096000050050017001010350013001180950017001311000041001481010008001891020007001972000092002042100056002962150017003523050023003696750018003928010016004109660029004269980018004557010033004731980http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&uri=full=3100024<U+007E>!1980<U+007E>!019990625133500.0  a(bn)1980  aPTBN00002027  a19870301d1979    m  y0pory5003    ba0 apor  aPT1 aEdema agudo do pulmão num serviço de cuidados intensivosfA. Paes Cardoso... [et al.]  a[S.l.cs.n.,dD.L. 1979]ePorto :gImp. Portuguesa)  a10 p.d23 cm  aSep. O Médico, 90  a616vmedzpor 0aPTbBNgRPC  lBNmFGMONsS.A. 51916 V.  aFSE04 - 00312 1aCardoso,bAntónio Pais4070','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>00736cam a2200229  04500</leader>\n  <controlfield tag=\"001\">1980</controlfield>\n  <controlfield tag=\"003\">http://porbase.bnportugal.pt/ipac20/ipac.jsp?profile=bn&amp;uri=full=3100024&lt;U+007E&gt;!1980&lt;U+007E&gt;!0</controlfield>\n  <controlfield tag=\"005\">19990625133500.0</controlfield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1980</subfield>\n  </datafield>\n  <datafield tag=\"095\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PTBN00002027</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19870301d1979    m  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Edema agudo do pulmão num serviço de cuidados intensivos</subfield>\n    <subfield code=\"f\">A. Paes Cardoso... [et al.]</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">[S.l.</subfield>\n    <subfield code=\"c\">s.n.,</subfield>\n    <subfield code=\"d\">D.L. 1979]</subfield>\n    <subfield code=\"e\">Porto :</subfield>\n    <subfield code=\"g\">Imp. Portuguesa)</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">10 p.</subfield>\n    <subfield code=\"d\">23 cm</subfield>\n  </datafield>\n  <datafield tag=\"305\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Sep. O Médico, 90</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">616</subfield>\n    <subfield code=\"v\">med</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">BN</subfield>\n    <subfield code=\"g\">RPC</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">S.A. 51916 V.</subfield>\n  </datafield>\n  <datafield tag=\"998\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FSE04 - 00312</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Cardoso,</subfield>\n    <subfield code=\"b\">António Pais</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0'),(21,1,NULL,1,'2017-03-07 12:57:18',NULL,'01105cam a2200313   4500010001800000010001800018021001800036021001800054035001600072100004100088101000800129102000700137105001800144106000600162200009700168205001700265210004200282215002100324327011300345675001900458675001700477702002300494710005300517900002100570966005100591966005100642966004900693966004900742  a972-766-575-6  a972-766-689-2  aPTb185369/02  aPTb205381/04  a(bn)1153279  a20030319g20022004c  y0pory5003    ba0 apor  aPT  aa   z   000yy  ar1 aO menino JesusfDepartamento de Catequese do Patriarcado de Lisboagil. Fernando Gerardo  a1<U+00AA> ed  aRanholas - SintracImpala,d2002-2004  a2 v.cil.d26 cm1 a[1<U+00BA> v.]: O menino Jesus nasceu... - 32 p.a2<U+00BA> v.: O menino Jesus fez-se homem. - 2004. - 32 p.  a087.5vBNzpor  a232vBNzpor 1aGerardo,bFernando01aLisboa.bPatriarcado.bDepartamento de Catequese  aBIBNACd20130602  b001d[1<U+00BA> v.]lBNmFGMONsP. 19677 V.x1  b001d[1<U+00BA> v.]lBNmFGMONsP. 19677 V.x1  b001d2<U+00BA> v.lBNmFGMONsP. 19678 V.x1  b001d2<U+00BA> v.lBNmFGMONsP. 19678 V.x1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<collection\n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n  xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n  xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n<record>\n  <leader>01105cam a2200313   4500</leader>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">972-766-575-6</subfield>\n  </datafield>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">972-766-689-2</subfield>\n  </datafield>\n  <datafield tag=\"021\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">185369/02</subfield>\n  </datafield>\n  <datafield tag=\"021\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n    <subfield code=\"b\">205381/04</subfield>\n  </datafield>\n  <datafield tag=\"035\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">(bn)1153279</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">20030319g20022004c  y0pory5003    ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"0\" ind2=\" \">\n    <subfield code=\"a\">por</subfield>\n  </datafield>\n  <datafield tag=\"102\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">PT</subfield>\n  </datafield>\n  <datafield tag=\"105\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">a   z   000yy</subfield>\n  </datafield>\n  <datafield tag=\"106\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">r</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">O menino Jesus</subfield>\n    <subfield code=\"f\">Departamento de Catequese do Patriarcado de Lisboa</subfield>\n    <subfield code=\"g\">il. Fernando Gerardo</subfield>\n  </datafield>\n  <datafield tag=\"205\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">1&lt;U+00AA&gt; ed</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Ranholas - Sintra</subfield>\n    <subfield code=\"c\">Impala,</subfield>\n    <subfield code=\"d\">2002-2004</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">2 v.</subfield>\n    <subfield code=\"c\">il.</subfield>\n    <subfield code=\"d\">26 cm</subfield>\n  </datafield>\n  <datafield tag=\"327\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">[1&lt;U+00BA&gt; v.]: O menino Jesus nasceu... - 32 p.</subfield>\n    <subfield code=\"a\">2&lt;U+00BA&gt; v.: O menino Jesus fez-se homem. - 2004. - 32 p.</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">087.5</subfield>\n    <subfield code=\"v\">BN</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"675\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">232</subfield>\n    <subfield code=\"v\">BN</subfield>\n    <subfield code=\"z\">por</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"a\">Gerardo,</subfield>\n    <subfield code=\"b\">Fernando</subfield>\n  </datafield>\n  <datafield tag=\"710\" ind1=\"0\" ind2=\"1\">\n    <subfield code=\"a\">Lisboa.</subfield>\n    <subfield code=\"b\">Patriarcado.</subfield>\n    <subfield code=\"b\">Departamento de Catequese</subfield>\n  </datafield>\n  <datafield tag=\"900\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">BIBNAC</subfield>\n    <subfield code=\"d\">20130602</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"b\">001</subfield>\n    <subfield code=\"d\">[1&lt;U+00BA&gt; v.]</subfield>\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">P. 19677 V.</subfield>\n    <subfield code=\"x\">1</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"b\">001</subfield>\n    <subfield code=\"d\">[1&lt;U+00BA&gt; v.]</subfield>\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">P. 19677 V.</subfield>\n    <subfield code=\"x\">1</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"b\">001</subfield>\n    <subfield code=\"d\">2&lt;U+00BA&gt; v.</subfield>\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">P. 19678 V.</subfield>\n    <subfield code=\"x\">1</subfield>\n  </datafield>\n  <datafield tag=\"966\" ind1=\" \" ind2=\" \">\n    <subfield code=\"b\">001</subfield>\n    <subfield code=\"d\">2&lt;U+00BA&gt; v.</subfield>\n    <subfield code=\"l\">BN</subfield>\n    <subfield code=\"m\">FGMON</subfield>\n    <subfield code=\"s\">P. 19678 V.</subfield>\n    <subfield code=\"x\">1</subfield>\n  </datafield>\n</record>\n\n</collection>','','biblio','no_match','staged',NULL,'UTF-8','0');
/*!40000 ALTER TABLE `import_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `returndate` datetime DEFAULT NULL,
  `lastreneweddate` datetime DEFAULT NULL,
  `return` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `renewals` tinyint(4) DEFAULT NULL,
  `auto_renew` tinyint(1) DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `issuedate` datetime DEFAULT NULL,
  `onsite_checkout` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`issue_id`),
  UNIQUE KEY `itemnumber` (`itemnumber`),
  KEY `issuesborridx` (`borrowernumber`),
  KEY `itemnumber_idx` (`itemnumber`),
  KEY `branchcode_idx` (`branchcode`),
  KEY `bordate` (`borrowernumber`,`timestamp`),
  CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON UPDATE CASCADE,
  CONSTRAINT `issues_ibfk_2` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuingrules`
--

DROP TABLE IF EXISTS `issuingrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuingrules` (
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `restrictedtype` tinyint(1) DEFAULT NULL,
  `rentaldiscount` decimal(28,6) DEFAULT NULL,
  `reservecharge` decimal(28,6) DEFAULT NULL,
  `fine` decimal(28,6) DEFAULT NULL,
  `finedays` int(11) DEFAULT NULL,
  `maxsuspensiondays` int(11) DEFAULT NULL,
  `firstremind` int(11) DEFAULT NULL,
  `chargeperiod` int(11) DEFAULT NULL,
  `chargeperiod_charge_at` tinyint(1) NOT NULL DEFAULT '0',
  `accountsent` int(11) DEFAULT NULL,
  `chargename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maxissueqty` int(4) DEFAULT NULL,
  `maxonsiteissueqty` int(4) DEFAULT NULL,
  `issuelength` int(4) DEFAULT NULL,
  `lengthunit` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'days',
  `hardduedate` date DEFAULT NULL,
  `hardduedatecompare` tinyint(4) NOT NULL DEFAULT '0',
  `renewalsallowed` smallint(6) NOT NULL DEFAULT '0',
  `renewalperiod` int(4) DEFAULT NULL,
  `norenewalbefore` int(4) DEFAULT NULL,
  `auto_renew` tinyint(1) DEFAULT '0',
  `no_auto_renewal_after` int(4) DEFAULT NULL,
  `reservesallowed` smallint(6) NOT NULL DEFAULT '0',
  `holds_per_record` smallint(6) NOT NULL DEFAULT '1',
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `overduefinescap` decimal(28,6) DEFAULT NULL,
  `cap_fine_to_replacement_price` tinyint(1) NOT NULL DEFAULT '0',
  `onshelfholds` tinyint(1) NOT NULL DEFAULT '0',
  `opacitemholds` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `article_requests` enum('no','yes','bib_only','item_only') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`branchcode`,`categorycode`,`itemtype`),
  KEY `categorycode` (`categorycode`),
  KEY `itemtype` (`itemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuingrules`
--

LOCK TABLES `issuingrules` WRITE;
/*!40000 ALTER TABLE `issuingrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuingrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_circulation_alert_preferences`
--

DROP TABLE IF EXISTS `item_circulation_alert_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_circulation_alert_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `item_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `notification` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branchcode` (`branchcode`,`categorycode`,`item_type`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_circulation_alert_preferences`
--

LOCK TABLES `item_circulation_alert_preferences` WRITE;
/*!40000 ALTER TABLE `item_circulation_alert_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_circulation_alert_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemnumber` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `biblioitemnumber` int(11) NOT NULL DEFAULT '0',
  `barcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateaccessioned` date DEFAULT NULL,
  `booksellerid` mediumtext COLLATE utf8_unicode_ci,
  `homebranch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `replacementprice` decimal(8,2) DEFAULT NULL,
  `replacementpricedate` date DEFAULT NULL,
  `datelastborrowed` date DEFAULT NULL,
  `datelastseen` date DEFAULT NULL,
  `stack` tinyint(1) DEFAULT NULL,
  `notforloan` tinyint(1) NOT NULL DEFAULT '0',
  `damaged` tinyint(1) NOT NULL DEFAULT '0',
  `itemlost` tinyint(1) NOT NULL DEFAULT '0',
  `itemlost_on` datetime DEFAULT NULL,
  `withdrawn` tinyint(1) NOT NULL DEFAULT '0',
  `withdrawn_on` datetime DEFAULT NULL,
  `itemcallnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coded_location_qualifier` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issues` smallint(6) DEFAULT NULL,
  `renewals` smallint(6) DEFAULT NULL,
  `reserves` smallint(6) DEFAULT NULL,
  `restricted` tinyint(1) DEFAULT NULL,
  `itemnotes` mediumtext COLLATE utf8_unicode_ci,
  `itemnotes_nonpublic` mediumtext COLLATE utf8_unicode_ci,
  `holdingbranch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paidfor` mediumtext COLLATE utf8_unicode_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanent_location` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onloan` date DEFAULT NULL,
  `cn_source` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_sort` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ccode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `materials` text COLLATE utf8_unicode_ci,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `more_subfields_xml` longtext COLLATE utf8_unicode_ci,
  `enumchron` text COLLATE utf8_unicode_ci,
  `copynumber` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stocknumber` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_status` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`itemnumber`),
  UNIQUE KEY `itembarcodeidx` (`barcode`),
  KEY `itemstocknumberidx` (`stocknumber`),
  KEY `itembinoidx` (`biblioitemnumber`),
  KEY `itembibnoidx` (`biblionumber`),
  KEY `homebranch` (`homebranch`),
  KEY `holdingbranch` (`holdingbranch`),
  KEY `itemcallnumber` (`itemcallnumber`),
  KEY `items_location` (`location`),
  KEY `items_ccode` (`ccode`),
  KEY `itype_idx` (`itype`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`biblioitemnumber`) REFERENCES `biblioitems` (`biblioitemnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`homebranch`) REFERENCES `branches` (`branchcode`) ON UPDATE CASCADE,
  CONSTRAINT `items_ibfk_3` FOREIGN KEY (`holdingbranch`) REFERENCES `branches` (`branchcode`) ON UPDATE CASCADE,
  CONSTRAINT `items_ibfk_4` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_last_borrower`
--

DROP TABLE IF EXISTS `items_last_borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_last_borrower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemnumber` int(11) NOT NULL,
  `borrowernumber` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemnumber` (`itemnumber`),
  KEY `borrowernumber` (`borrowernumber`),
  CONSTRAINT `items_last_borrower_ibfk_1` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_last_borrower_ibfk_2` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_last_borrower`
--

LOCK TABLES `items_last_borrower` WRITE;
/*!40000 ALTER TABLE `items_last_borrower` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_last_borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_search_fields`
--

DROP TABLE IF EXISTS `items_search_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_search_fields` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tagfield` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `tagsubfield` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorised_values_category` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `items_search_fields_authorised_values_category` (`authorised_values_category`),
  CONSTRAINT `items_search_fields_authorised_values_category` FOREIGN KEY (`authorised_values_category`) REFERENCES `authorised_value_categories` (`category_name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_search_fields`
--

LOCK TABLES `items_search_fields` WRITE;
/*!40000 ALTER TABLE `items_search_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_search_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemtypes`
--

DROP TABLE IF EXISTS `itemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemtypes` (
  `itemtype` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `rentalcharge` double(16,4) DEFAULT NULL,
  `notforloan` smallint(6) DEFAULT NULL,
  `imageurl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `checkinmsg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkinmsgtype` char(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'message',
  `sip_media_type` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hideinopac` tinyint(1) NOT NULL DEFAULT '0',
  `searchcategory` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`itemtype`),
  UNIQUE KEY `itemtype` (`itemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtypes`
--

LOCK TABLES `itemtypes` WRITE;
/*!40000 ALTER TABLE `itemtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kemnersaker`
--

DROP TABLE IF EXISTS `kemnersaker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kemnersaker` (
  `issue_id` int(11) NOT NULL,
  `borrowernumber` int(11) NOT NULL,
  `itemnumber` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`issue_id`),
  KEY `kemner_issueidx` (`issue_id`),
  KEY `kemner_borroweridx` (`borrowernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kemnersaker`
--

LOCK TABLES `kemnersaker` WRITE;
/*!40000 ALTER TABLE `kemnersaker` DISABLE KEYS */;
/*!40000 ALTER TABLE `kemnersaker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_descriptions`
--

DROP TABLE IF EXISTS `language_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_descriptions` (
  `subtag` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`),
  KEY `subtag_type_lang` (`subtag`,`type`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_descriptions`
--

LOCK TABLES `language_descriptions` WRITE;
/*!40000 ALTER TABLE `language_descriptions` DISABLE KEYS */;
INSERT INTO `language_descriptions` VALUES ('opac','i','en','OPAC',1),('opac','i','fr','OPAC',2),('opac','i','de','OPAC',3),('intranet','i','en','Staff Client',4),('intranet','i','fr','Client personnel',5),('intranet','i','de','Dienstoberfläche',6),('prog','t','en','Prog',7),('prog','t','fr','Prog',8),('prog','t','de','Prog',9),('am','language','am','አማርኛ',10),('am','language','en','Amharic',11),('ar','language','ar','لعربية',12),('ar','language','en','Arabic',13),('ar','language','fr','Arabe',14),('ar','language','de','Arabisch',15),('az','language','az','Azərbaycan dili',16),('az','language','en','Azerbaijani',17),('be','language','be','Беларуская мова',18),('be','language','en','Byelorussian',19),('bn','language','bn','বাংলা',20),('bn','language','en','Bengali',21),('bg','language','bg','Български',22),('bg','language','en','Bulgarian',23),('bg','language','fr','Bulgare',24),('bg','language','de','Bulgarisch',25),('ca','language','es','Catalán',26),('ca','language','en','Catalan',27),('ca','language','fr','Catalan',28),('ca','language','ca','Català',29),('ca','language','de','Katalanisch',30),('cs','language','cs','Čeština',31),('cs','language','en','Czech',32),('cs','language','fr','Tchèque',33),('cs','language','de','Tschechisch',34),('da','language','da','Dansk',35),('da','language','en','Danish',36),('da','language','fr','Danois',37),('da','language','de','Dänisch',38),('de','language','de','Deutsch',39),('de','language','en','German',40),('de','language','fr','Allemand',41),('el','language','el','Eλληνικά',42),('el','language','en','Greek, Modern [1453- ]',43),('el','language','fr','Grec Moderne (Après 1453)',44),('el','language','de','Griechisch (Moern [1453- ]',45),('en','language','en','English',46),('en','language','fr','Anglais',47),('en','language','de','Englisch',48),('es','language','es','Español',49),('es','language','en','Spanish',50),('es','language','fr','Espagnol',51),('es','language','de','Spanisch',52),('eu','language','eu','Euskera',53),('eu','language','en','Basque',54),('fa','language','fa','فارسى',55),('fa','language','en','Persian',56),('fa','language','fr','Persan',57),('fa','language','de','Persisch',58),('fi','language','fi','Suomi',59),('fi','language','en','Finnish',60),('fi','language','de','Finnisch',61),('fo','language','fo','Føroyskt',62),('fo','language','en','Faroese',63),('fr','language','en','French',64),('fr','language','fr','Français',65),('fr','language','de','Französisch',66),('gl','language','gl','Galego',67),('gl','language','en','Galician',68),('gl','language','fr','Galicien',69),('gl','language','de','Galicisch',70),('he','language','he','עִבְרִית',71),('he','language','en','Hebrew',72),('he','language','fr','Hébreu',73),('he','language','de','Hebräisch',74),('hi','language','hi','हिन्दी',75),('hi','language','en','Hindi',76),('hi','language','fr','Hindi',77),('hi','language','de','Hindi',78),('hr','language','hr','Hrvatski',79),('hr','language','en','Croatian',80),('hr','language','fr','Croate',81),('hr','language','de','Kroatisch',82),('hu','language','hu','Magyar',83),('hu','language','en','Hungarian',84),('hu','language','fr','Hongrois',85),('hu','language','de','Ungarisch',86),('hy','language','hy','Հայերեն',87),('hy','language','en','Armenian',88),('hy','language','fr','Armenian',89),('hy','language','de','Armenisch',90),('id','language','id','Bahasa Indonesia',91),('id','language','en','Indonesian',92),('id','language','fr','Indonésien',93),('id','language','de','Indonesisch',94),('is','language','is','Íslenska',95),('is','language','en','Icelandic',96),('it','language','it','Italiano',97),('it','language','en','Italian',98),('it','language','fr','Italien',99),('it','language','de','Italienisch',100),('ja','language','ja','日本語',101),('ja','language','en','Japanese',102),('ja','language','fr','Japonais',103),('ja','language','de','Japanisch',104),('ka','language','ka','ქართული',105),('ka','language','en','Georgian',106),('ka','language','fr','Géorgien',107),('ka','language','de','Georgisch',108),('ka','language','es','Georgiano',109),('kn','language','kn','ಕನ್ನಡ',110),('kn','language','en','Kannada',111),('km','language','km','ភាសាខ្មែរ',112),('km','language','en','Khmer',113),('ko','language','ko','한국어',114),('ko','language','en','Korean',115),('ko','language','fr','Coréen',116),('ko','language','de','Koreanisch',117),('ku','language','ku','کوردی',118),('ku','language','en','Kurdish',119),('ku','language','fr','Kurde',120),('ku','language','de','Kurdisch',121),('ku','language','es','Kurdo',122),('la','language','la','Latina',123),('la','language','en','Latin',124),('la','language','fr','Latin',125),('la','language','de','Latein',126),('lo','language','lo','ພາສາລາວ',127),('lo','language','en','Lao',128),('lo','language','fr','Laotien',129),('lo','language','de','Laotisch',130),('mi','language','mi','Te Reo Māori',131),('mi','language','en','Maori',132),('mn','language','mn','Mонгол',133),('mn','language','en','Mongolian',134),('mr','language','mr','मराठी',135),('mr','language','en','Marathi',136),('ms','language','ms','Bahasa melayu',137),('ms','language','en','Malay',138),('nb','language','nb','Norsk bokmål',139),('nb','language','en','Norwegian bokmål',140),('nb','language','fr','Norvégien bokmål',141),('nb','language','de','Norwegisch bokmål',142),('ne','language','ne','नेपाली',143),('ne','language','en','Nepali',144),('nl','language','nl','Nederlands',145),('nl','language','en','Dutch',146),('nl','language','fr','Néerlandais',147),('nl','language','de','Niederländisch',148),('nn','language','nb','Norsk nynorsk',149),('nn','language','nn','Norsk nynorsk',150),('nn','language','en','Norwegian nynorsk',151),('nn','language','fr','Norvégien nynorsk',152),('nn','language','de','Norwegisch nynorsk',153),('pbr','language','pbr','Ekipangwa',154),('pbr','language','en','Pangwa',155),('pl','language','pl','Polski',156),('pl','language','en','Polish',157),('pl','language','fr','Polonais',158),('pl','language','de','Polnisch',159),('prs','language','prs','درى',160),('prs','language','en','Dari',161),('pt','language','pt','Português',162),('pt','language','en','Portuguese',163),('pt','language','fr','Portugais',164),('pt','language','de','Portugiesisch',165),('ro','language','ro','Română',166),('ro','language','en','Romanian',167),('ro','language','fr','Roumain',168),('ro','language','de','Rumänisch',169),('ru','language','ru','Русский',170),('ru','language','en','Russian',171),('ru','language','fr','Russe',172),('ru','language','de','Russisch',173),('rw','language','rw','Ikinyarwanda',174),('rw','language','en','Kinyarwanda',175),('sd','language','sd','سنڌي',176),('sd','language','en','Sindhi',177),('sk','language','sk','Slovenčina',178),('sk','language','en','Slovak',179),('sl','language','sl','Slovenščina',180),('sl','language','en','Slovene',181),('sq','language','sq','Shqip',182),('sq','language','en','Albanian',183),('sr','language','sr','Cрпски',184),('sr','language','en','Serbian',185),('sr','language','fr','Serbe',186),('sr','language','de','Serbisch',187),('sv','language','sv','Svenska',188),('sv','language','en','Swedish',189),('sv','language','fr','Suédois',190),('sv','language','de','Schwedisch',191),('sw','language','sw','Kiswahili',192),('sw','language','en','Swahili',193),('ta','language','ta','தமிழ்',194),('ta','language','en','Tamil',195),('tet','language','tet','Tetun',196),('tet','language','en','Tetum',197),('tet','language','fr','Tétoum',198),('tet','language','de','Tetum',199),('th','language','th','ภาษาไทย',200),('th','language','en','Thai',201),('th','language','fr','Thaï',202),('th','language','de','Thailändisch',203),('tl','language','tl','Tagalog',204),('tl','language','en','Tagalog',205),('tr','language','tr','Türkçe',206),('tr','language','en','Turkish',207),('tr','language','fr','Turc',208),('tr','language','de','Türkisch',209),('uk','language','uk','Українська',210),('uk','language','en','Ukranian',211),('uk','language','fr','Ukrainien',212),('uk','language','de','Ukrainisch',213),('ur','language','en','Urdu',214),('ur','language','ur','اردو',215),('ur','language','fr','Ourdou',216),('ur','language','de','Urdu',217),('vi','language','vi','㗂越',218),('vi','language','en','Vietnamese',219),('zh','language','zh','中文',220),('zh','language','en','Chinese',221),('zh','language','fr','Chinois',222),('zh','language','de','Chinesisch',223),('Arab','script','Arab','العربية',224),('Arab','script','en','Arabic',225),('Arab','script','fr','Arabic',226),('Arab','script','de','Arabisch',227),('Armn','script','Armn','Հայոց այբուբեն',228),('Armn','script','en','Armenian',229),('Cyrl','script','Cyrl','Кирилица',230),('Cyrl','script','en','Cyrillic',231),('Cyrl','script','fr','Cyrillic',232),('Cyrl','script','de','Kyrillisch',233),('Ethi','script','Ethi','ግዕዝ',234),('Ethi','script','en','Ethiopic',235),('Grek','script','Grek','Ελληνικό αλφάβητο',236),('Grek','script','en','Greek',237),('Grek','script','fr','Greek',238),('Grek','script','de','Griechisch',239),('Hans','script','Hans','简体字',240),('Hans','script','en','Han (Simplified variant)',241),('Hans','script','fr','Han (Simplified variant)',242),('Hans','script','de','Han (Vereinfachte Variante)',243),('Hant','script','Hant','繁體字',244),('Hant','script','en','Han (Traditional variant)',245),('Hant','script','de','Han (Traditionelle Variante)',246),('Hebr','script','Hebr','אָלֶף־בֵּית עִבְרִי',247),('Hebr','script','en','Hebrew',248),('Hebr','script','de','Hebräisch',249),('Jpan','script','Jpan','漢字',250),('Jpan','script','en','Japanese',251),('Knda','script','Knda','ಕನ್ನಡ ಲಿಪಿ',252),('Knda','script','en','Kannada',253),('Kore','script','Kore','한글',254),('Kore','script','en','Korean',255),('Laoo','script','Laoo','ອັກສອນລາວ',256),('Laoo','script','en','Lao',257),('Laoo','script','de','Laotisch',258),('AL','region','en','Albania',259),('AL','region','sq','Shqipërisë',260),('AZ','region','en','Azerbaijan',261),('AZ','region','az','Azərbaycan',262),('BE','region','en','Belgium',263),('BE','region','nl','België',264),('BR','region','en','Brazil',265),('BR','region','pt','Brasil',266),('BY','region','en','Belarus',267),('BY','region','be','Беларусь',268),('CA','region','en','Canada',269),('CA','region','fr','Canada',270),('CH','region','en','Switzerland',271),('CH','region','de','Schweiz',272),('CN','region','en','China',273),('CN','region','zh','中国',274),('CZ','region','en','Czech Republic',275),('CZ','region','cs','Česká republika',276),('DE','region','en','Germany',277),('DE','region','de','Deutschland',278),('DK','region','en','Denmark',279),('DK','region','dk','Danmark',280),('ES','region','en','Spain',281),('ES','region','es','España',282),('FI','region','en','Finland',283),('FI','region','fi','Suomi',284),('FO','region','en','Faroe Islands',285),('FO','region','fo','Føroyar',286),('FR','region','en','France',287),('FR','region','fr','France',288),('GB','region','en','United Kingdom',289),('GR','region','en','Greece',290),('GR','region','el','Ελλάδα',291),('HR','region','en','Croatia',292),('HR','region','hr','Hrvatska',293),('HU','region','en','Hungary',294),('HU','region','hu','Magyarország',295),('ID','region','en','Indonesia',296),('ID','region','id','Indonesia',297),('IN','region','en','India',298),('IN','region','bn','ভারত',299),('IS','region','en','Iceland',300),('IS','region','is','Ísland',301),('IT','region','en','Italy',302),('IT','region','it','Italia',303),('JP','region','en','Japan',304),('JP','region','ja','日本',305),('KE','region','en','Kenya',306),('KE','region','rw','Kenya',307),('KH','region','en','Cambodia',308),('KH','region','km','កម្ពុជា',309),('KP','region','en','North Korea',310),('KP','region','ko','조선민주주의인민공화국',311),('LK','region','en','Sri Lanka',312),('LK','region','ta','இலங்கை',313),('MY','region','en','Malaysia',314),('MY','region','ms','Malaysia',315),('NE','region','en','Niger',316),('NE','region','ne','Niger',317),('NL','region','en','Netherlands',318),('NL','region','nl','Nederland',319),('NO','region','en','Norway',320),('NO','region','ne','Noreg',321),('NO','region','nn','Noreg',322),('NZ','region','en','New Zealand',323),('PH','region','en','Philippines',324),('PH','region','tl','Pilipinas',325),('PK','region','en','Pakistan',326),('PK','region','sd','پاكستان',327),('PL','region','en','Poland',328),('PL','region','pl','Polska',329),('PT','region','en','Portugal',330),('PT','region','pt','Portugal',331),('RO','region','en','Romania',332),('RO','region','ro','România',333),('RU','region','en','Russia',334),('RU','region','ru','Россия',335),('RW','region','en','Rwanda',336),('RW','region','rw','Rwanda',337),('SE','region','en','Sweden',338),('SE','region','sv','Sverige',339),('SI','region','en','Slovenia',340),('SI','region','sl','Slovenija',341),('SK','region','en','Slovakia',342),('SK','region','sk','Slovensko',343),('TH','region','en','Thailand',344),('TH','region','th','ประเทศไทย',345),('TR','region','en','Turkey',346),('TR','region','tr','Türkiye',347),('TW','region','en','Taiwan',348),('TW','region','zh','台灣',349),('UA','region','en','Ukraine',350),('UA','region','uk','Україна',351),('US','region','en','United States',352),('VN','region','en','Vietnam',353),('VN','region','vi','Việt Nam',354);
/*!40000 ALTER TABLE `language_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_rfc4646_to_iso639`
--

DROP TABLE IF EXISTS `language_rfc4646_to_iso639`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_rfc4646_to_iso639` (
  `rfc4646_subtag` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso639_2_code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `rfc4646_subtag` (`rfc4646_subtag`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_rfc4646_to_iso639`
--

LOCK TABLES `language_rfc4646_to_iso639` WRITE;
/*!40000 ALTER TABLE `language_rfc4646_to_iso639` DISABLE KEYS */;
INSERT INTO `language_rfc4646_to_iso639` VALUES ('am','amh',1),('ar','ara',2),('az','aze',3),('be','bel',4),('bn','ben',5),('bg','bul',6),('ca','cat',7),('cs','cze',8),('da','dan',9),('de','ger',10),('el','gre',11),('en','eng',12),('es','spa',13),('eu','eus',14),('fa','per',15),('fi','fin',16),('fo','fao',17),('fr','fre',18),('gl','glg',19),('he','heb',20),('hi','hin',21),('hr','hrv',22),('hu','hun',23),('hy','arm',24),('id','ind',25),('is','ice',26),('it','ita',27),('ja','jpn',28),('ka','geo',29),('kn','kan',30),('km','khm',31),('ko','kor',32),('ku','kur',33),('la','lat',34),('lo','lao',35),('mi','mri',36),('mn','mon',37),('mr','mar',38),('ms','may',39),('nb','nob',40),('ne','nep',41),('nl','dut',42),('nn','nno',43),('pbr','pbr',44),('pl','pol',45),('prs','prs',46),('pt','por',47),('ro','rum',48),('ru','rus',49),('rw','kin',50),('sd','snd',51),('sk','slk',52),('sl','slv',53),('sq','sqi',54),('sr','srp',55),('sv','swe',56),('sw','swa',57),('ta','tam',58),('tet','tet',59),('th','tha',60),('tl','tgl',61),('tr','tur',62),('uk','ukr',63),('ur','urd',64),('vi','vie',65),('zh','chi',66);
/*!40000 ALTER TABLE `language_rfc4646_to_iso639` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_script_bidi`
--

DROP TABLE IF EXISTS `language_script_bidi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_script_bidi` (
  `rfc4646_subtag` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bidi` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `rfc4646_subtag` (`rfc4646_subtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_script_bidi`
--

LOCK TABLES `language_script_bidi` WRITE;
/*!40000 ALTER TABLE `language_script_bidi` DISABLE KEYS */;
INSERT INTO `language_script_bidi` VALUES ('Arab','rtl'),('Hebr','rtl');
/*!40000 ALTER TABLE `language_script_bidi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_script_mapping`
--

DROP TABLE IF EXISTS `language_script_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_script_mapping` (
  `language_subtag` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script_subtag` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `language_subtag` (`language_subtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_script_mapping`
--

LOCK TABLES `language_script_mapping` WRITE;
/*!40000 ALTER TABLE `language_script_mapping` DISABLE KEYS */;
INSERT INTO `language_script_mapping` VALUES ('ar','Arab'),('he','Hebr');
/*!40000 ALTER TABLE `language_script_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_subtag_registry`
--

DROP TABLE IF EXISTS `language_subtag_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_subtag_registry` (
  `subtag` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` date DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `subtag` (`subtag`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_subtag_registry`
--

LOCK TABLES `language_subtag_registry` WRITE;
/*!40000 ALTER TABLE `language_subtag_registry` DISABLE KEYS */;
INSERT INTO `language_subtag_registry` VALUES ('opac','i','OPAC','2005-10-16',1),('intranet','i','Staff Client','2005-10-16',2),('prog','t','Prog','2005-10-16',3),('am','language','Amharic','2014-10-29',4),('ar','language','Arabic','2005-10-16',5),('az','language','Azerbaijani','2014-10-30',6),('be','language','Byelorussian','2014-10-30',7),('bn','language','Bengali','2014-10-30',8),('bg','language','Bulgarian','2005-10-16',9),('ca','language','Catalan','2013-01-12',10),('cs','language','Czech','2005-10-16',11),('da','language','Danish','2005-10-16',12),('de','language','German','2005-10-16',13),('el','language','Greek, Modern [1453- ]','2005-10-16',14),('en','language','English','2005-10-16',15),('es','language','Spanish','2005-10-16',16),('eu','language','Basque','2014-10-30',17),('fa','language','Persian','2005-10-16',18),('fi','language','Finnish','2005-10-16',19),('fo','language','Faroese','2014-10-30',20),('fr','language','French','2005-10-16',21),('gl','language','Galician','2005-10-16',22),('he','language','Hebrew','2005-10-16',23),('hi','language','Hindi','2005-10-16',24),('hr','language','Croatian','2014-07-24',25),('hu','language','Hungarian','2005-10-16',26),('hy','language','Armenian','2005-10-16',27),('id','language','Indonesian','2005-10-16',28),('is','language','Icelandic','2014-10-30',29),('it','language','Italian','2005-10-16',30),('ja','language','Japanese','2005-10-16',31),('ka','language','Georgian','2015-04-20',32),('kn','language','Kannada','2014-10-30',33),('km','language','Khmer','2014-10-30',34),('ko','language','Korean','2005-10-16',35),('ku','language','Kurdish','2014-05-13',36),('la','language','Latin','2005-10-16',37),('lo','language','Lao','2005-10-16',38),('mi','language','Maori','2014-10-30',39),('mn','language','Mongolian','2014-10-30',40),('mr','language','Marathi','2014-10-30',41),('ms','language','Malay','2014-10-30',42),('nb','language','Norwegian bokmål','2005-10-16',43),('ne','language','Nepali','2014-10-30',44),('nl','language','Dutch','2005-10-16',45),('nn','language','Norwegian nynorsk','2011-02-14',46),('pbr','language','Pangwa','2014-10-30',47),('pl','language','Polish','2005-10-16',48),('prs','language','Dari','2014-10-30',49),('pt','language','Portuguese','2005-10-16',50),('ro','language','Romanian','2005-10-16',51),('ru','language','Russian','2005-10-16',52),('rw','language','Kinyarwanda','2014-10-30',53),('sd','language','Sindhi','2014-10-30',54),('sk','language','Slovak','2014-10-30',55),('sl','language','Slovene','2014-10-30',56),('sq','language','Albanian','2014-10-30',57),('sr','language','Serbian','2005-10-16',58),('sv','language','Swedish','2005-10-16',59),('sw','language','Swahili','2014-10-30',60),('ta','language','Tamil','2014-10-30',61),('tet','language','Tetum','2005-10-16',62),('th','language','Thai','2005-10-16',63),('tl','language','Tagalog','2014-10-30',64),('tr','language','Turkish','2005-10-16',65),('uk','language','Ukranian','2005-10-16',66),('ur','language','Urdu','2005-10-16',67),('vi','language','Vietnamese','2014-10-30',68),('zh','language','Chinese','2005-10-16',69),('Arab','script','Arabic','2005-10-16',70),('Armn','script','Armenian','2014-10-30',71),('Cyrl','script','Cyrillic','2005-10-16',72),('Ethi','script','Ethiopic','2014-10-30',73),('Grek','script','Greek','2005-10-16',74),('Hans','script','Han (Simplified variant)','2005-10-16',75),('Hant','script','Han (Traditional variant)','2005-10-16',76),('Hebr','script','Hebrew','2005-10-16',77),('Jpan','script','Japanese','2014-10-30',78),('Knda','script','Kannada','2014-10-30',79),('Kore','script','Korean','2014-10-30',80),('Laoo','script','Lao','2005-10-16',81),('AL','region','Albania','2014-10-30',82),('AZ','region','Azerbaijan','2014-10-30',83),('BE','region','Belgium','2014-10-30',84),('BR','region','Brazil','2014-10-30',85),('BY','region','Belarus','2014-10-30',86),('CA','region','Canada','2005-10-16',87),('CH','region','Switzerland','2014-10-30',88),('CN','region','China','2014-10-30',89),('CZ','region','Czech Republic','2014-10-30',90),('DE','region','Germany','2014-10-30',91),('DK','region','Denmark','2005-10-16',92),('ES','region','Spain','2014-10-30',93),('FI','region','Finland','2014-10-30',94),('FO','region','Faroe Islands','2014-10-30',95),('FR','region','France','2005-10-16',96),('GB','region','United Kingdom','2005-10-16',97),('GR','region','Greece','2014-10-30',98),('HR','region','Croatia','2014-10-30',99),('HU','region','Hungary','2014-10-30',100),('ID','region','Indonesia','2014-10-30',101),('IN','region','India','2015-05-28',102),('IS','region','Iceland','2014-10-30',103),('IT','region','Italy','2014-10-30',104),('JP','region','Japan','2014-10-30',105),('KE','region','Kenya','2014-10-30',106),('KH','region','Cambodia','2014-10-30',107),('KP','region','North Korea','2014-10-30',108),('LK','region','Sri Lanka','2014-10-30',109),('MY','region','Malaysia','2014-10-30',110),('NE','region','Niger','2014-10-30',111),('NL','region','Netherlands','2014-10-30',112),('NO','region','Norway','2014-10-30',113),('NZ','region','New Zealand','2005-10-16',114),('PH','region','Philippines','2014-10-30',115),('PK','region','Pakistan','2014-10-30',116),('PL','region','Poland','2014-10-30',117),('PT','region','Portugal','2014-10-30',118),('RO','region','Romania','2014-10-30',119),('RU','region','Russia','2014-10-30',120),('RW','region','Rwanda','2014-10-30',121),('SE','region','Sweden','2014-10-30',122),('SI','region','Slovenia','2014-10-30',123),('SK','region','Slovakia','2014-10-30',124),('TH','region','Thailand','2014-10-30',125),('TR','region','Turkey','2014-10-30',126),('TW','region','Taiwan','2014-10-30',127),('UA','region','Ukraine','2014-10-30',128),('US','region','United States','2005-10-16',129),('VN','region','Vietnam','2014-10-30',130);
/*!40000 ALTER TABLE `language_subtag_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letter`
--

DROP TABLE IF EXISTS `letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter` (
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_html` tinyint(1) DEFAULT '0',
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci,
  `message_transport_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  PRIMARY KEY (`module`,`code`,`branchcode`,`message_transport_type`),
  KEY `message_transport_type_fk` (`message_transport_type`),
  CONSTRAINT `message_transport_type_fk` FOREIGN KEY (`message_transport_type`) REFERENCES `message_transport_types` (`message_transport_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letter`
--

LOCK TABLES `letter` WRITE;
/*!40000 ALTER TABLE `letter` DISABLE KEYS */;
INSERT INTO `letter` VALUES ('acquisition','ACQ_NOTIF_ON_RECEIV','','Notification on receiving',0,'Order received','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\n The order <<aqorders.ordernumber>> (<<biblio.title>>) has been received.\n\nYour library.','email'),('circulation','AR_CANCELED','','Article request - canceled',0,'Article request canceled','Dear <<borrowers.firstname>> <<borrowers.surname>> (<<borrowers.cardnumber>>),\r\n\r\nYour request for an article from <<biblio.title>> (<<items.barcode>>) has been canceled for the following reason:\r\n\r\n<<article_requests.notes>>\r\n\r\nArticle requested:\r\nTitle: <<article_requests.title>>\r\nAuthor: <<article_requests.author>>\r\nVolume: <<article_requests.volume>>\r\nIssue: <<article_requests.issue>>\r\nDate: <<article_requests.date>>\r\nPages: <<article_requests.pages>>\r\nChapters: <<article_requests.chapters>>\r\nNotes: <<article_requests.patron_notes>>\r\n\r\nYour library','email'),('circulation','AR_COMPLETED','','Article request - completed',0,'Article request completed','Dear <<borrowers.firstname>> <<borrowers.surname>> (<<borrowers.cardnumber>>),\r\n\r\nWe have completed your request for an article from <<biblio.title>> (<<items.barcode>>).\r\n\r\nArticle requested:\r\nTitle: <<article_requests.title>>\r\nAuthor: <<article_requests.author>>\r\nVolume: <<article_requests.volume>>\r\nIssue: <<article_requests.issue>>\r\nDate: <<article_requests.date>>\r\nPages: <<article_requests.pages>>\r\nChapters: <<article_requests.chapters>>\r\nNotes: <<article_requests.patron_notes>>\r\n\r\nYou may pick your article up at <<branches.branchname>>.\r\n\r\nThank you!','email'),('circulation','AR_PENDING','','Article request - pending',0,'Article request received','Dear <<borrowers.firstname>> <<borrowers.surname>> (<<borrowers.cardnumber>>)\r\n\r\nWe have received your request for an article from <<biblio.title>> (<<items.barcode>>).\r\n\r\nArticle requested:\r\nTitle: <<article_requests.title>>\r\nAuthor: <<article_requests.author>>\r\nVolume: <<article_requests.volume>>\r\nIssue: <<article_requests.issue>>\r\nDate: <<article_requests.date>>\r\nPages: <<article_requests.pages>>\r\nChapters: <<article_requests.chapters>>\r\nNotes: <<article_requests.patron_notes>>\r\n\r\n\r\nThank you!','email'),('circulation','AR_PROCESSING','','Article request - processing',0,'Article request processing','Dear <<borrowers.firstname>> <<borrowers.surname>> (<<borrowers.cardnumber>>),\r\n\r\nWe are now processing your request for an article from <<biblio.title>> (<<items.barcode>>).\r\n\r\nArticle requested:\r\nTitle: <<article_requests.title>>\r\nAuthor: <<article_requests.author>>\r\nVolume: <<article_requests.volume>>\r\nIssue: <<article_requests.issue>>\r\nDate: <<article_requests.date>>\r\nPages: <<article_requests.pages>>\r\nChapters: <<article_requests.chapters>>\r\nNotes: <<article_requests.patron_notes>>\r\n\r\nThank you!','email'),('circulation','AR_SLIP','','Article request - print slip',0,'Article request','Article request:\r\n\r\n<<borrowers.firstname>> <<borrowers.surname>> (<<borrowers.cardnumber>>),\r\n\r\nTitle: <<biblio.title>>\r\nBarcode: <<items.barcode>>\r\n\r\nArticle requested:\r\nTitle: <<article_requests.title>>\r\nAuthor: <<article_requests.author>>\r\nVolume: <<article_requests.volume>>\r\nIssue: <<article_requests.issue>>\r\nDate: <<article_requests.date>>\r\nPages: <<article_requests.pages>>\r\nChapters: <<article_requests.chapters>>\r\nNotes: <<article_requests.patron_notes>>\r\n','print'),('circulation','CHECKIN','','Innlevering',0,'Melding om innlevering','Følgende dokument har blitt innlevert:\r\n----\r\n<<biblio.title>>\r\n----\r\nVennlig hilsen\r\nBiblioteket','email'),('circulation','CHECKOUT','','Utlån',0,'Melding om utlån','Følgende dokument har blitt lånt ut:\r\n----\r\n<<biblio.title>>\r\n----\r\nVennlig hilsen\r\nBiblioteket','email'),('circulation','DUE','','Innleveringspåminnelse',0,'Innleveringspåminnelse','<<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nDette dokumentet må nå leveres:\r\n\r\n<<biblio.title>>, <<biblio.author>> (<<items.barcode>>)','email'),('circulation','DUEDGST','','Innleveringspåminnelse (sammendrag)',0,'Innleveringspåminnelse','Du har <<count>> dokumenter som skulle vært levert.','email'),('circulation','HOLD_SLIP','','Reservasjon',1,'Reservasjon','<h5>Dato: <<today>></h5>\n\n<h3> Overfør til/Reservasjon hos <<branches.branchname>></h3>\n\n<h3><<borrowers.surname>>, <<borrowers.firstname>></h3>\n\n<ul>\n    <li><<borrowers.cardnumber>></li>\n    <li><<borrowers.phone>></li>\n    <li> <<borrowers.address>><br />\n         <<borrowers.address2>><br />\n         <<borrowers.city >>  <<borrowers.zipcode>>\n    </li>\n    <li><<borrowers.email>></li>\n</ul>\n<br />\n<h3>RESERVERT</h3>\n<h4><<biblio.title>></h4>\n<h5><<biblio.author>></h5>\n<ul>\n   <li><<items.barcode>></li>\n   <li><<items.itemcallnumber>></li>\n   <li><<reserves.waitingdate>></li>\n</ul>\n<p>Kommentarer:\n<pre><<reserves.reservenotes>></pre>\n</p>\n','email'),('circulation','ISSUEQSLIP','','Utlån (enkel)',1,'Utlån (enkel)','<h3><<branches.branchname>></h3>\nUtlånt til <<borrowers.title>> <<borrowers.firstname>> <<borrowers.initials>> <<borrowers.surname>> <br />\n(<<borrowers.cardnumber>>) <br />\n\n<<today>><br />\n\n<h4>Utlånt i dag</h4>\n<checkedout>\n<p>\n<<biblio.title>> <br />\nStrekkode: <<items.barcode>><br />\nInnleveringsfrist: <<issues.date_due>><br />\n</p>\n</checkedout>','email'),('circulation','ISSUESLIP','','Utlån',1,'Utlån','<h3><<branches.branchname>></h3>\nUtlånt til <<borrowers.title>> <<borrowers.firstname>> <<borrowers.initials>> <<borrowers.surname>> <br />\n(<<borrowers.cardnumber>>) <br />\n\n<<today>><br />\n\n<h4>Utlånt</h4>\n<checkedout>\n<p>\n<<biblio.title>> <br />\nStrekkode: <<items.barcode>><br />\nInnleveringsfrist: <<issues.date_due>><br />\n</p>\n</checkedout>\n\n<h4>Forfalte lån</h4>\n<overdue>\n<p>\n<<biblio.title>> <br />\nStrekkode: <<items.barcode>><br />\nInnleveringsfrist: <<issues.date_due>><br />\n</p>\n</overdue>\n\n<hr>\n\n<h4 style=\"text-align: center; font-style:italic;\">Nyheter</h4>\n<news>\n<div class=\"newsitem\">\n<h5 style=\"margin-bottom: 1px; margin-top: 1px\"><b><<opac_news.title>></b></h5>\n<p style=\"margin-bottom: 1px; margin-top: 1px\"><<opac_news.new>></p>\n<p class=\"newsfooter\" style=\"font-size: 8pt; font-style:italic; margin-bottom: 1px; margin-top: 1px\">Publisert <<opac_news.timestamp>></p>\n<hr />\n</div>\n</news>','email'),('circulation','ODUE','','Purring',0,'Purring på dokument','<<borrowers.firstname>> <<borrowers.surname>>,\n\nDu har lån som skulle vært levert. Biblioteket krever ikke inn gebyrer, men vennligst lever eller forny lånet/lånene ved biblioteket.\n\n<<branches.branchname>>\n<<branches.branchaddress1>>\n<<branches.branchaddress2>> <<branches.branchaddress3>>\nTelefon: <<branches.branchphone>>\nFax: <<branches.branchfax>>\nE-post: <<branches.branchemail>>\n\nDersom du har et passord og lånet/lånene kan fornyes kan du gjøre dette på nettet. Dersom du overskrider lånetiden med mer enn 30 dager vil lånekortet bli sperret.\n\nFølgende lån har gått over tiden:\n\n<item>\"<<biblio.title>>\" av <<biblio.author>>, <<items.itemcallnumber>>, Strekkode: <<items.barcode>> Gebyr: <<items.fine>></item>\n\nPå forhånd takk.\n\n<<branches.branchname>>\n','email'),('circulation','OVERDUES_SLIP','','Overdues Slip',0,'OVERDUES_SLIP','The following item(s) is/are currently overdue:\n\n<item>\"<<biblio.title>>\" by <<biblio.author>>, <<items.itemcallnumber>>, Barcode: <<items.barcode>> Fine: <<items.fine>></item>\n','print'),('circulation','PREDUE','','Forhåndspåminnelse',0,'Forhåndspåminnelse','<<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nDette dokumentet må snart leveres:\r\n\r\n<<biblio.title>>, <<biblio.author>> (<<items.barcode>>)','email'),('circulation','PREDUEDGST','','Forhåndspåminnelse (sammendrag)',0,'Forhåndspåminnelse','Du har lånt <<count>> dokumenter som snart må leveres.','email'),('circulation','RENEWAL','','Fornying',0,'Fornyinger','Følgende lån har blitt fornyet:\r\n----\r\n<<biblio.title>>\r\n----\r\n','email'),('circulation','TRANSFERSLIP','','Overføringslapp',1,'Overføringslapp','<h5>Dato: <<today>></h5>\n\n<h3>Overføres til <<branches.branchname>></h3>\n\n<h3>EKSEMPLAR</h3>\n<h4><<biblio.title>></h4>\n<h5><<biblio.author>></h5>\n<ul>\n   <li><<items.barcode>></li>\n   <li><<items.itemcallnumber>></li>\n</ul>','email'),('claimacquisition','ACQCLAIM','','Periodikapurring',0,'Eksemplar ikke mottatt','<<aqbooksellers.name>>\r\n<<aqbooksellers.address1>>\r\n<<aqbooksellers.address2>>\r\n<<aqbooksellers.address3>>\r\n<<aqbooksellers.address4>>\r\n<<aqbooksellers.phone>>\r\n\r\n<order>Bestillingsnummer <<aqorders.ordernumber>> (<<aqorders.title>>) (<<aqorders.quantity>> ordered) ($<<aqorders.listprice>> each) har ikke blitt mottatt.</order>','email'),('members','ACCTDETAILS','','Mal for kontodetaljer - STANDARD',0,'Dine nye kontodetaljer i Koha.','Hei <<borrowers.title>> <<borrowers.firstname>> <<borrowers.surname>>.\r\n\r\nDine nye detaljer er:\r\n\r\nBruker:  <<borrowers.userid>>\r\nPassord: <<borrowers.password>>\r\n\r\nDersom det oppstår problemer, vennligst kontakt biblioteket.\r\n\r\nVennlig hilsen,\r\nBiblioteket\r\nkohaadmin@yoursite.org','email'),('members','DISCHARGE','','Discharge',0,'Discharge for <<borrowers.firstname>> <<borrowers.surname>>','<h1>Discharge</h1>\r\n\r\nThe library <<borrowers.branchcode>> certifies that the following borrower :\r\n\r\n    <<borrowers.firstname>> <<borrowers.surname>>\r\n   Cardnumber : <<borrowers.cardnumber>>\r\n\r\nreturned all his documents.','email'),('members','MEMBERSHIP_EXPIRY','','Account expiration',0,'Account expiration','Dear <<borrowers.title>> <<borrowers.firstname>> <<borrowers.surname>>,.\r\n\r\nYour library card will expire soon, on:\r\n\r\n<<borrowers.dateexpiry>>\r\n\r\nThank you,\r\n\r\nLibrarian\r\n\r\n<<branches.branchname>>','email'),('members','OPAC_REG_VERIFY','','Verifikasjon av egenregistrering i publikumskatalogen',1,'Verifiser registreringen din','Hei!\n\nD har blitt registrert som bruker av biblioteket. Verifiser epostadressen din ved å klikke på lenka nedenfor:\n\n<<OPACBaseURL>>/cgi-bin/koha/opac-registration-verify.pl?token=<<borrower_modifications.verification_token>>\n\nDersom du ikke har bedt om å bli registret som bruker av biblioteket kan du se bort fra denne engangsmeldingen. Forespørselen vil snart gå ut på dato.','email'),('members','PASSWORD_RESET','','Online password reset',1,'Koha password recovery','<html>\r\n<p>This email has been sent in response to your password recovery request for the account <strong><<user>></strong>.\r\n</p>\r\n<p>\r\nYou can now create your new password using the following link:\r\n<br/><a href=\"<<passwordreseturl>>\"><<passwordreseturl>></a>\r\n</p>\r\n<p>This link will be valid for 2 days from this email\'s reception, then you must reapply if you do not change your password.</p>\r\n<p>Thank you.</p>\r\n</html>\r\n','email'),('members','SHARE_ACCEPT','','Notification about an accepted share',0,'Share on list <<listname>> accepted','Dear patron,\n\nWe want to inform you that <<borrowers.firstname>> <<borrowers.surname>> accepted your invitation to share your list <<listname>> in our library catalog.\n\nThank you.\n\nYour library.','email'),('members','SHARE_INVITE','','Invitation for sharing a list',0,'Share list <<listname>>','Dear patron,\n\nOne of our patrons, <<borrowers.firstname>> <<borrowers.surname>>, invites you to share a list <<listname>> in our library catalog.\n\nTo access this shared list, please click on the following URL or copy-and-paste it into your browser address bar.\n\n<<shareurl>>\n\nIn case you are not a patron in our library or do not want to accept this invitation, please ignore this mail. Note also that this invitation expires within two weeks.\n\nThank you.\n\nYour library.','email'),('orderacquisition','ACQORDER','','Acquisition order',0,'Order','<<aqbooksellers.name>>\r\n<<aqbooksellers.address1>>\r\n<<aqbooksellers.address2>>\r\n<<aqbooksellers.address3>>\r\n<<aqbooksellers.address4>>\r\n<<aqbooksellers.phone>>\r\n\r\nPlease order for the library:\r\n\r\n<order>Ordernumber <<aqorders.ordernumber>> (<<biblio.title>>) (quantity: <<aqorders.quantity>>) ($<<aqorders.listprice>> each).</order>\r\n\r\nThank you,\n\n<<branches.branchname>>','email'),('reserves','HOLD','','Hentemelding',0,'Hentemelding fra <<branches.branchname>>','<<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nEt reservert dokument er klart til henting fra <<reserves.waitingdate>>:\r\n\r\nTittel: <<biblio.title>>\r\nForfatter: <<biblio.author>>\r\nEksemplar: <<items.copynumber>>\r\nHentested: <<branches.branchname>>\r\n<<branches.branchaddress1>>\r\n<<branches.branchaddress2>>\r\n<<branches.branchaddress3>>\r\n<<branches.branchcity>> <<branches.branchzip>>','email'),('reserves','HOLD','','Hentemelding',0,'Hentemelding','<<branches.branchname>>\r\n<<branches.branchaddress1>>\r\n<<branches.branchaddress2>>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<<borrowers.firstname>> <<borrowers.surname>>\r\n<<borrowers.address>>\r\n<<borrowers.city>> <<borrowers.zipcode>>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<<borrowers.firstname>> <<borrowers.surname>> <<borrowers.cardnumber>>\r\n\r\nDu har et reservert dokument som kan hentes fra  <<reserves.waitingdate>>:\r\n\r\nTittel: <<biblio.title>>\r\nForfatter: <<biblio.author>>\r\nEksemplar: <<items.copynumber>>\r\n','print'),('reserves','HOLDPLACED','','Melding om reservasjon',0,'Melding om reservasjon','Følgende dokument har blitt reservert : <<biblio.title>> (<<biblio.biblionumber>>) av <<borrowers.firstname>> <<borrowers.surname>> (<<borrowers.cardnumber>>).','email'),('serial','RLIST','','Sirkulasjon',0,'Et dokument er nå tilgjengelig','<<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nDette dokumentet er tilgjengelig:\r\n\r\n<<biblio.title>>, <<biblio.author>> (<<items.barcode>>)\r\n\r\nVennligst kom og hent det når det passer.','email'),('suggestions','ACCEPTED','','Forslag godtatt',0,'Innkjøpsforslag godtatt','<<borrowers.firstname>> <<borrowers.surname>>,\n\nDu har foreslått at biblioteket kjøper inn <<suggestions.title>> av <<suggestions.author>>.\n\nBiblioteket har vurdert forslaget i dag. Dokumentet vil bli bestilt så fort det lar seg gjøre. Du vil få en ny melding når bestillingen er gjort, og når dokumentet ankommer biblioteket.\n\nEr det noe du lurer på, vennligst kontakt oss på <<branches.branchemail>>.\n\nVennlig hilsen,\n\n<<branches.branchname>>','email'),('suggestions','AVAILABLE','','Foreslått dokument tilgjengelig',0,'Foreslått dokument tilgjengelig','<<borrowers.firstname>> <<borrowers.surname>>,\n\nDu har foreslått at biblioteket kjøper inn <<suggestions.title>> av <<suggestions.author>>.\n\nVi har gleden av å informere deg om at dokumentet nå er innlemmet i samlingen.\n\nEr det noe du lurer på, vennligst kontakt oss på <<branches.branchemail>>.\n\nVennlig hilsen,\n\n<<branches.branchname>>','email'),('suggestions','ORDERED','','Innkjøpsforslag i bestilling',0,'Innkjøpsforslag i bestilling','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nDu har foreslått at biblioteket kjøper inn <<suggestions.title>> av <<suggestions.author>>.\n\nVi har gleden av å informere deg om at dokumentet du foreslo nå er i bestilling.\n\nDu vil få en ny melding når dokumentet er tilgjengelig.\n\nEr det noe du lurer på, vennligst kontakt oss på <<branches.branchemail>>.\n\nVennlig hilsen,\n\n<<branches.branchname>>','email'),('suggestions','REJECTED','','Innkjøpsforslag avslått',0,'Innkjøpsforslag avslått','<<borrowers.firstname>> <<borrowers.surname>>,\n\nDu har foreslått at biblioteket kjøper inn <<suggestions.title>> av <<suggestions.author>>.\n\nBiblioteket har vurdert innkjøpsforslaget ditt i dag, og bestemt seg for å ikke ta det til følge.\n\nBegrunnelse: <<suggestions.reason>>\n\nEr det noe du lurer på, vennligst kontakt oss på <<branches.branchemail>>.\n\nVennlig hilsen,\n\n<<branches.branchname>>','email'),('suggestions','TO_PROCESS','','Notify fund owner',0,'A suggestion is ready to be processed','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nA new suggestion is ready to be processed: <<suggestions.title>> by <<suggestions.author>>.\n\nThank you,\n\n<<branches.branchname>>','email');
/*!40000 ALTER TABLE `letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linktracker`
--

DROP TABLE IF EXISTS `linktracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linktracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` int(11) DEFAULT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `borrowernumber` int(11) DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `timeclicked` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bibidx` (`biblionumber`),
  KEY `itemidx` (`itemnumber`),
  KEY `borridx` (`borrowernumber`),
  KEY `dateidx` (`timeclicked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linktracker`
--

LOCK TABLES `linktracker` WRITE;
/*!40000 ALTER TABLE `linktracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `linktracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localization`
--

DROP TABLE IF EXISTS `localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localization` (
  `localization_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`localization_id`),
  UNIQUE KEY `entity_code_lang` (`entity`,`code`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localization`
--

LOCK TABLES `localization` WRITE;
/*!40000 ALTER TABLE `localization` DISABLE KEYS */;
/*!40000 ALTER TABLE `localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marc_matchers`
--

DROP TABLE IF EXISTS `marc_matchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marc_matchers` (
  `matcher_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `record_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'biblio',
  `threshold` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`matcher_id`),
  KEY `code` (`code`),
  KEY `record_type` (`record_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marc_matchers`
--

LOCK TABLES `marc_matchers` WRITE;
/*!40000 ALTER TABLE `marc_matchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `marc_matchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marc_modification_template_actions`
--

DROP TABLE IF EXISTS `marc_modification_template_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marc_modification_template_actions` (
  `mmta_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `ordering` int(3) NOT NULL,
  `action` enum('delete_field','update_field','move_field','copy_field','copy_and_replace_field') COLLATE utf8_unicode_ci NOT NULL,
  `field_number` smallint(6) NOT NULL DEFAULT '0',
  `from_field` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `from_subfield` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_value` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_field` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_subfield` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_regex_search` text COLLATE utf8_unicode_ci,
  `to_regex_replace` text COLLATE utf8_unicode_ci,
  `to_regex_modifiers` varchar(8) COLLATE utf8_unicode_ci DEFAULT '',
  `conditional` enum('if','unless') COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditional_field` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditional_subfield` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditional_comparison` enum('exists','not_exists','equals','not_equals') COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditional_value` text COLLATE utf8_unicode_ci,
  `conditional_regex` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`mmta_id`),
  KEY `mmta_ibfk_1` (`template_id`),
  CONSTRAINT `mmta_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `marc_modification_templates` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marc_modification_template_actions`
--

LOCK TABLES `marc_modification_template_actions` WRITE;
/*!40000 ALTER TABLE `marc_modification_template_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `marc_modification_template_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marc_modification_templates`
--

DROP TABLE IF EXISTS `marc_modification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marc_modification_templates` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marc_modification_templates`
--

LOCK TABLES `marc_modification_templates` WRITE;
/*!40000 ALTER TABLE `marc_modification_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `marc_modification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marc_subfield_structure`
--

DROP TABLE IF EXISTS `marc_subfield_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marc_subfield_structure` (
  `tagfield` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagsubfield` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `liblibrarian` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `libopac` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `kohafield` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tab` tinyint(1) DEFAULT NULL,
  `authorised_value` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authtypecode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value_builder` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isurl` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `frameworkcode` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seealso` varchar(1100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultvalue` text COLLATE utf8_unicode_ci,
  `maxlength` int(4) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`frameworkcode`,`tagfield`,`tagsubfield`),
  KEY `kohafield_2` (`kohafield`),
  KEY `tab` (`frameworkcode`,`tab`),
  KEY `kohafield` (`frameworkcode`,`kohafield`),
  KEY `marc_subfield_structure_ibfk_1` (`authorised_value`),
  CONSTRAINT `marc_subfield_structure_ibfk_1` FOREIGN KEY (`authorised_value`) REFERENCES `authorised_value_categories` (`category_name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marc_subfield_structure`
--

LOCK TABLES `marc_subfield_structure` WRITE;
/*!40000 ALTER TABLE `marc_subfield_structure` DISABLE KEYS */;
INSERT INTO `marc_subfield_structure` VALUES ('000','@','fixed length control field','fixed length control field',0,1,'',0,'','','unimarc_leader.pl',0,0,'','','',NULL,24),('001','@','control field','control field',0,1,'biblio.biblionumber',-1,'','','',0,0,'','','',NULL,9999),('003','@','control field','control field',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('005','@','control field','control field',0,0,'',0,'','','marc21_field_005.pl',0,0,'','','',NULL,9999),('010','6','Interfield Linking Data','Interfield Linking Data',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('010','a','Number (ISBN)','Number (ISBN)',0,0,'biblioitems.isbn',0,'','','',0,0,'','','',NULL,9999),('010','b','Qualification','Qualification',1,0,'',0,'','','',0,0,'','','',NULL,9999),('010','d','Terms of Availability and/or Price','Terms of Availability and/or Price',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('010','z','Erroneous ISBN','Erroneous ISBN',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('011','a','Number (ISSN)','Number (ISSN)',0,0,'biblioitems.issn',0,'','','',0,0,'','','',NULL,9999),('011','b','Qualification','Qualification',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('011','d','Terms of Availability and/or Price','Terms of Availability and/or Price',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('011','f','ISSN-L or Linking ISSN','ISSN-L or Linking ISSN',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('011','g','Cancelled ISSN-L','Cancelled ISSN-L',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('011','y','Cancelled ISSN','Cancelled ISSN',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('011','z','Erroneous ISSN or ISSN-L','Erroneous ISSN or ISSN-L',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('012','2','Fingerprint System Code','Fingerprint System Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('012','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('012','a','Fingerprint','Fingerprint',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('013','a','Number (ISMN)','Number (ISMN)',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('013','b','Qualification','Qualification',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('013','d','Terms of Availability and/or Price','Terms of Availability and/or Price',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('013','z','Erroneous ISMN','Erroneous ISMN',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('014','2','System Code','System Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('014','a','Article Identifier','Article Identifier',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('014','z','Erroneous Article Identifier','Erroneous Article Identifier',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('015','a','Number (ISRN)','Number (ISRN)',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('015','b','Qualification','Qualification',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('015','d','Terms of Availability and/or Price','Terms of Availability and/or Price',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('015','z','Cancelled/Invalid/Erroneous ISRN','Cancelled/Invalid/Erroneous ISRN',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('016','a','Number (ISRC)','Number (ISRC)',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('016','b','Qualification','Qualification',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('016','d','Terms of Availability and/or Price [Obsolete]','Terms of Availability and/or Price [Obsolete]',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('016','z','Erroneous ISRC','Erroneous ISRC',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('017','2','Source of Code','Source of Code',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('017','a','Standard Number','Standard Number',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('017','b','Qualification','Qualification',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('017','d','Terms of Availability and/or Price','Terms of Availability and/or Price',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('017','z','Erroneous Number or Code','Erroneous Number or Code',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('020','a','Country Code','Country Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('020','b','Number','Number',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('020','z','Erroneous Number','Erroneous Number',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('021','a','Country Code','Country Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('021','b','Number','Number',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('021','z','Erroneous Number','Erroneous Number',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('022','a','Country Code','Country Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('022','b','Number','Number',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('022','z','Erroneous Number','Erroneous Number',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('035','a','System Control Number','System Control Number',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('035','z','Cancelled or Invalid Control Number','Cancelled or Invalid Control Number',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','2','System Code for Musical Notation','System Code for Musical Notation',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','a','Number of Work','Number of Work',0,1,'',0,'','','',0,-6,'','','',NULL,9999),('036','b','Number of Movement','Number of Movement',0,1,'',0,'','','',0,-6,'','','',NULL,9999),('036','c','Number of Incipit','Number of Incipit',0,1,'',0,'','','',0,-6,'','','',NULL,9999),('036','d','Voice/Instrument','Voice/Instrument',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','e','Role','Role',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','f','Movement Caption/Heading','Movement Caption/Heading',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','g','Key or Mode','Key or Mode',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','m','Clef','Clef',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','n','Key Signature','Key Signature',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','o','Time Signature','Time Signature',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','p','Musical Notation','Musical Notation',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','q','Comments (Free Text)','Comments (Free Text)',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','r','Codified Note','Codified Note',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','t','Text Incipit','Text Incipit',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','u','Uniform Resource Identifier','Uniform Resource Identifier',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('036','z','Language of Text','Language of Text',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('040','a','CODEN','CODEN',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('040','z','Erroneous CODEN','Erroneous CODEN',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('071','a','Publisher\'s Number','Publisher\'s Number',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('071','b','Source','Source',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('071','c','Qualification','Qualification',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('071','d','Terms of Availability and/or Price','Terms of Availability and/or Price',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('071','z','Erroneous Publisher\'s Number','Erroneous Publisher\'s Number',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('072','a','Standard Number','Standard Number',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('072','b','Qualification','Qualification',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('072','c','Additional Codes Following Standard Number or Code','Additional Codes Following Standard Number or Code',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('072','d','Terms of Availability and/or Price','Terms of Availability and/or Price',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('072','z','Erroneous Number or Code','Erroneous Number or Code',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('073','a','Standard Number','Standard Number',0,0,'biblioitems.ean',0,'','','',0,0,'','','',NULL,9999),('073','b','Qualification','Qualification',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('073','c','Additional Codes Following Standard Number or Code','Additional Codes Following Standard Number or Code',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('073','d','Terms of Availability and/or Price','Terms of Availability and/or Price',0,0,'',0,'','','',0,-6,'','','',NULL,9999),('073','z','Erroneous Number or Code','Erroneous Number or Code',1,0,'',0,'','','',0,-6,'','','',NULL,9999),('090','a','Koha biblioitem number (autogenerated)','Koha biblioitem number (autogenerated)',0,0,'biblioitems.biblioitemnumber',9,'','','',0,-5,'',NULL,'','',9999),('099','c','Date of creation (bib. record)','Date of creation (bib. record)',0,0,'biblio.datecreated',0,'','','',0,-5,'',NULL,'','',9999),('099','d','Last modified date (bib. record)','Last modified data (bib. record)',0,0,'biblio.timestamp',0,'','','',0,-5,'',NULL,'','',9999),('100','a','General Processing Data','General Processing Data',0,0,'',1,'','','unimarc_field_100.pl',0,0,'','','',NULL,36),('101','a','Language of Text, Soundtrack etc.','Language of Text, Soundtrack etc.',1,0,'',1,'LANG','','',0,0,'','','',NULL,9999),('101','b','Language of Intermediate Text When Item is Not Translated from Original','Language of Intermediate Text When Item is Not Translated from Original',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','c','Language of Original Work','Language of Original Work',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','d','Language of Summary','Language of Summary',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','e','Language of Contents Page','Language of Contents Page',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','f','Language of Title Page If Different from Text','Language of Title Page If Different from Text',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','g','Language of Title Proper If Not First Language of Text, Soundtrack, etc.','Language of Title Proper If Not First Language of Text, Soundtrack, etc.',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','h','Language of Libretto, etc.','Language of Libretto, etc.',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','i','Language of Accompanying Material (Other than Summaries, Abstracts or Librettos)','Language of Accompanying Material (Other than Summaries, Abstracts or Librettos)',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','j','Language of Subtitles','Language of Subtitles',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('102','a','Country of Publication','Country of Publication',1,0,'',1,'COUNTRY','','',0,0,'','','',NULL,9999),('102','b','Locality of Publication','Locality of Publication',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('105','a','Monograph Coded Data','Monograph Coded Data',0,0,'',1,'','','',0,0,'','','',NULL,9999),('106','a','Textual Material Coded Data Physical Medium Designator','Textual Material Coded Data Physical Medium Designator',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('110','a','Continuing Resource Coded Data','Continuing Resource Coded Data',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('115','a','Coded Data - General','Coded Data - General',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('115','b','Motion Picture Coded Data - Archival','Motion Picture Coded Data - Archival',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('116','a','Coded Data for Graphics','Coded Data for Graphics',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('117','a','Coded Data for Three-Dimensional Artefacts and Realia','Coded Data for Three-Dimensional Artefacts and Realia',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('120','a','Cartographic Material Coded Data (General)','Cartographic Material Coded Data (General)',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('121','a','Cartographic Material Coded Data: Physical Attributes (General)','Cartographic Material Coded Data: Physical Attributes (General)',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('121','b','Aerial Photography and Remote Sensing Coded Data: Physical Attributes','Aerial Photography and Remote Sensing Coded Data: Physical Attributes',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('122','a','Time Period, 9999 B.C. to Present','Time Period, 9999 B.C. to Present',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','a','Type of Scale','Type of Scale',0,1,'',1,'','','',0,-5,'','','',NULL,9999),('123','b','Constant Ratio Linear Horizontal Scale','Constant Ratio Linear Horizontal Scale',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','c','Constant Ratio Linear Vertical Scale','Constant Ratio Linear Vertical Scale',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','d','Coordinates - Westernmost Longitude','Coordinates - Westernmost Longitude',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','e','Coordinates - Easternmost Longitude','Coordinates - Easternmost Longitude',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','f','Coordinates - Northernmost Latitude','Coordinates - Northernmost Latitude',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','g','Coordinates - Southernmost Latitude','Coordinates - Southernmost Latitude',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','h','Angular Scale','Angular Scale',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','i','Declination - Northern Limit','Declination - Northern Limit',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','j','Declination - Southern Limit','Declination - Southern Limit',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','k','Right Ascension - Eastern Limits','Right Ascension - Eastern Limits',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','m','Right Ascension - Western Limits','Right Ascension - Western Limits',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','n','Equinox','Equinox',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','o','Epoch','Epoch',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','p','Planet','Planet',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('124','a','Character of Image','Character of Image',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','b','Form of Cartographic Item','Form of Cartographic Item',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','c','Presentation Technique for Photographic or Non-Photographic Image','Presentation Technique for Photographic or Non-Photographic Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','d','Position of Platform for Photographic or Remote Sensing Image','Position of Platform for Photographic or Remote Sensing Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','e','Category of Satellite for Remote Sensing Image','Category of Satellite for Remote Sensing Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','f','Name of Satellite for Remote Sensing Image','Name of Satellite for Remote Sensing Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','g','Recording Technique for Remote Sensing Image','Recording Technique for Remote Sensing Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('125','a','Format of Notated Music','Format of Notated Music',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('125','b','Literary Text Indicator (Non-Music Performance)','Literary Text Indicator (Non-Music Performance)',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('125','c','Multiple Musical Format','Multiple Musical Format',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('126','a','Sound Recording Coded Data (General)','Sound Recording Coded Data (General)',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('126','b','Sound Recording Coded Data (Detail)','Sound Recording Coded Data (Detail)',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('127','a','Duration','Duration',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('128','a','Form of Musical Work','Form of Musical Work',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('128','b','Instruments or Voices for Ensembles [Obsolete]','Instruments or Voices for Ensembles [Obsolete]',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('128','c','Instruments or Voices for Soloists [Obsolete]','Instruments or Voices for Soloists [Obsolete]',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('128','d','Key or Mode of Musical Work','Key or Mode of Musical Work',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('130','a','Microform Coded Data Physical Attributes','Microform Coded Data Physical Attributes',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','a','Spheroid','Spheroid',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','b','Horizontal Datum','Horizontal Datum',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','c','Grid and Referencing System','Grid and Referencing System',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','d','Overlapping and Referencing System','Overlapping and Referencing System',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','e','Secondary Grid and Referencing System','Secondary Grid and Referencing System',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','f','Vertical Datum','Vertical Datum',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','g','Unit of Measurement of Heighting','Unit of Measurement of Heighting',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','h','Contour Interval','Contour Interval',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','i','Supplementary Contour Interval','Supplementary Contour Interval',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','j','Unit of Measurement of Bathymetry','Unit of Measurement of Bathymetry',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','k','Bathymetric Interval','Bathymetric Interval',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','l','Supplementary Bathymetric Interval','Supplementary Bathymetric Interval',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('135','a','Coded Data for Electronic Resources','Coded Data for Electronic Resources',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('140','a','Antiquarian Coded Data - General','Antiquarian Coded Data - General',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('141','5','Institution and Copy to Which the Field Applies','Institution and Copy to Which the Field Applies',0,1,'',1,'','','',0,-5,'','','',NULL,9999),('141','a','Coded Data - Copy Specific Attributes','Coded Data - Copy Specific Attributes',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('141','b','Binding Specific Characteristics','Binding Specific Characteristics',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('141','c','Age','Age',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('141','d','Binding State of Preservation Code - Specific','Binding State of Preservation Code - Specific',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('141','e','Body of the Book Specific Characteristics','Body of the Book Specific Characteristics',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('141','f','Body of the Book State of Preservation Code - Specific','Body of the Book State of Preservation Code - Specific',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('145','a','Type of Performance Medium','Type of Performance Medium',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('145','b','Instrument/Voice, Conductor, Other Performer or Device','Instrument/Voice, Conductor, Other Performer or Device',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('145','c','Type of Ensemble','Type of Ensemble',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('145','d','Group within Larger Ensemble','Group within Larger Ensemble',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('145','e','Number of Parts','Number of Parts',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('145','f','Number of Players','Number of Players',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('146','a','Type of Performance Medium','Type of Performance Medium',0,0,'',1,'','','',0,-6,'','','',NULL,9999),('146','b','Instrument or Voice Soloist','Instrument or Voice Soloist',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('146','c','Instrument or Voice Non-Soloist, Conductor, Other Performer or Device','Instrument or Voice Non-Soloist, Conductor, Other Performer or Device',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('146','d','Vocal or Instrumental Ensemble','Vocal or Instrumental Ensemble',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('146','e','Instrument or Voice Non-Soloist, Conductor, Other Performer or Device, Included in an Ensemble','Instrument or Voice Non-Soloist, Conductor, Other Performer or Device, Included in an Ensemble',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('146','f','Specific Instrument','Specific Instrument',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('146','h','Number of Parts','Number of Parts',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('146','i','Number of Players','Number of Players',1,0,'',1,'','','',0,-6,'','','',NULL,9999),('200','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',2,'','','',0,0,'','','',NULL,9999),('200','a','Title Proper','Title Proper',1,0,'biblio.title',2,'','','',0,0,'','','',NULL,9999),('200','b','General Material Designation','General Material Designation',1,0,'',2,'','','',0,0,'','','',NULL,9999),('200','c','Title Proper by Another Author','Title Proper by Another Author',1,0,'',2,'','','',0,0,'','','',NULL,9999),('200','d','Parallel Title Proper','Parallel Title Proper',1,0,'',2,'','','',0,0,'','','',NULL,9999),('200','e','Other Title Information','Other Title Information',1,0,'',2,'','','',0,0,'','','',NULL,9999),('200','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'biblio.author',2,'','','',0,0,'','','',NULL,9999),('200','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',2,'','','',0,0,'','','',NULL,9999),('200','h','Number of a Part','Number of a Part',1,0,'',2,'','','',0,0,'','','',NULL,9999),('200','i','Name of a Part','Name of a Part',1,0,'',2,'','','',0,0,'','','',NULL,9999),('200','j','Inclusive Dates','Inclusive Dates',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('200','k','Bulk Dates','Bulk Dates',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('200','r','Title Page Information Following the Title Proper','Title Page Information Following the Title Proper',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('200','v','Volume Designation','Volume Designation',0,0,'',2,'','','',0,0,'','','',NULL,9999),('200','z','Language of Parallel Title Proper','Language of Parallel Title Proper',1,0,'',2,'','','',0,0,'','','',NULL,9999),('204','a','GMD','GMD',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('205','a','Edition Statement','Edition Statement',0,0,'biblioitems.editionstatement',2,'','','',0,0,'','','',NULL,9999),('205','b','Issue Statement','Issue Statement',1,0,'',2,'','','',0,0,'','','',NULL,9999),('205','d','Parallel Edition Statement','Parallel Edition Statement',1,0,'',2,'','','',0,0,'','','',NULL,9999),('205','f','Statement of Responsibility Relating to Edition','Statement of Responsibility Relating to Edition',1,0,'',2,'','','',0,0,'','','',NULL,9999),('205','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',2,'','','',0,0,'','','',NULL,9999),('206','a','Mathematical Data Statement','Mathematical Data Statement',0,0,'',2,'','','',0,0,'','','',NULL,9999),('206','b','Statement of Scale','Statement of Scale',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('206','c','Statement of Projection','Statement of Projection',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('206','d','Statement of Coordinates','Statement of Coordinates',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('206','e','Right Ascension and Declination','Right Ascension and Declination',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('206','f','Statement of Equinox','Statement of Equinox',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('207','a','Numbering: Dates and Volume Designations','Numbering: Dates and Volume Designations',1,0,'',2,'','','',0,0,'','','',NULL,9999),('207','z','Source of Numbering Information','Source of Numbering Information',1,0,'',2,'','','',0,0,'','','',NULL,9999),('208','a','Printed Music Specific Statement','Printed Music Specific Statement',0,0,'',2,'','','',0,0,'','','',NULL,9999),('208','d','Parallel Printed Music Specific Statement(s)','Parallel Printed Music Specific Statement(s)',1,0,'',2,'','','',0,0,'','','',NULL,9999),('210','a','Place of Publication, Distribution, etc.','Place of Publication, Distribution, etc.',1,0,'',2,'','','',0,0,'','','',NULL,9999),('210','b','Address of Publisher, Distributor, etc.','Address of Publisher, Distributor, etc.',1,0,'',2,'','','',0,0,'','','',NULL,9999),('210','c','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'biblioitems.publishercode',2,'','','unimarc_field_210c.pl',0,0,'','','',NULL,9999),('210','d','Date of Publication, Distribution, etc.','Date of Publication, Distribution, etc.',1,0,'biblioitems.publicationyear',2,'','','',0,0,'','','',NULL,9999),('210','e','Place of Manufacture','Place of Manufacture',1,0,'',2,'','','',0,0,'','','',NULL,9999),('210','f','Address of Manufacturer','Address of Manufacturer',1,0,'',2,'','','',0,0,'','','',NULL,9999),('210','g','Name of Manufacturer','Name of Manufacturer',1,0,'',2,'','','',0,0,'','','',NULL,9999),('210','h','Date of Manufacture','Date of Manufacture',1,0,'',2,'','','',0,0,'','','',NULL,9999),('210','r','Printing and/or Publishing Information Transcribed as Found in the Main Source of Information','Printing and/or Publishing Information Transcribed as Found in the Main Source of Information',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('210','s','Printing and/or Publishing Information Transcribed as Found in the Colophon','Printing and/or Publishing Information Transcribed as Found in the Colophon',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('211','a','Date','Date',0,0,'',2,'','','',0,0,'','','',NULL,9999),('215','a','Specific Material Designation and Extent of Item','Specific Material Designation and Extent of Item',1,0,'biblioitems.pages',2,'','','',0,0,'','','',NULL,9999),('215','c','Other Physical Details','Other Physical Details',0,0,'',2,'','','',0,0,'','','',NULL,9999),('215','d','Dimensions','Dimensions',1,0,'biblioitems.size',2,'','','',0,0,'','','',NULL,9999),('215','e','Accompanying Material','Accompanying Material',1,0,'',2,'','','',0,0,'','','',NULL,9999),('225','a','Series Title','Series Title',0,0,'biblio.seriestitle',2,'','','unimarc_field_225a.pl',0,0,'','','',NULL,9999),('225','d','Parallel Series Title','Parallel Series Title',1,0,'',2,'','','',0,0,'','','',NULL,9999),('225','e','Other Title Information','Other Title Information',1,0,'',2,'','','',0,0,'','','',NULL,9999),('225','f','Statement of Responsibility','Statement of Responsibility',1,0,'',2,'','','',0,0,'','','',NULL,9999),('225','h','Number of a Part','Number of a Part',1,0,'',2,'','','',0,0,'','','',NULL,9999),('225','i','Name of a Part','Name of a Part',1,0,'',2,'','','',0,0,'','','',NULL,9999),('225','v','Volume Designation','Volume Designation',1,0,'biblioitems.volume',2,'','','',0,0,'','','',NULL,9999),('225','x','ISSN of Series','ISSN of Series',1,0,'',2,'','','',0,0,'','','',NULL,9999),('225','z','Language of Parallel Title','Language of Parallel Title',1,0,'',2,'','','',0,0,'','','',NULL,9999),('230','a','Designation and Extent of File','Designation and Extent of File',0,0,'',2,'','','',0,0,'','','',NULL,9999),('251','a','Organization','Organization',1,0,'',2,'','','',0,-6,'','','',NULL,9999),('251','b','Arrangement','Arrangement',1,0,'',2,'','','',0,-6,'','','',NULL,9999),('251','c','Level','Level',0,0,'',2,'','','',0,-6,'','','',NULL,9999),('300','a','Text of Note','Text of Note',0,0,'biblio.notes',3,'','','',0,0,'','','',NULL,9999),('301','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('302','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('303','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('304','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('305','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('306','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('307','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('308','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('310','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('311','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('312','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('313','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('314','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('315','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('316','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('316','6','Interfield Linking Data','Interfield Linking Data',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('316','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('316','u','Uniform Resource Identifier','Uniform Resource Identifier',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('317','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,1,'',3,'','','',0,-6,'','','',NULL,9999),('317','6','Interfield Linking Data','Interfield Linking Data',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('317','8','Materials Specified','Materials Specified',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('317','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('317','u','Uniform Resource Identifier','Uniform Resource Identifier',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('318','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','a','Action','Action',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','b','Action Identification','Action Identification',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','c','Time of Action','Time of Action',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','d','Action Interval','Action Interval',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','e','Contingency for Action','Contingency for Action',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','f','Authorization','Authorization',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','h','Jurisdiction','Jurisdiction',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','i','Method of Action','Method of Action',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','j','Site of Action','Site of Action',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','k','Action Agent','Action Agent',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','l','Status','Status',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','n','Extent','Extent',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','o','Type of Unit','Type of Unit',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','p','Non-Public Note','Non-Public Note',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','r','Public Note','Public Note',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','u','Uniform Resource Identifier','Uniform Resource Identifier',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('320','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('320','u','Uniform Resource Identifier','Uniform Resource Identifier',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('321','a','Indexes, Abstracts, References Note','Indexes, Abstracts, References Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('321','b','Dates of Coverage','Dates of Coverage',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('321','x','International Standard Serial Number (ISSN)','International Standard Serial Number (ISSN)',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('322','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('323','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('324','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('325','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('326','a','Frequency','Frequency',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('326','b','Dates of Frequency','Dates of Frequency',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('327','a','Text of Note','Text of Note',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('327','b','Title of Level 1 Subdivision','Title of Level 1 Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','c','Title of Level 2 Subdivision','Title of Level 2 Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','d','Title of Level 3 Subdivision','Title of Level 3 Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','e','Title of Level 4 Subdivision','Title of Level 4 Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','f','Title of Level 5 Subdivision','Title of Level 5 Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','g','Title of Level 6 Subdivision','Title of Level 6 Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','h','Title of Level 7 Subdivision','Title of Level 7 Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','i','Title of Level 8 Subdivision','Title of Level 8 Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','p','Sequence of Pages or First Page of a Subdivision','Sequence of Pages or First Page of a Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','u','Uniform Resource Identifier (Uri)','Uniform Resource Identifier (Uri)',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('327','z','Other Information Concerning a Subdivision','Other Information Concerning a Subdivision',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('328','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('328','b','Dissertation or Thesis Details and Type of Degree','Dissertation or Thesis Details and Type of Degree',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('328','c','Discipline of Degree','Discipline of Degree',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('328','d','Date of Degree','Date of Degree',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('328','e','Body Granting the Degree','Body Granting the Degree',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('328','t','Title of Other Edition of Dissertation or Thesis','Title of Other Edition of Dissertation or Thesis',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('328','z','Text Preceding or Following the Note','Text Preceding or Following the Note',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('330','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('332','a','Preferred Citation','Preferred Citation',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('333','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('334','a','Text of Awards Note','Text of Awards Note',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('334','b','Name of Award','Name of Award',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('334','c','Year of Award','Year of Award',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('334','d','Country of Award','Country of Award',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('334','u','Uniform Resource Identifier (Uri)','Uniform Resource Identifier (Uri)',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('335','8','Materials Specified','Materials Specified',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('335','a','Identification of the Holder','Identification of the Holder',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('335','b','Address','Address',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('335','c','Country','Country',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('335','g','Control Number','Control Number',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('335','u','Uniform Resource Identifier (Uri)','Uniform Resource Identifier (Uri)',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('336','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('337','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('337','u','Uniform Resource Identifier (Uri)','Uniform Resource Identifier (Uri)',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('345','a','Source for Acquisition/Subscription Address','Source for Acquisition/Subscription Address',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('345','b','Stock Number','Stock Number',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('345','c','Medium','Medium',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('345','d','Terms of Availability','Terms of Availability',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('345','u','Uniform Resource Identifier (Uri)','Uniform Resource Identifier (Uri)',1,0,'',3,'','','',0,-6,'','','',NULL,9999),('371','a','Terms Governing Use and Reproduction','Terms Governing Use and Reproduction',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('371','b','Jurisdiction','Jurisdiction',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('371','c','Authorization','Authorization',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('371','d','Authorized Users','Authorized Users',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('371','z','Materials Specified','Materials Specified',0,0,'',3,'','','',0,-6,'','','',NULL,9999),('410','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('410','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('410','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('411','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('411','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('412','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','a','Author','Author',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','t','Title','Title',0,1,'',4,'','','',0,-6,'','','',NULL,9999),('412','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('412','z','CODEN','CODEN',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','a','Author','Author',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','t','Title','Title',0,1,'',4,'','','',0,-6,'','','',NULL,9999),('413','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('413','z','CODEN','CODEN',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('421','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('421','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('422','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('422','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('423','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('423','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('424','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','a','Author','Author',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','t','Title','Title',0,1,'',4,'','','',0,-6,'','','',NULL,9999),('424','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('424','z','CODEN','CODEN',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','a','Author','Author',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','t','Title','Title',0,1,'',4,'','','',0,-6,'','','',NULL,9999),('425','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('425','z','CODEN','CODEN',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('430','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('430','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('431','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('431','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('432','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('432','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('433','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('433','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('434','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('434','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('435','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('435','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('436','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('436','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('437','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('437','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('440','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('440','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('441','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('441','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('442','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('442','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('443','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('443','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('444','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('444','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('445','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('445','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('446','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('446','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('447','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('447','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('448','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('448','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('451','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('451','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('452','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('452','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('453','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('453','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('454','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('454','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('455','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('455','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('456','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('456','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('461','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('461','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('462','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('462','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('463','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('463','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('464','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('464','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('470','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('470','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('481','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('481','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('482','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('482','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','1','Linking Data','Linking Data',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','3','Authority Record Number','Authority Record Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','b','General Material Designation','General Material Designation',0,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','c','Place of Publication','Place of Publication',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','f','First Statement of Responsibility','First Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','h','Number of Section or Part','Number of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','i','Name of Section or Part','Name of Section or Part',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','l','Parallel Title','Parallel Title',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','m','International Standard Music Number','International Standard Music Number',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','n','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','o','Other Title Information.','Other Title Information.',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','q','International Standard Identifier for a Work','International Standard Identifier for a Work',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','r','International Standard Identifier for an Expression','International Standard Identifier for an Expression',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','s','Series Statement','Series Statement',1,0,'',4,'','','',0,-6,'','','',NULL,9999),('488','t','Title','Title',0,1,'',4,'','','',0,-5,'','','',NULL,9999),('488','u','Uniform Resource Locator','Uniform Resource Locator',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','x','International Standard Serial Number','International Standard Serial Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','y','International Standard Book Number','International Standard Book Number',1,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('500','2','System Code','System Code',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','3','Authority Record Number','Authority Record Number',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','a','Preferred Access Point','Preferred Access Point',0,0,'biblio.unititle',5,'','','',0,0,'','','',NULL,9999),('500','b','General Material Designation','General Material Designation',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','h','Number of Section or Part','Number of Section or Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','i','Name of Section or Part','Name of Section or Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','j','Form Subdivision','Form Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('500','k','Date of Publication','Date of Publication',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','l','Form Subheading','Form Subheading',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','m','Language (when Part of a Heading)','Language (when Part of a Heading)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','n','Miscellaneous Information','Miscellaneous Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','q','Version (or Date of Version)','Version (or Date of Version)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','u','Key (for Music)','Key (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','v','Volume Designation','Volume Designation',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','w','Additional Elements (for Music)','Additional Elements (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','x','Topical Subdivision','Topical Subdivision',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','y','Geographical Subdivision','Geographical Subdivision',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','z','Chronological Subdivision','Chronological Subdivision',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','2','System Code','System Code',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','3','Authority Record Number','Authority Record Number',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','a','Collective Preferred Title','Collective Preferred Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','b','General Material Designation','General Material Designation',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','e','Collective Preferred Subtitle','Collective Preferred Subtitle',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','j','Form Subdivision','Form Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('501','k','Date of Publication, etc.','Date of Publication, etc.',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','u','Key (for Music)','Key (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','x','Topical Subdivision','Topical Subdivision',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','y','Geographical Subdivision','Geographical Subdivision',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','z','Chronological Subdivision','Chronological Subdivision',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','a','Form Heading Proper','Form Heading Proper',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','b','Form Subheading','Form Subheading',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','d','Month and Day','Month and Day',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','e','Personal Name - Entry Element of Person','Personal Name - Entry Element of Person',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','f','Personal Name - Part of Name Other than Entry Element - Forename','Personal Name - Part of Name Other than Entry Element - Forename',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','g','Personal Name - Dates','Personal Name - Dates',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('503','h','Personal Name Qualifier','Personal Name Qualifier',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','i','Title of Part','Title of Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','j','Year','Year',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','k','Numeration (Arabic)','Numeration (Arabic)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','l','Numeration (Roman)','Numeration (Roman)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','m','Locality','Locality',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','n','Institution in Locality','Institution in Locality',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','o','Place in Locality','Place in Locality',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','3','Authority Entry Record Number','Authority Entry Record Number',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','a','Title','Title',0,1,'',5,'','','',0,-6,'','','',NULL,9999),('506','c','Form of Work','Form of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','d','Date of Work','Date of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','e','Place of Origin of Work','Place of Origin of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','f','Original Language of the Work','Original Language of the Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','h','Number of Section or Part','Number of Section or Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','i','Name of Section or Part','Name of Section or Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','k','Other Distinguishing Characteristics of a Work','Other Distinguishing Characteristics of a Work',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('506','u','Key (for Music)','Key (for Music)',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','3','Authority Entry Record Number','Authority Entry Record Number',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','a','Title','Title',0,1,'',5,'','','',0,-6,'','','',NULL,9999),('507','c','Form of Work','Form of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','d','Date of Work','Date of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','e','Place of Origin of Work','Place of Origin of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','f','Original Language of the Work','Original Language of the Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','h','Number of Section or Part','Number of Section or Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','i','Name of Section or Part','Name of Section or Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','k','Other Distinguishing Characteristics of a Work','Other Distinguishing Characteristics of a Work',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','l','Form of the Expression [Expression]','Form of the Expression [Expression]',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','m','Language of the Expression [Expression]','Language of the Expression [Expression]',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','n','Content Type [Expression]','Content Type [Expression]',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','o','Date of Expression [Expression]','Date of Expression [Expression]',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','u','Key (for Music)','Key (for Music)',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','v','Medium of Performance (for Music) [Expression]','Medium of Performance (for Music) [Expression]',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('507','w','Other Characteristics of Expression [Expression]','Other Characteristics of Expression [Expression]',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('510','a','Parallel Title','Parallel Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('511','a','Half Title','Half Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('511','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('511','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('511','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('511','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('511','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('511','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('512','a','Cover Title','Cover Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('512','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('512','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('512','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('512','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('512','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('512','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('513','a','Added Title - Page Title','Added Title - Page Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('513','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('513','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('513','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('513','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('513','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('513','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('514','a','Caption Title','Caption Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('514','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('514','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('514','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('514','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('514','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('514','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('515','a','Running Title','Running Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('515','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('515','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('515','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('515','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('515','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('515','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('516','a','Spine Title','Spine Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('516','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('516','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('516','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('516','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('516','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('516','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('517','a','Variant Title','Variant Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('517','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,0,'','','',NULL,9999),('517','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('517','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('517','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('517','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('517','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('518','a','Title Proper, Variant Title or Uniform Title in Standard Modern Spelling','Title Proper, Variant Title or Uniform Title in Standard Modern Spelling',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','a','Former Title Proper','Former Title Proper',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','h','Number of Part','Number of Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','i','Name of Part','Name of Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','j','Volumes or Dates of Former Title','Volumes or Dates of Former Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','x','ISSN of Former Title','ISSN of Former Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('530','a','Key Title','Key Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('530','b','Qualifier','Qualifier',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('530','j','Volume or Dates Associated with Key Title','Volume or Dates Associated with Key Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('530','v','Volume Designation','Volume Designation',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('531','a','Abbreviated Title','Abbreviated Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('531','b','Qualifier','Qualifier',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('531','v','Volume Designation','Volume Designation',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('532','a','Expanded Title','Expanded Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('532','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('540','a','Additional Title','Additional Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('540','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('540','h','Number of Part','Number of Part',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('540','i','Name of Part','Name of Part',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('541','a','Translated Title','Translated Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('541','e','Other Title Information','Other Title Information',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('541','h','Number of a Part','Number of a Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('541','i','Name of Part','Name of Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('541','z','Language of Translated Title','Language of Translated Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('545','a','Section Title','Section Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('545','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('545','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('545','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('545','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('545','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('545','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('560','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('560','a','Artificial Title','Artificial Title',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('560','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','1','Linking Data','Linking Data',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','3','Authority Entry Record Number','Authority Entry Record Number',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','a','Name','Name',0,1,'',5,'','','',0,-6,'','','',NULL,9999),('576','c','Form of Work','Form of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','d','Date of Work','Date of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','e','Place of Origin of Work','Place of Origin of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','f','Original Language of the Work','Original Language of the Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','h','Number of Section or Part','Number of Section or Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','i','Name of Section or Part','Name of Section or Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','j','Form Subdivision','Form Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','k','Other Distinguishing Characteristics of a Work','Other Distinguishing Characteristics of a Work',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','t','Title','Title',0,1,'',5,'','','',0,-6,'','','',NULL,9999),('576','u','Key (for Music)','Key (for Music)',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','x','Topical Subdivision','Topical Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','y','Geographical Subdivision','Geographical Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('576','z','Chronological Subdivision','Chronological Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','1','Linking Data','Linking Data',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','3','Authority Entry Record Number','Authority Entry Record Number',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','a','Name','Name',0,1,'',5,'','','',0,-6,'','','',NULL,9999),('577','c','Form of Work','Form of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','d','Date of Work','Date of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','e','Place of Origin of Work','Place of Origin of Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','f','Original Language of the Work','Original Language of the Work',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','h','Number of Section or Part','Number of Section or Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','i','Name of Section or Part','Name of Section or Part',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','j','Form Subdivision','Form Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','k','Other Distinguishing Characteristics of a Work','Other Distinguishing Characteristics of a Work',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','l','Form of the Expression [Expression]','Form of the Expression [Expression]',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','m','Language of the Expression [Expression]','Language of the Expression [Expression]',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','n','Content Type [Expression]','Content Type [Expression]',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','o','Date of Expression [Expression]','Date of Expression [Expression]',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','t','Title','Title',0,1,'',5,'','','',0,-6,'','','',NULL,9999),('577','u','Key (for Music)','Key (for Music)',0,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','v','Medium of Performance (for Music) [Expression]','Medium of Performance (for Music) [Expression]',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','w','Other Characteristics of Expression [Expression]','Other Characteristics of Expression [Expression]',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','x','Topical Subdivision','Topical Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','y','Geographical Subdivision','Geographical Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('577','z','Chronological Subdivision','Chronological Subdivision',1,0,'',5,'','','',0,-6,'','','',NULL,9999),('600','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','3','Authority Record Number','Authority Record Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('600','5','Institution and Copy to Which the Field Applies','Institution and Copy to Which the Field Applies',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('600','a','Entry Element','Entry Element',0,1,'',6,'','','',0,0,'','','',NULL,9999),('600','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','c','Additions to Name Other than Dates','Additions to Name Other than Dates',1,0,'',6,'','','',0,0,'','','',NULL,9999),('600','d','Roman Numerals','Roman Numerals',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','f','Dates','Dates',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('600','j','Form Subdivision','Form Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('600','p','Affiliation/Address','Affiliation/Address',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('600','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('600','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('600','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','3','Authority Record Number','Authority Record Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','5','Institution and Copy to Which the Field Applies','Institution and Copy to Which the Field Applies',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('601','a','Entry Element','Entry Element',0,1,'',6,'','','',0,0,'','','',NULL,9999),('601','b','Subdivision (or Name if Entered under Place)','Subdivision (or Name if Entered under Place)',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','c','Addition to Name or Qualifier','Addition to Name or Qualifier',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','d','Number of Meeting and/or Number of Part of a Meeting','Number of Meeting and/or Number of Part of a Meeting',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','e','Location of Meeting','Location of Meeting',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','f','Date of Meeting','Date of Meeting',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','g','Inverted Element','Inverted Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','j','Form Subdivision','Form Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('601','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('602','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('602','3','Authority Record Number','Authority Record Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('602','5','Institution and Copy to Which the Field Applies','Institution and Copy to Which the Field Applies',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('602','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('602','f','Dates','Dates',0,0,'',6,'','','',0,0,'','','',NULL,9999),('602','j','Form Subdivision','Form Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('602','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('602','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('602','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('604','1','Linking Data','Linking Data',1,0,'',6,'','','',0,0,'','','',NULL,9999),('604','3','Authority Record Number','Authority Record Number',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('604','a','Entry Element Name','Entry Element Name',0,1,'',6,'','','',0,-6,'','','',NULL,9999),('604','j','Form Subdivision','Form Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('604','t','Title','Title',0,1,'',6,'','','',0,-6,'','','',NULL,9999),('604','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('604','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('604','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('605','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','3','Authority Record Number','Authority Record Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','h','Number of Section or Part','Number of Section or Part',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','i','Name of Section or Part','Name of Section or Part',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','j','Form Subdivision','Form Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('605','k','Date of Publication','Date of Publication',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','l','Form Subheading','Form Subheading',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','n','Miscellaneous Information','Miscellaneous Information',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','q','Version (or Date of Version)','Version (or Date of Version)',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('605','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('605','u','Key (for Music)','Key (for Music)',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('605','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('605','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('606','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('606','3','Authority Record Number','Authority Record Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('606','9','Koha Internal code','Koha Internal code',0,0,'',6,'','','',0,1,'','','',NULL,9999),('606','a','Entry Element','Entry Element',0,0,'bibliosubject.subject',6,'','','',0,0,'','','',NULL,9999),('606','j','Form Subdivision','Form Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('606','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('606','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('606','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('607','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('607','3','Authority Record Number','Authority Record Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('607','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('607','j','Form Subdivision','Form Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('607','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('607','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('607','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('608','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('608','3','Authority Record Number','Authority Record Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('608','5','Institution and Copy to Which the Field Applies','Institution and Copy to Which the Field Applies',0,0,'',6,'','','',0,0,'','','',NULL,9999),('608','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('608','j','Form Subdivision','Form Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('608','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('608','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('608','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('610','5','Institution and Copy to Which the Field Applies','Institution and Copy to Which the Field Applies',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('610','a','Subject Term','Subject Term',1,0,'',6,'','','',0,0,'','','',NULL,9999),('615','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('615','3','Authority Record Number','Authority Record Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('615','a','Subject Category Entry Element Text','Subject Category Entry Element Text',0,0,'',6,'','','',0,0,'','','',NULL,9999),('615','m','Subject Category Subdivision Code','Subject Category Subdivision Code',1,0,'',6,'','','',0,0,'','','',NULL,9999),('615','n','Subject Category Code','Subject Category Code',1,0,'',6,'','','',0,0,'','','',NULL,9999),('615','x','Subject Category Subdivision Text','Subject Category Subdivision Text',1,0,'',6,'','','',0,0,'','','',NULL,9999),('616','2','System Code','System Code',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('616','3','Authority Record Number','Authority Record Number',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('616','a','Entry Element','Entry Element',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('616','c','Qualification','Qualification',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('616','f','Dates','Dates',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('616','j','Form Subdivision','Form Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('616','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('616','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('616','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','2','System Code','System Code',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','3','Authority Record Number','Authority Record Number',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','a','Country (Nation State)','Country (Nation State)',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','b','State or Province, etc.','State or Province, etc.',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','c','Intermediate Political Jurisdiction','Intermediate Political Jurisdiction',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','d','City, etc.','City, etc.',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','e','Venue','Venue',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','f','Date','Date',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','g','Season','Season',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','h','Occasion','Occasion',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','i','Final Date','Final Date',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','k','Subsection of City, etc.','Subsection of City, etc.',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','m','Other Geographical Regions or Features','Other Geographical Regions or Features',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','n','Extraterrestrial Areas','Extraterrestrial Areas',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('617','o','Geographical Areas Such as World, Hemisphere, Continent: Larger Area than Country','Geographical Areas Such as World, Hemisphere, Continent: Larger Area than Country',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','2','System Code','System Code',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','3','Authority Record Number','Authority Record Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('620','a','Country (Nation State)','Country (Nation State)',0,0,'',6,'','','',0,0,'','','',NULL,9999),('620','b','State or Province etc.','State or Province etc.',0,0,'',6,'','','',0,0,'','','',NULL,9999),('620','c','Intermediate Political Jurisdiction','Intermediate Political Jurisdiction',1,0,'',6,'','','',0,0,'','','',NULL,9999),('620','d','City, etc.','City, etc.',0,0,'',6,'','','',0,0,'','','',NULL,9999),('620','e','Venue','Venue',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','f','Date','Date',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','g','Season','Season',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','h','Occasion','Occasion',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','i','Final Date','Final Date',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','k','Subsection of City, etc.','Subsection of City, etc.',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','m','Other Geographical Regions or Features','Other Geographical Regions or Features',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','n','Extraterrestrial Areas','Extraterrestrial Areas',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('620','o','Geographical Areas Such as World, Hemisphere, Continent: Larger Area than Country','Geographical Areas Such as World, Hemisphere, Continent: Larger Area than Country',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','2','System Code','System Code',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','3','Authority Record Number','Authority Record Number',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','a','Country (Nation State) or Larger Entity Country','Country (Nation State) or Larger Entity Country',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','b','State or Province, etc.','State or Province, etc.',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','c','Intermediate Political Jurisdiction','Intermediate Political Jurisdiction',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','d','City, etc.','City, etc.',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','e','Building, Vehicle, etc.','Building, Vehicle, etc.',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','f','Date 1','Date 1',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','g','Season','Season',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','h','Occasion','Occasion',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','i','Date 2','Date 2',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','k','Subsection of City, etc.','Subsection of City, etc.',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','m','Other Geographic Regions or Features','Other Geographic Regions or Features',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','n','Extraterrestrial Area','Extraterrestrial Area',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('621','o','Geographical Areas Such as World, Hemisphere, Continent: Larger Area than Country','Geographical Areas Such as World, Hemisphere, Continent: Larger Area than Country',1,0,'',6,'','','',0,-6,'','','',NULL,9999),('626','a','Make and Model of Machines','Make and Model of Machines',0,0,'',6,'','','',0,0,'','','',NULL,9999),('626','b','Programming Languages','Programming Languages',0,0,'',6,'','','',0,0,'','','',NULL,9999),('626','c','Operating System','Operating System',0,0,'',6,'','','',0,0,'','','',NULL,9999),('660','a','Code','Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('661','a','Time Period Code','Time Period Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('670','b','Subject Indicator Number','Subject Indicator Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('670','c','String','String',0,0,'',6,'','','',0,0,'','','',NULL,9999),('670','e','Reference Indicator Number','Reference Indicator Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('670','z','Language of Terms','Language of Terms',0,0,'',6,'','','',0,0,'','','',NULL,9999),('675','3','Classification Record Number','Classification Record Number',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('675','a','Number','Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('675','v','Edition','Edition',0,0,'',6,'','','',0,0,'','','',NULL,9999),('675','z','Language of Edition','Language of Edition',0,0,'',6,'','','',0,0,'','','',NULL,9999),('676','3','Classification Record Number','Classification Record Number',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('676','a','Number','Number',0,0,'biblioitems.dewey',6,'','','',0,0,'','','',NULL,9999),('676','v','Edition','Edition',0,0,'',6,'','','',0,0,'','','',NULL,9999),('676','z','Language of Edition','Language of Edition',0,0,'',6,'','','',0,0,'','','',NULL,9999),('680','3','Classification Record Number','Classification Record Number',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('680','a','Class Number','Class Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('680','b','Book Number','Book Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('686','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('686','3','Classification Record Number','Classification Record Number',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('686','a','Class Number','Class Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('686','b','Book Number','Book Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('686','c','Classification Subdivision','Classification Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('686','v','Edition','Edition',0,0,'',6,'','','',0,-6,'','','',NULL,9999),('700','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('700','9','Koha Internal Code','Koha Internal Code',0,0,'',7,'','','',0,1,'','','',NULL,9999),('700','a','Entry Element','Entry Element',0,0,'',7,'','PER','',0,0,'','','',NULL,9999),('700','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','c','Additions to Names Other than Dates','Additions to Names Other than Dates',1,0,'',7,'','','',0,0,'','','',NULL,9999),('700','d','Roman Numerals','Roman Numerals',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','o','International Standard Identifier for the Name','International Standard Identifier for the Name',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('700','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('701','9','Koha Internal Code','Koha Internal Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','c','Additions to Names Other than Dates','Additions to Names Other than Dates',1,0,'',7,'','','',0,0,'','','',NULL,9999),('701','d','Roman Numerals','Roman Numerals',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('702','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('702','9','Koha Internal Code','Koha Internal Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','c','Additions to Names Other than Dates','Additions to Names Other than Dates',1,0,'',7,'','','',0,0,'','','',NULL,9999),('702','d','Roman Numerals','Roman Numerals',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','o','International Standard Identifier for the Name','International Standard Identifier for the Name',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('702','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','r','Part or Role Played','Part or Role Played',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','4','Relator Code','Relator Code',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','a','Entry Element','Entry Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','c','Additions to Names Other than Dates','Additions to Names Other than Dates',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','d','Roman Numerals','Roman Numerals',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','f','Dates','Dates',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','o','International Standard Identifier for the Name','International Standard Identifier for the Name',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('703','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('710','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('710','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','b','Subdivision','Subdivision',1,0,'',7,'','','',0,0,'','','',NULL,9999),('710','c','Addition to Name or Qualifier','Addition to Name or Qualifier',1,0,'',7,'','','',0,0,'','','',NULL,9999),('710','d','Number of Meeting and/or Number of Part of Meeting','Number of Meeting and/or Number of Part of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','e','Location of Meeting','Location of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','f','Date of Meeting','Date of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','g','Inverted Element','Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','o','International Standard Identifier for the Name','International Standard Identifier for the Name',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('710','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('711','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','b','Subdivision','Subdivision',1,0,'',7,'','','',0,0,'','','',NULL,9999),('711','c','Addition to Name or Qualifier','Addition to Name or Qualifier',1,0,'',7,'','','',0,0,'','','',NULL,9999),('711','d','Number of Meeting and/or Number of Part of Meeting','Number of Meeting and/or Number of Part of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','e','Location of Meeting','Location of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','f','Date of Meeting','Date of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','g','Inverted Element','Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('712','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,1,'',7,'','','',0,-6,'','','',NULL,9999),('712','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','b','Subdivision','Subdivision',1,0,'',7,'','','',0,0,'','','',NULL,9999),('712','c','Addition to Name or Qualifier','Addition to Name or Qualifier',1,0,'',7,'','','',0,0,'','','',NULL,9999),('712','d','Number of Meeting and/or Number of Part of Meeting','Number of Meeting and/or Number of Part of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','e','Location of Meeting','Location of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','f','Date of Meeting','Date of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','g','Inverted Element','Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','r','Part or Role Played','Part or Role Played',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','4','Relator Code','Relator Code',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,1,'',7,'','','',0,-6,'','','',NULL,9999),('713','a','Entry Element','Entry Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','b','Subdivision','Subdivision',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','c','Addition to Name or Qualifier','Addition to Name or Qualifier',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','d','Number of Meeting and/or Number of Part of Meeting','Number of Meeting and/or Number of Part of Meeting',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','e','Location of Meeting','Location of Meeting',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','f','Date of Meeting','Date of Meeting',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','g','Inverted Element','Inverted Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('713','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('716','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('716','a','Data Element','Data Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('716','c','Qualifications','Qualifications',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('716','f','Dates','Dates',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('720','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('720','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('720','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('720','c','Type of Family','Type of Family',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('720','d','Places Associated with the Family','Places Associated with the Family',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('720','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('720','o','International Standard Identifier for the Name','International Standard Identifier for the Name',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('721','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('721','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('721','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('721','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('722','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('722','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('722','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,1,'',7,'','','',0,-6,'','','',NULL,9999),('722','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('722','c','Type of Family','Type of Family',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('722','d','Places Associated with the Family','Places Associated with the Family',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('722','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('722','o','International Standard Identifier for the Name','International Standard Identifier for the Name',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('722','r','Part or Role Played','Part or Role Played',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('723','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('723','4','Relator Code','Relator Code',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('723','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,1,'',7,'','','',0,-6,'','','',NULL,9999),('723','a','Entry Element','Entry Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('723','c','Type of Family','Type of Family',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('723','d','Places Associated with the Family','Places Associated with the Family',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('723','f','Dates','Dates',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('723','o','International Standard Identifier for the Name','International Standard Identifier for the Name',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('730','4','Relator Code','Relator Code',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('730','a','Entry Element','Entry Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','a','Entry Element','Entry Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','b','Subdivision','Subdivision',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','c','Addition to Name or Qualifier','Addition to Name or Qualifier',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','e','Name of the Other Party','Name of the Other Party',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','f','Date of Legal Issue or Version, or Date of Signing','Date of Legal Issue or Version, or Date of Signing',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','i','Name of Section or Part','Name of Section or Part',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','l','Form Subheading','Form Subheading',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','n','Miscellaneous Information','Miscellaneous Information',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('740','t','Uniform Title','Uniform Title',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','a','Entry Element','Entry Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','b','Subdivision','Subdivision',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','c','Addition to Name or Qualifier','Addition to Name or Qualifier',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','e','Name of the Other Party','Name of the Other Party',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','f','Date of Legal Issue or Version, or Date of Signing','Date of Legal Issue or Version, or Date of Signing',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','i','Name of Section or Part','Name of Section or Part',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','l','Form Subheading','Form Subheading',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','n','Miscellaneous Information','Miscellaneous Information',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('741','t','Uniform Title','Uniform Title',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','3','Authority Record Number','Authority Record Number',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','a','Entry Element','Entry Element',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','b','Subdivision','Subdivision',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','c','Addition to Name or Qualifier','Addition to Name or Qualifier',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','e','Name of the Other Party','Name of the Other Party',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','f','Date of Legal Issue or Version, or Date of Signing','Date of Legal Issue or Version, or Date of Signing',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','i','Name of Section or Part','Name of Section or Part',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','l','Form Subheading','Form Subheading',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','n','Miscellaneous Information','Miscellaneous Information',1,0,'',7,'','','',0,-6,'','','',NULL,9999),('742','t','Uniform Title','Uniform Title',0,0,'',7,'','','',0,-6,'','','',NULL,9999),('801','2','System Code','System Code',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('801','a','Country','Country',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('801','b','Agency','Agency',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('801','c','Date of Transaction','Date of Transaction',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('801','g','Cataloguing Rules (Descriptive Conventions)','Cataloguing Rules (Descriptive Conventions)',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('801','h','Original Control Number','Original Control Number',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('802','a','ISSN Centre Code','ISSN Centre Code',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('830','a','Text of Note','Text of Note',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('850','a','Code of Institution','Code of Institution',1,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','2','System Code','System Code',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','a','Institution Identifier','Institution Identifier',0,1,'',8,'','','',0,-6,'','','',NULL,9999),('852','b','Sub-Location Identifier','Sub-Location Identifier',1,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','c','Address','Address',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','d','Coded Location Qualifier (2 or 3 Characters)','Coded Location Qualifier (2 or 3 Characters)',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','e','Non-Coded Location Qualifier','Non-Coded Location Qualifier',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','g','Call Number Prefix','Call Number Prefix',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','j','Call Number','Call Number',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','k','Shelving Form of Title, Author, Author/Title','Shelving Form of Title, Author, Author/Title',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','l','Call Number Suffix','Call Number Suffix',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','m','Item Identifier','Item Identifier',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','n','Copy Identifier','Copy Identifier',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','p','Country','Country',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','t','Copy Number','Copy Number',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','x','Non-Public Note.','Non-Public Note.',1,0,'',8,'','','',0,-6,'','','',NULL,9999),('852','y','Public Note','Public Note',1,0,'',8,'','','',0,-6,'','','',NULL,9999),('856','2','Link Text','Link Text',1,0,'',8,'','','',0,-6,'','','',NULL,9999),('856','a','Host Name','Host Name',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','b','Access Number','Access Number',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','c','Compression Information','Compression Information',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','d','Path','Path',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','e','Date and Hour of Consultation and Access','Date and Hour of Consultation and Access',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','f','Electronic Name','Electronic Name',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','h','Processor of Request','Processor of Request',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','i','Instruction','Instruction',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','j','Bits per Second','Bits per Second',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','k','Password','Password',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','l','Logon/login','Logon/login',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','m','Contact for Access Assistance','Contact for Access Assistance',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','n','Name of Location of Host in Subfield $A','Name of Location of Host in Subfield $A',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','o','Operating System','Operating System',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','p','Port','Port',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','q','Electronic Format Type','Electronic Format Type',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','r','Settings','Settings',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','s','File Size','File Size',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','t','Terminal Emulation','Terminal Emulation',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','u','Uniform Resource Identifier','Uniform Resource Identifier',0,0,'biblioitems.url',8,'','','',1,0,'','','',NULL,9999),('856','v','Hours Access Method Available','Hours Access Method Available',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','w','Record Control Number','Record Control Number',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','x','Nonpublic Note','Nonpublic Note',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','y','Access Method','Access Method',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','z','Public Note','Public Note',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('886','2','System Code','System Code',0,0,'',8,'','','',0,-6,'','','',NULL,9999),('886','a','Tag of the Source Format Field','Tag of the Source Format Field',1,0,'',8,'','','',0,-6,'','','',NULL,9999),('886','b','Indicators and Subfields of the Source Format Field','Indicators and Subfields of the Source Format Field',1,0,'',8,'','','',0,-6,'','','',NULL,9999),('942','0','Koha issues (borrowed), all copies','Koha issues (borrowed), all copies',0,0,'biblioitems.totalissues',9,'','','',NULL,-5,'','','',NULL,9999),('942','2','Source of classification or shelving scheme','Source of classification or shelving scheme',0,0,'biblioitems.cn_source',9,'','','',NULL,0,'','','',NULL,9999),('942','6','Koha normalized classification for sorting','Koha normalized classification for sorting',0,0,'biblioitems.cn_sort',-1,'','','',0,7,'','','',NULL,9999),('942','c','Koha item type','Koha item type',0,1,'biblioitems.itemtype',9,'itemtypes','','',NULL,0,'','','',NULL,9999),('942','s','Serial record flag','Serial record',0,0,'biblio.serial',9,'','','',NULL,-5,'','','',NULL,9999),('995','0','Withdrawn status','Withdrawn status',0,0,'items.withdrawn',10,'WITHDRAWN','','',0,0,'','','',NULL,9999),('995','2','Lost status','Lost status',0,0,'items.itemlost',10,'LOST','','',0,0,'','','',NULL,9999),('995','3','Use restrictions','Use restrictions',0,0,'items.restricted',10,'RESTRICTED','','',0,0,'','','',NULL,9999),('995','5','Date acquired','Coded location qualifier',0,0,'items.dateaccessioned',10,'','','',NULL,0,'','','',NULL,9999),('995','6','Copy number','Copy number',0,0,'items.copynumber',10,'','','',NULL,0,'','','',NULL,9999),('995','7','Uniform Resource Identifier','Uniform Resource Identifier',0,0,'items.uri',10,'','','',0,0,'','','',NULL,9999),('995','9','Internal item number (Koha itemnumber, autogenerated)','Internal itemnumber (Koha itemnumber)',0,0,'items.itemnumber',-1,'','','',0,-5,'','','',NULL,9999),('995','a','Origin of the item (home branch) (free text)','Origin of item (home branch) (free text)',0,1,'',10,'','','',0,0,'','','',NULL,9999),('995','b','Origin of item (home branch) (coded)','Origin of item (home branch (coded)',0,0,'items.homebranch',10,'branches','','',0,-1,'','','',NULL,9999),('995','c','Lending or holding organisation (holding branch) code','Lending or holding organisation (holding branch) code ',0,1,'items.holdingbranch',10,'branches','','',0,0,'','','',NULL,9999),('995','d','Lending or holding organisation (holding branch) (free text)','Lending or holding organisation (holding branch) (free text)',0,0,'',10,'','','',0,-1,'','','',NULL,9999),('995','e','Shelving location','Shelving location',0,0,'items.location',10,'LOC','','',0,0,'','','',NULL,9999),('995','f','Barcode','Barcode',0,0,'items.barcode',10,'','','barcode.pl',0,0,'','','',NULL,9999),('995','h','Koha collection','Koha collection',0,0,'items.ccode',10,'CCODE','','',0,0,'','','',NULL,9999),('995','j','Inventory number','Inventory number',0,0,'items.stocknumber ',10,'','','',0,0,'','','',NULL,9999),('995','k','Call number (full call number)','Call number (full call number)',0,0,'items.itemcallnumber',10,'','','',0,0,'','','',NULL,9999),('995','l','Numbering (volume or other part)','Numbering (bound volume or other part)',0,0,'items.materials',10,'','','',0,0,'','','',NULL,9999),('995','m','Date of loan or deposit','Date of loan or deposit',0,0,'items.datelastborrowed',10,'','','',0,-5,'','','',NULL,9999),('995','n','Expiration of loan date','Expiration of loan date',0,0,'items.onloan',10,'','','',0,-1,'','','',NULL,9999),('995','o','Circulation type (not for loan)','Circulation type (not for loan)',0,0,'items.notforloan',10,'','','',0,0,'','','',NULL,9999),('995','r','Type of item and material','Type of item and material',0,1,'items.itype',10,'itemtypes','','',0,0,'','','',NULL,9999),('995','u','Copy note','Copy note',0,0,'items.itemnotes',10,'','','',0,0,'','','',NULL,9999),('995','v','Serial Enumeration / chronology','Serial Enumeration / chronology',0,0,'items.enumchron',10,'','','',0,-1,'','','',NULL,9999),('000','@','Cabeçalho','Cabeçalho',0,1,'',0,'','','unimarc_leader.pl',0,-3,'MON','','','',9999),('001','@','Campo de controlo','Campo de controlo',0,0,'biblio.biblionumber',0,'','','',0,0,'MON','','','',9999),('005','@','Campo de controlo','Campo de controlo',0,0,'',0,'','','marc21_field_005.pl',0,-1,'MON','','','',9999),('010','a','Número (ISBN)','Número (ISBN)',1,0,'biblioitems.isbn',0,'','','',0,0,'MON','','','',9999),('010','b','Qualificação','Qualificação',0,0,'',-1,'','','',0,0,'MON','','','',9999),('010','d','Modalidade de aquisição e/ou preço','Modalidade de aquisição e/ou preço',0,0,'',-1,'','','',0,-5,'MON','','','',9999),('010','z','ISBN errado','ISBN errado',0,0,'',0,'','','',0,-1,'MON','','','',9999),('012','2','Código de impressão','Código de impressão',1,0,'',0,'','','',0,-1,'MON','','','',9999),('012','5','Instituição à qual se aplica','Instituição à qual se aplica',0,1,'',-1,'','','',0,-5,'MON','','','',9999),('012','a','Impressão','Impressão',0,0,'',-1,'','','',0,-5,'MON','','','',9999),('021','b','Número','Número',0,0,'',0,'','','',0,0,'MON','','','',9999),('021','z','Número errado','Número errado',1,0,'',0,'','','',0,-1,'MON','','','',9999),('090','a','Koha biblioitem number (autogenerated)','Koha biblioitem number (autogenerated)',0,0,'biblioitems.biblioitemnumber',0,'','','',0,0,'MON','','','',9999),('100','a','Dados gerais de processamento','Dados gerais de processamento',0,1,'',1,'','','unimarc_field_100.pl',0,0,'MON','','','',9999),('102','b','Localidade de publicação','Localidade de publicação',1,0,'',1,'','','',0,-1,'MON','','','',9999),('105','a','Dados codificados dos livros ','Dados codificados dos livros ',0,0,'',1,'CCODE','','unimarc_field_105.pl',0,-1,'MON',NULL,'','',9999),('106','a','Dados codificados do material textual','Dados codificados do material textual',0,0,'',1,'','','unimarc_field_106.pl',0,-1,'MON','','','',9999),('141','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',1,'','','',0,-1,'MON','','','',9999),('141','a','Dados codificados - atributos específicos do exemplar','Dados codificados - atributos específicos do exemplar',0,0,'',1,'','','unimarc_field_141.pl',0,-1,'MON','','','',9999),('200','5','Instituição à qual o campo se aplica','Instituição à qual o campo se aplica',0,0,'',2,'','','',0,-1,'MON','','','',9999),('200','a','Título próprio','Título próprio',1,1,'biblio.title',2,'','','',0,0,'MON','','','',9999),('200','b','Indicação geral da natureza do documento','Indicação geral da natureza do documento',1,0,'biblio.abstract',2,'','','',0,-1,'MON','','','',9999),('200','c','Título próprio de outro autor','Título próprio de outro autor',1,0,'',2,'','','',0,-1,'MON','','','',9999),('200','d','Título paralelo','Título paralelo',1,0,'',2,'','','',0,-1,'MON','','','',9999),('200','e','Informação de outro título','Informação de outro título',1,0,'biblio.unititle',2,'','','',0,0,'MON','','','',9999),('200','f','Primeira menção de responsabilidade','Primeira menção de responsabilidade',1,0,'biblio.author',2,'','','',0,0,'MON','','','',9999),('200','g','Outras menções de responsabilidade','Outras menções de responsabilidade',1,0,'',2,'','','',0,0,'MON','','','',9999),('200','h','Número de uma parte ou secção','Número de uma parte ou secção',1,0,'',2,'','','',0,-1,'MON','','','',9999),('200','i','Nome de uma parte ou secção','Nome de uma parte ou secção',1,0,'',2,'','','',0,-1,'MON','','','',9999),('200','v','Indicação de volume','Indicação de volume',0,0,'',2,'','','',0,-1,'MON','','','',9999),('205','a','Menção da edição','Menção da edição',0,0,'biblioitems.editionstatement',2,'','','',0,-1,'MON','','','',9999),('205','b','Outras menções de edição','Outras menções de edição',1,0,'',2,'','','',0,-1,'MON','','','',9999),('205','d','Menção paralela da edição','Menção paralela da edição',1,0,'',2,'','','',0,-1,'MON','','','',9999),('205','f','Menção de responsabilidade relativa à edição','Menção de responsabilidade relativa à edição',0,0,'',2,'','','',0,-1,'MON','','','',9999),('205','g','Outras menções de responsabilidade relativas à edição','Outras menções de responsabilidade relativas à edição',1,0,'',2,'','','',0,-1,'MON','','','',9999),('210','a','Lugar da edição','Lugar da edição',0,1,'biblioitems.place',2,'','','',0,0,'MON','','','',9999),('210','b','Endereço do editor, distribuidor, etc.','Endereço do editor, distribuidor, etc.',1,0,'',2,'','','',0,-1,'MON','','','',9999),('210','c','Nome do editor','Nome do editor',0,1,'biblioitems.publishercode',2,'','','unimarc_field_210c.pl',0,0,'MON','','','',9999),('210','d','Data da publicação','Data da publicação',1,1,'biblioitems.publicationyear',2,'','','',0,0,'MON','','','',9999),('210','e','Lugar da impressão','Lugar da impressão',1,0,'',2,'','','',0,-1,'MON','','','',9999),('210','f','Endereço do impressor','Endereço do impressor',1,0,'',2,'','','',0,-1,'MON','','','',9999),('210','g','Nome do impressor','Nome do impressor',1,0,'',2,'','','',0,-1,'MON','','','',9999),('210','h','Data da impressão','Data da impressão',1,0,'',2,'','','',0,-1,'MON','','','',9999),('211','a','Data','Data',0,0,'',-1,'','','',0,0,'MON','','','',9999),('215','a','Paginação','Indicação específica da natureza do documento e extensão da espécie',0,1,'biblioitems.pages',2,'','','',0,4,'MON','','','',9999),('215','c','Outras indicações físicas','Outras indicações físicas',0,1,'biblioitems.illus',2,'','','',0,4,'MON','','','',9999),('215','d','Dimensões','Dimensões',0,1,'biblioitems.size',2,'','','',0,4,'MON','','','',9999),('215','e','Material acompanhante','Material acompanhante',1,0,'',2,'','','',0,-1,'MON','','','',9999),('225','a','Título próprio da colecção','Título próprio da colecção',0,0,'biblio.seriestitle',2,'','','unimarc_field_225a.pl',0,0,'MON','','','',9999),('225','d','Título paralelo da coleção','Título paralelo da coleção',1,0,'',2,'','','',0,-1,'MON','','','',9999),('225','e','Informação de outro título da coleção ','Informação de outro título da coleção ',1,0,'',2,'','','',0,-1,'MON','','','',9999),('225','f','Menção de responsabilidade relativa à coleção','Menção de responsabilidade relativa à coleção',0,0,'',2,'','','',0,-1,'MON','','','',9999),('225','h','Número de uma parte ou secção','Número de uma parte ou secção',1,0,'',2,'','','',0,-1,'MON','','','',9999),('225','i','Nome de uma parte ou secção','Nome de uma parte ou secção',1,0,'',2,'','','',0,-1,'MON','','','',9999),('225','v','Volume','Volume',1,0,'biblioitems.collectionvolume',2,'','','',0,0,'MON','','','',9999),('225','x','ISSN da coleção','ISSN da coleção',1,0,'',2,'','','',0,-1,'MON','','','',9999),('300','a','Texto da nota','Texto da nota',0,0,'biblio.notes',3,'','','',0,0,'MON','','','',9999),('301','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('302','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('303','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('304','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('305','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('306','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('307','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('308','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('310','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('311','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('312','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('313','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('314','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('315','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,0,'MON','','','',9999),('316','a','Texto da nota','Texto da nota',1,0,'',-1,'','','',0,0,'MON','','','',9999),('317','a','Texto da nota','Texto da nota',0,0,'',-1,'','','',0,-1,'MON','','','',9999),('318','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',-1,'','','',0,-1,'MON','','','',9999),('318','a','Intervenção','Intervenção',0,0,'',3,'','','',0,0,'MON','','','',9999),('318','b','Identificação da intervenção','Identificação da intervenção',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','c','Tempo da intervenção','Tempo da intervenção',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','d','Intervalo da intervenção','Intervalo da intervenção',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','e','Contingência da intervenção','Contingência da intervenção',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','f','Autorização','Autorização',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','h','Jurisdição','Jurisdição',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','i','Método da intervenção','Método da intervenção',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','j','Local da intervenção','Local da intervenção',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','k','Agente da intervenção','Agente da intervenção',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','l','Estado do material','Estado do material',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','n','Extensão da intervenção','Extensão da intervenção',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','o','Tipo da unidade','Tipo da unidade',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','p','Nota para informação interna','Nota para informação interna',1,0,'',3,'','','',0,-1,'MON','','','',9999),('318','r','Nota para informação ao público','Nota para informação ao público',1,0,'',3,'','','',0,-1,'MON','','','',9999),('320','a','Texto da nota','Texto da nota',0,0,'',3,'','','',0,0,'MON','','','',9999),('321','a','Notas sobre índices, resumos e referências','Notas sobre índices, resumos e referências',0,0,'',3,'','','',0,0,'MON','','','',9999),('321','b','Datas de cobertura','Datas de cobertura',0,0,'',3,'','','',0,-1,'MON','','','',9999),('321','x','ISSN','ISSN',0,0,'',3,'','','',0,-1,'MON','','','',9999),('324','a','Texto da nota','Texto da nota',0,0,'',3,'','','',0,0,'MON','','','',9999),('325','a','Texto da nota','Texto da nota',0,0,'',3,'','','',0,0,'MON','','','',9999),('327','a','Texto da nota','Texto da nota',1,0,'',3,'','','',0,-1,'MON','','','',9999),('328','a','Texto da nota','Texto da nota',0,0,'',3,'','','',0,0,'MON','','','',9999),('328','b','Especificações da dissertação ou tese','Especificações da dissertação ou tese',0,0,'',3,'','','',0,0,'MON','','','',9999),('328','c','Área científica do grau académico','Área científica do grau académico',0,0,'',3,'','','',0,0,'MON','','','',9999),('328','d','Ano do grau académico','Ano do grau académico',0,0,'',3,'','','',0,0,'MON','','','',9999),('328','e','Instituição que confere o grau académico','Instituição que confere o grau académico',0,0,'',3,'','','',0,0,'MON','','','',9999),('328','t','Título de outra edição da dissertação ou tese','Título de outra edição da dissertação ou tese',0,0,'',3,'','','',0,0,'MON','','','',9999),('328','z','Texto que precede ou segue a nota','Texto que precede ou segue a nota',1,0,'',3,'','','',0,0,'MON','','','',9999),('330','a','Texto da nota','Texto da nota',0,0,'',3,'','','',0,0,'MON','','','',9999),('345','a','Endereço da fonte de aquisição/assinatura','Endereço da fonte de aquisição/assinatura',1,0,'',3,'','','',0,0,'MON','','','',9999),('345','b','Número de existências','Número de existências',1,0,'',3,'','','',0,-1,'MON','','','',9999),('345','c','Tipo de material','Tipo de material',1,0,'',3,'','','',0,-1,'MON','','','',9999),('410','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('410','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('410','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('410','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('410','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('410','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('410','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('410','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('410','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('410','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('410','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('410','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('410','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('410','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('410','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('410','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('421','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('421','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('421','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('421','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('421','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('421','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('421','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('421','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('421','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('421','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('421','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('421','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('421','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('421','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('421','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('421','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('422','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('422','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('422','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('422','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('422','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('422','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('422','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-5,'MON','','','',9999),('422','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('422','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('422','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('422','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('422','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('422','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('422','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('422','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('422','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('423','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('423','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('423','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('423','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('423','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('423','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('423','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('423','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('423','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('423','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('423','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('423','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('423','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('423','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('423','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('423','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('437','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('437','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('437','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('437','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('437','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('437','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('437','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('437','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('437','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('437','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('437','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('437','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('437','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('437','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('437','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('437','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('451','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('451','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('451','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('451','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('451','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('451','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('451','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('451','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('451','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('451','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('451','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('451','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('451','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('451','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('451','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('451','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('452','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('452','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('452','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('452','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('452','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('452','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('452','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('452','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('452','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('452','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('452','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('452','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('452','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('452','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('452','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('452','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('453','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('453','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('453','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('453','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('453','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('453','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('453','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('453','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('453','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('453','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('453','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('453','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('453','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('453','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('453','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('453','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('454','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('454','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('454','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('454','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('454','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('454','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('454','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('454','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('454','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('454','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('454','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('454','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('454','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('454','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('454','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('454','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('481','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('481','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('481','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('481','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('481','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('481','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('481','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('481','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('481','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('481','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('481','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('481','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('481','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('481','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('481','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('481','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('482','0','Identificação do registo bibliográfico','Identificação do registo bibliográfico',0,0,'',4,'','','',0,-1,'MON','','','',9999),('482','3','Número do registo de autoridade','Número do registo de autoridade',1,0,'',4,'','','',0,-1,'MON','','','',9999),('482','5','Institutição à qual o campo se aplica','Institutição à qual o campo se aplica',0,0,'',4,'','','',0,-1,'MON','','','',9999),('482','a','Autor','Autor',0,0,'',4,'','','',0,-1,'MON','','','',9999),('482','c','Local da publicação','Local da publicação',1,0,'',4,'','','',0,-1,'MON','','','',9999),('482','d','Data da publicação','Data da publicação',0,0,'',4,'','','',0,-1,'MON','','','',9999),('482','e','Estado da edição','Estado da edição',0,0,'',4,'','','',0,-1,'MON','','','',9999),('482','h','Número da parte ou secção','Número da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('482','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',4,'','','',0,-1,'MON','','','',9999),('482','p','Descrição física','Descrição física',0,0,'',4,'','','',0,-1,'MON','','','',9999),('482','t','Título','Título',1,0,'',4,'','','',0,0,'MON','','','',9999),('482','u','URL','URL',0,0,'',4,'','','',0,-1,'MON','','','',9999),('482','v','Número do volume','Número do volume',0,0,'',4,'','','',0,-1,'MON','','','',9999),('482','x','ISSN','ISSN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('482','y','ISBN/ISMN','ISBN/ISMN',1,0,'',4,'','','',0,-1,'MON','','','',9999),('482','z','CODEN','CODEN',0,0,'',4,'','','',0,-1,'MON','','','',9999),('500','2','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',5,'','','',0,-1,'MON','','','',9999),('500','3','Código do sistema','Código do sistema',0,0,'',5,'','','',0,-1,'MON','','','',9999),('500','9','ID Autoridade','ID Autoridade',0,0,'',5,'','','',0,4,'MON','','','',9999),('500','a','Título uniforme','Título uniforme',0,0,'',5,'','','',0,0,'MON','','','',9999),('500','b','Indicação geral da natureza do documento','Indicação geral da natureza do documento',1,0,'',5,'','','',0,-1,'MON','','','',9999),('500','h','Número da parte ou secção','Número da parte ou secção',1,0,'',5,'','','',0,-1,'MON','','','',9999),('500','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',5,'','','',0,-1,'MON','','','',9999),('500','k','Data da publicação','Data da publicação',0,0,'',5,'','','',0,-1,'MON','','','',9999),('500','l','Subrubrica de forma','Subrubrica de forma',1,0,'',5,'','','',0,-1,'MON','','','',9999),('500','n','Informação vária','Informação vária',1,0,'',5,'','','',0,-1,'MON','','','',9999),('500','q','Versão (ou data da versão)','Versão (ou data da versão)',0,0,'',5,'','','',0,-1,'MON','','','',9999),('500','r','Forma de execução (para música)','Forma de execução (para música)',1,0,'',5,'','','',0,-1,'MON','','','',9999),('500','s','Designação numérica (para música)','Designação numérica (para música)',1,0,'',5,'','','',0,-1,'MON','','','',9999),('500','u','Escala (para música)','Escala (para música)',0,0,'',5,'','','',0,-1,'MON','','','',9999),('500','v','Designação do volume','Designação do volume',0,0,'',5,'','','',0,-1,'MON','','','',9999),('500','w','Menção de arranjo (para música)','Menção de arranjo (para música)',0,0,'',5,'','','',0,-1,'MON','','','',9999),('500','x','Subdivisão de assunto ou forma','Subdivisão de assunto ou forma',1,0,'',5,'','','',0,-5,'MON','','','',9999),('500','y','Subdivisão geográfica','Subdivisão geográfica',1,0,'',5,'','','',0,-1,'MON','','','',9999),('500','z','Subdivisão cronológica','Subdivisão cronológica',1,0,'',5,'','','',0,-1,'MON','','','',9999),('503','a','Forma do cabeçalho','Forma do cabeçalho',1,0,'',5,'','','',0,0,'MON','','','',9999),('503','b','Forma do subcabeçalho','Forma do subcabeçalho',0,0,'',5,'','','',0,-1,'MON','','','',9999),('503','d','Mês e dia','Mês e dia',1,0,'',5,'','','',0,-1,'MON','','','',9999),('503','e','Apelido de pessoa','Apelido de pessoa',0,0,'',5,'','','',0,-1,'MON','','','',9999),('503','f','Nome próprio','Nome próprio',0,0,'',5,'','','',0,-1,'MON','','','',9999),('503','h','Atributo de nome de pessoa','Atributo de nome de pessoa',0,0,'',5,'','','',0,-1,'MON','','','',9999),('503','i','Título da parte','Título da parte',0,0,'',5,'','','',0,-1,'MON','','','',9999),('503','j','Ano','Ano',1,0,'',5,'','','',0,-1,'MON','','','',9999),('503','k','Numeração (Árabe)','Numeração (Árabe)',0,0,'',5,'','','',0,-1,'MON','','','',9999),('503','l','Numeração (Romana)','Numeração (Romana)',0,0,'',5,'','','',0,-1,'MON','','','',9999),('503','m','Localidade','Localidade',0,0,'',5,'','','',0,-1,'MON','','','',9999),('503','n','Instituição na localidade','Instituição na localidade',0,0,'',5,'','','',0,-1,'MON','','','',9999),('510','a','Título paralelo','Título paralelo',0,0,'',5,'','','',0,2,'MON','','','',9999),('510','e','Informação de outro título','Informação de outro título',1,0,'',5,'','','',0,-1,'MON','','','',9999),('510','h','Número da parte','Número da parte',1,0,'',5,'','','',0,-1,'MON','','','',9999),('510','i','Nome da parte','Nome da parte',1,0,'',5,'','','',0,-1,'MON','','','',9999),('510','j','Volume ou datas associados com o título','Volume ou datas associados com o título',0,0,'',5,'','','',0,-1,'MON','','','',9999),('510','n','Informação vária','Informação vária',0,0,'',5,'','','',0,-1,'MON','','','',9999),('512','a','Título da capa','Título da capa',0,0,'',5,'','','',0,-1,'MON','','','',9999),('512','e','Informação de outro título','Informação de outro título',1,0,'',5,'','','',0,-1,'MON','','','',9999),('517','a','Variante do titulo','Variante do titulo',0,0,'',5,'','','',0,-1,'MON','','','',9999),('517','e','Informação de outro título','Informação de outro título',1,0,'',5,'','','',0,-1,'MON','','','',9999),('518','a','Títtulo próprio','Títtulo próprio',0,0,'',5,'','','',0,-1,'MON','','','',9999),('518','e','Informação de outro título','Informação de outro título',1,0,'',5,'','','',0,-1,'MON','','','',9999),('518','h','Número da parte','Número da parte',1,0,'',5,'','','',0,-1,'MON','','','',9999),('518','i','Nome da parte','Nome da parte',1,0,'',5,'','','',0,-1,'MON','','','',9999),('518','j','Volume ou datas associadas ao título','Volume ou datas associadas ao título',0,0,'',5,'','','',0,-1,'MON','','','',9999),('518','n','Informação vária','Informação vária',0,0,'',5,'','','',0,-1,'MON','','','',9999),('532','a','Título desenvolvido','Título desenvolvido',0,0,'',5,'','','',0,-1,'MON','','','',9999),('541','a','Título traduzido','Título traduzido',0,0,'',5,'','','',0,-1,'MON','','','',9999),('541','e','Informação de outro título','Informação de outro título',0,0,'',5,'','','',0,-1,'MON','','','',9999),('541','h','Número da parte','Número da parte',0,0,'',5,'','','',0,-1,'MON','','','',9999),('541','i','Nome da parte','Nome da parte',0,0,'',5,'','','',0,-1,'MON','','','',9999),('600','2','Código do sistema','Código do sistema',0,0,'',6,'','','',0,-1,'MON','','','',9999),('600','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',1,0,'',6,'','','',0,-1,'MON','','','',9999),('600','9','ID Autoridade','ID Autoridade',0,0,'',6,'','PER','',0,4,'MON','','','',9999),('600','a','Palavra de ordem','Palavra de ordem',0,0,'',6,'','PER','',0,0,'MON','','','',9999),('600','b','Outra parte do nome não tomada para palavra de ordem','Outra parte do nome não tomada para palavra de ordem',0,0,'',6,'','PER','',0,0,'MON','','','',9999),('600','c','Elementos de identificação ou de distinção','Elementos de identificação ou de distinção',1,0,'',6,'','PER','',0,-1,'MON','','','',9999),('600','d','Numerais romanos','Numerais romanos',0,0,'',6,'','PER','',0,-1,'MON','','','',9999),('600','f','Datas','Datas',0,0,'',6,'','PER','',0,0,'MON','','','',9999),('600','x','Subdivisão de assunto','Subdivisão de assunto',1,0,'',6,'','','',0,0,'MON','','','',9999),('600','y','Subdivisão geográfica','Subdivisão geográfica',1,0,'',6,'','','',0,0,'MON','','','',9999),('600','z','Subdivisão cronológica','Subdivisão cronológica',1,0,'',6,'','','',0,0,'MON','','','',9999),('601','2','Código do sistema','Código do sistema',0,0,'',6,'','','',0,-1,'MON','','','',9999),('601','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',1,0,'',6,'','','',0,-1,'MON','','','',9999),('601','9','ID Autoridade','ID Autoridade',0,0,'',6,'','COR','',0,4,'MON','','','',9999),('601','a','Palavra de ordem','Palavra de ordem',0,0,'',6,'','COR','',0,0,'MON','','','',9999),('601','b','Subdivisão (ou nome da colectividade se entrou pelo nome da localidade)','Subdivisão (ou nome da colectividade se entrou pelo nome da localidade)',1,0,'',6,'','','',0,0,'MON','','','',9999),('601','c','Elementos de identificação ou distinção','Elementos de identificação ou distinção',1,0,'',6,'','','',0,-1,'MON','','','',9999),('601','d','Número do grupo-eventual e/ou número de uma parte do grupo-eventual','Número do grupo-eventual e/ou número de uma parte do grupo-eventual',0,0,'',6,'','','',0,0,'MON','','','',9999),('601','e','Local do grupo-eventual','Local do grupo-eventual',0,0,'',6,'','','',0,-1,'MON','','','',9999),('601','f','Data do grupo-eventual','Data do grupo-eventual',0,0,'',6,'','','',0,-1,'MON','','','',9999),('601','g','Palavra invertida','Palavra invertida',0,0,'',6,'','','',0,-1,'MON','','','',9999),('601','h','Outra parte do nome que não a palavra de ordem','Outra parte do nome que não a palavra de ordem',0,0,'',6,'','','',0,-1,'MON','','','',9999),('601','x','Subdivisão de assunto','Subdivisão de assunto',1,0,'',6,'','','',0,0,'MON','','','',9999),('601','y','Subdivisão geográfica','Subdivisão geográfica',1,0,'',6,'','','',0,0,'MON','','','',9999),('601','z','Subdivisão cronológica','Subdivisão cronológica',1,0,'',6,'','','',0,0,'MON','','','',9999),('604','1','Elemento de ligação','Elemento de ligação',0,0,'',6,'','','',0,-1,'MON','','','',9999),('604','2','Código do sistema','Código do sistema',0,0,'',6,'','','',0,-1,'MON','','','',9999),('604','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',1,0,'',6,'','','',0,-1,'MON','','','',9999),('604','a','Palavra de ordem','Palavra de ordem',0,0,'',6,'','','',0,-1,'MON','','','',9999),('604','b','Outra parte do nome','Outra parte do nome',0,0,'',6,'','','',0,-1,'MON','','','',9999),('604','f','Datas','Datas',0,0,'',6,'','','',0,-1,'MON','','','',9999),('604','t','Título','Título',0,0,'',-1,'','','',0,0,'MON','','','',9999),('604','x','Subdivisão de assunto','Subdivisão de assunto',1,0,'',6,'','','',0,-1,'MON','','','',9999),('604','y','Subdivisão geográfica','Subdivisão geográfica',1,0,'',6,'','','',0,-1,'MON','','','',9999),('604','z','Subdivisão cronológica','Subdivisão cronológica',1,0,'',6,'','','',0,-1,'MON','','','',9999),('605','2','Código do sistema','Código do sistema',0,0,'',6,'','','',0,-1,'MON','','','',9999),('605','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',1,0,'',6,'','','',0,-1,'MON','','','',9999),('605','a','Palavra de ordem','Palavra de ordem',0,0,'',6,'','','',0,-1,'MON','','','',9999),('605','h','Número da parte','Número da parte',1,0,'',6,'','','',0,-1,'MON','','','',9999),('605','i','Nome da parte ou secção','Nome da parte ou secção',1,0,'',6,'','','',0,-1,'MON','','','',9999),('605','k','Data da publicação','Data da publicação',0,0,'',6,'','','',0,-1,'MON','','','',9999),('605','l','Sub rubrica de forma','Sub rubrica de forma',0,0,'',6,'','','',0,-1,'MON','','','',9999),('605','n','Informação vária','Informação vária',1,0,'',6,'','','',0,-1,'MON','','','',9999),('605','q','Versão (ou data da versão)','Versão (ou data da versão)',0,0,'',6,'','','',0,-1,'MON','','','',9999),('605','x','Subdivisão de assunto','Subdivisão de assunto',1,0,'',6,'','','',0,-1,'MON','','','',9999),('605','y','Subdivisão geográfica','Subdivisão geográfica',1,0,'',6,'','','',0,-1,'MON','','','',9999),('605','z','Subdivisão cronológica','Subdivisão cronológica',1,0,'',6,'','','',0,-1,'MON','','','',9999),('606','2','Código do sistema','Código do sistema',0,0,'',6,'','','',0,1,'MON','','','',9999),('606','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',1,0,'',6,'','','',0,1,'MON','','','',9999),('606','9','ID Autoridade','ID Autoridade',0,0,'',6,'','SUB','',0,1,'MON','','','',9999),('606','a','Palavra de ordem','Palavra de ordem',0,0,'',6,'','SUB','',0,0,'MON','','','',9999),('606','x','Subdivisão de assunto','Subdivisão de assunto',1,0,'',6,'','SUB','',0,-1,'MON','','','',9999),('606','y','Subdivisão geográfica','Subdivisão geográfica',1,0,'',6,'','','',0,-1,'MON','','','',9999),('606','z','Subdivisão cronológica','Subdivisão cronológica',1,0,'',6,'','','',0,-1,'MON','','','',9999),('607','2','Código do sistema','Código do sistema',0,0,'',6,'','','',0,1,'MON','','','',9999),('607','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',1,0,'',6,'','','',0,1,'MON','','','',9999),('607','9','ID Autoridade','ID Autoridade',0,0,'',6,'','GEO','',0,4,'MON','','','',9999),('607','a','Palavra de ordem','Palavra de ordem',0,0,'',6,'','GEO','',0,0,'MON','','','',9999),('607','x','Subdivisão de assunto','Subdivisão de assunto',1,0,'',6,'','','',0,-1,'MON','','','',9999),('607','y','Subdivisão geográfica','Subdivisão geográfica',1,0,'',6,'','','',0,-1,'MON','','','',9999),('607','z','Subdivisão cronológica','Subdivisão cronológica',1,0,'',6,'','','',0,-1,'MON','','','',9999),('610','a','Termo de indexação','Termo de indexação',1,0,'',6,'','','',0,0,'MON','','','',9999),('620','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',6,'','','',0,1,'MON','','','',9999),('620','a','País','País',0,0,'',6,'','','',0,1,'MON','','','',9999),('620','b','Estado ou província','Estado ou província',0,0,'',6,'','','',0,1,'MON','','','',9999),('620','c','Jurisdição política intermédia','Jurisdição política intermédia',1,0,'',6,'','','',0,1,'MON','','','',9999),('620','d','Cidade','Cidade',0,0,'',6,'','','',0,0,'MON','','','',9999),('648','9','9 (RLIN)','9 (RLIN)',0,0,'',6,'','','',0,-5,'MON','','','',9999),('654','9','9 (RLIN)','9 (RLIN)',0,0,'',6,'','','',0,-5,'MON','','','',9999),('655','9','9 (RLIN)','9 (RLIN)',0,0,'',6,'','','',0,-5,'MON','','','',9999),('656','9','9 (RLIN)','9 (RLIN)',0,0,'',6,'','','',0,-5,'MON','','','',9999),('657','9','9 (RLIN)','9 (RLIN)',0,0,'',6,'','','',0,-5,'MON','','','',9999),('658','9','9 (RLIN)','9 (RLIN)',0,0,'',6,'','','',0,-5,'MON','','','',9999),('662','9','9 (RLIN)','9 (RLIN)',0,0,'',6,'','','',0,-5,'MON','','','',9999),('675','3','Número de registo de classificação','Número de registo de classificação',0,0,'',6,'','','',0,1,'MON','','','',9999),('675','a','Notação','Notação',0,0,'',6,'','','',0,0,'MON','','','',9999),('675','v','Edição','Edição',0,1,'',6,'','','',0,4,'MON','','','BN',9999),('675','z','Língua da edição','Língua da edição',0,1,'',6,'','','',0,4,'MON','','','Português',9999),('676','3','Número de registo de classificação','Número de registo de classificação',1,0,'',6,'','','',0,1,'MON','','','',9999),('676','a','Notação','Notação',0,0,'',6,'','','',0,0,'MON','','','',9999),('676','v','Edição','Edição',0,0,'',6,'','','',0,1,'MON','','','',9999),('676','z','Língua da edição','Língua da edição',0,0,'',6,'','','',0,1,'MON','','','',9999),('680','3','Número de registo de classificação','Número de registo de classificação',0,0,'',6,'','','',0,1,'MON','','','',9999),('680','a','Notação','Notação',0,0,'',6,'','','',0,0,'MON','','','',9999),('680','b','Número do exemplar','Número do exemplar',0,0,'',6,'','','',0,1,'MON','','','',9999),('686','2','Código do sistema','Código do sistema',0,0,'',6,'','','',0,1,'MON','','','',9999),('686','3','Número de registo de classificação','Número de registo de classificação',0,0,'',6,'','','',0,1,'MON','','','',9999),('686','a','Notação','Notação',1,0,'',6,'','','',0,0,'MON','','','',9999),('686','b','Número do exemplar','Número do exemplar',1,0,'',6,'','','',0,1,'MON','','','',9999),('686','c','Subdivisão da classificação','Subdivisão da classificação',1,0,'',6,'','','',0,1,'MON','','','',9999),('700','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',7,'','','',0,1,'MON','','','',9999),('700','9','ID Autoridade','ID Autoridade',0,0,'',7,'','PER','',0,4,'MON','','','',9999),('700','a','Palavra de ordem','Palavra de ordem',0,0,'',7,'','PER','',0,0,'MON','','','',9999),('700','b','Outra parte do nome não tomada para palavra de ordem','Outra parte do nome não tomada para palavra de ordem',0,0,'',7,'','PER','',0,0,'MON','','','',9999),('700','c','Elementos de identificação ou distinção','Elementos de identificação ou distinção',1,0,'',7,'','PER','',0,-1,'MON','','','',9999),('700','d','Numerais romanos','Numerais romanos',0,0,'',7,'','PER','',0,-1,'MON','','','',9999),('700','f','Datas','Datas',0,0,'',7,'','PER','',0,0,'MON','','','',9999),('700','g','Desenvolvimento de iniciais de nome próprio','Desenvolvimento de iniciais de nome próprio',0,0,'',7,'','','',0,1,'MON','','','',9999),('700','p','Filiação/Endereço','Filiação/Endereço',0,0,'',7,'','','',0,1,'MON','','','',9999),('701','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',7,'','','',0,1,'MON','','','',9999),('701','9','ID Autoridade','ID Autoridade',0,0,'',7,'','PER','',0,1,'MON','','','',9999),('701','a','Palavra de ordem','Palavra de ordem',0,0,'',7,'','PER','',0,0,'MON','','','',9999),('701','b','Outra parte do nome não tomada para palavra de ordem','Outra parte do nome não tomada para palavra de ordem',0,0,'',7,'','PER','',0,0,'MON','','','',9999),('701','c','Elementos de identificação ou distinção','Elementos de identificação ou distinção',1,0,'',7,'','PER','',0,-1,'MON','','','',9999),('701','d','Numerais romanos','Numerais romanos',0,0,'',7,'','PER','',0,-1,'MON','','','',9999),('701','f','Datas','Datas',0,0,'',7,'','PER','',0,0,'MON','','','',9999),('701','g','Desenvolvimento de iniciais de nome próprio','Desenvolvimento de iniciais de nome próprio',0,0,'',7,'','','',0,1,'MON','','','',9999),('701','p','Filiação/Endereço','Filiação/Endereço',0,0,'',7,'','','',0,1,'MON','','','',9999),('702','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',7,'','','',0,1,'MON','','','',9999),('702','9','ID Autoridade','ID Autoridade',0,0,'',7,'','PER','',0,1,'MON','','','',9999),('702','a','Palavra de ordem','Palavra de ordem',0,0,'',7,'','PER','',0,0,'MON','','','',9999),('702','b','Outra parte do nome não tomada para palavra de ordem','Outra parte do nome não tomada para palavra de ordem',0,0,'',7,'','PER','',0,0,'MON','','','',9999),('702','c','Elementos de identificação ou distinção','Elementos de identificação ou distinção',1,0,'',7,'','PER','',0,-1,'MON','','','',9999),('702','d','Numerais romanos','Numerais romanos',0,0,'',7,'','PER','',0,-1,'MON','','','',9999),('702','f','Datas','Datas',0,0,'',7,'','PER','',0,0,'MON','','','',9999),('702','g','Desenvolvimento de iniciais de nome próprio','Desenvolvimento de iniciais de nome próprio',0,0,'',7,'','','',0,1,'MON','','','',9999),('702','p','Filiação/Endereço','Filiação/Endereço',0,0,'',7,'','','',0,1,'MON','','','',9999),('710','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',7,'','','',0,1,'MON','','','',9999),('710','9','ID Autoridade','ID Autoridade',0,0,'',7,'','COR','',0,4,'MON','','','',9999),('710','a','Palavra de ordem','Palavra de ordem',0,0,'',7,'','COR','',0,0,'MON','','','',9999),('710','b','Subdivisão','Subdivisão',1,0,'',7,'','COR','',0,4,'MON','','','',9999),('710','c','Elementos de identificação ou distinção','Elementos de identificação ou distinção',1,0,'',7,'','COR','',0,-1,'MON','','','',9999),('710','d','Número do grupo-eventual e/ou número de uma parte do grupo-eventual','Número do grupo-eventual e/ou número de uma parte do grupo-eventual',0,0,'',7,'','COR','',0,-1,'MON','','','',9999),('710','e','Local do grupo-eventual','Local do grupo-eventual',0,0,'',7,'','COR','',0,-1,'MON','','','',9999),('710','f','Data do grupo-eventual','Data do grupo-eventual',0,0,'',7,'','COR','',0,-1,'MON','','','',9999),('710','g','Palavra invertida','Palavra invertida',0,0,'',7,'','','',0,-1,'MON','','','',9999),('710','h','Outra parte do nome que não a palavra de ordem','Outra parte do nome que não a palavra de ordem',0,0,'',7,'','','',0,-1,'MON','','','',9999),('710','p','Filiação/Endereço','Filiação/Endereço',0,0,'',7,'','','',0,-1,'MON','','','',9999),('711','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',7,'','','',0,1,'MON','','','',9999),('711','9','ID Autoridade','ID Autoridade',0,0,'',7,'','COR','',0,4,'MON','','','',9999),('711','a','Palavra de ordem','Palavra de ordem',0,0,'',7,'','COR','',0,0,'MON','','','',9999),('711','b','Subdivisão','Subdivisão',1,0,'',7,'','COR','',0,0,'MON','','','',9999),('711','c','Elementos de identificação ou distinção','Elementos de identificação ou distinção',1,0,'',7,'','COR','',0,-1,'MON','','','',9999),('711','d','Número do grupo-eventual e/ou número de uma parte do grupo-eventual','Número do grupo-eventual e/ou número de uma parte do grupo-eventual',0,0,'',7,'','COR','',0,-1,'MON','','','',9999),('711','e','Local do grupo-eventual','Local do grupo-eventual',0,0,'',7,'','COR','',0,-1,'MON','','','',9999),('711','f','Data do grupo-eventual','Data do grupo-eventual',0,0,'',7,'','COR','',0,-1,'MON','','','',9999),('711','g','Palavra invertida','Palavra invertida',0,0,'',7,'','','',0,1,'MON','','','',9999),('711','h','Outra parte do nome que não a palavra de ordem','Outra parte do nome que não a palavra de ordem',0,0,'',7,'','','',0,1,'MON','','','',9999),('711','p','Filiação/Endereço','Filiação/Endereço',0,0,'',7,'','','',0,1,'MON','','','',9999),('712','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',7,'','','',0,1,'MON','','','',9999),('712','9','ID Autoridade','ID Autoridade',0,0,'',7,'','COR','',0,4,'MON','','','',9999),('712','a','Palavra de ordem','Palavra de ordem',0,0,'',7,'','COR','',0,0,'MON','','','',9999),('712','b','Subdivisão','Subdivisão',1,0,'',7,'','COR','',0,0,'MON','','','',9999),('712','c','Elementos de identificação ou distinção','Elementos de identificação ou distinção',1,0,'',7,'','COR','',0,-1,'MON','','','',9999),('712','d','Número do grupo-eventual e/ou número de uma parte do grupo-eventual','Número do grupo-eventual e/ou número de uma parte do grupo-eventual',0,0,'',7,'','COR','',0,-1,'MON','','','',9999),('712','e','Local do grupo-eventual','Local do grupo-eventual',0,0,'',7,'','COR','',0,-1,'MON','','','',9999),('712','f','Data do grupo-eventual','Data do grupo-eventual',0,0,'',7,'','COR','',0,-1,'MON','','','',9999),('712','g','Palavra invertida','Palavra invertida',0,0,'',7,'','','',0,1,'MON','','','',9999),('712','h','Outra parte do nome que não a palavra de ordem','Outra parte do nome que não a palavra de ordem',0,0,'',7,'','','',0,1,'MON','','','',9999),('712','p','Filiação/Endereço','Filiação/Endereço',0,0,'',7,'','','',0,1,'MON','','','',9999),('720','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',7,'','','',0,1,'MON','','','',9999),('720','9','ID Autoridade','ID Autoridade',0,0,'',7,'','COR','',0,4,'MON','','','',9999),('720','a','Palavra de ordem','Palavra de ordem',0,0,'',7,'','COR','',0,0,'MON','','','',9999),('720','f','Datas','Datas',0,0,'',7,'','COR','',0,0,'MON','','','',9999),('721','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',7,'','','',0,1,'MON','','','',9999),('721','9','ID Autoridade','ID Autoridade',0,0,'',7,'','COR','',0,4,'MON','','','',9999),('721','a','Palavra de ordem','Palavra de ordem',0,0,'',7,'','COR','',0,0,'MON','','','',9999),('721','f','Datas','Datas',0,0,'',7,'','COR','',0,0,'MON','','','',9999),('722','3','Número de registo de entrada de autoridade','Número de registo de entrada de autoridade',0,0,'',7,'','','',0,1,'MON','','','',9999),('722','9','ID Autoridade','ID Autoridade',0,0,'',7,'','COR','',0,4,'MON','','','',9999),('722','a','Palavra de ordem','Palavra de ordem',0,0,'',7,'','COR','',0,0,'MON','','','',9999),('722','f','Datas','Datas',0,0,'',7,'','COR','',0,0,'MON','','','',9999),('801','2','Código do sistema','Código do sistema',0,0,'',8,'','','',0,1,'MON',NULL,'','',9999),('801','a','País','País',0,0,'',8,'','','',0,4,'MON',NULL,'','Portugal',9999),('801','b','Agência','Agência',0,0,'',8,'','','',0,4,'MON',NULL,'','UEBIB',9999),('801','c','Data da última transacção','Data da última transacção',0,0,'biblioitems.timestamp',8,'','','',0,4,'MON',NULL,'','',9999),('801','g','Regras de catalogação','Regras de catalogação',0,0,'',8,'','','',0,1,'MON',NULL,'','RPC',9999),('801','h','Número de controlo de origem','Número de controlo de origem',0,0,'',8,'','','',0,-1,'MON',NULL,'','',9999),('856','2','Texto de ligação','Texto de ligação',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','a','Nome do servidor','Nome do servidor',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','b','Número de acesso','Número de acesso',1,0,'',8,'','','',0,4,'MON','','','',9999),('856','c','Informação de compressão','Informação de compressão',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','d','Caminho','Caminho',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','e','Data e hora do acesso e consulta','Data e hora do acesso e consulta',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','f','Nome electrónico ','Nome electrónico',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','g','URN','URN',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','h','Processador do pedido','Processador do pedido',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','i','Instrução','Instrução',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','j','Bits por segundo','Bits por segundo',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','k','Password','Password',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','l','Logon/login','Logon/login',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','m','Contacto para assistência no acesso','Contacto para assistência no acesso',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','n','Localização do servidor indicado em $a','Localização do servidor indicado em $a',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','o','Sistema operativo','Sistema operativo',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','p','Porto','Porto',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','q','Tipo do formato electrónico','Tipo do formato electrónico',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','r','Definições (settings)','Definições (settings)',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','s','Extensão do ficheiro','Extensão do ficheiro',1,0,'',8,'','','',0,-1,'MON','','','',9999),('856','t','Emulação de terminal','Emulação de terminal',1,0,'',8,'','','',0,-5,'MON','','','',9999),('856','u','URL','URL',1,0,'biblioitems.url',8,'','','',0,-1,'MON','','','',9999),('856','v','Horário de acesso','Horário de acesso',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','w','Número de controlo do registo','Número de controlo do registo',1,0,'',8,'','','',0,1,'MON','','','',9999),('856','x','Nota para informação interna','Nota para informação interna',1,0,'',8,'','','',0,-1,'MON','','','',9999),('856','y','Método de acesso','Método de acesso',0,0,'',8,'','','',0,1,'MON','','','',9999),('856','z','Nota para informação ao público','Nota para informação ao público',1,0,'',8,'','','',0,0,'MON','','','',9999),('859','a','Descrição','Descrição',0,0,'',8,'','','',0,0,'MON',NULL,'','Capa',9999),('859','b','Localização do Ficheiro','Localização do Ficheiro',0,0,'',8,'','','',1,0,'MON',NULL,'','',9999),('859','c','Disponibilizar ao público','Disponibilizar ao público',0,0,'',8,'','','',0,0,'MON',NULL,'','',9999),('990','0','Número Koha','Número Koha',0,0,'biblioitems.totalissues',9,'','','',0,-1,'MON','','','',9999),('990','2','Fonte de classificação ou esquema de arrumação','Fonte de classificação ou esquema de arrumação',0,0,'biblioitems.cn_source',9,'','','',0,0,'MON','','','',9999),('990','6','Classificação normalizada Koha para ordenação','Classificação normalizada Koha para ordenação',0,0,'biblioitems.cn_sort',9,'','','',0,1,'MON','','','',9999),('990','c','Tipo de documento Koha','Tipo de documento Koha',0,0,'biblioitems.itemtype',9,'itemtypes','','',0,0,'MON','','','',9999),('990','e','Edição','Edição',0,0,'',9,'','','',0,0,'MON','','','',9999),('990','h','Parte da classificação','Parte da classificação',0,0,'biblioitems.cn_class',9,'','','',0,0,'MON','','','',9999),('990','i','Parte do item','Parte do item',1,0,'biblioitems.cn_item',9,'','','',0,1,'MON','','','',9999),('990','k','Prefixo do número de registo','Prefixo do número de registo',0,0,'',9,'','','',0,0,'MON','','','',9999),('990','m','Sufixo do número de registo','Sufixo do número de registo',0,0,'biblioitems.cn_suffix',9,'','','',0,0,'MON','','','',9999),('990','n','Suprimir em OPAC','Suprimir em OPAC',0,0,'',9,'','','',0,4,'MON','','','',9999),('990','s','Etiqueta de registo de série','Etiqueta de registo de série',0,0,'biblio.serial',9,'','','',0,-5,'MON','','','',9999),('994','e','Existências (periódicos)','Existências (periódicos)',0,0,'',9,'','','',0,0,'MON','','','',9999),('995','0','Situação do levantamento','Situação do levantamento',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','1','Situação do extravio','Situação do extravio',0,0,'items.itemlost',10,'LOST','','',0,0,'MON','','','',9999),('995','2','Código do sistema (classificação específica ou outro esquema e edição)','Código do sistema (classificação específica ou outro esquema e edição)',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','3','Restrições','Restrições',0,0,'items.restricted',-1,'RESTRICTED','','',0,0,'MON','','','',9999),('995','4','Classificação interna Koha para ordenação','Classificação interna Koha para ordenação',0,0,'items.cn_sort',-1,'','','',0,4,'MON','','','',9999),('995','5','Data de aquisição','Data de aquisição',0,0,'items.dateaccessioned',10,'','','',0,0,'MON','','','',9999),('995','6','Número de registo','Número de registo',0,1,'items.copynumber',10,'','','',0,0,'MON','','','',9999),('995','7','Identificador de recurso','Identificador de recurso',0,0,'items.uri',-1,'','','',0,0,'MON','','','',9999),('995','8','Coleção temática','Coleção temática',0,0,'items.ccode',10,'CCODE','','',0,0,'MON','','','',9999),('995','9','Número interno Koha (auto-gerado)','Número interno Koha (auto-gerado)',0,0,'items.itemnumber',-1,'','','',0,0,'MON','','','',9999),('995','a','Biblioteca de aquisição','Biblioteca de aquisição',0,1,'items.homebranch',10,'branches','','',0,0,'MON','','','',9999),('995','b','Código da biblioteca de aquisição','Código da biblioteca de aquisição',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','c','Biblioteca de empréstimo','Biblioteca de empréstimo',0,0,'items.holdingbranch',10,'branches','','',0,0,'MON','','','',9999),('995','d','Código da biblioteca de empréstimo','Código da biblioteca de empréstimo',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','e','Detalhe do género','Detalhe do género',0,0,'',-1,'','','',0,-1,'MON','','','',9999),('995','f','Código de barras','Código de barras',0,0,'items.barcode',10,'','','barcode.pl',0,0,'MON','','','',9999),('995','h','Numeração (volume ou parte)','Numeração (volume ou parte)',0,0,'items.enumchron',10,'','','',0,0,'MON','','','',9999),('995','i','Sufixo do código de barras','Sufixo do código de barras',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','j','Desconhecido','Desconhecido',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','k','Cota','Cota',0,1,'items.itemcallnumber',10,'','','',0,0,'MON','','','',9999),('995','l','Material acompanhante','Material acompanhante',0,0,'items.materials',10,'','','',0,0,'MON','','','',9999),('995','m','Data de empréstimo ou deposito','Data de empréstimo ou deposito',0,0,'items.datelastborrowed',10,'','','',0,0,'MON','','','',9999),('995','n','Fim da data de empréstimo','Fim da data de empréstimo',0,0,'items.datelastseen',10,'','','',0,0,'MON','','','',9999),('995','o','Permissão de empréstimo','Permissão de empréstimo',0,0,'items.notforloan',10,'NOT_LOAN','','',0,0,'MON','','','',9999),('995','p','Preço','Preço',0,0,'items.price',10,'','','',0,0,'MON','','','',9999),('995','q','Código de audiência','Código de audiência',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','r','Tipo de documento','Tipo de documento',0,1,'items.itype',10,'itemtypes','','',0,0,'MON','','','',9999),('995','t','Género','Género',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','u','Nota pública','Nota pública',0,0,'items.itemnotes',10,'','','',0,0,'MON','','','',9999),('995','v','Número da série','Número da série',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','w','Código da organização de destino','Código da organização de destino',0,0,'',-1,'','','',0,0,'MON','','','',9999),('995','z','Nota interna ao exemplar','Nota interna ao exemplar',0,0,'items.itemnotes_nonpublic',10,'','','',0,0,'MON','','','',9999),('999','m','Folha de descrição','Folha de descrição',0,0,'',-1,'','','',0,0,'MON','','','',9999);
/*!40000 ALTER TABLE `marc_subfield_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marc_tag_structure`
--

DROP TABLE IF EXISTS `marc_tag_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marc_tag_structure` (
  `tagfield` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `liblibrarian` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `libopac` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `authorised_value` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frameworkcode` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`frameworkcode`,`tagfield`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marc_tag_structure`
--

LOCK TABLES `marc_tag_structure` WRITE;
/*!40000 ALTER TABLE `marc_tag_structure` DISABLE KEYS */;
INSERT INTO `marc_tag_structure` VALUES ('000','Record Label','Record Label',0,1,'',''),('001','Record Identifier','Record Identifier',0,1,'',''),('003','Persistent Record Identifier','Persistent Record Identifier',0,0,'',''),('005','Version Identifier','Version Identifier',0,0,'',''),('010','International Standard Book Number (ISBN)','International Standard Book Number (ISBN)',1,0,'',''),('011','International Standard Serial Number (ISSN)','International Standard Serial Number (ISSN)',1,0,'',''),('012','Fingerprint Identifier','Fingerprint Identifier',1,0,'',''),('013','International Standard Music Number (ISMN)','International Standard Music Number (ISMN)',1,0,'',''),('014','Article Identifier','Article Identifier',1,0,'',''),('015','International Standard Technical Report Number (ISRN)','International Standard Technical Report Number (ISRN)',1,0,'',''),('016','International Standard Recording Code (ISRC)','International Standard Recording Code (ISRC)',1,0,'',''),('017','Other Standard Identifier','Other Standard Identifier',1,0,'',''),('020','National Bibliography Number','National Bibliography Number',1,0,'',''),('021','Legal Deposit Number','Legal Deposit Number',1,0,'',''),('022','Government Publication Number','Government Publication Number',1,0,'',''),('035','Other System Control Numbers','Other System Control Numbers',1,0,'',''),('036','Music Incipit','Music Incipit',1,0,'',''),('040','CODEN (Serials)','CODEN (Serials)',1,0,'',''),('071','Publisher\'s Number','Publisher\'s Number',1,0,'',''),('072','Universal Product Code (UPC)','Universal Product Code (UPC)',1,0,'',''),('073','International Article Number (EAN)','International Article Number (EAN)',1,0,'',''),('090','System Control Numbers (Koha)','System Control Numbers (Koha)',0,0,'',''),('099','local dates','',0,0,'',''),('100','General Processing Data','General Processing Data',0,1,'',''),('101','Language of the Resource','Language of the Resource',0,0,'',''),('102','Country of Publication or Production','Country of Publication or Production',0,0,'',''),('105','Coded Data Field: Textual Material, Monographic','Coded Data Field: Textual Material, Monographic',0,0,'',''),('106','Coded Data Field: Textual Material - Physical Attributes','Coded Data Field: Textual Material - Physical Attributes',0,0,'',''),('110','Coded Data Field: Continuing Resources','Coded Data Field: Continuing Resources',0,0,'',''),('115','Coded Data Field: Visual Projections, Videorecordings and Motion Pictures','Coded Data Fields: Visual Projections, Videorecordings and Motion Pictures',1,0,'',''),('116','Coded Data Field: Graphics','Coded Data Field: Graphics',1,0,'',''),('117','Coded Data Field: Three-Dimensional Artefacts and Realia','Coded Data Field: Three-Dimensional Artefacts and Realia',1,0,'',''),('120','Coded Data Field: Cartographic Materials - General','Coded Data Field: Cartographic Materials - General',0,0,'',''),('121','Coded Data Field: Cartographic Materials: Physical Attributes','Coded Data Field: Cartographic Materials: Physical Attributes',0,0,'',''),('122','Coded Data Field: Time Period of Item Content','Coded Data Field: Time Period of Item Content',1,0,'',''),('123','Coded Data Field: Cartographic Resources - Scale and Co-Ordinates','Coded Data Field: Cartographic Resources - Scale and Co-Ordinates',1,0,'',''),('124','Coded Data Field: Cartographic Materials - Specific Material Designation Analysis','Coded Data Field: Cartographic Materials - Specific Material Designation Analysis',0,0,'',''),('125','Coded Data Field: Sound Recordings and Music','Coded Data Field: Sound Recordings and Music',0,0,'',''),('126','Coded Data Field: Sound Recordings - Physical Attributes','Coded Data Field: Sound Recordings - Physical Attributes',0,0,'',''),('127','Coded Data Field: Duration of Sound Recordings and Printed Music','Coded Data Field: Duration of Sound Recordings and Printed Music',0,0,'',''),('128','Coded Data Field: Form of Musical Work and Key or Mode','Coded Data Field: Form of Musical Work and Key or Mode',1,0,'',''),('130','Coded Data Field: Microforms - Physical Attributes','Coded Data Field: Microforms - Physical Attributes',1,0,'',''),('131','Coded Data Field: Cartographic Materials: Geodetic, Grid and Vertical Measurement','Coded Data Field: Cartographic Materials: Geodetic, Grid and Vertical Measurement',0,0,'',''),('135','Coded Data Field: Electronic Resources','Coded Data Field: Electronic Resources',1,0,'',''),('140','Coded Data Field: Antiquarian - General','Coded Data Field: Antiquarian - General',0,0,'',''),('141','Coded Data Field: Copy Specific Attributes','Coded Data Field: Copy Specific Attributes',1,0,'',''),('145','Coded Data Field: Medium of Performance [Obsolete]','Coded Data Field: Medium of Performance [Obsolete]',1,0,'',''),('146','Coded Data Field: Medium of Performance','Coded Data Field: Medium of Performance',1,0,'',''),('200','Title and Statement of Responsibility','Title and Statement of Responsibility',0,1,'',''),('204','General Material Designation [Obsolete]','General Material Designation [Obsolete]',1,0,'',''),('205','Edition Statement','Edition Statement',1,0,'',''),('206','Material Specific Area: Cartographic Resources - Mathematical Data','Material Specific Area: Cartographic Resources - Mathematical Data',1,0,'',''),('207','Material Specific Area: Numbering of Continuing Resources','Material Specific Area: Numbering of Continuing Resources',0,0,'',''),('208','Material Specific Area: Printed Music Specific Statement','Material Specific Area: Printed Music Specific Statement',0,0,'',''),('210','Publication, Distribution, etc.','Publication, Distribution, etc.',1,0,'',''),('211','Projected Publication Date','Projected Publication Date',0,0,'',''),('215','Physical Description','Physical Description',1,0,'',''),('225','Series','Series',1,0,'',''),('230','Material Specific Area: Electronic Resource Characteristics','Material Specific Area: Electronic Resource Characteristics',1,0,'',''),('251','Organization and Arrangement of Materials','Organization and Arrangement of Materials',1,0,'',''),('300','General Notes','General Notes',1,0,'',''),('301','Notes Pertaining to Identification Numbers','Notes Pertaining to Identification Numbers',1,0,'',''),('302','Notes Pertaining to Coded Information','Notes Pertaining to Coded Information',1,0,'',''),('303','General Notes Pertaining to Descriptive Information','General Notes Pertaining to Descriptive Information',1,0,'',''),('304','Notes Pertaining to Title and Statement of Responsibility','Notes Pertaining to Title and Statement of Responsibility',1,0,'',''),('305','Notes Pertaining to Edition and Bibliographic History','Notes Pertaining to Edition and Bibliographic History',1,0,'',''),('306','Notes Pertaining to Publication, Distribution, etc.','Notes Pertaining to Publication, Distribution, etc.',1,0,'',''),('307','Notes Pertaining to Physical Description','Notes Pertaining to Physical Description',1,0,'',''),('308','Notes Pertaining to Series','Notes Pertaining to Series',1,0,'',''),('310','Notes Pertaining to Binding and Availability','Notes Pertaining to Binding and Availability',1,0,'',''),('311','Notes Pertaining to Linking Fields','Notes Pertaining to Linking Fields',1,0,'',''),('312','Notes Pertaining to Related Titles','Notes Pertaining to Related Titles',1,0,'',''),('313','Notes Pertaining to Subject Access','Notes Pertaining to Subject Access',1,0,'',''),('314','Notes Pertaining to Responsibility','Notes Pertaining to Responsibility',1,0,'',''),('315','Notes Pertaining to Material (Or Type of Publication) Specific Information','Notes Pertaining to Material (Or Type of Publication) Specific Information',1,0,'',''),('316','Note Relating to the Copy in Hand','Note Relating to the Copy in Hand',1,0,'',''),('317','Provenance Note','Provenance Note',1,0,'',''),('318','Action Note','Action Note',1,0,'',''),('320','Internal Bibliographies/Indexes Note','Internal Bibliographies/Indexes Note',1,0,'',''),('321','External Indexes/Abstracts/References Note','External Indexes/Abstracts/References Note',1,0,'',''),('322','Credits Note (Projected and Video Material and Sound Recordings)','Credits Note (Projected and Video Material and Sound Recordings)',0,0,'',''),('323','Cast Note (Projected and Video Material and Sound Recordings)','Cast Note (Projected and Video Material and Sound Recordings)',1,0,'',''),('324','Original Version Note','Original Version Note',0,0,'',''),('325','Reproduction Note','Reproduction Note',1,0,'',''),('326','Frequency Statement Note (Continuing Resources)','Frequency Statement Note (Continuing Resources)',1,0,'',''),('327','Contents Note','Contents Note',1,0,'',''),('328','Dissertation (Thesis) Note','Dissertation (Thesis) Note',1,0,'',''),('330','Summary or Abstract','Summary or Abstract',1,0,'',''),('332','Preferred Citation of Described Materials','Preferred Citation of Described Materials',1,0,'',''),('333','Users/Intended Audience Note','Users/Intended Audience Note',1,0,'',''),('334','Awards Note','Awards Note',1,0,'',''),('335','Location of Originals/ Reproductions','Location of Originals/ Reproductions',1,0,'',''),('336','Type of Electronic Resource Note','Type of Electronic Resource Note',1,0,'',''),('337','System Requirements Note (Electronic Resources)','System Requirements Note (Electronic Resources)',1,0,'',''),('345','Acquisition Information Note','Acquisition Information Note',0,0,'',''),('371','Notes on Information Service Policy','Notes on Information Service Policy',1,0,'',''),('410','Series','Series',0,0,'',''),('411','Subseries','Subseries',0,0,'',''),('412','Source of Excerpt or Offprint','Source of Excerpt or Offprint',0,0,'',''),('413','Excerpt or Offprint','Excerpt or Offprint',0,0,'',''),('421','Supplement','Supplement',0,0,'',''),('422','Parent of Supplement','Parent of Supplement',0,0,'',''),('423','Issued with','Issued with',0,0,'',''),('424','is Updated by','is Updated by',0,0,'',''),('425','Updates','Updates',0,0,'',''),('430','Continues','Continues',0,0,'',''),('431','Continues in Part','Continues in Part',0,0,'',''),('432','Supersedes','Supersedes',0,0,'',''),('433','Supersedes in Part','Supersedes in Part',0,0,'',''),('434','Absorbed','Absorbed',0,0,'',''),('435','Absorbed in Part','Absorbed in Part',0,0,'',''),('436','Formed by Merger of','Formed by Merger of',0,0,'',''),('437','Separated from','Separated from',0,0,'',''),('440','Continued by','Continued by',0,0,'',''),('441','Continued in Part by','Continued in Part by',0,0,'',''),('442','Superseded by','Superseded by',0,0,'',''),('443','Superseded in Part by','Superseded in Part by',0,0,'',''),('444','Absorbed by','Absorbed by',0,0,'',''),('445','Absorbed in Part by','Absorbed in Part by',0,0,'',''),('446','Split into','Split into',0,0,'',''),('447','Merged with XXX to Form','Merged with XXX to Form',0,0,'',''),('448','Changed Back to','Changed Back to',0,0,'',''),('451','Other Edition in the Same Medium','Other Edition in the Same Medium',0,0,'',''),('452','Other Edition in Another Medium','Other Edition in Another Medium',0,0,'',''),('453','Translated as','Translated as',0,0,'',''),('454','Translation of','Translation of',0,0,'',''),('455','Other Edition, State or Impression in the Same Medium','Other Edition, State or Impression in the Same Medium',0,0,'',''),('456','Reproduced as','Reproduced as',0,0,'',''),('461','Set Level','Set Level',0,0,'',''),('462','Subset Level','Subset Level',0,0,'',''),('463','Piece Level','Piece Level',0,0,'',''),('464','Piece-Analytic Level','Piece-Analytic Level',0,0,'',''),('470','Item Reviewed','Item Reviewed',0,0,'',''),('481','Also Bound with This Volume','Also Bound with This Volume',0,0,'',''),('482','Bound with','Bound with',0,0,'',''),('488','Other Related Works','Other Related Works',0,0,'',''),('500','Preferred Access Point','Preferred Access Point',1,0,'',''),('501','Collective Preferred Title','Collective Preferred Title',1,0,'',''),('503','Preferred Conventional Heading','Preferred Conventional Heading',1,0,'',''),('506','Preferred Access Point - Identification of a Work','Preferred Access Point - Identification of a Work',1,0,'',''),('507','Preferred Access Point - Identification of an Expression','Preferred Access Point - Identification of an Expression',1,0,'',''),('510','Parallel Title Proper','Parallel Title Proper',1,0,'',''),('511','Half Title','Half Title',1,0,'',''),('512','Cover Title','Cover Title',1,0,'',''),('513','Added Title-Page Title','Added Title-Page Title',1,0,'',''),('514','Caption Title','Caption Title',1,0,'',''),('515','Running Title','Running Title',1,0,'',''),('516','Spine Title','Spine Title',1,0,'',''),('517','Other Variant Titles','Other Variant Titles',1,0,'',''),('518','Title in Standard Modern Spelling','Title in Standard Modern Spelling',1,0,'',''),('520','Former Title (Continuing Resources)','Former Title (Continuing Resources)',1,0,'',''),('530','Key Title (Continuing Resources)','Key Title (Continuing Resources)',1,0,'',''),('531','Abbreviated Title (Continuing Resources)','Abbreviated Title (Continuing Resources)',1,0,'',''),('532','Expanded Title','Expanded Title',1,0,'',''),('540','Additional Title Supplied by Cataloguer','Additional Title Supplied by Cataloguer',1,0,'',''),('541','Translated Title Supplied by Cataloguer','Translated Title Supplied by Cataloguer',1,0,'',''),('545','Section Title','Section Title',1,0,'',''),('560','Artifical Title','Artifical Title',1,0,'',''),('576','Name / Preferred Access Point - Identification of a Work','Name / Preferred Access Point - Identification of a Work',1,0,'',''),('577','Name / Preferred Access Point - Identification of an Expression','Name / Preferred Access Point - Identification of an Expression',1,0,'',''),('600','Personal Name Used as Subject','Personal Name Used as Subject',1,0,'',''),('601','Corporate Body Name Used as Subject','Corporate Body Name Used as Subject',1,0,'',''),('602','Family Name Used as Subject','Family Name Used as Subject',1,0,'',''),('604','Name and Title Used as Subject','Name and Title Used as Subject',1,0,'',''),('605','Title Used as Subject','Title Used as Subject',1,0,'',''),('606','Topical Name Used as Subject','Topical Name Used as Subject',1,0,'',''),('607','Geographical Name Used as Subject','Geographical Name Used as Subject',1,0,'',''),('608','Form, Genre or Physical Characteristics Heading','Form, Genre or Physical Characteristics Heading',1,0,'',''),('610','Uncontrolled Subject Terms','Uncontrolled Subject Terms',1,0,'',''),('615','Subject Category (Provisional)','Subject Category (Provisional)',1,0,'',''),('616','Trademark Used as Subject','Trademark Used as Subject',1,0,'',''),('617','Hierarchical Geographical Name Used as Subject','Hierarchical Geographical Name Used as Subject',1,0,'',''),('620','Place and Date of Publication, Performance, etc.','Place and Date of Publication, Performance, etc.',1,0,'',''),('621','Place and Date of Provenance','Place and Date of Provenance',1,0,'',''),('626','Technical Details Access (Electronic Resources) [Obsolete]','Technical Details Access (Electronic Resources) [Obsolete]',1,0,'',''),('660','Geographic Area Code','Geographic Area Code',1,0,'',''),('661','Time Period Code','Time Period Code',1,0,'',''),('670','PRECIS','PRECIS',1,0,'',''),('675','Universal Decimal Classification (UDC)','Universal Decimal Classification (UDC)',1,0,'',''),('676','Dewey Decimal Classification','Dewey Decimal Classification',1,0,'',''),('680','Library of Congress Classification','Library of Congress Classification',1,0,'',''),('686','Other Class Numbers','Other Class Numbers',1,0,'',''),('700','Personal Name - Primary Responsibility','Personal Name - Primary Responsibility',0,0,'',''),('701','Personal Name - Alternative Responsibility','Personal Name - Alternative Responsibility',1,0,'',''),('702','Personal Name - Secondary Responsibility','Personal Name - Secondary Responsibility',1,0,'',''),('703','Personal Name - Provenance or Ownership','Personal Name - Provenance or Ownership',1,0,'',''),('710','Corporate Body Name - Primary Responsibility','Corporate Body Name - Primary Responsibility',0,0,'',''),('711','Corporate Body Name - Alternative Responsibility','Corporate Body Name - Alternative Responsibility',1,0,'',''),('712','Corporate Body Name - Secondary Responsibility','Corporate Body Name - Secondary Responsibility',1,0,'',''),('713','Corporate Body Name - Provenance or Ownership','Corporate Body Name - Provenance or Ownership',1,0,'',''),('716','Trademark','Trademark',1,0,'',''),('720','Family Name - Primary Responsibility','Family Name - Primary Responsibility',0,0,'',''),('721','Family Name - Alternative Responsibility','Family Name - Alternative Responsibility',1,0,'',''),('722','Family Name - Secondary Responsibility','Family Name - Secondary Responsibility',1,0,'',''),('723','Family Name - Provenance or Ownership','Family Name - Provenance or Ownership',1,0,'',''),('730','Name - Entity Responsible','Name - Entity Responsible',1,0,'',''),('740','Uniform Conventional Heading for Legal and Religious Texts - Primary Responsibility','Uniform Conventional Heading for Legal and Religious Texts - Primary Responsibility',0,0,'',''),('741','Uniform Conventional Heading for Legal and Religious Texts - Alternative Responsibility','Uniform Conventional Heading for Legal and Religious Texts - Alternative Responsibility',1,0,'',''),('742','Uniform Conventional Heading for Legal and Religious Texts - Secondary Responsibility','Uniform Conventional Heading for Legal and Religious Texts - Secondary Responsibility',1,0,'',''),('801','Originating Source','Originating Source',1,1,'',''),('802','National ISSN Centre','National ISSN Centre',0,0,'',''),('830','General Cataloguer\'s Note','General Cataloguer\'s Note',1,0,'',''),('850','Holding Institution','Holding Institution',1,0,'',''),('852','Location and Call Number','Location and Call Number',1,0,'',''),('856','Electronic Location and Access','Electronic Location and Access',1,0,'',''),('886','Data Not Converted from Source Format','Data Not Converted from Source Format',1,0,'',''),('942','ADDED ENTRY ELEMENTS (KOHA)','ADDED ENTRY ELEMENTS (KOHA)',0,0,'',''),('995','Location and Item Information (Koha)','Location and Item Information (Koha)',0,0,'',''),('000','Etiqueta do registo','Etiqueta do registo',0,1,'','MON'),('001','Identificador do registo','Identificador do registo',0,0,'','MON'),('005','Identificador da versão','Identificador da versão',0,0,'','MON'),('010','Número internacional normalizado dos livros (ISBN)','Número internacional normalizado dos livros (ISBN)',1,0,'','MON'),('012','Identificador da impressão ','Identificador da impressão',1,0,'','MON'),('021','Número do Depósito Legal','Número do Depósito Legal',1,0,'','MON'),('090','System Control Numbers (Koha)','System Control Numbers (Koha)',0,0,'','MON'),('100','Dados gerais de processamento','Dados gerais de processamento',0,1,'','MON'),('101','Língua de publicação','Língua de publicação',0,0,'Lingua','MON'),('102','Pais de publicação ou produção','Pais de publicação ou produção',0,0,'Pais','MON'),('105','Campo de dados codificados: Materia textual de carácter monográfico','Campo de dados codificados: livros',0,0,'','MON'),('106','Campo de dados codificados: Forma do item','Campo de dados codificados: Forma do item',0,0,'','MON'),('141','Características específicas do exemplar','Características específicas do exemplar',1,0,'','MON'),('200','Titulo e menção de responsabilidade','Titulo e menção de responsabilidade',0,0,'','MON'),('205','Menção da edição','Menção da edição',1,0,'','MON'),('210','Publicação, distribuição, etc. ','Publicação, distribuição, etc. ',1,0,'','MON'),('215','Descrição física ','Descrição física ',1,0,'','MON'),('225','Colecção ','Colecção ',1,0,'','MON'),('300','Notas gerais ','Notas gerais ',1,0,'','MON'),('301','Notas relativas a números de identificação ','Notas relativas a números de identificação ',1,0,'','MON'),('302','Notas relativas a informação codificada ','Notas relativas a informação codificada ',1,0,'','MON'),('303','Notas gerais relativas a informação descritiva ','Notas gerais relativas a informação descritiva ',1,0,'','MON'),('304','Notas relativas a título e menção de responsabilidade ','Notas relativas a título e menção de responsabilidade ',1,0,'','MON'),('305','Notas relativas à edição e história bibliográfica da publicação ','Notas relativas à edição e história bibliográfica da publicação ',1,0,'','MON'),('306','Notas relativas a publicação, distribuição, etc. ','Notas relativas a publicação, distribuição, etc. ',1,0,'','MON'),('307','Notas relativas a descrição física ','Notas relativas a descrição física ',1,0,'','MON'),('308','Notas relativas à coleção','Notas relativas à coleção',1,0,'','MON'),('310','Notas relativas à encadernação e modalidade de aquisição ','Notas relativas à encadernação e modalidade de aquisição ',1,0,'','MON'),('311','Notas relativas a campos de entradas relacionadas ','Notas relativas a campos de entradas relacionadas ',1,0,'','MON'),('312','Notas relativas a títulos relacionados ','Notas relativas a títulos relacionados ',1,0,'','MON'),('313','Notas relativas a acesso por assunto ','Notas relativas a acesso por assunto ',1,0,'','MON'),('314','Notas relativas a responsabilidade intelectual ','Notas relativas a responsabilidade intelectual ',1,0,'','MON'),('315','Notas relativas a informação específica sobre alguns tipos de materiais (ou tipo de publicação)','Notas relativas a informação específica sobre alguns tipos de materiais (ou tipo de publicação)',1,0,'','MON'),('316','Nota relativa ao exemplar catalogado (em mão) ','Nota relativa ao exemplar catalogado (em mão) ',1,0,'','MON'),('317','Nota de proveniência ','Nota de proveniência ',1,0,'','MON'),('318','Nota de intervenção ','Nota de intervenção ',1,0,'','MON'),('320','Nota relativa a bibliografia e índices internos ','Nota relativa a bibliografia e índices internos ',1,0,'','MON'),('321','Nota relativa a indíces, resumos de autor e referências externas ','Nota relativa a indíces, resumos de autor e referências externas ',1,0,'','MON'),('324','Nota de versão original','Nota de versão original',0,0,'','MON'),('325','Nota de reprodução','Nota de reprodução',1,0,'','MON'),('327','Nota de conteúdo ','Nota de conteúdo ',1,0,'','MON'),('328','Nota de dissertação ou tese','Nota de dissertação ou tese',1,0,'','MON'),('330','Sumário ou Resumo','Sumário ou Resumo',1,0,'','MON'),('345','Nota informativa sobre aquisição','Nota informativa sobre aquisição',0,0,'','MON'),('410','Colecção','Colecção',1,0,'','MON'),('421','Tem por suplemento','Tem por suplemento',1,0,'','MON'),('422','É suplemento de','É suplemento de',1,0,'','MON'),('423','Publicado com','Publicado com',1,0,'','MON'),('437','Separado de','Separado de',1,0,'','MON'),('451','Outra edição no mesmo suporte','Outra edição no mesmo suporte',1,0,'','MON'),('452','Edição em suporte diferente','Edição em suporte diferente',1,0,'','MON'),('453','Traduzido como','Traduzido como',1,0,'','MON'),('454','Tradução de','Tradução de',1,0,'','MON'),('481','Também encadernado neste volume','Também encadernado neste volume',1,0,'','MON'),('482','Encadernado com','Encadernado com',1,0,'','MON'),('500','Título Uniforme','Título Uniforme',1,0,'','MON'),('503','Cabeçalho convencional uniforme','Cabeçalho convencional uniforme',1,0,'','MON'),('510','Título paralelo','Título paralelo',1,0,'','MON'),('512','Título da capa','Título da capa',1,0,'','MON'),('517','Outras variantes do título','Outras variantes do título',1,0,'','MON'),('518','Título na grafia actualizada','Título na grafia actualizada',1,0,'','MON'),('532','Título desenvolvido','Título desenvolvido',1,0,'','MON'),('541','Título traduzido adicionado pelo catalogador','Título traduzido adicionado pelo catalogador',1,0,'','MON'),('600','Nome de pessoa usado como assunto','Nome de pessoa usado como assunto',1,0,'','MON'),('601','Nome de colectividade usado como assunto','Nome de colectividade usado como assunto',1,0,'','MON'),('604','Autor/título usado como assunto ','Autor/título usado como assunto ',1,0,'','MON'),('605','Título usado como assunto','Título usado como assunto',1,0,'','MON'),('606','Nome comum usado como assunto','Nome comum usado como assunto',1,0,'','MON'),('607','Nome geográfico usado como assunto','Nome geográfico usado como assunto',1,0,'','MON'),('610','Termos de indexação não controlados','Termos de indexação não controlados',1,0,'','MON'),('620','Lugar e data de publicação, representação, etc.','Lugar e data de publicação, representação, etc.',1,0,'','MON'),('675','Classificação Decimal Universal (CDU)','Classificação Decimal Universal (CDU)',1,0,'','MON'),('676','Classificação Decimal Dewey (CDD)','Classificação Decimal Dewey (CDD)',1,0,'','MON'),('680','Classificação da Biblioteca do Congresso','Classificação da Biblioteca do Congresso',1,0,'','MON'),('686','Outras classificações numéricas','Outras classificações numéricas',1,0,'','MON'),('700','Nome de pessoa - Responsabilidade principal','Nome de pessoa - Responsabilidade principal',0,0,'','MON'),('701','Nome de pessoa - Co-responsabilidade principal','Nome de pessoa - Co-responsabilidade principal',1,0,'','MON'),('702','Nome de pessoa - Responsabilidade secundária','Nome de pessoa - Responsabilidade secundária',1,0,'','MON'),('710','Nome de colectividade - Responsabilidade principal','Nome de colectividade - Responsabilidade principal',0,0,'','MON'),('711','Nome de colectividade - Co-responsabilidade principal','Nome de colectividade - Co-responsabilidade principal',1,0,'','MON'),('712','Nome de colectividade - Responsabilidade secundária','Nome de colectividade - Responsabilidade secundária',1,0,'','MON'),('720','Nome de Família - Responsabilidade principal','Nome de Família - Responsabilidade principal',0,0,'','MON'),('721','Nome de Família - Co-responsabilidade principal','Nome de Família - Co-responsabilidade principal',1,0,'','MON'),('722','Nome de Família - Responsabilidade secundária','Nome de Família - Responsabilidade secundária',1,0,'','MON'),('801','Fonte de origem','Fonte de origem',1,0,'','MON'),('856','Instituição detentora do item','Instituição detentora do item',1,0,'','MON'),('859','Imagem de Capa','Imagem de Capa',0,0,'','MON'),('990','Elementos KOHA','Elementos KOHA',0,0,'','MON'),('994','Estado da catalogação','Estado da catalogação',0,0,'','MON'),('995','Localização e informação dos exemplares','Localização e informação dos exemplares',0,1,'','MON');
/*!40000 ALTER TABLE `marc_tag_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchchecks`
--

DROP TABLE IF EXISTS `matchchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchchecks` (
  `matcher_id` int(11) NOT NULL,
  `matchcheck_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_matchpoint_id` int(11) NOT NULL,
  `target_matchpoint_id` int(11) NOT NULL,
  PRIMARY KEY (`matchcheck_id`),
  KEY `matcher_matchchecks_ifbk_1` (`matcher_id`),
  KEY `matcher_matchchecks_ifbk_2` (`source_matchpoint_id`),
  KEY `matcher_matchchecks_ifbk_3` (`target_matchpoint_id`),
  CONSTRAINT `matcher_matchchecks_ifbk_1` FOREIGN KEY (`matcher_id`) REFERENCES `marc_matchers` (`matcher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matcher_matchchecks_ifbk_2` FOREIGN KEY (`source_matchpoint_id`) REFERENCES `matchpoints` (`matchpoint_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matcher_matchchecks_ifbk_3` FOREIGN KEY (`target_matchpoint_id`) REFERENCES `matchpoints` (`matchpoint_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchchecks`
--

LOCK TABLES `matchchecks` WRITE;
/*!40000 ALTER TABLE `matchchecks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matcher_matchpoints`
--

DROP TABLE IF EXISTS `matcher_matchpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matcher_matchpoints` (
  `matcher_id` int(11) NOT NULL,
  `matchpoint_id` int(11) NOT NULL,
  KEY `matcher_matchpoints_ifbk_1` (`matcher_id`),
  KEY `matcher_matchpoints_ifbk_2` (`matchpoint_id`),
  CONSTRAINT `matcher_matchpoints_ifbk_1` FOREIGN KEY (`matcher_id`) REFERENCES `marc_matchers` (`matcher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matcher_matchpoints_ifbk_2` FOREIGN KEY (`matchpoint_id`) REFERENCES `matchpoints` (`matchpoint_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matcher_matchpoints`
--

LOCK TABLES `matcher_matchpoints` WRITE;
/*!40000 ALTER TABLE `matcher_matchpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `matcher_matchpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchpoint_component_norms`
--

DROP TABLE IF EXISTS `matchpoint_component_norms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchpoint_component_norms` (
  `matchpoint_component_id` int(11) NOT NULL,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `norm_routine` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  KEY `matchpoint_component_norms` (`matchpoint_component_id`,`sequence`),
  CONSTRAINT `matchpoint_component_norms_ifbk_1` FOREIGN KEY (`matchpoint_component_id`) REFERENCES `matchpoint_components` (`matchpoint_component_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchpoint_component_norms`
--

LOCK TABLES `matchpoint_component_norms` WRITE;
/*!40000 ALTER TABLE `matchpoint_component_norms` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchpoint_component_norms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchpoint_components`
--

DROP TABLE IF EXISTS `matchpoint_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchpoint_components` (
  `matchpoint_id` int(11) NOT NULL,
  `matchpoint_component_id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subfields` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offset` int(4) NOT NULL DEFAULT '0',
  `length` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchpoint_component_id`),
  KEY `by_sequence` (`matchpoint_id`,`sequence`),
  CONSTRAINT `matchpoint_components_ifbk_1` FOREIGN KEY (`matchpoint_id`) REFERENCES `matchpoints` (`matchpoint_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchpoint_components`
--

LOCK TABLES `matchpoint_components` WRITE;
/*!40000 ALTER TABLE `matchpoint_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchpoint_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchpoints`
--

DROP TABLE IF EXISTS `matchpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchpoints` (
  `matcher_id` int(11) NOT NULL,
  `matchpoint_id` int(11) NOT NULL AUTO_INCREMENT,
  `search_index` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchpoint_id`),
  KEY `matchpoints_ifbk_1` (`matcher_id`),
  CONSTRAINT `matchpoints_ifbk_1` FOREIGN KEY (`matcher_id`) REFERENCES `marc_matchers` (`matcher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchpoints`
--

LOCK TABLES `matchpoints` WRITE;
/*!40000 ALTER TABLE `matchpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_attributes`
--

DROP TABLE IF EXISTS `message_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_attributes` (
  `message_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `takes_days` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_attribute_id`),
  UNIQUE KEY `message_name` (`message_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_attributes`
--

LOCK TABLES `message_attributes` WRITE;
/*!40000 ALTER TABLE `message_attributes` DISABLE KEYS */;
INSERT INTO `message_attributes` VALUES (1,'Item_Due',0),(2,'Advance_Notice',1),(4,'Hold_Filled',0),(5,'Item_Check_in',0),(6,'Item_Checkout',0);
/*!40000 ALTER TABLE `message_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_queue`
--

DROP TABLE IF EXISTS `message_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_queue` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `metadata` text COLLATE utf8_unicode_ci,
  `letter_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_transport_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('sent','pending','failed','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `time_queued` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_address` mediumtext COLLATE utf8_unicode_ci,
  `from_address` mediumtext COLLATE utf8_unicode_ci,
  `content_type` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`message_id`),
  KEY `borrowernumber` (`borrowernumber`),
  KEY `message_transport_type` (`message_transport_type`),
  CONSTRAINT `messageq_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messageq_ibfk_2` FOREIGN KEY (`message_transport_type`) REFERENCES `message_transport_types` (`message_transport_type`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_queue`
--

LOCK TABLES `message_queue` WRITE;
/*!40000 ALTER TABLE `message_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_transport_types`
--

DROP TABLE IF EXISTS `message_transport_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_transport_types` (
  `message_transport_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`message_transport_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_transport_types`
--

LOCK TABLES `message_transport_types` WRITE;
/*!40000 ALTER TABLE `message_transport_types` DISABLE KEYS */;
INSERT INTO `message_transport_types` VALUES ('email'),('phone'),('print'),('sms');
/*!40000 ALTER TABLE `message_transport_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_transports`
--

DROP TABLE IF EXISTS `message_transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_transports` (
  `message_attribute_id` int(11) NOT NULL,
  `message_transport_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_digest` tinyint(1) NOT NULL DEFAULT '0',
  `letter_module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `letter_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`message_attribute_id`,`message_transport_type`,`is_digest`),
  KEY `message_transport_type` (`message_transport_type`),
  KEY `letter_module` (`letter_module`,`letter_code`),
  KEY `message_transports_ibfk_3` (`letter_module`,`letter_code`,`branchcode`),
  CONSTRAINT `message_transports_ibfk_1` FOREIGN KEY (`message_attribute_id`) REFERENCES `message_attributes` (`message_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_transports_ibfk_2` FOREIGN KEY (`message_transport_type`) REFERENCES `message_transport_types` (`message_transport_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_transports_ibfk_3` FOREIGN KEY (`letter_module`, `letter_code`, `branchcode`) REFERENCES `letter` (`module`, `code`, `branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_transports`
--

LOCK TABLES `message_transports` WRITE;
/*!40000 ALTER TABLE `message_transports` DISABLE KEYS */;
INSERT INTO `message_transports` VALUES (5,'email',0,'circulation','CHECKIN',''),(5,'sms',0,'circulation','CHECKIN',''),(6,'email',0,'circulation','CHECKOUT',''),(6,'sms',0,'circulation','CHECKOUT',''),(1,'email',0,'circulation','DUE',''),(1,'sms',0,'circulation','DUE',''),(1,'email',1,'circulation','DUEDGST',''),(1,'sms',1,'circulation','DUEDGST',''),(2,'email',0,'circulation','PREDUE',''),(2,'sms',0,'circulation','PREDUE',''),(2,'email',1,'circulation','PREDUEDGST',''),(2,'sms',1,'circulation','PREDUEDGST',''),(4,'email',0,'reserves','HOLD',''),(4,'sms',0,'reserves','HOLD','');
/*!40000 ALTER TABLE `message_transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `message_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `messages_ibfk_1` (`manager_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_files`
--

DROP TABLE IF EXISTS `misc_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_content` longblob NOT NULL,
  `date_uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_id`),
  KEY `table_tag` (`table_tag`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_files`
--

LOCK TABLES `misc_files` WRITE;
/*!40000 ALTER TABLE `misc_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `misc_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `need_merge_authorities`
--

DROP TABLE IF EXISTS `need_merge_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `need_merge_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authid` bigint(20) NOT NULL,
  `done` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `need_merge_authorities`
--

LOCK TABLES `need_merge_authorities` WRITE;
/*!40000 ALTER TABLE `need_merge_authorities` DISABLE KEYS */;
/*!40000 ALTER TABLE `need_merge_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifys`
--

DROP TABLE IF EXISTS `notifys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifys` (
  `notify_id` int(11) NOT NULL DEFAULT '0',
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `itemnumber` int(11) NOT NULL DEFAULT '0',
  `notify_date` date DEFAULT NULL,
  `notify_send_date` date DEFAULT NULL,
  `notify_level` int(1) NOT NULL DEFAULT '0',
  `method` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifys`
--

LOCK TABLES `notifys` WRITE;
/*!40000 ALTER TABLE `notifys` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_sets`
--

DROP TABLE IF EXISTS `oai_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spec` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_sets`
--

LOCK TABLES `oai_sets` WRITE;
/*!40000 ALTER TABLE `oai_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_sets_biblios`
--

DROP TABLE IF EXISTS `oai_sets_biblios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_sets_biblios` (
  `biblionumber` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  PRIMARY KEY (`biblionumber`,`set_id`),
  KEY `oai_sets_biblios_ibfk_2` (`set_id`),
  CONSTRAINT `oai_sets_biblios_ibfk_2` FOREIGN KEY (`set_id`) REFERENCES `oai_sets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_sets_biblios`
--

LOCK TABLES `oai_sets_biblios` WRITE;
/*!40000 ALTER TABLE `oai_sets_biblios` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_sets_biblios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_sets_descriptions`
--

DROP TABLE IF EXISTS `oai_sets_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_sets_descriptions` (
  `set_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  KEY `oai_sets_descriptions_ibfk_1` (`set_id`),
  CONSTRAINT `oai_sets_descriptions_ibfk_1` FOREIGN KEY (`set_id`) REFERENCES `oai_sets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_sets_descriptions`
--

LOCK TABLES `oai_sets_descriptions` WRITE;
/*!40000 ALTER TABLE `oai_sets_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_sets_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_sets_mappings`
--

DROP TABLE IF EXISTS `oai_sets_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_sets_mappings` (
  `set_id` int(11) NOT NULL,
  `marcfield` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `marcsubfield` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `operator` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'equal',
  `marcvalue` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  KEY `oai_sets_mappings_ibfk_1` (`set_id`),
  CONSTRAINT `oai_sets_mappings_ibfk_1` FOREIGN KEY (`set_id`) REFERENCES `oai_sets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_sets_mappings`
--

LOCK TABLES `oai_sets_mappings` WRITE;
/*!40000 ALTER TABLE `oai_sets_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_sets_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_issues`
--

DROP TABLE IF EXISTS `old_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_issues` (
  `issue_id` int(11) NOT NULL,
  `borrowernumber` int(11) DEFAULT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `returndate` datetime DEFAULT NULL,
  `lastreneweddate` datetime DEFAULT NULL,
  `return` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `renewals` tinyint(4) DEFAULT NULL,
  `auto_renew` tinyint(1) DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `issuedate` datetime DEFAULT NULL,
  `onsite_checkout` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`issue_id`),
  KEY `old_issuesborridx` (`borrowernumber`),
  KEY `old_issuesitemidx` (`itemnumber`),
  KEY `branchcode_idx` (`branchcode`),
  KEY `old_bordate` (`borrowernumber`,`timestamp`),
  CONSTRAINT `old_issues_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `old_issues_ibfk_2` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_issues`
--

LOCK TABLES `old_issues` WRITE;
/*!40000 ALTER TABLE `old_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `old_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_reserves`
--

DROP TABLE IF EXISTS `old_reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_reserves` (
  `reserve_id` int(11) NOT NULL,
  `borrowernumber` int(11) DEFAULT NULL,
  `reservedate` date DEFAULT NULL,
  `biblionumber` int(11) DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificationdate` date DEFAULT NULL,
  `reminderdate` date DEFAULT NULL,
  `cancellationdate` date DEFAULT NULL,
  `reservenotes` mediumtext COLLATE utf8_unicode_ci,
  `priority` smallint(6) DEFAULT NULL,
  `found` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `itemnumber` int(11) DEFAULT NULL,
  `waitingdate` date DEFAULT NULL,
  `expirationdate` date DEFAULT NULL,
  `lowestPriority` tinyint(1) NOT NULL,
  `suspend` tinyint(1) NOT NULL DEFAULT '0',
  `suspend_until` datetime DEFAULT NULL,
  `itemtype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reserve_id`),
  KEY `old_reserves_borrowernumber` (`borrowernumber`),
  KEY `old_reserves_biblionumber` (`biblionumber`),
  KEY `old_reserves_itemnumber` (`itemnumber`),
  KEY `old_reserves_branchcode` (`branchcode`),
  KEY `old_reserves_itemtype` (`itemtype`),
  CONSTRAINT `old_reserves_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `old_reserves_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `old_reserves_ibfk_3` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `old_reserves_ibfk_4` FOREIGN KEY (`itemtype`) REFERENCES `itemtypes` (`itemtype`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_reserves`
--

LOCK TABLES `old_reserves` WRITE;
/*!40000 ALTER TABLE `old_reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `old_reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opac_news`
--

DROP TABLE IF EXISTS `opac_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opac_news` (
  `idnew` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `new` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expirationdate` date DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `borrowernumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`idnew`),
  KEY `borrowernumber_fk` (`borrowernumber`),
  KEY `opac_news_branchcode_ibfk` (`branchcode`),
  CONSTRAINT `borrowernumber_fk` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `opac_news_branchcode_ibfk` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opac_news`
--

LOCK TABLES `opac_news` WRITE;
/*!40000 ALTER TABLE `opac_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `opac_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overduerules`
--

DROP TABLE IF EXISTS `overduerules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overduerules` (
  `overduerules_id` int(11) NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categorycode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` int(4) DEFAULT NULL,
  `letter1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debarred1` varchar(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `delay2` int(4) DEFAULT NULL,
  `debarred2` varchar(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `letter2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delay3` int(4) DEFAULT NULL,
  `letter3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debarred3` int(1) DEFAULT '0',
  PRIMARY KEY (`overduerules_id`),
  UNIQUE KEY `overduerules_branch_cat` (`branchcode`,`categorycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overduerules`
--

LOCK TABLES `overduerules` WRITE;
/*!40000 ALTER TABLE `overduerules` DISABLE KEYS */;
/*!40000 ALTER TABLE `overduerules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overduerules_transport_types`
--

DROP TABLE IF EXISTS `overduerules_transport_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overduerules_transport_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letternumber` int(1) NOT NULL DEFAULT '1',
  `message_transport_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `overduerules_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `overduerules_fk` (`overduerules_id`),
  KEY `mtt_fk` (`message_transport_type`),
  CONSTRAINT `mtt_fk` FOREIGN KEY (`message_transport_type`) REFERENCES `message_transport_types` (`message_transport_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `overduerules_fk` FOREIGN KEY (`overduerules_id`) REFERENCES `overduerules` (`overduerules_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overduerules_transport_types`
--

LOCK TABLES `overduerules_transport_types` WRITE;
/*!40000 ALTER TABLE `overduerules_transport_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `overduerules_transport_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patron_list_patrons`
--

DROP TABLE IF EXISTS `patron_list_patrons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patron_list_patrons` (
  `patron_list_patron_id` int(11) NOT NULL AUTO_INCREMENT,
  `patron_list_id` int(11) NOT NULL,
  `borrowernumber` int(11) NOT NULL,
  PRIMARY KEY (`patron_list_patron_id`),
  KEY `patron_list_id` (`patron_list_id`),
  KEY `borrowernumber` (`borrowernumber`),
  CONSTRAINT `patron_list_patrons_ibfk_1` FOREIGN KEY (`patron_list_id`) REFERENCES `patron_lists` (`patron_list_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patron_list_patrons_ibfk_2` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patron_list_patrons`
--

LOCK TABLES `patron_list_patrons` WRITE;
/*!40000 ALTER TABLE `patron_list_patrons` DISABLE KEYS */;
/*!40000 ALTER TABLE `patron_list_patrons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patron_lists`
--

DROP TABLE IF EXISTS `patron_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patron_lists` (
  `patron_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `owner` int(11) NOT NULL,
  PRIMARY KEY (`patron_list_id`),
  KEY `owner` (`owner`),
  CONSTRAINT `patron_lists_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patron_lists`
--

LOCK TABLES `patron_lists` WRITE;
/*!40000 ALTER TABLE `patron_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `patron_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patronimage`
--

DROP TABLE IF EXISTS `patronimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patronimage` (
  `borrowernumber` int(11) NOT NULL,
  `mimetype` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `imagefile` mediumblob NOT NULL,
  PRIMARY KEY (`borrowernumber`),
  CONSTRAINT `patronimage_fk1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patronimage`
--

LOCK TABLES `patronimage` WRITE;
/*!40000 ALTER TABLE `patronimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `patronimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_offline_operations`
--

DROP TABLE IF EXISTS `pending_offline_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_offline_operations` (
  `operationid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `barcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cardnumber` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(28,6) DEFAULT NULL,
  PRIMARY KEY (`operationid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_offline_operations`
--

LOCK TABLES `pending_offline_operations` WRITE;
/*!40000 ALTER TABLE `pending_offline_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_offline_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `module_bit` int(11) NOT NULL DEFAULT '0',
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`module_bit`,`code`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`module_bit`) REFERENCES `userflags` (`bit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'circulate_remaining_permissions','Remaining circulation permissions'),(1,'force_checkout','Force checkout if a limitation exists'),(1,'manage_restrictions','Manage restrictions for accounts'),(1,'overdues_report','Execute overdue items report'),(1,'override_renewals','Override blocked renewals'),(1,'self_checkout','Perform self checkout at the OPAC. It should be used for the patron matching the AutoSelfCheckID'),(3,'manage_circ_rules','Manage circulation rules'),(3,'parameters_remaining_permissions','Remaining system parameters permissions'),(6,'modify_holds_priority','Modify holds priority'),(6,'place_holds','Place holds for patrons'),(9,'delete_all_items','Delete all items at once'),(9,'edit_catalogue','Edit catalog (Modify bibliographic/holdings data)'),(9,'edit_items','Edit items'),(9,'edit_items_restricted','Limit item modification to subfields defined in the SubfieldsToAllowForRestrictedEditing preference (please note that edit_item is still required)'),(9,'fast_cataloging','Fast cataloging'),(10,'remaining_permissions','Remaining permissions for managing fines and fees'),(10,'writeoff','Write off fines and fees'),(11,'budget_add_del','Add and delete budgets (but can\'t modify budgets)'),(11,'budget_manage','Manage budgets'),(11,'budget_manage_all','Manage all budgets'),(11,'budget_modify','Modify budget (can\'t create lines, but can modify existing ones)'),(11,'contracts_manage','Manage contracts'),(11,'edi_manage','Manage EDIFACT transmissions'),(11,'group_manage','Manage orders & basketgroups'),(11,'order_manage','Manage orders & basket'),(11,'order_manage_all','Manage all orders and baskets, regardless of restrictions on them'),(11,'order_receive','Manage orders & basket'),(11,'period_manage','Manage periods'),(11,'planning_manage','Manage budget plannings'),(11,'vendors_manage','Manage vendors'),(13,'batch_upload_patron_images','Upload patron images in a batch or one at a time'),(13,'delete_anonymize_patrons','Delete old borrowers and anonymize circulation history (deletes borrower reading history)'),(13,'edit_calendar','Define days when the library is closed'),(13,'edit_news','Write news for the OPAC and staff interfaces'),(13,'edit_notice_status_triggers','Set notice/status triggers for overdue items'),(13,'edit_notices','Define notices'),(13,'edit_patrons','Perform batch modification of patrons'),(13,'edit_quotes','Edit quotes for quote-of-the-day feature'),(13,'export_catalog','Export bibliographic and holdings data'),(13,'import_patrons','Import patron data'),(13,'inventory','Perform inventory (stocktaking) of your catalog'),(13,'items_batchdel','Perform batch deletion of items'),(13,'items_batchmod','Perform batch modification of items'),(13,'items_batchmod_restricted','Limit batch item modification to subfields defined in the SubfieldsToAllowForRestrictedBatchmod preference (please note that items_batchmod is still required)'),(13,'label_creator','Create printable labels and barcodes from catalog and patron data'),(13,'manage_csv_profiles','Manage CSV export profiles'),(13,'manage_patron_lists','Add, edit and delete patron lists and their contents'),(13,'manage_staged_marc','Manage staged MARC records, including completing and reversing imports'),(13,'marc_modification_templates','Manage marc modification templates'),(13,'moderate_comments','Moderate patron comments'),(13,'moderate_tags','Moderate patron tags'),(13,'records_batchdel','Perform batch deletion of records (bibliographic or authority)'),(13,'records_batchmod','Perform batch modification of records (biblios or authorities)'),(13,'rotating_collections','Manage rotating collections'),(13,'schedule_tasks','Schedule tasks to run'),(13,'stage_marc_import','Stage MARC records into the reservoir'),(13,'upload_general_files','Upload any file'),(13,'upload_local_cover_images','Upload local cover images'),(13,'upload_manage','Manage uploaded files'),(13,'view_system_logs','Browse the system logs'),(15,'check_expiration','Check the expiration of a serial'),(15,'claim_serials','Claim missing serials'),(15,'create_subscription','Create a new subscription'),(15,'delete_subscription','Delete an existing subscription'),(15,'edit_subscription','Edit an existing subscription'),(15,'receive_serials','Serials receiving'),(15,'renew_subscription','Renew a subscription'),(15,'routing','Routing'),(15,'superserials','Manage subscriptions from any branch (only applies when IndependentBranches is used)'),(16,'create_reports','Create SQL reports'),(16,'delete_reports','Delete SQL reports'),(16,'execute_reports','Execute SQL reports'),(18,'add_reserves','Add course reserves'),(18,'delete_reserves','Remove course reserves'),(18,'manage_courses','Add, edit and delete courses'),(19,'configure','Configure plugins'),(19,'manage','Manage plugins ( install / uninstall )'),(19,'report','Use report plugins'),(19,'tool','Use tool plugins'),(20,'delete_public_lists','Delete public lists');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_data`
--

DROP TABLE IF EXISTS `plugin_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_data` (
  `plugin_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`plugin_class`,`plugin_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_data`
--

LOCK TABLES `plugin_data` WRITE;
/*!40000 ALTER TABLE `plugin_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printers` (
  `printername` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `printqueue` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `printtype` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`printername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

LOCK TABLES `printers` WRITE;
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printers_profile`
--

DROP TABLE IF EXISTS `printers_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printers_profile` (
  `profile_id` int(4) NOT NULL AUTO_INCREMENT,
  `printer_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default Printer',
  `template_id` int(4) NOT NULL DEFAULT '0',
  `paper_bin` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Bypass',
  `offset_horz` float NOT NULL DEFAULT '0',
  `offset_vert` float NOT NULL DEFAULT '0',
  `creep_horz` float NOT NULL DEFAULT '0',
  `creep_vert` float NOT NULL DEFAULT '0',
  `units` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'POINT',
  `creator` char(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Labels',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `printername` (`printer_name`,`template_id`,`paper_bin`,`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers_profile`
--

LOCK TABLES `printers_profile` WRITE;
/*!40000 ALTER TABLE `printers_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `printers_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` text COLLATE utf8_unicode_ci,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `borrowernumber` int(11) NOT NULL,
  `biblionumber` int(11) NOT NULL,
  `rating_value` tinyint(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`borrowernumber`,`biblionumber`),
  KEY `ratings_ibfk_2` (`biblionumber`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_lost_item_fee_rules`
--

DROP TABLE IF EXISTS `refund_lost_item_fee_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_lost_item_fee_rules` (
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `refund` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_lost_item_fee_rules`
--

LOCK TABLES `refund_lost_item_fee_rules` WRITE;
/*!40000 ALTER TABLE `refund_lost_item_fee_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_lost_item_fee_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repeatable_holidays`
--

DROP TABLE IF EXISTS `repeatable_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repeatable_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weekday` smallint(6) DEFAULT NULL,
  `day` smallint(6) DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repeatable_holidays`
--

LOCK TABLES `repeatable_holidays` WRITE;
/*!40000 ALTER TABLE `repeatable_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `repeatable_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_dictionary`
--

DROP TABLE IF EXISTS `reports_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `saved_sql` text COLLATE utf8_unicode_ci,
  `report_area` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dictionary_area_idx` (`report_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_dictionary`
--

LOCK TABLES `reports_dictionary` WRITE;
/*!40000 ALTER TABLE `reports_dictionary` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserves`
--

DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserves` (
  `reserve_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `reservedate` date DEFAULT NULL,
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificationdate` date DEFAULT NULL,
  `reminderdate` date DEFAULT NULL,
  `cancellationdate` date DEFAULT NULL,
  `reservenotes` mediumtext COLLATE utf8_unicode_ci,
  `priority` smallint(6) DEFAULT NULL,
  `found` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `itemnumber` int(11) DEFAULT NULL,
  `waitingdate` date DEFAULT NULL,
  `expirationdate` date DEFAULT NULL,
  `lowestPriority` tinyint(1) NOT NULL,
  `suspend` tinyint(1) NOT NULL DEFAULT '0',
  `suspend_until` datetime DEFAULT NULL,
  `itemtype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reserve_id`),
  KEY `priorityfoundidx` (`priority`,`found`),
  KEY `borrowernumber` (`borrowernumber`),
  KEY `biblionumber` (`biblionumber`),
  KEY `itemnumber` (`itemnumber`),
  KEY `branchcode` (`branchcode`),
  KEY `itemtype` (`itemtype`),
  CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserves_ibfk_3` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserves_ibfk_4` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserves_ibfk_5` FOREIGN KEY (`itemtype`) REFERENCES `itemtypes` (`itemtype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserves`
--

LOCK TABLES `reserves` WRITE;
/*!40000 ALTER TABLE `reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `reviewid` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `biblionumber` int(11) DEFAULT NULL,
  `review` text COLLATE utf8_unicode_ci,
  `approved` tinyint(4) DEFAULT '0',
  `datereviewed` datetime DEFAULT NULL,
  PRIMARY KEY (`reviewid`),
  KEY `reviews_ibfk_1` (`borrowernumber`),
  KEY `reviews_ibfk_2` (`biblionumber`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_reports`
--

DROP TABLE IF EXISTS `saved_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `report` longtext COLLATE utf8_unicode_ci,
  `date_run` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_reports`
--

LOCK TABLES `saved_reports` WRITE;
/*!40000 ALTER TABLE `saved_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_sql`
--

DROP TABLE IF EXISTS `saved_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `savedsql` text COLLATE utf8_unicode_ci,
  `last_run` datetime DEFAULT NULL,
  `report_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `cache_expiry` int(11) NOT NULL DEFAULT '300',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `report_area` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `report_group` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `report_subgroup` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sql_area_group_idx` (`report_group`,`report_subgroup`),
  KEY `boridx` (`borrowernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_sql`
--

LOCK TABLES `saved_sql` WRITE;
/*!40000 ALTER TABLE `saved_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_field`
--

DROP TABLE IF EXISTS `search_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'the name of the field as it will be stored in the search engine',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'the human readable name of the field, for display',
  `type` enum('string','date','number','boolean','sum') COLLATE utf8_unicode_ci NOT NULL COMMENT 'what type of data this holds, relevant when storing it in the search engine',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_field`
--

LOCK TABLES `search_field` WRITE;
/*!40000 ALTER TABLE `search_field` DISABLE KEYS */;
INSERT INTO `search_field` VALUES (1,'publisher','publisher','string'),(2,'date-entered-on-file','date-entered-on-file',''),(3,'acqdate','acqdate','date'),(4,'issues','issues','sum'),(5,'isbn','isbn',''),(6,'itemnumber','itemnumber','number'),(7,'pubdate','pubdate',''),(8,'subject','subject','string'),(9,'number-db','number-db',''),(10,'se','se','string'),(11,'location','Location',''),(12,'lc-cardnumber','lc-cardnumber',''),(13,'pl','pl',''),(14,'number-legal-deposit','number-legal-deposit',''),(15,'ff7-02','ff7-02',''),(16,'copydate','copydate','date'),(17,'llength','llength',''),(18,'holdingbranch','HoldingLibrary','string'),(19,'su-geo','su-geo','string'),(20,'an','an','number'),(21,'Local-number','Local-number','string'),(22,'onloan','onloan','boolean'),(23,'ff7-00','ff7-00',''),(24,'local-classification','local-classification',''),(25,'ta','ta',''),(26,'number-natl-biblio','number-natl-biblio',''),(27,'ff8-23','ff8-23',''),(28,'notforloan','notforloan','number'),(29,'rtype','rtype',''),(30,'bio','bio',''),(31,'place','place','string'),(32,'identifier-standard','identifier-standard',''),(33,'bnb-card-number','bnb-card-number',''),(34,'bib-level','bib-level',''),(35,'Host-Item-Number','Host-Item-Number','number'),(36,'material-type','material-type',''),(37,'record-source','record-source',''),(38,'ctype','ctype',''),(39,'lf','lf',''),(40,'bgf-number','bgf-number',''),(41,'ff7-01-02','ff7-01-02',''),(42,'control-number','control-number',''),(43,'author','author','string'),(44,'issn','issn',''),(45,'title','title','string'),(46,'itype','itype','string'),(47,'microform-generation','microform-generation',''),(48,'ln','ln',''),(49,'ff7-01','ff7-01',''),(50,'date-time-last-modified','date-time-last-modified',''),(51,'ff8-29','ff8-29',''),(52,'homebranch','HomeLibrary','string'),(53,'Meeting-name-see-also-from','Meeting-name-see-also-from',''),(54,'authtype','authtype',''),(55,'Heading-use-series-added-entry','Heading-use-series-added-entry',''),(56,'Match','Match',''),(57,'Match-heading','Match-heading',''),(58,'Heading-Main','Heading-Main',''),(59,'Descriptive-cataloging-rules','Descriptive-cataloging-rules',''),(60,'Kind-of-record','Kind-of-record',''),(61,'Corporate-name-see-also-from','Corporate-name-see-also-from',''),(62,'Personal-name-see-also-from','Personal-name-see-also-from',''),(63,'See-also-from','See-also-from',''),(64,'Heading-use-subject-added-entry','Heading-use-subject-added-entry',''),(65,'LC-card-number','LC-card-number',''),(66,'Heading','Heading',''),(67,'Meeting-name','Meeting-name',''),(68,'Meeting-name-see-from','Meeting-name-see-from',''),(69,'Meeting-name-heading','Meeting-name-heading',''),(70,'Personal-name-see-from','Personal-name-see-from',''),(71,'Personal-name','Personal-name',''),(72,'Personal-name-heading','Personal-name-heading',''),(73,'Match-heading-see-from','Match-heading-see-from',''),(74,'Corporate-name-see-from','Corporate-name-see-from',''),(75,'Subject-heading-thesaurus','Subject-heading-thesaurus',''),(76,'Heading-use-main-or-added-entry','Heading-use-main-or-added-entry',''),(77,'See-from','See-from','');
/*!40000 ALTER TABLE `search_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_history`
--

DROP TABLE IF EXISTS `search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `sessionid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `query_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query_cgi` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'biblio',
  `total` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `sessionid` (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Opac search history results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_history`
--

LOCK TABLES `search_history` WRITE;
/*!40000 ALTER TABLE `search_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_marc_map`
--

DROP TABLE IF EXISTS `search_marc_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_marc_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_name` enum('biblios','authorities') COLLATE utf8_unicode_ci NOT NULL COMMENT 'what storage index this map is for',
  `marc_type` enum('marc21','unimarc','normarc') COLLATE utf8_unicode_ci NOT NULL COMMENT 'what MARC type this map is for',
  `marc_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'the MARC specifier for this field',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`index_name`,`marc_field`,`marc_type`),
  KEY `index_name_2` (`index_name`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_marc_map`
--

LOCK TABLES `search_marc_map` WRITE;
/*!40000 ALTER TABLE `search_marc_map` DISABLE KEYS */;
INSERT INTO `search_marc_map` VALUES (247,'biblios','marc21','001'),(200,'biblios','unimarc','001'),(248,'biblios','normarc','001'),(366,'biblios','marc21','005'),(235,'biblios','marc21','007'),(236,'biblios','normarc','007'),(204,'biblios','marc21','007_/1'),(205,'biblios','normarc','007_/1'),(245,'biblios','marc21','007_/1-2'),(246,'biblios','normarc','007_/1-2'),(359,'biblios','marc21','007_/11'),(360,'biblios','normarc','007_/11'),(364,'biblios','marc21','007_/2'),(365,'biblios','normarc','007_/2'),(82,'biblios','marc21','007_/3'),(83,'biblios','normarc','007_/3'),(4,'biblios','marc21','008_/1-5'),(5,'biblios','normarc','008_/1-5'),(79,'biblios','marc21','008_/15-17'),(80,'biblios','normarc','008_/15-17'),(210,'biblios','marc21','008_/22'),(211,'biblios','normarc','008_/22'),(213,'biblios','marc21','008_/23'),(214,'biblios','normarc','008_/23'),(239,'biblios','marc21','008_/24-27'),(240,'biblios','normarc','008_/24-27'),(368,'biblios','marc21','008_/29'),(369,'biblios','normarc','008_/29'),(242,'biblios','marc21','008_/33'),(243,'biblios','normarc','008_/33'),(220,'biblios','marc21','008_/34'),(221,'biblios','normarc','008_/34'),(361,'biblios','marc21','008_/35-37'),(362,'biblios','normarc','008_/35-37'),(237,'biblios','marc21','008_/39'),(238,'biblios','normarc','008_/39'),(18,'biblios','marc21','008_/7-10'),(19,'biblios','normarc','008_/7-10'),(75,'biblios','marc21','010'),(77,'biblios','normarc','010'),(14,'biblios','unimarc','010az'),(76,'biblios','marc21','011'),(229,'biblios','unimarc','011ayz'),(65,'biblios','marc21','015'),(66,'biblios','normarc','015'),(81,'biblios','marc21','017'),(226,'biblios','marc21','018'),(12,'biblios','marc21','020a'),(13,'biblios','normarc','020a'),(227,'biblios','marc21','022a'),(228,'biblios','normarc','022a'),(6,'biblios','unimarc','099c'),(367,'biblios','unimarc','099d'),(94,'biblios','marc21','1009'),(125,'biblios','normarc','1009'),(249,'biblios','marc21','100a'),(254,'biblios','normarc','100a'),(212,'biblios','unimarc','100a_/17'),(20,'biblios','unimarc','100a_/9-12'),(363,'biblios','unimarc','101a'),(244,'biblios','unimarc','105a_/11'),(222,'biblios','unimarc','105a_/12'),(241,'biblios','unimarc','105a_/4-7'),(370,'biblios','unimarc','105a_/8'),(95,'biblios','marc21','1109'),(126,'biblios','normarc','1109'),(250,'biblios','marc21','110a'),(255,'biblios','normarc','110a'),(96,'biblios','marc21','1119'),(127,'biblios','normarc','1119'),(251,'biblios','marc21','111a'),(256,'biblios','normarc','111a'),(263,'biblios','marc21','130'),(281,'biblios','normarc','130'),(97,'biblios','marc21','1309'),(128,'biblios','normarc','1309'),(295,'biblios','unimarc','200a'),(357,'biblios','unimarc','200b'),(296,'biblios','unimarc','200c'),(297,'biblios','unimarc','200d'),(298,'biblios','unimarc','200e'),(259,'biblios','unimarc','200f'),(260,'biblios','unimarc','200g'),(299,'biblios','unimarc','200h'),(300,'biblios','unimarc','200i'),(301,'biblios','unimarc','205'),(264,'biblios','marc21','210'),(282,'biblios','normarc','210'),(225,'biblios','unimarc','210a'),(3,'biblios','unimarc','210c'),(265,'biblios','marc21','211'),(266,'biblios','marc21','212'),(267,'biblios','marc21','214'),(268,'biblios','marc21','222'),(283,'biblios','normarc','222'),(71,'biblios','unimarc','225a'),(269,'biblios','marc21','240'),(284,'biblios','normarc','240'),(98,'biblios','marc21','2459'),(129,'biblios','normarc','2459'),(270,'biblios','marc21','245a'),(285,'biblios','normarc','245a'),(252,'biblios','marc21','245c'),(257,'biblios','normarc','245c'),(271,'biblios','marc21','246'),(286,'biblios','normarc','246'),(272,'biblios','marc21','247'),(287,'biblios','normarc','247'),(223,'biblios','marc21','260a'),(224,'biblios','normarc','260a'),(1,'biblios','marc21','260b'),(2,'biblios','normarc','260b'),(84,'biblios','marc21','260c'),(85,'biblios','normarc','260c'),(302,'biblios','unimarc','304a'),(303,'biblios','unimarc','327a'),(304,'biblios','unimarc','327b'),(305,'biblios','unimarc','327c'),(306,'biblios','unimarc','327d'),(307,'biblios','unimarc','327e'),(308,'biblios','unimarc','327f'),(309,'biblios','unimarc','327g'),(310,'biblios','unimarc','327h'),(311,'biblios','unimarc','327i'),(312,'biblios','unimarc','328t'),(99,'biblios','marc21','4009'),(100,'biblios','marc21','4109'),(313,'biblios','unimarc','410t'),(314,'biblios','unimarc','411t'),(315,'biblios','unimarc','412t'),(316,'biblios','unimarc','413t'),(317,'biblios','unimarc','421t'),(318,'biblios','unimarc','422t'),(319,'biblios','unimarc','423t'),(320,'biblios','unimarc','424t'),(321,'biblios','unimarc','425t'),(322,'biblios','unimarc','430t'),(323,'biblios','unimarc','431t'),(324,'biblios','unimarc','432t'),(325,'biblios','unimarc','433t'),(326,'biblios','unimarc','434t'),(327,'biblios','unimarc','435t'),(328,'biblios','unimarc','436t'),(329,'biblios','unimarc','437t'),(101,'biblios','marc21','4409'),(130,'biblios','normarc','4409'),(67,'biblios','marc21','440a'),(69,'biblios','normarc','440a'),(330,'biblios','unimarc','440t'),(331,'biblios','unimarc','441t'),(332,'biblios','unimarc','442t'),(333,'biblios','unimarc','443t'),(334,'biblios','unimarc','444t'),(335,'biblios','unimarc','445t'),(336,'biblios','unimarc','446t'),(337,'biblios','unimarc','447t'),(338,'biblios','unimarc','448t'),(339,'biblios','unimarc','451t'),(340,'biblios','unimarc','452t'),(341,'biblios','unimarc','453t'),(342,'biblios','unimarc','454t'),(343,'biblios','unimarc','455t'),(344,'biblios','unimarc','456t'),(234,'biblios','unimarc','4619'),(345,'biblios','unimarc','461t'),(346,'biblios','unimarc','462t'),(347,'biblios','unimarc','463t'),(348,'biblios','unimarc','464t'),(349,'biblios','unimarc','470t'),(350,'biblios','unimarc','481t'),(351,'biblios','unimarc','482t'),(352,'biblios','unimarc','488t'),(102,'biblios','marc21','4909'),(131,'biblios','normarc','4909'),(68,'biblios','marc21','490a'),(70,'biblios','normarc','490a'),(153,'biblios','unimarc','5009'),(154,'biblios','unimarc','5019'),(155,'biblios','unimarc','5039'),(273,'biblios','marc21','505t'),(156,'biblios','unimarc','5109'),(157,'biblios','unimarc','5129'),(158,'biblios','unimarc','5139'),(159,'biblios','unimarc','5149'),(160,'biblios','unimarc','5159'),(161,'biblios','unimarc','5169'),(162,'biblios','unimarc','5179'),(163,'biblios','unimarc','5189'),(164,'biblios','unimarc','5199'),(165,'biblios','unimarc','5209'),(166,'biblios','unimarc','5309'),(167,'biblios','unimarc','5319'),(168,'biblios','unimarc','5329'),(169,'biblios','unimarc','5409'),(170,'biblios','unimarc','5419'),(171,'biblios','unimarc','5459'),(172,'biblios','unimarc','5609'),(55,'biblios','unimarc','600'),(103,'biblios','marc21','6009'),(173,'biblios','unimarc','6009'),(132,'biblios','normarc','6009'),(21,'biblios','marc21','600a'),(56,'biblios','unimarc','600a'),(38,'biblios','normarc','600a'),(22,'biblios','marc21','600t'),(39,'biblios','normarc','600t'),(57,'biblios','unimarc','601'),(174,'biblios','unimarc','6019'),(58,'biblios','unimarc','602'),(175,'biblios','unimarc','6029'),(59,'biblios','unimarc','604'),(176,'biblios','unimarc','6049'),(60,'biblios','unimarc','605'),(177,'biblios','unimarc','6059'),(61,'biblios','unimarc','606'),(178,'biblios','unimarc','6069'),(62,'biblios','unimarc','607'),(179,'biblios','unimarc','6079'),(93,'biblios','unimarc','607a'),(63,'biblios','unimarc','608'),(180,'biblios','unimarc','6089'),(64,'biblios','unimarc','610'),(104,'biblios','marc21','6109'),(181,'biblios','unimarc','6109'),(133,'biblios','normarc','6109'),(23,'biblios','marc21','610a'),(40,'biblios','normarc','610a'),(24,'biblios','marc21','610t'),(41,'biblios','normarc','610t'),(25,'biblios','marc21','611'),(42,'biblios','normarc','611'),(105,'biblios','marc21','6119'),(134,'biblios','normarc','6119'),(182,'biblios','unimarc','6159'),(183,'biblios','unimarc','6169'),(184,'biblios','unimarc','6179'),(185,'biblios','unimarc','6209'),(186,'biblios','unimarc','6219'),(106,'biblios','marc21','6309'),(135,'biblios','normarc','6309'),(26,'biblios','marc21','630n'),(43,'biblios','normarc','630n'),(27,'biblios','marc21','630r'),(44,'biblios','normarc','630r'),(107,'biblios','marc21','6509'),(136,'biblios','normarc','6509'),(28,'biblios','marc21','650a'),(45,'biblios','normarc','650a'),(29,'biblios','marc21','650b'),(46,'biblios','normarc','650b'),(30,'biblios','marc21','650c'),(47,'biblios','normarc','650c'),(31,'biblios','marc21','650d'),(48,'biblios','normarc','650d'),(32,'biblios','marc21','650v'),(49,'biblios','normarc','650v'),(33,'biblios','marc21','650x'),(50,'biblios','normarc','650x'),(34,'biblios','marc21','650y'),(51,'biblios','normarc','650y'),(35,'biblios','marc21','650z'),(52,'biblios','normarc','650z'),(36,'biblios','marc21','651'),(53,'biblios','normarc','651'),(108,'biblios','marc21','6519'),(137,'biblios','normarc','6519'),(91,'biblios','marc21','651a'),(92,'biblios','normarc','651a'),(109,'biblios','marc21','6529'),(138,'biblios','normarc','6529'),(54,'biblios','normarc','653'),(110,'biblios','marc21','6539'),(139,'biblios','normarc','6539'),(37,'biblios','marc21','653a'),(111,'biblios','marc21','6549'),(140,'biblios','normarc','6549'),(112,'biblios','marc21','6559'),(141,'biblios','normarc','6559'),(113,'biblios','marc21','6569'),(142,'biblios','normarc','6569'),(114,'biblios','marc21','6579'),(143,'biblios','normarc','6579'),(208,'biblios','unimarc','686'),(115,'biblios','marc21','6909'),(144,'biblios','normarc','6909'),(116,'biblios','marc21','7009'),(187,'biblios','unimarc','7009'),(145,'biblios','normarc','7009'),(253,'biblios','marc21','700a'),(261,'biblios','unimarc','700a'),(258,'biblios','normarc','700a'),(274,'biblios','marc21','700t'),(288,'biblios','normarc','700t'),(262,'biblios','unimarc','701'),(188,'biblios','unimarc','7019'),(189,'biblios','unimarc','7029'),(117,'biblios','marc21','7109'),(190,'biblios','unimarc','7109'),(146,'biblios','normarc','7109'),(275,'biblios','marc21','710t'),(289,'biblios','normarc','710t'),(118,'biblios','marc21','7119'),(191,'biblios','unimarc','7119'),(147,'biblios','normarc','7119'),(276,'biblios','marc21','711t'),(290,'biblios','normarc','711t'),(192,'biblios','unimarc','7129'),(193,'biblios','unimarc','7169'),(194,'biblios','unimarc','7209'),(195,'biblios','unimarc','7219'),(196,'biblios','unimarc','7229'),(277,'biblios','marc21','730'),(291,'biblios','normarc','730'),(119,'biblios','marc21','7309'),(197,'biblios','unimarc','7309'),(148,'biblios','normarc','7309'),(278,'biblios','marc21','740'),(292,'biblios','normarc','740'),(120,'biblios','marc21','7519'),(232,'biblios','marc21','7739'),(233,'biblios','normarc','7739'),(279,'biblios','marc21','780'),(293,'biblios','normarc','780'),(280,'biblios','marc21','785'),(294,'biblios','normarc','785'),(121,'biblios','marc21','8009'),(149,'biblios','normarc','8009'),(122,'biblios','marc21','8109'),(150,'biblios','normarc','8109'),(123,'biblios','marc21','8119'),(151,'biblios','normarc','8119'),(124,'biblios','marc21','8309'),(152,'biblios','normarc','8309'),(353,'biblios','marc21','942c'),(355,'biblios','normarc','942c'),(215,'biblios','marc21','9527'),(216,'biblios','normarc','9527'),(15,'biblios','marc21','9529'),(16,'biblios','normarc','9529'),(371,'biblios','marc21','952a'),(372,'biblios','normarc','952a'),(88,'biblios','marc21','952b'),(89,'biblios','normarc','952b'),(72,'biblios','marc21','952c'),(73,'biblios','normarc','952c'),(7,'biblios','marc21','952d'),(8,'biblios','normarc','952d'),(10,'biblios','marc21','952l'),(11,'biblios','normarc','952l'),(206,'biblios','marc21','952o'),(207,'biblios','normarc','952o'),(201,'biblios','marc21','952q'),(202,'biblios','normarc','952q'),(354,'biblios','marc21','952y'),(356,'biblios','normarc','952y'),(9,'biblios','unimarc','9955'),(17,'biblios','unimarc','9959'),(373,'biblios','unimarc','995b'),(90,'biblios','unimarc','995c'),(74,'biblios','unimarc','995e'),(78,'biblios','unimarc','995j'),(209,'biblios','unimarc','995k'),(203,'biblios','unimarc','995n'),(217,'biblios','unimarc','995o'),(358,'biblios','unimarc','995r'),(198,'biblios','marc21','999c'),(199,'biblios','normarc','999c'),(86,'biblios','marc21','leader_/1-5'),(87,'biblios','normarc','leader_/1-5'),(218,'biblios','marc21','leader_/6'),(219,'biblios','normarc','leader_/6'),(230,'biblios','marc21','leader_/7'),(231,'biblios','normarc','leader_/7'),(408,'authorities','marc21','001'),(409,'authorities','normarc','001'),(398,'authorities','marc21','008_/10'),(399,'authorities','normarc','008_/10'),(410,'authorities','marc21','008_/11'),(411,'authorities','normarc','008_/11'),(412,'authorities','marc21','008_/14'),(413,'authorities','normarc','008_/14'),(404,'authorities','marc21','008_/15'),(405,'authorities','normarc','008_/15'),(378,'authorities','marc21','008_/16'),(379,'authorities','normarc','008_/16'),(400,'authorities','marc21','008_/9'),(401,'authorities','normarc','008_/9'),(406,'authorities','marc21','010az'),(407,'authorities','normarc','010az'),(402,'authorities','marc21','040acd'),(403,'authorities','normarc','040acd'),(394,'authorities','marc21','100a'),(396,'authorities','normarc','100a'),(380,'authorities','marc21','100abcdefghjklmnopqrstvxyz'),(387,'authorities','normarc','100abcdefghjklmnopqrstvxyz'),(395,'authorities','marc21','111a'),(397,'authorities','normarc','111a'),(381,'authorities','marc21','111acdefghjklnpqstvxyz'),(388,'authorities','normarc','111acdefghjklnpqstvxyz'),(382,'authorities','marc21','400abcdefghjklmnopqrstvxyz'),(389,'authorities','normarc','400abcdefghjklmnopqrstvxyz'),(383,'authorities','marc21','410abcdefghklmnoprstvxyz'),(390,'authorities','normarc','410abcdefghklmnoprstvxyz'),(384,'authorities','marc21','411acdefghjklnpqstvxyz'),(391,'authorities','normarc','411acdefghjklnpqstvxyz'),(385,'authorities','marc21','500abcdefghjklmnopqrstvxyz'),(392,'authorities','normarc','500abcdefghjklmnopqrstvxyz'),(386,'authorities','marc21','510abcdefghklmnoprstvxyz'),(393,'authorities','normarc','510abcdefghklmnoprstvxyz'),(374,'authorities','marc21','511acdefghjklnpqstvxyz'),(375,'authorities','normarc','511acdefghjklnpqstvxyz'),(376,'authorities','marc21','942a'),(377,'authorities','normarc','942a');
/*!40000 ALTER TABLE `search_marc_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_marc_to_field`
--

DROP TABLE IF EXISTS `search_marc_to_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_marc_to_field` (
  `search_marc_map_id` int(11) NOT NULL,
  `search_field_id` int(11) NOT NULL,
  `facet` tinyint(1) DEFAULT '0' COMMENT 'true if a facet field should be generated for this',
  `suggestible` tinyint(1) DEFAULT '0' COMMENT 'true if this field can be used to generate suggestions for browse',
  `sort` tinyint(1) DEFAULT NULL COMMENT 'true/false creates special sort handling, null doesn''t',
  PRIMARY KEY (`search_marc_map_id`,`search_field_id`),
  KEY `search_field_id` (`search_field_id`),
  CONSTRAINT `search_marc_to_field_ibfk_1` FOREIGN KEY (`search_marc_map_id`) REFERENCES `search_marc_map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `search_marc_to_field_ibfk_2` FOREIGN KEY (`search_field_id`) REFERENCES `search_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_marc_to_field`
--

LOCK TABLES `search_marc_to_field` WRITE;
/*!40000 ALTER TABLE `search_marc_to_field` DISABLE KEYS */;
INSERT INTO `search_marc_to_field` VALUES (1,1,1,0,NULL),(2,1,1,0,NULL),(3,1,1,0,NULL),(4,2,0,0,NULL),(5,2,0,0,NULL),(6,2,0,0,NULL),(7,3,0,0,NULL),(8,3,0,0,NULL),(9,3,0,0,NULL),(10,4,0,0,NULL),(11,4,0,0,NULL),(12,5,0,0,NULL),(12,32,0,0,NULL),(13,5,0,0,NULL),(13,32,0,0,NULL),(14,5,0,0,NULL),(14,32,0,0,NULL),(15,6,0,0,NULL),(16,6,0,0,NULL),(17,6,0,0,NULL),(18,7,0,0,NULL),(19,7,0,0,NULL),(20,7,0,0,NULL),(21,8,1,1,NULL),(22,8,1,1,NULL),(23,8,1,1,NULL),(24,8,1,1,NULL),(25,8,1,1,NULL),(26,8,1,1,NULL),(27,8,1,1,NULL),(28,8,1,1,NULL),(29,8,1,1,NULL),(30,8,1,1,NULL),(31,8,1,1,NULL),(32,8,1,1,NULL),(33,8,1,1,NULL),(34,8,1,1,NULL),(35,8,1,1,NULL),(36,8,1,1,NULL),(37,8,1,1,NULL),(38,8,1,1,NULL),(39,8,1,1,NULL),(40,8,1,1,NULL),(41,8,1,1,NULL),(42,8,1,1,NULL),(43,8,1,1,NULL),(44,8,1,1,NULL),(45,8,1,1,NULL),(46,8,1,1,NULL),(47,8,1,1,NULL),(48,8,1,1,NULL),(49,8,1,1,NULL),(50,8,1,1,NULL),(51,8,1,1,NULL),(52,8,1,1,NULL),(53,8,1,1,NULL),(54,8,1,1,NULL),(55,8,1,1,NULL),(56,8,1,1,NULL),(57,8,1,1,NULL),(58,8,1,1,NULL),(59,8,1,1,NULL),(60,8,1,1,NULL),(61,8,1,1,NULL),(62,8,1,1,NULL),(63,8,1,1,NULL),(64,8,1,1,NULL),(65,9,0,0,NULL),(65,26,0,0,NULL),(65,32,0,0,NULL),(65,33,0,0,NULL),(65,40,0,0,NULL),(66,9,0,0,NULL),(66,26,0,0,NULL),(66,32,0,0,NULL),(66,33,0,0,NULL),(66,40,0,0,NULL),(67,10,1,0,NULL),(68,10,1,0,NULL),(68,45,0,1,NULL),(69,10,1,0,NULL),(70,10,1,0,NULL),(70,45,0,1,NULL),(71,10,1,0,NULL),(72,11,1,0,NULL),(73,11,1,0,NULL),(74,11,1,0,NULL),(75,12,0,0,NULL),(75,32,0,0,NULL),(76,12,0,0,NULL),(76,32,0,0,NULL),(77,12,0,0,NULL),(77,32,0,0,NULL),(78,12,0,0,NULL),(79,13,0,0,NULL),(80,13,0,0,NULL),(81,14,0,0,NULL),(81,32,0,0,NULL),(82,15,0,0,NULL),(83,15,0,0,NULL),(84,16,1,0,NULL),(85,16,1,0,NULL),(86,17,0,0,NULL),(87,17,0,0,NULL),(88,18,1,0,NULL),(89,18,1,0,NULL),(90,18,0,0,NULL),(91,19,1,0,NULL),(92,19,1,0,NULL),(93,19,1,0,NULL),(94,20,0,0,NULL),(95,20,0,0,NULL),(96,20,0,0,NULL),(97,20,0,0,NULL),(98,20,0,0,NULL),(99,20,0,0,NULL),(100,20,0,0,NULL),(101,20,0,0,NULL),(102,20,0,0,NULL),(103,20,0,0,NULL),(104,20,0,0,NULL),(105,20,0,0,NULL),(106,20,0,0,NULL),(107,20,0,0,NULL),(108,20,0,0,NULL),(109,20,0,0,NULL),(110,20,0,0,NULL),(111,20,0,0,NULL),(112,20,0,0,NULL),(113,20,0,0,NULL),(114,20,0,0,NULL),(115,20,0,0,NULL),(116,20,0,0,NULL),(117,20,0,0,NULL),(118,20,0,0,NULL),(119,20,0,0,NULL),(120,20,0,0,NULL),(121,20,0,0,NULL),(122,20,0,0,NULL),(123,20,0,0,NULL),(124,20,0,0,NULL),(125,20,0,0,NULL),(126,20,0,0,NULL),(127,20,0,0,NULL),(128,20,0,0,NULL),(129,20,0,0,NULL),(130,20,0,0,NULL),(131,20,0,0,NULL),(132,20,0,0,NULL),(133,20,0,0,NULL),(134,20,0,0,NULL),(135,20,0,0,NULL),(136,20,0,0,NULL),(137,20,0,0,NULL),(138,20,0,0,NULL),(139,20,0,0,NULL),(140,20,0,0,NULL),(141,20,0,0,NULL),(142,20,0,0,NULL),(143,20,0,0,NULL),(144,20,0,0,NULL),(145,20,0,0,NULL),(146,20,0,0,NULL),(147,20,0,0,NULL),(148,20,0,0,NULL),(149,20,0,0,NULL),(150,20,0,0,NULL),(151,20,0,0,NULL),(152,20,0,0,NULL),(153,20,0,0,NULL),(154,20,0,0,NULL),(155,20,0,0,NULL),(156,20,0,0,NULL),(157,20,0,0,NULL),(158,20,0,0,NULL),(159,20,0,0,NULL),(160,20,0,0,NULL),(161,20,0,0,NULL),(162,20,0,0,NULL),(163,20,0,0,NULL),(164,20,0,0,NULL),(165,20,0,0,NULL),(166,20,0,0,NULL),(167,20,0,0,NULL),(168,20,0,0,NULL),(169,20,0,0,NULL),(170,20,0,0,NULL),(171,20,0,0,NULL),(172,20,0,0,NULL),(173,20,0,0,NULL),(174,20,0,0,NULL),(175,20,0,0,NULL),(176,20,0,0,NULL),(177,20,0,0,NULL),(178,20,0,0,NULL),(179,20,0,0,NULL),(180,20,0,0,NULL),(181,20,0,0,NULL),(182,20,0,0,NULL),(183,20,0,0,NULL),(184,20,0,0,NULL),(185,20,0,0,NULL),(186,20,0,0,NULL),(187,20,0,0,NULL),(188,20,0,0,NULL),(189,20,0,0,NULL),(190,20,0,0,NULL),(191,20,0,0,NULL),(192,20,0,0,NULL),(193,20,0,0,NULL),(194,20,0,0,NULL),(195,20,0,0,NULL),(196,20,0,0,NULL),(197,20,0,0,NULL),(198,21,0,0,NULL),(199,21,0,0,NULL),(200,21,0,0,NULL),(201,22,0,0,NULL),(202,22,0,0,NULL),(203,22,0,0,NULL),(204,23,0,0,NULL),(205,23,0,0,NULL),(206,24,0,1,NULL),(207,24,0,1,NULL),(208,24,0,0,NULL),(209,24,0,1,NULL),(210,25,0,0,NULL),(211,25,0,0,NULL),(212,25,0,0,NULL),(213,27,0,0,NULL),(214,27,0,0,NULL),(215,28,0,0,NULL),(216,28,0,0,NULL),(217,28,0,0,NULL),(218,29,0,0,NULL),(219,29,0,0,NULL),(220,30,0,0,NULL),(221,30,0,0,NULL),(222,30,0,0,NULL),(223,31,1,0,NULL),(224,31,1,0,NULL),(225,31,1,0,NULL),(226,32,0,0,NULL),(227,32,0,0,NULL),(227,44,0,0,NULL),(228,32,0,0,NULL),(228,44,0,0,NULL),(229,32,0,0,NULL),(229,44,0,0,NULL),(230,34,0,0,NULL),(231,34,0,0,NULL),(232,35,0,0,NULL),(233,35,0,0,NULL),(234,35,0,0,NULL),(235,36,0,0,NULL),(236,36,0,0,NULL),(237,37,0,0,NULL),(238,37,0,0,NULL),(239,38,0,0,NULL),(240,38,0,0,NULL),(241,38,0,0,NULL),(242,39,0,0,NULL),(243,39,0,0,NULL),(244,39,0,0,NULL),(245,41,0,0,NULL),(246,41,0,0,NULL),(247,42,0,0,NULL),(248,42,0,0,NULL),(249,43,1,1,NULL),(250,43,1,1,NULL),(251,43,1,1,NULL),(252,43,0,0,0),(253,43,1,1,0),(254,43,1,1,NULL),(255,43,1,1,NULL),(256,43,1,1,NULL),(257,43,0,0,0),(258,43,1,1,0),(259,43,1,1,NULL),(260,43,1,1,NULL),(261,43,1,1,0),(262,43,0,0,0),(263,45,0,0,NULL),(264,45,0,0,NULL),(265,45,0,0,NULL),(266,45,0,0,NULL),(267,45,0,0,NULL),(268,45,0,0,NULL),(269,45,0,0,NULL),(270,45,0,1,NULL),(271,45,0,1,NULL),(272,45,0,1,NULL),(273,45,0,1,NULL),(274,45,0,1,NULL),(275,45,0,1,NULL),(276,45,0,1,NULL),(277,45,0,0,NULL),(278,45,0,0,NULL),(279,45,0,0,NULL),(280,45,0,0,NULL),(281,45,0,0,NULL),(282,45,0,0,NULL),(283,45,0,0,NULL),(284,45,0,0,NULL),(285,45,0,1,NULL),(286,45,0,1,NULL),(287,45,0,1,NULL),(288,45,0,1,NULL),(289,45,0,1,NULL),(290,45,0,1,NULL),(291,45,0,0,NULL),(292,45,0,0,NULL),(293,45,0,0,NULL),(294,45,0,0,NULL),(295,45,0,1,NULL),(296,45,0,1,NULL),(297,45,0,1,NULL),(298,45,0,1,NULL),(299,45,0,1,NULL),(300,45,0,1,NULL),(301,45,0,1,NULL),(302,45,0,1,NULL),(303,45,0,0,NULL),(304,45,0,0,NULL),(305,45,0,0,NULL),(306,45,0,0,NULL),(307,45,0,0,NULL),(308,45,0,0,NULL),(309,45,0,0,NULL),(310,45,0,0,NULL),(311,45,0,0,NULL),(312,45,0,0,NULL),(313,45,0,0,NULL),(314,45,0,0,NULL),(315,45,0,0,NULL),(316,45,0,0,NULL),(317,45,0,0,NULL),(318,45,0,0,NULL),(319,45,0,0,NULL),(320,45,0,0,NULL),(321,45,0,0,NULL),(322,45,0,0,NULL),(323,45,0,0,NULL),(324,45,0,0,NULL),(325,45,0,0,NULL),(326,45,0,0,NULL),(327,45,0,0,NULL),(328,45,0,0,NULL),(329,45,0,0,NULL),(330,45,0,0,NULL),(331,45,0,0,NULL),(332,45,0,0,NULL),(333,45,0,0,NULL),(334,45,0,0,NULL),(335,45,0,0,NULL),(336,45,0,0,NULL),(337,45,0,0,NULL),(338,45,0,0,NULL),(339,45,0,0,NULL),(340,45,0,0,NULL),(341,45,0,0,NULL),(342,45,0,0,NULL),(343,45,0,0,NULL),(344,45,0,0,NULL),(345,45,0,0,NULL),(346,45,0,0,NULL),(347,45,0,0,NULL),(348,45,0,0,NULL),(349,45,0,0,NULL),(350,45,0,0,NULL),(351,45,0,0,NULL),(352,45,0,0,NULL),(353,46,1,0,NULL),(354,46,1,0,NULL),(355,46,1,0,NULL),(356,46,1,0,NULL),(357,46,1,0,NULL),(358,46,1,0,NULL),(359,47,0,0,NULL),(360,47,0,0,NULL),(361,48,0,0,NULL),(362,48,0,0,NULL),(363,48,0,0,NULL),(364,49,0,0,NULL),(365,49,0,0,NULL),(366,50,0,0,NULL),(367,50,0,0,NULL),(368,51,0,0,NULL),(369,51,0,0,NULL),(370,51,0,0,NULL),(371,52,1,0,NULL),(372,52,1,0,NULL),(373,52,1,0,NULL),(374,53,0,0,NULL),(374,56,0,0,NULL),(374,63,0,0,NULL),(375,53,0,0,NULL),(375,56,0,0,NULL),(375,63,0,0,NULL),(376,54,0,0,NULL),(377,54,0,0,NULL),(378,55,0,0,NULL),(379,55,0,0,NULL),(380,56,0,0,NULL),(380,57,0,0,NULL),(380,66,0,0,NULL),(380,71,0,0,NULL),(380,72,0,0,NULL),(381,56,0,0,NULL),(381,57,0,0,NULL),(381,66,0,0,NULL),(381,67,0,0,NULL),(381,69,0,0,NULL),(382,56,0,0,NULL),(382,70,0,0,NULL),(382,73,0,0,NULL),(382,77,0,0,NULL),(383,56,0,0,NULL),(383,73,0,0,NULL),(383,74,0,0,NULL),(383,77,0,0,NULL),(384,56,0,0,NULL),(384,68,0,0,NULL),(384,73,0,0,NULL),(384,77,0,0,NULL),(385,56,0,0,NULL),(385,62,0,0,NULL),(385,63,0,0,NULL),(386,56,0,0,NULL),(386,61,0,0,NULL),(386,63,0,0,NULL),(387,56,0,0,NULL),(387,57,0,0,NULL),(387,66,0,0,NULL),(387,71,0,0,NULL),(387,72,0,0,NULL),(388,56,0,0,NULL),(388,57,0,0,NULL),(388,66,0,0,NULL),(388,67,0,0,NULL),(388,69,0,0,NULL),(389,56,0,0,NULL),(389,70,0,0,NULL),(389,73,0,0,NULL),(389,77,0,0,NULL),(390,56,0,0,NULL),(390,73,0,0,NULL),(390,74,0,0,NULL),(390,77,0,0,NULL),(391,56,0,0,NULL),(391,68,0,0,NULL),(391,73,0,0,NULL),(391,77,0,0,NULL),(392,56,0,0,NULL),(392,62,0,0,NULL),(392,63,0,0,NULL),(393,56,0,0,NULL),(393,61,0,0,NULL),(393,63,0,0,NULL),(394,58,0,0,NULL),(395,58,0,0,NULL),(396,58,0,0,NULL),(397,58,0,0,NULL),(398,59,0,0,NULL),(399,59,0,0,NULL),(400,60,0,0,NULL),(401,60,0,0,NULL),(402,37,0,0,NULL),(403,37,0,0,NULL),(404,64,0,0,NULL),(405,64,0,0,NULL),(406,65,0,0,NULL),(407,65,0,0,NULL),(408,21,0,0,NULL),(409,21,0,0,NULL),(410,75,0,0,NULL),(411,75,0,0,NULL),(412,76,0,0,NULL),(413,76,0,0,NULL);
/*!40000 ALTER TABLE `search_marc_to_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serial`
--

DROP TABLE IF EXISTS `serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serial` (
  `serialid` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subscriptionid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `serialseq` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `serialseq_x` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serialseq_y` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serialseq_z` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `planneddate` date DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `publisheddate` date DEFAULT NULL,
  `publisheddatetext` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `claimdate` date DEFAULT NULL,
  `claims_count` int(11) DEFAULT '0',
  `routingnotes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`serialid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serial`
--

LOCK TABLES `serial` WRITE;
/*!40000 ALTER TABLE `serial` DISABLE KEYS */;
/*!40000 ALTER TABLE `serial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialitems`
--

DROP TABLE IF EXISTS `serialitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialitems` (
  `itemnumber` int(11) NOT NULL,
  `serialid` int(11) NOT NULL,
  UNIQUE KEY `serialitemsidx` (`itemnumber`),
  KEY `serialitems_sfk_1` (`serialid`),
  CONSTRAINT `serialitems_sfk_1` FOREIGN KEY (`serialid`) REFERENCES `serial` (`serialid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serialitems_sfk_2` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialitems`
--

LOCK TABLES `serialitems` WRITE;
/*!40000 ALTER TABLE `serialitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_throttle`
--

DROP TABLE IF EXISTS `services_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_throttle` (
  `service_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `service_count` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_throttle`
--

LOCK TABLES `services_throttle` WRITE;
/*!40000 ALTER TABLE `services_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `a_session` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1cdde3c16c138182866a61203584833f','--- \n_SESSION_ATIME: \'1488990234\'\n_SESSION_CTIME: \'1488990234\'\n_SESSION_ID: 1cdde3c16c138182866a61203584833f\n_SESSION_REMOTE_ADDR: 192.168.1.108\n');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_providers`
--

DROP TABLE IF EXISTS `sms_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_providers`
--

LOCK TABLES `sms_providers` WRITE;
/*!40000 ALTER TABLE `sms_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_data`
--

DROP TABLE IF EXISTS `social_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_data` (
  `isbn` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_critics` int(11) DEFAULT NULL,
  `num_critics_pro` int(11) DEFAULT NULL,
  `num_quotations` int(11) DEFAULT NULL,
  `num_videos` int(11) DEFAULT NULL,
  `score_avg` decimal(5,2) DEFAULT NULL,
  `num_scores` int(11) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_data`
--

LOCK TABLES `social_data` WRITE;
/*!40000 ALTER TABLE `social_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_holidays`
--

DROP TABLE IF EXISTS `special_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `day` smallint(6) NOT NULL DEFAULT '0',
  `month` smallint(6) NOT NULL DEFAULT '0',
  `year` smallint(6) NOT NULL DEFAULT '0',
  `isexception` smallint(1) NOT NULL DEFAULT '1',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_holidays`
--

LOCK TABLES `special_holidays` WRITE;
/*!40000 ALTER TABLE `special_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `datetime` datetime DEFAULT NULL,
  `branch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proccode` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` double(16,4) DEFAULT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other` mediumtext COLLATE utf8_unicode_ci,
  `usercode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `itemtype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borrowernumber` int(11) DEFAULT NULL,
  `associatedborrower` int(11) DEFAULT NULL,
  `ccode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `timeidx` (`datetime`),
  KEY `branch_idx` (`branch`),
  KEY `proccode_idx` (`proccode`),
  KEY `type_idx` (`type`),
  KEY `usercode_idx` (`usercode`),
  KEY `itemnumber_idx` (`itemnumber`),
  KEY `itemtype_idx` (`itemtype`),
  KEY `borrowernumber_idx` (`borrowernumber`),
  KEY `associatedborrower_idx` (`associatedborrower`),
  KEY `ccode_idx` (`ccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `subscriptionid` int(11) NOT NULL AUTO_INCREMENT,
  `librarian` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `startdate` date DEFAULT NULL,
  `aqbooksellerid` int(11) DEFAULT '0',
  `cost` int(11) DEFAULT '0',
  `aqbudgetid` int(11) DEFAULT '0',
  `weeklength` int(11) DEFAULT '0',
  `monthlength` int(11) DEFAULT '0',
  `numberlength` int(11) DEFAULT '0',
  `periodicity` int(11) DEFAULT NULL,
  `countissuesperunit` int(11) NOT NULL DEFAULT '1',
  `notes` mediumtext COLLATE utf8_unicode_ci,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastvalue1` int(11) DEFAULT NULL,
  `innerloop1` int(11) DEFAULT '0',
  `lastvalue2` int(11) DEFAULT NULL,
  `innerloop2` int(11) DEFAULT '0',
  `lastvalue3` int(11) DEFAULT NULL,
  `innerloop3` int(11) DEFAULT '0',
  `firstacquidate` date DEFAULT NULL,
  `manualhistory` tinyint(1) NOT NULL DEFAULT '0',
  `irregularity` text COLLATE utf8_unicode_ci,
  `skip_serialseq` tinyint(1) NOT NULL DEFAULT '0',
  `letter` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numberpattern` int(11) DEFAULT NULL,
  `locale` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distributedto` text COLLATE utf8_unicode_ci,
  `internalnotes` longtext COLLATE utf8_unicode_ci,
  `callnumber` text COLLATE utf8_unicode_ci,
  `location` varchar(80) COLLATE utf8_unicode_ci DEFAULT '',
  `branchcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastbranch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serialsadditems` tinyint(1) NOT NULL DEFAULT '0',
  `staffdisplaycount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opacdisplaycount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `graceperiod` int(11) NOT NULL DEFAULT '0',
  `enddate` date DEFAULT NULL,
  `closed` int(1) NOT NULL DEFAULT '0',
  `reneweddate` date DEFAULT NULL,
  `itemtype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `previousitemtype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`subscriptionid`),
  KEY `subscription_ibfk_1` (`periodicity`),
  KEY `subscription_ibfk_2` (`numberpattern`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`periodicity`) REFERENCES `subscription_frequencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`numberpattern`) REFERENCES `subscription_numberpatterns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_frequencies`
--

DROP TABLE IF EXISTS `subscription_frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_frequencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `displayorder` int(11) DEFAULT NULL,
  `unit` enum('day','week','month','year') COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitsperissue` int(11) NOT NULL DEFAULT '1',
  `issuesperunit` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_frequencies`
--

LOCK TABLES `subscription_frequencies` WRITE;
/*!40000 ALTER TABLE `subscription_frequencies` DISABLE KEYS */;
INSERT INTO `subscription_frequencies` VALUES (1,'2/day',1,'day',1,2),(2,'1/day',2,'day',1,1),(3,'3/week',3,'week',1,3),(4,'1/week',4,'week',1,1),(5,'1/2 weeks',5,'week',2,1),(6,'1/3 weeks',6,'week',3,1),(7,'1/month',7,'month',1,1),(8,'1/2 months',8,'month',2,1),(9,'1/3 months',9,'month',3,1),(10,'2/year',10,'month',6,1),(11,'1/year',11,'year',1,1),(12,'1/2 year',12,'year',2,1),(13,'Irregular',13,NULL,1,1);
/*!40000 ALTER TABLE `subscription_frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_numberpatterns`
--

DROP TABLE IF EXISTS `subscription_numberpatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_numberpatterns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `displayorder` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `numberingmethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add1` int(11) DEFAULT NULL,
  `every1` int(11) DEFAULT NULL,
  `whenmorethan1` int(11) DEFAULT NULL,
  `setto1` int(11) DEFAULT NULL,
  `numbering1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add2` int(11) DEFAULT NULL,
  `every2` int(11) DEFAULT NULL,
  `whenmorethan2` int(11) DEFAULT NULL,
  `setto2` int(11) DEFAULT NULL,
  `numbering2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add3` int(11) DEFAULT NULL,
  `every3` int(11) DEFAULT NULL,
  `whenmorethan3` int(11) DEFAULT NULL,
  `setto3` int(11) DEFAULT NULL,
  `numbering3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_numberpatterns`
--

LOCK TABLES `subscription_numberpatterns` WRITE;
/*!40000 ALTER TABLE `subscription_numberpatterns` DISABLE KEYS */;
INSERT INTO `subscription_numberpatterns` VALUES (1,'Number',1,'Simple Numbering method','No.{X}','Number',1,1,99999,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Volume, Number, Issue',2,'Volume Number Issue 1','Vol.{X}, Number {Y}, Issue {Z}','Volume',1,48,99999,1,NULL,'Number',1,4,12,1,NULL,'Issue',1,1,4,1,NULL),(3,'Volume, Number',3,'Volume Number 1','Vol {X}, No {Y}','Volume',1,12,99999,1,NULL,'Number',1,1,12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Seasonal',4,'Season Year','{X} {Y}','Season',1,1,3,0,'season','Year',1,4,99999,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subscription_numberpatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptionhistory`
--

DROP TABLE IF EXISTS `subscriptionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptionhistory` (
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `subscriptionid` int(11) NOT NULL DEFAULT '0',
  `histstartdate` date DEFAULT NULL,
  `histenddate` date DEFAULT NULL,
  `missinglist` longtext COLLATE utf8_unicode_ci NOT NULL,
  `recievedlist` longtext COLLATE utf8_unicode_ci NOT NULL,
  `opacnote` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `librariannote` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`subscriptionid`),
  KEY `biblionumber` (`biblionumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptionhistory`
--

LOCK TABLES `subscriptionhistory` WRITE;
/*!40000 ALTER TABLE `subscriptionhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptionhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptionroutinglist`
--

DROP TABLE IF EXISTS `subscriptionroutinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptionroutinglist` (
  `routingid` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `ranking` int(11) DEFAULT NULL,
  `subscriptionid` int(11) NOT NULL,
  PRIMARY KEY (`routingid`),
  UNIQUE KEY `subscriptionid` (`subscriptionid`,`borrowernumber`),
  KEY `subscriptionroutinglist_ibfk_1` (`borrowernumber`),
  CONSTRAINT `subscriptionroutinglist_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriptionroutinglist_ibfk_2` FOREIGN KEY (`subscriptionid`) REFERENCES `subscription` (`subscriptionid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptionroutinglist`
--

LOCK TABLES `subscriptionroutinglist` WRITE;
/*!40000 ALTER TABLE `subscriptionroutinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptionroutinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions`
--

DROP TABLE IF EXISTS `suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestions` (
  `suggestionid` int(8) NOT NULL AUTO_INCREMENT,
  `suggestedby` int(11) NOT NULL DEFAULT '0',
  `suggesteddate` date NOT NULL,
  `managedby` int(11) DEFAULT NULL,
  `manageddate` date DEFAULT NULL,
  `acceptedby` int(11) DEFAULT NULL,
  `accepteddate` date DEFAULT NULL,
  `rejectedby` int(11) DEFAULT NULL,
  `rejecteddate` date DEFAULT NULL,
  `STATUS` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `note` mediumtext COLLATE utf8_unicode_ci,
  `author` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `copyrightdate` smallint(6) DEFAULT NULL,
  `publishercode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `volumedesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publicationyear` smallint(6) DEFAULT '0',
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isbn` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biblionumber` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `patronreason` text COLLATE utf8_unicode_ci,
  `budgetid` int(11) DEFAULT NULL,
  `branchcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collectiontitle` text COLLATE utf8_unicode_ci,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(28,6) DEFAULT NULL,
  `total` decimal(28,6) DEFAULT NULL,
  PRIMARY KEY (`suggestionid`),
  KEY `suggestedby` (`suggestedby`),
  KEY `managedby` (`managedby`),
  KEY `status` (`STATUS`),
  KEY `biblionumber` (`biblionumber`),
  KEY `branchcode` (`branchcode`),
  KEY `suggestions_budget_id_fk` (`budgetid`),
  CONSTRAINT `suggestions_budget_id_fk` FOREIGN KEY (`budgetid`) REFERENCES `aqbudgets` (`budget_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions`
--

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systempreferences`
--

DROP TABLE IF EXISTS `systempreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systempreferences` (
  `variable` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  `options` mediumtext COLLATE utf8_unicode_ci,
  `explanation` text COLLATE utf8_unicode_ci,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systempreferences`
--

LOCK TABLES `systempreferences` WRITE;
/*!40000 ALTER TABLE `systempreferences` DISABLE KEYS */;
INSERT INTO `systempreferences` VALUES ('AcqCreateItem','ordering','ordering|receiving|cataloguing','Define when the item is created : when ordering, when receiving, or in cataloguing module','Choice'),('AcqEnableFiles','0',NULL,'If enabled, allows librarians to upload and attach arbitrary files to invoice records.','YesNo'),('AcqItemSetSubfieldsWhenReceiptIsCancelled','','','Upon cancelling a receipt, update the items subfields if they were created when placing an order (e.g. o=5|a=\"bar foo\")','Free'),('AcqItemSetSubfieldsWhenReceived','','','Upon receiving items, update their subfields if they were created when placing an order (e.g. o=5|a=\"foo bar\")','Free'),('AcquisitionDetails','1','','Hide/Show acquisition details on the biblio detail page.','YesNo'),('AcqViewBaskets','user','user|branch|all','Define which baskets a user is allowed to view: his own only, any within his branch or all','Choice'),('AcqWarnOnDuplicateInvoice','0','','Warn librarians when they try to create a duplicate invoice','YesNo'),('AddressFormat','us','','Choose format to display postal addresses','Choice'),('advancedMARCeditor','0','','If ON, the MARC editor won\'t display field/subfield descriptions','YesNo'),('AdvancedSearchLanguages','','','ISO 639-2 codes of languages you wish to see appear as an Advanced search option.  Example: eng|fre|ita','Textarea'),('AdvancedSearchTypes','itemtypes','itemtypes|ccode','Select which set of fields comprise the Type limit in the advanced search','Choice'),('AgeRestrictionMarker','',NULL,'Markers for age restriction indication, e.g. FSK|PEGI|Age|','free'),('AgeRestrictionOverride','0',NULL,'Allow staff to check out an item with age restriction.','YesNo'),('AggressiveMatchOnISBN','0',NULL,'If enabled, attempt to match aggressively by trying all variations of the ISBNs in the imported record as a phrase in the ISBN fields of already cataloged records when matching on ISBN with the record import tool','YesNo'),('AggressiveMatchOnISSN','0',NULL,'If enabled, attempt to match aggressively by trying all variations of the ISSNs in the imported record as a phrase in the ISSN fields of already cataloged records when matching on ISSN with the record import tool','YesNo'),('AllFinesNeedOverride','1','0','If on, staff will be asked to override every fine, even if it is below noissuescharge.','YesNo'),('AllowAllMessageDeletion','0','','Allow any Library to delete any message','YesNo'),('AllowFineOverride','0','0','If on, staff will be able to issue books to patrons with fines greater than noissuescharge.','YesNo'),('AllowHoldDateInFuture','0','','If set a date field is displayed on the Hold screen of the Staff Interface, allowing the hold date to be set in the future.','YesNo'),('AllowHoldItemTypeSelection','0','','If enabled, patrons and staff will be able to select the itemtype when placing a hold','YesNo'),('AllowHoldPolicyOverride','0',NULL,'Allow staff to override hold policies when placing holds','YesNo'),('AllowHoldsOnDamagedItems','1','','Allow hold requests to be placed on damaged items','YesNo'),('AllowHoldsOnPatronsPossessions','1',NULL,'Allow holds on records that patron have items of it','YesNo'),('AllowItemsOnHoldCheckout','0','','Do not generate RESERVE_WAITING and RESERVED warning when checking out items reserved to someone else. This allows self checkouts for those items.','YesNo'),('AllowItemsOnHoldCheckoutSCO','0','','Do not generate RESERVE_WAITING and RESERVED warning in the SCO module when checking out items reserved to someone else. This allows self checkouts for those items.','YesNo'),('AllowMultipleCovers','0','1','Allow multiple cover images to be attached to each bibliographic record.','YesNo'),('AllowMultipleIssuesOnABiblio','1','Allow/Don\'t allow patrons to check out multiple items from one biblio','','YesNo'),('AllowNotForLoanOverride','0','','If ON, Koha will allow the librarian to loan a not for loan item.','YesNo'),('AllowOfflineCirculation','0','','If on, enables HTML5 offline circulation functionality.','YesNo'),('AllowPatronToSetCheckoutsVisibilityForGuarantor','0',NULL,'If enabled, the patron can set checkouts to be visible to his or her guarantor','YesNo'),('AllowPKIAuth','None','None|Common Name|emailAddress','Use the field from a client-side SSL certificate to look a user in the Koha database','Choice'),('AllowPurchaseSuggestionBranchChoice','0','1','Allow user to choose branch when making a purchase suggestion','YesNo'),('AllowRenewalIfOtherItemsAvailable','0',NULL,'If enabled, allow a patron to renew an item with unfilled holds if other available items can fill that hold.','YesNo'),('AllowRenewalLimitOverride','0',NULL,'if ON, allows renewal limits to be overridden on the circulation screen','YesNo'),('AllowReturnToBranch','anywhere','anywhere|homebranch|holdingbranch|homeorholdingbranch','Where an item may be returned','Choice'),('AllowSelfCheckReturns','0','','If enabled, patrons may return items through the Web-based Self Checkout','YesNo'),('AllowStaffToSetCheckoutsVisibilityForGuarantor','0',NULL,'If enabled, library staff can set a patron\'s checkouts to be visible to linked patrons from the opac.','YesNo'),('AllowTooManyOverride','1','','If on, allow staff to override and check out items when the patron has reached the maximum number of allowed checkouts','YesNo'),('alphabet','A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Æ Ø Å',NULL,'Alphabet than can be expanded into browse links, e.g. on Home > Patrons','free'),('AlternateHoldingsField','',NULL,'The MARC field/subfield that contains alternate holdings information for bibs taht do not have items attached (e.g. 852abchi for libraries converting from MARC Magician).','free'),('AlternateHoldingsSeparator','',NULL,'The string to use to separate subfields in alternate holdings displays.','free'),('AmazonAssocTag','','','See:  http://aws.amazon.com','free'),('AmazonCoverImages','0','','Display Cover Images in Staff Client from Amazon Web Services','YesNo'),('AmazonLocale','US','US|CA|DE|FR|JP|UK','Use to set the Locale of your Amazon.com Web Services','Choice'),('AnonSuggestions','0',NULL,'Set to enable Anonymous suggestions to AnonymousPatron borrowernumber','YesNo'),('AnonymousPatron','0',NULL,'Set the identifier (borrowernumber) of the anonymous patron. Used for Suggestion and reading history privacy',''),('ArticleRequests','0',NULL,'Enables the article request feature','YesNo'),('ArticleRequestsMandatoryFields','',NULL,'Comma delimited list of required fields for bibs where article requests rule = \'yes\'','multiple'),('ArticleRequestsMandatoryFieldsItemsOnly','',NULL,'Comma delimited list of required fields for bibs where article requests rule = \'item_only\'','multiple'),('ArticleRequestsMandatoryFieldsRecordOnly','',NULL,'Comma delimited list of required fields for bibs where article requests rule = \'bib_only\'','multiple'),('AudioAlerts','0','','Enable circulation sounds during checkin and checkout in the staff interface.  Not supported by all web browsers yet.','YesNo'),('AuthDisplayHierarchy','0','','Display authority hierarchies','YesNo'),('AuthoritiesLog','1',NULL,'If ON, log edit/create/delete actions on authorities.','YesNo'),('AuthorityMergeMode','loose','loose|strict','Authority merge mode','Choice'),('AuthoritySeparator','--','10','Used to separate a list of authorities in a display. Usually --','free'),('autoBarcode','OFF','incremental|annual|hbyymmincr|EAN13|OFF','Used to autogenerate a barcode: incremental will be of the form 1, 2, 3; annual of the form 2007-0001, 2007-0002; hbyymmincr of the form HB08010001 where HB=Home Branch','Choice'),('AutoCreateAuthorities','0',NULL,'Automatically create authorities that do not exist when cataloging records.','YesNo'),('AutoEmailOpacUser','0',NULL,'Sends notification emails containing new account details to patrons - when account is created.','YesNo'),('AutoEmailPrimaryAddress','OFF','email|emailpro|B_email|cardnumber|OFF','Defines the default email address where \'Account Details\' emails are sent.','Choice'),('AutoLocation','0',NULL,'If ON, IP authentication is enabled, blocking access to the staff client from unauthorized IP addresses','YesNo'),('AutomaticItemReturn','1',NULL,'If ON, Koha will automatically set up a transfer of this item to its homebranch','YesNo'),('autoMemberNum','1','','If ON, patron number is auto-calculated','YesNo'),('AutoRemoveOverduesRestrictions','0',NULL,'Defines whether an OVERDUES debarment should be lifted automatically if all overdue items are returned by the patron.','YesNo'),('AutoResumeSuspendedHolds','1',NULL,'Allow suspended holds to be automatically resumed by a set date.','YesNo'),('AutoSelfCheckAllowed','0','','For corporate and special libraries which want web-based self-check available from any PC without the need for a manual staff login. Most libraries will want to leave this turned off. If on, requires self-check ID and password to be entered in AutoSelfCheckID and AutoSelfCheckPass sysprefs.','YesNo'),('AutoSelfCheckID','','','Staff ID with circulation rights to be used for automatic web-based self-check. Only applies if AutoSelfCheckAllowed syspref is turned on.','free'),('AutoSelfCheckPass','','','Password to be used for automatic web-based self-check. Only applies if AutoSelfCheckAllowed syspref is turned on.','free'),('Babeltheque','0','','Turn ON Babeltheque content  - See babeltheque.com to subscribe to this service','YesNo'),('Babeltheque_url_js','','','Url for Babeltheque javascript (e.g. http://www.babeltheque.com/bw_XX.js)','Free'),('Babeltheque_url_update','','','Url for Babeltheque update (E.G. http://www.babeltheque.com/.../file.csv.bz2)','Free'),('BakerTaylorBookstoreURL','','','URL template for \"My Libary Bookstore\" links, to which the \"key\" value is appended, and \"https://\" is prepended.  It should include your hostname and \"Parent Number\".  Make this variable empty to turn MLB links off.  Example: ocls.mylibrarybookstore.com/MLB/actions/searchHandler.do?nextPage=bookDetails&parentNum=10923&key=',''),('BakerTaylorEnabled','0','','Enable or disable all Baker & Taylor features.','YesNo'),('BakerTaylorPassword','','','Baker & Taylor Password for Content Cafe (external content)','Free'),('BakerTaylorUsername','','','Baker & Taylor Username for Content Cafe (external content)','Free'),('BasketConfirmations','1','always ask for confirmation.|do not ask for confirmation.','When closing or reopening a basket,','Choice'),('BatchCheckouts','0','','Enable or disable batch checkouts','YesNo'),('BatchCheckoutsValidCategories','',NULL,'Patron categories allowed to checkout in a batch','Free'),('BiblioAddsAuthorities','0',NULL,'If ON, adding a new biblio will check for an existing authority record and create one on the fly if one doesn\'t exist','YesNo'),('BiblioDefaultView','normal','normal|marc|isbd','Choose the default detail view in the catalog; choose between normal, marc or isbd','Choice'),('BibtexExportAdditionalFields','',NULL,'Define additional BibTex tags to export from MARC records in YAML format as an associative array with either a marc tag/subfield combination as the value, or a list of tag/subfield combinations.','textarea'),('BlockExpiredPatronOpacActions','1',NULL,'Set whether an expired patron can perform opac actions such as placing holds or renew books, can be overridden on a per patron-type basis','YesNo'),('BlockReturnOfWithdrawnItems','1','0','If enabled, items that are marked as withdrawn cannot be returned.','YesNo'),('BorrowerMandatoryField','surname|cardnumber',NULL,'Choose the mandatory fields for a patron\'s account','free'),('borrowerRelationship','far|mor','','Define valid relationships between a guarantor & a guarantee (separated by | or ,)','free'),('BorrowerRenewalPeriodBase','now','dateexpiry|now|combination','Set whether the borrower renewal date should be counted from the dateexpiry, from the current date or by combination: if the dateexpiry is in future use dateexpiry, else use current date ','Choice'),('BorrowersLog','1',NULL,'If ON, log edit/create/delete actions on patron data','YesNo'),('BorrowersTitles','Fru|Frøken|Herr',NULL,'Define appropriate Titles for patrons','free'),('BorrowerUnwantedField','',NULL,'Name the fields you don\'t need to store for a patron\'s account','free'),('BranchTransferLimitsType','ccode','itemtype|ccode','When using branch transfer limits, choose whether to limit by itemtype or collection code.','Choice'),('CalculateFinesOnReturn','1','','Switch to control if overdue fines are calculated on return or not','YesNo'),('CalendarFirstDayOfWeek','1','0|1|2|3|4|5|6','Select the first day of week to use in the calendar.','Choice'),('canreservefromotherbranches','1','','With Independent branches on, can a user from one library place a hold on an item from another library','YesNo'),('CardnumberLength','','','Set a length for card numbers.','Free'),('casAuthentication','0','','Enable or disable CAS authentication','YesNo'),('casLogout','0','','Does a logout from Koha should also log the user out of CAS?','YesNo'),('casServerUrl','https://localhost:8443/cas','','URL of the cas server','Free'),('CatalogModuleRelink','0',NULL,'If OFF the linker will never replace the authids that are set in the cataloging module.','YesNo'),('CataloguingLog','1',NULL,'If ON, log edit/create/delete actions on bibliographic data. WARNING: this feature is very resource consuming.','YesNo'),('checkdigit','none','none|katipo','If ON, enable checks on patron cardnumber: none or \"Katipo\" style checks','Choice'),('CheckPrevCheckout','hardno','hardyes|softyes|softno|hardno','By default, for every item checked out, should we warn if the patron has borrowed that item in the past?','Choice'),('CircAutocompl','1',NULL,'If ON, autocompletion is enabled for the Circulation input','YesNo'),('CircAutoPrintQuickSlip','qslip',NULL,'Choose what should happen when an empty barcode field is submitted in circulation: Display a print quick slip window, Display a print slip window or Clear the screen.','Choice'),('CircControl','ItemHomeLibrary','PickupLibrary|PatronLibrary|ItemHomeLibrary','Specify the agency that controls the circulation and fines policy','Choice'),('ClaimsBccCopy','0','','Bcc the ClaimAcquisition and ClaimIssues alerts','YesNo'),('Coce','0',NULL,'If on, enables cover retrieval from the configured Coce server','YesNo'),('CoceHost','',NULL,'Coce server URL','Free'),('CoceProviders','','aws,gb,ol','Coce providers','multiple'),('COinSinOPACResults','1','','If ON, use COinS in OPAC search results page.  NOTE: this can slow down search response time significantly','YesNo'),('ConfirmFutureHolds','0','','Number of days for confirming future holds','Integer'),('ConsiderOnSiteCheckoutsAsNormalCheckouts','1',NULL,'Consider on-site checkouts as normal checkouts','YesNo'),('CronjobLog','0',NULL,'If ON, log information from cron jobs.','YesNo'),('CurrencyFormat','FR','US|FR|CH','Determines the display format of currencies. eg: \'36000\' is displayed as \'360 000,00\'  in \'FR\' or \'360,000.00\'  in \'US\'.','Choice'),('dateformat','metric','metric|us|iso|dmydot','Define global date format (us mm/dd/yyyy, metric dd/mm/yyy, ISO yyyy-mm-dd, dmydot dd.mm.yyyy)','Choice'),('DebugLevel','2','0|1|2','Define the level of debugging information sent to the browser when errors are encountered (set to 0 in production). 0=none, 1=some, 2=most','Choice'),('decreaseLoanHighHolds',NULL,'','Decreases the loan period for items with number of holds above the threshold specified in decreaseLoanHighHoldsValue','YesNo'),('decreaseLoanHighHoldsControl','static','static|dynamic','Chooses between static and dynamic high holds checking','Choice'),('decreaseLoanHighHoldsDuration',NULL,'','Specifies a number of days that a loan is reduced to when used in conjunction with decreaseLoanHighHolds','Integer'),('decreaseLoanHighHoldsIgnoreStatuses','','damaged|itemlost|notforloan|withdrawn','Ignore items with these statuses for dynamic high holds checking','Choice'),('decreaseLoanHighHoldsValue',NULL,'','Specifies a threshold for the minimum number of holds needed to trigger a reduction in loan duration (used with decreaseLoanHighHolds)','Integer'),('DefaultClassificationSource','ddc',NULL,'Default classification scheme used by the collection. E.g., Dewey, LCC, etc.','ClassSources'),('DefaultLanguageField008','nor','','Fill in the default language for field 008 Range 35-37 of MARC21 records (e.g. eng, nor, ger, see <a href=\"http://www.loc.gov/marc/languages/language_code.html\">MARC Code List for Languages</a>)','Free'),('DefaultLongOverdueChargeValue','',NULL,'Charge a lost item to the borrower\'s account when the LOST value of the item changes to n.','integer'),('DefaultLongOverdueDays','',NULL,'Set the LOST value of an item when the item has been overdue for more than n days.','integer'),('DefaultLongOverdueLostValue','',NULL,'Set the LOST value of an item to n when the item has been overdue for more than defaultlongoverduedays days.','integer'),('DefaultPatronSearchFields','surname,firstname,othernames,cardnumber,userid',NULL,'Comma separated list defining the default fields to be used during a patron search','free'),('defaultSortField','relevance','relevance|popularity|call_number|pubdate|acqdate|title|author','Specify the default field used for sorting','Choice'),('defaultSortOrder','dsc','asc|dsc|az|za','Specify the default sort order','Choice'),('DefaultToLoggedInLibraryCircRules','0',NULL,'If enabled, circ rules editor will default to the logged in library\'s rules, rather than the \'all libraries\' rules.','YesNo'),('DefaultToLoggedInLibraryNoticesSlips','0',NULL,'If enabled,slips and notices editor will default to the logged in library\'s rules, rather than the \'all libraries\' rules.','YesNo'),('DefaultToLoggedInLibraryOverdueTriggers','0',NULL,'If enabled, overdue status triggers editor will default to the logged in library\'s rules, rather than the \'default\' rules.','YesNo'),('delimiter',';',';|tabulation|,|/|\\|#||','Define the default separator character for exporting reports','Choice'),('Display856uAsImage','OFF','OFF|Details|Results|Both','Display the URI in the 856u field as an image, the corresponding Staff Client XSLT option must be on','Choice'),('DisplayClearScreenButton','0','','If set to ON, a clear screen button will appear on the circulation page.','YesNo'),('displayFacetCount','0',NULL,NULL,'YesNo'),('DisplayIconsXSLT','1','','If ON, displays the format, audience, and material type icons in XSLT MARC21 results and detail pages.','YesNo'),('DisplayLibraryFacets','holding','home|holding|both','Defines which library facets to display.','Choice'),('DisplayMultiPlaceHold','1','','Display the ability to place multiple holds or not','YesNo'),('DisplayOPACiconsXSLT','1','','If ON, displays the format, audience, and material type icons in XSLT MARC21 results and detail pages in the OPAC.','YesNo'),('dontmerge','1',NULL,'If ON, modifying an authority record will not update all associated bibliographic records immediately, ask your system administrator to enable the merge_authorities.pl cron job','YesNo'),('DumpTemplateVarsIntranet','0',NULL,'If enabled, dump all Template Toolkit variable to a comment in the html source for the staff intranet.','YesNo'),('DumpTemplateVarsOpac','0',NULL,'If enabled, dump all Template Toolkit variable to a comment in the html source for the opac.','YesNo'),('EasyAnalyticalRecords','0','','If on, display in the catalogue screens tools to easily setup analytical record relationships','YesNo'),('emailLibrarianWhenHoldIsPlaced','0',NULL,'If ON, emails the librarian whenever a hold is placed','YesNo'),('EnableAdvancedCatalogingEditor','0','','Enable the Rancor advanced cataloging editor','YesNo'),('EnableBorrowerFiles','0',NULL,'If enabled, allows librarians to upload and attach arbitrary files to a borrower record.','YesNo'),('EnableOpacSearchHistory','1','YesNo','Enable or disable opac search history',''),('EnablePayPalOpacPayments','0',NULL,'Enables the ability to pay fees and fines from  the OPAC via PayPal','YesNo'),('EnableSearchHistory','0','','Enable or disable search history','YesNo'),('EnhancedMessagingPreferences','0','','If ON, allows patrons to select to receive additional messages about items due or nearly due.','YesNo'),('EnhancedMessagingPreferencesOPAC','1',NULL,'If ON, show patrons messaging setting on the OPAC.','YesNo'),('expandedSearchOption','0',NULL,'If ON, set advanced search to be expanded by default','YesNo'),('ExpireReservesMaxPickUpDelay','0','','Enabling this allows holds to expire automatically if they have not been picked by within the time period specified in ReservesMaxPickUpDelay','YesNo'),('ExpireReservesMaxPickUpDelayCharge','0',NULL,'If ExpireReservesMaxPickUpDelay is enabled, and this field has a non-zero value, than a borrower whose waiting hold has expired will be charged this amount.','free'),('ExpireReservesOnHolidays','1',NULL,'If false, reserves at a library will not be canceled on days the library is not open.','YesNo'),('ExtendedPatronAttributes','0',NULL,'Use extended patron IDs and attributes','YesNo'),('FacetLabelTruncationLength','20',NULL,'Specify the facet max length in OPAC','Integer'),('FacetMaxCount','20',NULL,'Specify the max facet count for each category','Integer'),('FeeOnChangePatronCategory','1','','If set, when a patron changes to a category with enrolment fee, a fee is charged','YesNo'),('FilterBeforeOverdueReport','0','','Do not run overdue report until filter selected','YesNo'),('FineNotifyAtCheckin','0',NULL,'If ON notify librarians of overdue fines on the items they are checking in.','YesNo'),('finesCalendar','noFinesWhenClosed','ignoreCalendar|noFinesWhenClosed','Specify whether to use the Calendar in calculating duedates and fines','Choice'),('FinesIncludeGracePeriod','1',NULL,'If enabled, fines calculations will include the grace period.','YesNo'),('FinesLog','1',NULL,'If ON, log fines','YesNo'),('finesMode','test','off|test|production','Choose the fines mode, \'off\', \'test\' (emails admin report) or \'production\' (accrue overdue fines).  Requires accruefines cronjob.','Choice'),('FrameworksLoaded','sysprefs.sql|auth_val_cat.sql|subtag_registry.sql|auth_values.sql|authorities_normal_unimarc.sql|class_sources.sql|message_transport_types.sql|sample_frequencies.sql|sample_notices.sql|sample_notices_message_attributes.sql|sample_notices_message_transports.sql|sample_numberpatterns.sql|system_preferences.sql|unimarc_framework_DEFAULT.sql|userflags.sql|userpermissions.sql|audio_alerts.sql|refund_lost_item_fee_rules.sql',NULL,'Frameworks loaded through webinstaller','choice'),('FRBRizeEditions','0','','If ON, Koha will query one or more ISBN web services for associated ISBNs and display an Editions tab on the details pages','YesNo'),('gist','0','','Default Goods and Services tax rate NOT in %, but in numeric form (0.12 for 12%), set to 0 to disable GST','Integer'),('GoogleIndicTransliteration','0','','GoogleIndicTransliteration on the OPAC.','YesNo'),('GoogleJackets','0',NULL,'if ON, displays jacket covers from Google Books API','YesNo'),('GoogleOAuth2ClientID','',NULL,'Client ID for the web app registered with Google','Free'),('GoogleOAuth2ClientSecret','',NULL,'Client Secret for the web app registered with Google','Free'),('GoogleOpenIDConnect','0',NULL,'if ON, allows the use of Google OpenID Connect for login','YesNo'),('GoogleOpenIDConnectDomain','',NULL,'Restrict Google OpenID Connect to this domain (or subdomains of this domain). Leave blank for all Google domains','Free'),('hide_marc','0',NULL,'If ON, disables display of MARC fields, subfield codes & indicators (still shows data)','YesNo'),('hidelostitems','0','','If ON, disables display of\"lost\" items in OPAC.','YesNo'),('HidePatronName','0','','If this is switched on, patron\'s cardnumber will be shown instead of their name on the holds and catalog screens','YesNo'),('HighlightOwnItemsOnOPAC','0','','If on, and a patron is logged into the OPAC, items from his or her home library will be emphasized and shown first in search results and item details.','YesNo'),('HighlightOwnItemsOnOPACWhich','PatronBranch','PatronBranch|OpacURLBranch','Decides which branch\'s items to emphasize. If PatronBranch, emphasize the logged in user\'s library\'s items. If OpacURLBranch, highlight the items of the Apache var BRANCHCODE defined in Koha\'s Apache configuration file.','Choice'),('HoldFeeMode','not_always','always|not_always','Set the hold fee mode','Choice'),('HoldsLog','0',NULL,'If ON, log create/cancel/suspend/resume actions on holds.','YesNo'),('HoldsQueueSkipClosed','0',NULL,'If enabled, any libraries that are closed when the holds queue is built will be ignored for the purpose of filling holds.','YesNo'),('HoldsToPullStartDate','2',NULL,'Set the default start date for the Holds to pull list to this many days ago','Integer'),('HomeOrHoldingBranch','holdingbranch','holdingbranch|homebranch','Used by Circulation to determine which branch of an item to check with independent branches on, and by search to determine which branch to choose for availability ','Choice'),('HouseboundModule','0','','If ON, enable housebound module functionality.','YesNo'),('HTML5MediaEnabled','not','not|opac|staff|both','Show a tab with a HTML5 media player for files catalogued in field 856','Choice'),('HTML5MediaExtensions','webm|ogg|ogv|oga|vtt','','Media file extensions','free'),('HTML5MediaYouTube','0','Embed|Don\'t embed','YouTube links as videos','YesNo'),('IDreamBooksReadometer','0','','Display Readometer from IDreamBooks.com','YesNo'),('IDreamBooksResults','0','','Display IDreamBooks.com rating in search results','YesNo'),('IDreamBooksReviews','0','','Display book review snippets from IDreamBooks.com','YesNo'),('IdRef','0','','Disable/enable the IdRef webservice from the OPAC detail page.','YesNo'),('ILS-DI','0','','Enables ILS-DI services at OPAC.','YesNo'),('ILS-DI:AuthorizedIPs','','Restricts usage of ILS-DI to some IPs','.','Free'),('ImageLimit','5','','Limit images stored in the database by the Patron Card image manager to this number.','Integer'),('IncludeSeeFromInSearches','0','','Include see-from references in searches.','YesNo'),('IndependentBranches','0',NULL,'If ON, increases security between libraries','YesNo'),('IndependentBranchesPatronModifications','0',NULL,'Show only modification request for the logged in branch','YesNo'),('InProcessingToShelvingCart','0','','If set, when any item with a location code of PROC is \'checked in\', it\'s location code will be changed to CART.','YesNo'),('INTRAdidyoumean','',NULL,'Did you mean? configuration for the Intranet. Do not change, as this is controlled by /cgi-bin/koha/admin/didyoumean.pl.','Free'),('intranet_includes','includes',NULL,'The includes directory you want for specific look of Koha (includes or includes_npl for example)','Free'),('IntranetBiblioDefaultView','normal','normal|marc|isbd|labeled_marc','Choose the default detail view in the staff interface; choose between normal, labeled_marc, marc or isbd','Choice'),('intranetbookbag','1','','If ON, enables display of Cart feature in the intranet','YesNo'),('IntranetCatalogSearchPulldown','0',NULL,'Show a search field pulldown for \"Search the catalog\" boxes','YesNo'),('IntranetCirculationHomeHTML','',NULL,'Show the following HTML in a div on the bottom of the reports home page','Free'),('intranetcolorstylesheet','','50','Define the color stylesheet to use in the Staff Client','free'),('IntranetFavicon','','','Enter a complete URL to an image to replace the default Koha favicon on the Staff client','free'),('IntranetmainUserblock','','70|10','Add a block of HTML that will display on the intranet home page','Textarea'),('IntranetNav','','70|10','Use HTML tabs to add navigational links to the top-hand navigational bar in the Staff Client','Textarea'),('IntranetNumbersPreferPhrase','0',NULL,'Control the use of phr operator in callnumber and standard number staff client searches','YesNo'),('intranetreadinghistory','1','','If ON, Reading History is enabled for all patrons','YesNo'),('IntranetReportsHomeHTML','',NULL,'Show the following HTML in a div on the bottom of the reports home page','Free'),('IntranetSlipPrinterJS','','','Use this JavaScript for printing slips. Define at least function printThenClose(). For use e.g. with Firefox PlugIn jsPrintSetup, see http://jsprintsetup.mozdev.org/','Free'),('intranetstylesheet','','50','Enter a complete URL to use an alternate layout stylesheet in Intranet','free'),('IntranetUserCSS','',NULL,'Add CSS to be included in the intranet in an embedded <style> tag.','free'),('IntranetUserJS','','70|10','Custom javascript for inclusion in Intranet','Textarea'),('ISBD','#100||{ 100a }{ 100b }{ 100c }{ 100d }{ 110a }{ 110b }{ 110c }{ 110d }{ 110e }{ 110f }{ 110g }{ 130a }{ 130d }{ 130f }{ 130g }{ 130h }{ 130k }{ 130l }{ 130m }{ 130n }{ 130o }{ 130p }{ 130r }{ 130s }{ 130t }|<br/><br/>\r\n#245||{ 245a }{ 245b }{245f }{ 245g }{ 245k }{ 245n }{ 245p }{ 245s }{ 245h }|\r\n#246||{ : 246i }{ 246a }{ 246b }{ 246f }{ 246g }{ 246n }{ 246p }{ 246h }|\r\n#242||{ = 242a }{ 242b }{ 242n }{ 242p }{ 242h }|\r\n#245||{ 245c }|\r\n#242||{ = 242c }|\r\n#250| - |{ 250a }{ 250b }|\r\n#254|, |{ 254a }|\r\n#255|, |{ 255a }{ 255b }{ 255c }{ 255d }{ 255e }{ 255f }{ 255g }|\r\n#256|, |{ 256a }|\r\n#257|, |{ 257a }|\r\n#258|, |{ 258a }{ 258b }|\r\n#260| - |{ 260a }{ 260b }{ 260c }|\r\n#300| - |{ 300a }{ 300b }{ 300c }{ 300d }{ 300e }{ 300f }{ 300g }|\r\n#306| - |{ 306a }|\r\n#307| - |{ 307a }{ 307b }|\r\n#310| - |{ 310a }{ 310b }|\r\n#321| - |{ 321a }{ 321b }|\r\n#340| - |{ 3403 }{ 340a }{ 340b }{ 340c }{ 340d }{ 340e }{ 340f }{ 340h }{ 340i }|\r\n#342| - |{ 342a }{ 342b }{ 342c }{ 342d }{ 342e }{ 342f }{ 342g }{ 342h }{ 342i }{ 342j }{ 342k }{ 342l }{ 342m }{ 342n }{ 342o }{ 342p }{ 342q }{ 342r }{ 342s }{ 342t }{ 342u }{ 342v }{ 342w }|\r\n#343| - |{ 343a }{ 343b }{ 343c }{ 343d }{ 343e }{ 343f }{ 343g }{ 343h }{ 343i }|\r\n#351| - |{ 3513 }{ 351a }{ 351b }{ 351c }|\r\n#352| - |{ 352a }{ 352b }{ 352c }{ 352d }{ 352e }{ 352f }{ 352g }{ 352i }{ 352q }|\r\n#362| - |{ 362a }{ 351z }|\r\n#440| - |{ 440a }{ 440n }{ 440p }{ 440v }{ 440x }|.\r\n#490| - |{ 490a }{ 490v }{ 490x }|.\r\n#800| - |{ 800a }{ 800b }{ 800c }{ 800d }{ 800e }{ 800f }{ 800g }{ 800h }{ 800j }{ 800k }{ 800l }{ 800m }{ 800n }{ 800o }{ 800p }{ 800q }{ 800r }{ 800s }{ 800t }{ 800u }{ 800v }|.\r\n#810| - |{ 810a }{ 810b }{ 810c }{ 810d }{ 810e }{ 810f }{ 810g }{ 810h }{ 810k }{ 810l }{ 810m }{ 810n }{ 810o }{ 810p }{ 810r }{ 810s }{ 810t }{ 810u }{ 810v }|.\r\n#811| - |{ 811a }{ 811c }{ 811d }{ 811e }{ 811f }{ 811g }{ 811h }{ 811k }{ 811l }{ 811n }{ 811p }{ 811q }{ 811s }{ 811t }{ 811u }{ 811v }|.\r\n#830| - |{ 830a }{ 830d }{ 830f }{ 830g }{ 830h }{ 830k }{ 830l }{ 830m }{ 830n }{ 830o }{ 830p }{ 830r }{ 830s }{ 830t }{ 830v }|.\r\n#500|<br/><br/>|{ 5003 }{ 500a }|\r\n#501|<br/><br/>|{ 501a }|\r\n#502|<br/><br/>|{ 502a }|\r\n#504|<br/><br/>|{ 504a }|\r\n#505|<br/><br/>|{ 505a }{ 505t }{ 505r }{ 505g }{ 505u }|\r\n#506|<br/><br/>|{ 5063 }{ 506a }{ 506b }{ 506c }{ 506d }{ 506u }|\r\n#507|<br/><br/>|{ 507a }{ 507b }|\r\n#508|<br/><br/>|{ 508a }{ 508a }|\r\n#510|<br/><br/>|{ 5103 }{ 510a }{ 510x }{ 510c }{ 510b }|\r\n#511|<br/><br/>|{ 511a }|\r\n#513|<br/><br/>|{ 513a }{513b }|\r\n#514|<br/><br/>|{ 514z }{ 514a }{ 514b }{ 514c }{ 514d }{ 514e }{ 514f }{ 514g }{ 514h }{ 514i }{ 514j }{ 514k }{ 514m }{ 514u }|\r\n#515|<br/><br/>|{ 515a }|\r\n#516|<br/><br/>|{ 516a }|\r\n#518|<br/><br/>|{ 5183 }{ 518a }|\r\n#520|<br/><br/>|{ 5203 }{ 520a }{ 520b }{ 520u }|\r\n#521|<br/><br/>|{ 5213 }{ 521a }{ 521b }|\r\n#522|<br/><br/>|{ 522a }|\r\n#524|<br/><br/>|{ 524a }|\r\n#525|<br/><br/>|{ 525a }|\r\n#526|<br/><br/>|{\\n510i }{\\n510a }{ 510b }{ 510c }{ 510d }{\\n510x }|\r\n#530|<br/><br/>|{\\n5063 }{\\n506a }{ 506b }{ 506c }{ 506d }{\\n506u }|\r\n#533|<br/><br/>|{\\n5333 }{\\n533a }{\\n533b }{\\n533c }{\\n533d }{\\n533e }{\\n533f }{\\n533m }{\\n533n }|\r\n#534|<br/><br/>|{\\n533p }{\\n533a }{\\n533b }{\\n533c }{\\n533d }{\\n533e }{\\n533f }{\\n533m }{\\n533n }{\\n533t }{\\n533x }{\\n533z }|\r\n#535|<br/><br/>|{\\n5353 }{\\n535a }{\\n535b }{\\n535c }{\\n535d }|\r\n#538|<br/><br/>|{\\n5383 }{\\n538a }{\\n538i }{\\n538u }|\r\n#540|<br/><br/>|{\\n5403 }{\\n540a }{ 540b }{ 540c }{ 540d }{\\n520u }|\r\n#544|<br/><br/>|{\\n5443 }{\\n544a }{\\n544b }{\\n544c }{\\n544d }{\\n544e }{\\n544n }|\r\n#545|<br/><br/>|{\\n545a }{ 545b }{\\n545u }|\r\n#546|<br/><br/>|{\\n5463 }{\\n546a }{ 546b }|\r\n#547|<br/><br/>|{\\n547a }|\r\n#550|<br/><br/>|{ 550a }|\r\n#552|<br/><br/>|{ 552z }{ 552a }{ 552b }{ 552c }{ 552d }{ 552e }{ 552f }{ 552g }{ 552h }{ 552i }{ 552j }{ 552k }{ 552l }{ 552m }{ 552n }{ 562o }{ 552p }{ 552u }|\r\n#555|<br/><br/>|{ 5553 }{ 555a }{ 555b }{ 555c }{ 555d }{ 555u }|\r\n#556|<br/><br/>|{ 556a }{ 506z }|\r\n#563|<br/><br/>|{ 5633 }{ 563a }{ 563u }|\r\n#565|<br/><br/>|{ 5653 }{ 565a }{ 565b }{ 565c }{ 565d }{ 565e }|\r\n#567|<br/><br/>|{ 567a }|\r\n#580|<br/><br/>|{ 580a }|\r\n#581|<br/><br/>|{ 5633 }{ 581a }{ 581z }|\r\n#584|<br/><br/>|{ 5843 }{ 584a }{ 584b }|\r\n#585|<br/><br/>|{ 5853 }{ 585a }|\r\n#586|<br/><br/>|{ 5863 }{ 586a }|\r\n#020|<br/><br/><label>ISBN: </label>|{ 020a }{ 020c }|\r\n#022|<br/><br/><label>ISSN: </label>|{ 022a }|\r\n#222| = |{ 222a }{ 222b }|\r\n#210| = |{ 210a }{ 210b }|\r\n#024|<br/><br/><label>Standard No.: </label>|{ 024a }{ 024c }{ 024d }{ 0242 }|\r\n#027|<br/><br/><label>Standard Tech. Report. No.: </label>|{ 027a }|\r\n#028|<br/><br/><label>Publisher. No.: </label>|{ 028a }{ 028b }|\r\n#013|<br/><br/><label>Patent No.: </label>|{ 013a }{ 013b }{ 013c }{ 013d }{ 013e }{ 013f }|\r\n#030|<br/><br/><label>CODEN: </label>|{ 030a }|\r\n#037|<br/><br/><label>Source: </label>|{ 037a }{ 037b }{ 037c }{ 037f }{ 037g }{ 037n }|\r\n#010|<br/><br/><label>LCCN: </label>|{ 010a }|\r\n#015|<br/><br/><label>Nat. Bib. No.: </label>|{ 015a }{ 0152 }|\r\n#016|<br/><br/><label>Nat. Bib. Agency Control No.: </label>|{ 016a }{ 0162 }|\r\n#600|<br/><br/><label>Subjects--Personal Names: </label>|{\\n6003 }{\\n600a}{ 600b }{ 600c }{ 600d }{ 600e }{ 600f }{ 600g }{ 600h }{--600k}{ 600l }{ 600m }{ 600n }{ 600o }{--600p}{ 600r }{ 600s }{ 600t }{ 600u }{--600x}{--600z}{--600y}{--600v}|\r\n#610|<br/><br/><label>Subjects--Corporate Names: </label>|{\\n6103 }{\\n610a}{ 610b }{ 610c }{ 610d }{ 610e }{ 610f }{ 610g }{ 610h }{--610k}{ 610l }{ 610m }{ 610n }{ 610o }{--610p}{ 610r }{ 610s }{ 610t }{ 610u }{--610x}{--610z}{--610y}{--610v}|\r\n#611|<br/><br/><label>Subjects--Meeting Names: </label>|{\\n6113 }{\\n611a}{ 611b }{ 611c }{ 611d }{ 611e }{ 611f }{ 611g }{ 611h }{--611k}{ 611l }{ 611m }{ 611n }{ 611o }{--611p}{ 611r }{ 611s }{ 611t }{ 611u }{--611x}{--611z}{--611y}{--611v}|\r\n#630|<br/><br/><label>Subjects--Uniform Titles: </label>|{\\n630a}{ 630b }{ 630c }{ 630d }{ 630e }{ 630f }{ 630g }{ 630h }{--630k }{ 630l }{ 630m }{ 630n }{ 630o }{--630p}{ 630r }{ 630s }{ 630t }{--630x}{--630z}{--630y}{--630v}|\r\n#648|<br/><br/><label>Subjects--Chronological Terms: </label>|{\\n6483 }{\\n648a }{--648x}{--648z}{--648y}{--648v}|\r\n#650|<br/><br/><label>Subjects--Topical Terms: </label>|{\\n6503 }{\\n650a}{ 650b }{ 650c }{ 650d }{ 650e }{--650x}{--650z}{--650y}{--650v}|\r\n#651|<br/><br/><label>Subjects--Geographic Terms: </label>|{\\n6513 }{\\n651a}{ 651b }{ 651c }{ 651d }{ 651e }{--651x}{--651z}{--651y}{--651v}|\r\n#653|<br/><br/><label>Subjects--Index Terms: </label>|{ 653a }|\r\n#654|<br/><br/><label>Subjects--Facted Index Terms: </label>|{\\n6543 }{\\n654a}{--654b}{--654x}{--654z}{--654y}{--654v}|\r\n#655|<br/><br/><label>Index Terms--Genre/Form: </label>|{\\n6553 }{\\n655a}{--655b}{--655x }{--655z}{--655y}{--655v}|\r\n#656|<br/><br/><label>Index Terms--Occupation: </label>|{\\n6563 }{\\n656a}{--656k}{--656x}{--656z}{--656y}{--656v}|\r\n#657|<br/><br/><label>Index Terms--Function: </label>|{\\n6573 }{\\n657a}{--657x}{--657z}{--657y}{--657v}|\r\n#658|<br/><br/><label>Index Terms--Curriculum Objective: </label>|{\\n658a}{--658b}{--658c}{--658d}{--658v}|\r\n#050|<br/><br/><label>LC Class. No.: </label>|{ 050a }{ / 050b }|\r\n#082|<br/><br/><label>Dewey Class. No.: </label>|{ 082a }{ / 082b }|\r\n#080|<br/><br/><label>Universal Decimal Class. No.: </label>|{ 080a }{ 080x }{ / 080b }|\r\n#070|<br/><br/><label>National Agricultural Library Call No.: </label>|{ 070a }{ / 070b }|\r\n#060|<br/><br/><label>National Library of Medicine Call No.: </label>|{ 060a }{ / 060b }|\r\n#074|<br/><br/><label>GPO Item No.: </label>|{ 074a }|\r\n#086|<br/><br/><label>Gov. Doc. Class. No.: </label>|{ 086a }|\r\n#088|<br/><br/><label>Report. No.: </label>|{ 088a }|','70|10','ISBD','Textarea'),('IssueLog','1',NULL,'If ON, log checkout activity','YesNo'),('IssueLostItem','alert','Defines what should be done when an attempt is made to issue an item that has been marked as lost.','alert|confirm|nothing','Choice'),('IssuingInProcess','0',NULL,'If ON, disables fines if the patron is issuing item that accumulate debt','YesNo'),('item-level_itypes','1','','If ON, enables Item-level Itemtype / Issuing Rules','YesNo'),('itemBarcodeFallbackSearch','',NULL,'If set, uses scanned item barcodes as a catalogue search if not found as barcodes','YesNo'),('itemBarcodeInputFilter','','whitespace|T-prefix|cuecat|libsuite8|EAN13','If set, allows specification of a item barcode input filter','Choice'),('itemcallnumber','082ab',NULL,'The MARC field/subfield that is used to calculate the itemcallnumber (Dewey would be 082ab or 092ab; LOC would be 050ab or 090ab) could be 852hi from an item record','free'),('KohaAdminEmailAddress','root@localhost','','Define the email address where patron modification requests are sent','free'),('LabelMARCView','standard','standard|economical','Define how a MARC record will display','Choice'),('language','pt-PT',NULL,'Set the default language in the staff client.','Languages'),('LetterLog','1',NULL,'If ON, log all notices sent','YesNo'),('LibraryName','','','Define the library name as displayed on the OPAC',''),('LibraryThingForLibrariesEnabled','0','','Enable or Disable Library Thing for Libraries Features','YesNo'),('LibraryThingForLibrariesID','','','See:http://librarything.com/forlibraries/','free'),('LibraryThingForLibrariesTabbedView','0','','Put LibraryThingForLibraries Content in Tabs.','YesNo'),('LinkerKeepStale','0',NULL,'If ON the authority linker will keep existing authority links for headings where it is unable to find a match.','YesNo'),('LinkerModule','Default','Default|FirstMatch|LastMatch','Chooses which linker module to use (see documentation).','Choice'),('LinkerOptions','','','A pipe-separated list of options for the linker.','free'),('LinkerRelink','1',NULL,'If ON the authority linker will relink headings that have previously been linked every time it runs.','YesNo'),('LocalCoverImages','0','1','Display local cover images on intranet details pages.','YesNo'),('LocalHoldsPriority','0',NULL,'Enables the LocalHoldsPriority feature','YesNo'),('LocalHoldsPriorityItemControl','holdingbranch','holdingbranch|homebranch','decides if the feature operates using the item\'s home or holding library.','Choice'),('LocalHoldsPriorityPatronControl','PickupLibrary','HomeLibrary|PickupLibrary','decides if the feature operates using the library set as the patron\'s home library, or the library set as the pickup library for the given hold.','Choice'),('makePreviousSerialAvailable','0','','make previous serial automatically available when collecting a new serial. Please note that the item-level_itypes syspref must be set to specific item.','YesNo'),('ManInvInNoissuesCharge','1',NULL,'MANUAL_INV charges block checkouts (added to noissuescharge).','YesNo'),('MARCAuthorityControlField008','|| aca||aabn           | a|a     d',NULL,'Define the contents of MARC21 authority control field 008 position 06-39','Textarea'),('MarcFieldsToOrder','',NULL,'Set the mapping values for a new order line created from a MARC record in a staged file. In a YAML format.','textarea'),('marcflavour','UNIMARC','MARC21|UNIMARC|NORMARC','Define global MARC flavor (MARC21, UNIMARC or NORMARC) used for character encoding','Choice'),('MARCOrgCode','OSt','','Define MARC Organization Code for MARC21 records - http://www.loc.gov/marc/organizations/orgshome.html','free'),('MaxFine',NULL,'','Maximum fine a patron can have for all late returns at one moment. Single item caps are specified in the circulation rules matrix.','Integer'),('maxItemsInSearchResults','20',NULL,'Specify the maximum number of items to display for each result on a page of results','free'),('MaxItemsToDisplayForBatchDel','1000',NULL,'Display up to a given number of items in a single item deletionbatch.','Integer'),('MaxItemsToProcessForBatchMod','1000',NULL,'Process up to a given number of items in a single item modification batch.','Integer'),('MaxOpenSuggestions','',NULL,'Limit the number of open suggestions a patron can have at once','Integer'),('maxoutstanding','5','','maximum amount withstanding to be able make holds','Integer'),('maxRecordsForFacets','20',NULL,NULL,'Integer'),('maxreserves','50','','Define maximum number of holds a patron can place','Integer'),('MaxSearchResultsItemsPerRecordStatusCheck','20','','Max number of items per record for which to check transit and hold status','Integer'),('MembershipExpiryDaysNotice','',NULL,'Send an account expiration notice that a patron\'s card is about to expire after','Integer'),('MergeReportFields','',NULL,'Displayed fields for deleted MARC records after merge','Free'),('minPasswordLength','3',NULL,'Specify the minimum length of a patron/staff password','free'),('NewItemsDefaultLocation','','','If set, all new items will have a location of the given Location Code ( Authorized Value type LOC )',''),('NewsAuthorDisplay','none','none|opac|staff|both','Display the author name for news items.','Choice'),('noissuescharge','5','','Define maximum amount withstanding before check outs are blocked','Integer'),('NoIssuesChargeGuarantees','','','Define maximum amount withstanding before check outs are blocked','Integer'),('noItemTypeImages','0',NULL,'If ON, disables item-type images','YesNo'),('NoLoginInstructions','','60|10','Instructions to display on the OPAC login form when a patron is not logged in','Textarea'),('NorwegianPatronDBEnable','false',NULL,'Enable communication with the Norwegian national patron database.','YesNo'),('NorwegianPatronDBEndpoint','http://nlsink:9999',NULL,'Which NL endpoint to use.','Free'),('NorwegianPatronDBPassword','nlbasepass',NULL,'Password for communication with the Norwegian national patron database.','Free'),('NorwegianPatronDBSearchNLAfterLocalHit','0',NULL,'Search NL if a search has already given one or more local hits?.','YesNo'),('NorwegianPatronDBUsername','nlbaseuser',NULL,'Username for communication with the Norwegian national patron database.','Free'),('NotesBlacklist','',NULL,'List of notes fields that should not appear in the title notes/description separator of details','free'),('NotHighlightedWords','and|or|not',NULL,'List of words to NOT highlight when OpacHitHighlight is enabled','free'),('NoticeCSS','',NULL,'Notices CSS url.','free'),('NotifyBorrowerDeparture','30',NULL,'Define number of days before expiry where circulation is warned about patron account expiry','Integer'),('NovelistSelectEnabled','0',NULL,'Enable Novelist Select content.  Requires Novelist Profile and Password','YesNo'),('NovelistSelectPassword','',NULL,'Enable Novelist user Profile','free'),('NovelistSelectProfile','',NULL,'Novelist Select user Password','free'),('NovelistSelectStaffEnabled','0',NULL,'Enable Novelist Select content in the staff client.  Requires Novelist Profile and Password','YesNo'),('NovelistSelectStaffView','tab','tab|above|below','Where to display Novelist Select content in the staff client','Choice'),('NovelistSelectView','tab','tab|above|below|right','Where to display Novelist Select content','Choice'),('numReturnedItemsToShow','20',NULL,'Number of returned items to show on the check-in page','Integer'),('numSearchResults','20',NULL,'Specify the maximum number of results to display on a page of results','Integer'),('numSearchRSSResults','50',NULL,'Specify the maximum number of results to display on a RSS page of results','Integer'),('OAI-PMH','0',NULL,'if ON, OAI-PMH server is enabled','YesNo'),('OAI-PMH:archiveID','KOHA-OAI-TEST',NULL,'OAI-PMH archive identification','Free'),('OAI-PMH:AutoUpdateSets','0','','Automatically update OAI sets when a bibliographic record is created or updated','YesNo'),('OAI-PMH:ConfFile','',NULL,'If empty, Koha OAI Server operates in normal mode, otherwise it operates in extended mode.','File'),('OAI-PMH:DeletedRecord','persistent','Koha\'s deletedbiblio table will never be deleted (persistent), might be deleted (transient), or will never have any data in it (no)','transient|persistent|no','Choice'),('OAI-PMH:MaxCount','50',NULL,'OAI-PMH maximum number of records by answer to ListRecords and ListIdentifiers queries','Integer'),('OCLCAffiliateID','','','Use with FRBRizeEditions and XISBN. You can sign up for an AffiliateID here: http://www.worldcat.org/wcpa/do/AffiliateUserServices?method=initSelfRegister','free'),('OnSiteCheckouts','0','','Enable/Disable the on-site checkouts feature','YesNo'),('OnSiteCheckoutsForce','0','','Enable/Disable the on-site for all cases (Even if a user is debarred, etc.)','YesNo'),('OPACAcquisitionDetails','0','','Show the acquisition details at the OPAC','YesNo'),('OpacAdditionalStylesheet','','','Define an auxiliary stylesheet for OPAC use, to override specified settings from the primary opac.css stylesheet. Enter the filename (if the file is in the server\'s css directory) or a complete URL beginning with http (if the file lives on a remote server).','free'),('OpacAddMastheadLibraryPulldown','0','','Adds a pulldown menu to select the library to search on the opac masthead.','YesNo'),('OpacAdvSearchMoreOptions','pubdate,itemtype,language,subtype,sorting,location','Show search options for the expanded view (More options)','pubdate|itemtype|language|subtype|sorting|location','multiple'),('OpacAdvSearchOptions','pubdate,itemtype,language,sorting,location','Show search options','pubdate|itemtype|language|subtype|sorting|location','multiple'),('OPACAllowHoldDateInFuture','0','','If set, along with the AllowHoldDateInFuture system preference, OPAC users can set the date of a hold to be in the future.','YesNo'),('OpacAllowPublicListCreation','1',NULL,'If set, allows opac users to create public lists','YesNo'),('OpacAllowSharingPrivateLists','0',NULL,'If set, allows opac users to share private lists with other patrons','YesNo'),('OPACAllowUserToChooseBranch','1','1','Allow the user to choose the branch they want to pickup their hold from','YesNo'),('OPACAmazonCoverImages','0','','Display cover images on OPAC from Amazon Web Services','YesNo'),('OpacAuthorities','1',NULL,'If ON, enables the search authorities link on OPAC','YesNo'),('OPACBaseURL','',NULL,'Specify the Base URL of the OPAC, e.g., http://opac.mylibrary.com, including the protocol (http:// or https://). Otherwise, the http:// will be added automatically by Koha upon saving.','Free'),('opacbookbag','1','','If ON, enables display of Cart feature','YesNo'),('OpacBrowser','0',NULL,'If ON, enables subject authorities browser on OPAC (needs to set misc/cronjob/sbuild_browser_and_cloud.pl)','YesNo'),('OpacBrowseResults','1',NULL,'Disable/enable browsing and paging search results from the OPAC detail page.','YesNo'),('OpacCloud','0',NULL,'If ON, enables subject cloud on OPAC','YesNo'),('opaccredits','','70|10','Define HTML Credits at the bottom of the OPAC page','Textarea'),('OpacCustomSearch','','70|10','Replace the search box on the OPAC with the provided HTML','Textarea'),('OPACdefaultSortField','relevance','relevance|popularity|call_number|pubdate|acqdate|title|author','Specify the default field used for sorting','Choice'),('OPACdefaultSortOrder','dsc','asc|dsc|za|az','Specify the default sort order','Choice'),('OPACdidyoumean','',NULL,'Did you mean? configuration for the OPAC. Do not change, as this is controlled by /cgi-bin/koha/admin/didyoumean.pl.','Free'),('OPACDisplay856uAsImage','OFF','OFF|Details|Results|Both','Display the URI in the 856u field as an image, the corresponding OPACXSLT option must be on','Choice'),('OpacExportOptions','bibtex,dc,marcxml,marc8,utf8,marcstd,mods,ris,isbd','','Define export options available on OPAC detail page.','multiple'),('OPACFallback','prog','bootstrap|prog','Define the fallback theme for the OPAC interface.','Themes'),('OpacFavicon','','','Enter a complete URL to an image to replace the default Koha favicon on the OPAC','free'),('OPACFineNoRenewals','100','','Fine limit above which user cannot renew books via OPAC','Integer'),('OPACFinesTab','1','','If OFF the patron fines tab in the OPAC is disabled.','YesNo'),('OPACFRBRizeEditions','0','','If ON, the OPAC will query one or more ISBN web services for associated ISBNs and display an Editions tab on the details pages','YesNo'),('opacheader','','70|10','Add HTML to be included as a custom header in the OPAC','Textarea'),('OpacHiddenItems','','','This syspref allows to define custom rules for hiding specific items at opac. See docs/opac/OpacHiddenItems.txt for more informations.','Textarea'),('OpacHighlightedWords','1','','If Set, then queried words are higlighted in OPAC','YesNo'),('OPACHoldingsDefaultSortField','first_column','first_column|homebranch|holdingbranch','Default sort field for the holdings table at the OPAC','choice'),('OpacHoldNotes','0','','Show hold notes on OPAC','YesNo'),('OPACISBD','#100||{ 100a }{ 100b }{ 100c }{ 100d }{ 110a }{ 110b }{ 110c }{ 110d }{ 110e }{ 110f }{ 110g }{ 130a }{ 130d }{ 130f }{ 130g }{ 130h }{ 130k }{ 130l }{ 130m }{ 130n }{ 130o }{ 130p }{ 130r }{ 130s }{ 130t }|<br/><br/>\r\n#245||{ 245a }{ 245b }{245f }{ 245g }{ 245k }{ 245n }{ 245p }{ 245s }{ 245h }|\r\n#246||{ : 246i }{ 246a }{ 246b }{ 246f }{ 246g }{ 246n }{ 246p }{ 246h }|\r\n#242||{ = 242a }{ 242b }{ 242n }{ 242p }{ 242h }|\r\n#245||{ 245c }|\r\n#242||{ = 242c }|\r\n#250| - |{ 250a }{ 250b }|\r\n#254|, |{ 254a }|\r\n#255|, |{ 255a }{ 255b }{ 255c }{ 255d }{ 255e }{ 255f }{ 255g }|\r\n#256|, |{ 256a }|\r\n#257|, |{ 257a }|\r\n#258|, |{ 258a }{ 258b }|\r\n#260| - |{ 260a }{ 260b }{ 260c }|\r\n#300| - |{ 300a }{ 300b }{ 300c }{ 300d }{ 300e }{ 300f }{ 300g }|\r\n#306| - |{ 306a }|\r\n#307| - |{ 307a }{ 307b }|\r\n#310| - |{ 310a }{ 310b }|\r\n#321| - |{ 321a }{ 321b }|\r\n#340| - |{ 3403 }{ 340a }{ 340b }{ 340c }{ 340d }{ 340e }{ 340f }{ 340h }{ 340i }|\r\n#342| - |{ 342a }{ 342b }{ 342c }{ 342d }{ 342e }{ 342f }{ 342g }{ 342h }{ 342i }{ 342j }{ 342k }{ 342l }{ 342m }{ 342n }{ 342o }{ 342p }{ 342q }{ 342r }{ 342s }{ 342t }{ 342u }{ 342v }{ 342w }|\r\n#343| - |{ 343a }{ 343b }{ 343c }{ 343d }{ 343e }{ 343f }{ 343g }{ 343h }{ 343i }|\r\n#351| - |{ 3513 }{ 351a }{ 351b }{ 351c }|\r\n#352| - |{ 352a }{ 352b }{ 352c }{ 352d }{ 352e }{ 352f }{ 352g }{ 352i }{ 352q }|\r\n#362| - |{ 362a }{ 351z }|\r\n#440| - |{ 440a }{ 440n }{ 440p }{ 440v }{ 440x }|.\r\n#490| - |{ 490a }{ 490v }{ 490x }|.\r\n#800| - |{ 800a }{ 800b }{ 800c }{ 800d }{ 800e }{ 800f }{ 800g }{ 800h }{ 800j }{ 800k }{ 800l }{ 800m }{ 800n }{ 800o }{ 800p }{ 800q }{ 800r }{ 800s }{ 800t }{ 800u }{ 800v }|.\r\n#810| - |{ 810a }{ 810b }{ 810c }{ 810d }{ 810e }{ 810f }{ 810g }{ 810h }{ 810k }{ 810l }{ 810m }{ 810n }{ 810o }{ 810p }{ 810r }{ 810s }{ 810t }{ 810u }{ 810v }|.\r\n#811| - |{ 811a }{ 811c }{ 811d }{ 811e }{ 811f }{ 811g }{ 811h }{ 811k }{ 811l }{ 811n }{ 811p }{ 811q }{ 811s }{ 811t }{ 811u }{ 811v }|.\r\n#830| - |{ 830a }{ 830d }{ 830f }{ 830g }{ 830h }{ 830k }{ 830l }{ 830m }{ 830n }{ 830o }{ 830p }{ 830r }{ 830s }{ 830t }{ 830v }|.\r\n#500|<br/><br/>|{ 5003 }{ 500a }|\r\n#501|<br/><br/>|{ 501a }|\r\n#502|<br/><br/>|{ 502a }|\r\n#504|<br/><br/>|{ 504a }|\r\n#505|<br/><br/>|{ 505a }{ 505t }{ 505r }{ 505g }{ 505u }|\r\n#506|<br/><br/>|{ 5063 }{ 506a }{ 506b }{ 506c }{ 506d }{ 506u }|\r\n#507|<br/><br/>|{ 507a }{ 507b }|\r\n#508|<br/><br/>|{ 508a }{ 508a }|\r\n#510|<br/><br/>|{ 5103 }{ 510a }{ 510x }{ 510c }{ 510b }|\r\n#511|<br/><br/>|{ 511a }|\r\n#513|<br/><br/>|{ 513a }{513b }|\r\n#514|<br/><br/>|{ 514z }{ 514a }{ 514b }{ 514c }{ 514d }{ 514e }{ 514f }{ 514g }{ 514h }{ 514i }{ 514j }{ 514k }{ 514m }{ 514u }|\r\n#515|<br/><br/>|{ 515a }|\r\n#516|<br/><br/>|{ 516a }|\r\n#518|<br/><br/>|{ 5183 }{ 518a }|\r\n#520|<br/><br/>|{ 5203 }{ 520a }{ 520b }{ 520u }|\r\n#521|<br/><br/>|{ 5213 }{ 521a }{ 521b }|\r\n#522|<br/><br/>|{ 522a }|\r\n#524|<br/><br/>|{ 524a }|\r\n#525|<br/><br/>|{ 525a }|\r\n#526|<br/><br/>|{\\n510i }{\\n510a }{ 510b }{ 510c }{ 510d }{\\n510x }|\r\n#530|<br/><br/>|{\\n5063 }{\\n506a }{ 506b }{ 506c }{ 506d }{\\n506u }|\r\n#533|<br/><br/>|{\\n5333 }{\\n533a }{\\n533b }{\\n533c }{\\n533d }{\\n533e }{\\n533f }{\\n533m }{\\n533n }|\r\n#534|<br/><br/>|{\\n533p }{\\n533a }{\\n533b }{\\n533c }{\\n533d }{\\n533e }{\\n533f }{\\n533m }{\\n533n }{\\n533t }{\\n533x }{\\n533z }|\r\n#535|<br/><br/>|{\\n5353 }{\\n535a }{\\n535b }{\\n535c }{\\n535d }|\r\n#538|<br/><br/>|{\\n5383 }{\\n538a }{\\n538i }{\\n538u }|\r\n#540|<br/><br/>|{\\n5403 }{\\n540a }{ 540b }{ 540c }{ 540d }{\\n520u }|\r\n#544|<br/><br/>|{\\n5443 }{\\n544a }{\\n544b }{\\n544c }{\\n544d }{\\n544e }{\\n544n }|\r\n#545|<br/><br/>|{\\n545a }{ 545b }{\\n545u }|\r\n#546|<br/><br/>|{\\n5463 }{\\n546a }{ 546b }|\r\n#547|<br/><br/>|{\\n547a }|\r\n#550|<br/><br/>|{ 550a }|\r\n#552|<br/><br/>|{ 552z }{ 552a }{ 552b }{ 552c }{ 552d }{ 552e }{ 552f }{ 552g }{ 552h }{ 552i }{ 552j }{ 552k }{ 552l }{ 552m }{ 552n }{ 562o }{ 552p }{ 552u }|\r\n#555|<br/><br/>|{ 5553 }{ 555a }{ 555b }{ 555c }{ 555d }{ 555u }|\r\n#556|<br/><br/>|{ 556a }{ 506z }|\r\n#563|<br/><br/>|{ 5633 }{ 563a }{ 563u }|\r\n#565|<br/><br/>|{ 5653 }{ 565a }{ 565b }{ 565c }{ 565d }{ 565e }|\r\n#567|<br/><br/>|{ 567a }|\r\n#580|<br/><br/>|{ 580a }|\r\n#581|<br/><br/>|{ 5633 }{ 581a }{ 581z }|\r\n#584|<br/><br/>|{ 5843 }{ 584a }{ 584b }|\r\n#585|<br/><br/>|{ 5853 }{ 585a }|\r\n#586|<br/><br/>|{ 5863 }{ 586a }|\r\n#020|<br/><br/><label>ISBN: </label>|{ 020a }{ 020c }|\r\n#022|<br/><br/><label>ISSN: </label>|{ 022a }|\r\n#222| = |{ 222a }{ 222b }|\r\n#210| = |{ 210a }{ 210b }|\r\n#024|<br/><br/><label>Standard No.: </label>|{ 024a }{ 024c }{ 024d }{ 0242 }|\r\n#027|<br/><br/><label>Standard Tech. Report. No.: </label>|{ 027a }|\r\n#028|<br/><br/><label>Publisher. No.: </label>|{ 028a }{ 028b }|\r\n#013|<br/><br/><label>Patent No.: </label>|{ 013a }{ 013b }{ 013c }{ 013d }{ 013e }{ 013f }|\r\n#030|<br/><br/><label>CODEN: </label>|{ 030a }|\r\n#037|<br/><br/><label>Source: </label>|{ 037a }{ 037b }{ 037c }{ 037f }{ 037g }{ 037n }|\r\n#010|<br/><br/><label>LCCN: </label>|{ 010a }|\r\n#015|<br/><br/><label>Nat. Bib. No.: </label>|{ 015a }{ 0152 }|\r\n#016|<br/><br/><label>Nat. Bib. Agency Control No.: </label>|{ 016a }{ 0162 }|\r\n#600|<br/><br/><label>Subjects--Personal Names: </label>|{\\n6003 }{\\n600a}{ 600b }{ 600c }{ 600d }{ 600e }{ 600f }{ 600g }{ 600h }{--600k}{ 600l }{ 600m }{ 600n }{ 600o }{--600p}{ 600r }{ 600s }{ 600t }{ 600u }{--600x}{--600z}{--600y}{--600v}|\r\n#610|<br/><br/><label>Subjects--Corporate Names: </label>|{\\n6103 }{\\n610a}{ 610b }{ 610c }{ 610d }{ 610e }{ 610f }{ 610g }{ 610h }{--610k}{ 610l }{ 610m }{ 610n }{ 610o }{--610p}{ 610r }{ 610s }{ 610t }{ 610u }{--610x}{--610z}{--610y}{--610v}|\r\n#611|<br/><br/><label>Subjects--Meeting Names: </label>|{\\n6113 }{\\n611a}{ 611b }{ 611c }{ 611d }{ 611e }{ 611f }{ 611g }{ 611h }{--611k}{ 611l }{ 611m }{ 611n }{ 611o }{--611p}{ 611r }{ 611s }{ 611t }{ 611u }{--611x}{--611z}{--611y}{--611v}|\r\n#630|<br/><br/><label>Subjects--Uniform Titles: </label>|{\\n630a}{ 630b }{ 630c }{ 630d }{ 630e }{ 630f }{ 630g }{ 630h }{--630k }{ 630l }{ 630m }{ 630n }{ 630o }{--630p}{ 630r }{ 630s }{ 630t }{--630x}{--630z}{--630y}{--630v}|\r\n#648|<br/><br/><label>Subjects--Chronological Terms: </label>|{\\n6483 }{\\n648a }{--648x}{--648z}{--648y}{--648v}|\r\n#650|<br/><br/><label>Subjects--Topical Terms: </label>|{\\n6503 }{\\n650a}{ 650b }{ 650c }{ 650d }{ 650e }{--650x}{--650z}{--650y}{--650v}|\r\n#651|<br/><br/><label>Subjects--Geographic Terms: </label>|{\\n6513 }{\\n651a}{ 651b }{ 651c }{ 651d }{ 651e }{--651x}{--651z}{--651y}{--651v}|\r\n#653|<br/><br/><label>Subjects--Index Terms: </label>|{ 653a }|\r\n#654|<br/><br/><label>Subjects--Facted Index Terms: </label>|{\\n6543 }{\\n654a}{--654b}{--654x}{--654z}{--654y}{--654v}|\r\n#655|<br/><br/><label>Index Terms--Genre/Form: </label>|{\\n6553 }{\\n655a}{--655b}{--655x }{--655z}{--655y}{--655v}|\r\n#656|<br/><br/><label>Index Terms--Occupation: </label>|{\\n6563 }{\\n656a}{--656k}{--656x}{--656z}{--656y}{--656v}|\r\n#657|<br/><br/><label>Index Terms--Function: </label>|{\\n6573 }{\\n657a}{--657x}{--657z}{--657y}{--657v}|\r\n#658|<br/><br/><label>Index Terms--Curriculum Objective: </label>|{\\n658a}{--658b}{--658c}{--658d}{--658v}|\r\n#050|<br/><br/><label>LC Class. No.: </label>|{ 050a }{ / 050b }|\r\n#082|<br/><br/><label>Dewey Class. No.: </label>|{ 082a }{ / 082b }|\r\n#080|<br/><br/><label>Universal Decimal Class. No.: </label>|{ 080a }{ 080x }{ / 080b }|\r\n#070|<br/><br/><label>National Agricultural Library Call No.: </label>|{ 070a }{ / 070b }|\r\n#060|<br/><br/><label>National Library of Medicine Call No.: </label>|{ 060a }{ / 060b }|\r\n#074|<br/><br/><label>GPO Item No.: </label>|{ 074a }|\r\n#086|<br/><br/><label>Gov. Doc. Class. No.: </label>|{ 086a }|\r\n#088|<br/><br/><label>Report. No.: </label>|{ 088a }|','70|10','OPAC ISBD','Textarea'),('OpacItemLocation','callnum','callnum|ccode|location','Show the shelving location of items in the opac','Choice'),('OPACItemsResultsDisplay','0','','If OFF : show only the status of items in result list.If ON : show full location of items (branch+location+callnumber) as in staff interface','YesNo'),('OpacKohaUrl','1',NULL,'Show \'Powered by Koha\' text on OPAC footer.',NULL),('OpacLangSelectorMode','both','top|both|footer','Select the location to display the language selector','Choice'),('opaclanguages','pt-PT',NULL,'Set the default language in the OPAC.','Languages'),('opaclanguagesdisplay','0','','If ON, enables display of Change Language feature on OPAC','YesNo'),('opaclayoutstylesheet','opac.css','','Enter the name of the layout CSS stylesheet to use in the OPAC','free'),('OPACLocalCoverImages','0','1','Display local cover images on OPAC search and details pages.','YesNo'),('OpacLocationBranchToDisplay','holding','holding|home|both','In the OPAC, under location show which branch for Location in the record details.','Choice'),('OpacLocationBranchToDisplayShelving','holding','holding|home|both','In the OPAC, display the shelving location under which which column.','Choice'),('OpacMaintenance','0','','If ON, enables maintenance warning in OPAC','YesNo'),('OpacMaintenanceNotice','','','A user-defined block of HTML to appear on screen when OpacMaintenace is enabled','Textarea'),('OpacMainUserBlock','<p>Velkommen til Koha...</p><hr />','70|10','A user-defined block of HTML  in the main content area of the opac main page','Textarea'),('OpacMaxItemsToDisplay','50','','Max items to display at the OPAC on a biblio detail','Integer'),('OPACMySummaryHTML','','70|10','Enter the HTML that will appear in a column on the \'my summary\' and \'my reading history\' tabs when a user is logged in to the OPAC. Enter {BIBLIONUMBER}, {TITLE}, {AUTHOR}, or {ISBN} in place of their respective variables in the HTML. Leave blank to disable.','Textarea'),('OPACMySummaryNote','','','Note to display on the patron summary page. This note only appears if the patron is connected.','Free'),('OpacNav','<p>Viktige lenker kan plasseres her</p>','70|10','Use HTML tags to add navigational links to the left-hand navigational bar in OPAC','Textarea'),('OpacNavBottom','Important links here.','70|10','Use HTML tags to add navigational links to the left-hand navigational bar in OPAC','Textarea'),('OpacNavRight','','70|10','Show the following HTML in the right hand column of the main page under the main login form','Textarea'),('OPACNoResultsFound','','70|10','Display this HTML when no results are found for a search in the OPAC','Textarea'),('OPACNumbersPreferPhrase','0',NULL,'Control the use of phr operator in callnumber and standard number OPAC searches','YesNo'),('OPACnumSearchResults','20',NULL,'Specify the maximum number of results to display on a page of results','Integer'),('OpacPasswordChange','1',NULL,'If ON, enables patron-initiated password change in OPAC (disable it when using LDAP auth)','YesNo'),('OPACPatronDetails','1','','If OFF the patron details tab in the OPAC is disabled.','YesNo'),('OPACpatronimages','0',NULL,'Enable patron images in the OPAC','YesNo'),('OpacPrivacy','0',NULL,'if ON, allows patrons to define their privacy rules (reading history)','YesNo'),('OpacPublic','1',NULL,'Turn on/off public OPAC','YesNo'),('opacreadinghistory','1','','If ON, enables display of Patron Circulation History in OPAC','YesNo'),('OpacRenewalAllowed','0',NULL,'If ON, users can renew their issues directly from their OPAC account','YesNo'),('OpacRenewalBranch','checkoutbranch','itemhomebranch|patronhomebranch|checkoutbranch|null','Choose how the branch for an OPAC renewal is recorded in statistics','Choice'),('OpacResetPassword','0','','Shows the \'Forgot your password?\' link in the OPAC','YesNo'),('OPACResultsLibrary','homebranch','homebranch|holdingbranch','Defines whether the OPAC displays the holding or home branch in search results when using XSLT','Choice'),('OPACResultsSidebar','','70|10','Define HTML to be included on the search results page, underneath the facets sidebar','Textarea'),('OPACSearchForTitleIn','<li><a href=\"http://worldcat.org/search?q={TITLE}\" target=\"_blank\">Andre bibliotek (WorldCat)</a></li><li><a href=\"http://www.scholar.google.com/scholar?q={TITLE}\" target=\"_blank\">Andre databaser (Google Scholar)</a></li><li><a href=\"http://www.bookfinder.com/search/?author={AUTHOR}&amp;title={TITLE}&amp;st=xl&amp;ac=qr\" target=\"_blank\">Nettbutikker (Bookfinder.com)</a></li>','70|10','Enter the HTML that will appear in the \'Search for this title in\' box on the detail page in the OPAC.  Enter {TITLE}, {AUTHOR}, or {ISBN} in place of their respective variables in the URL. Leave blank to disable \'More Searches\' menu.','Textarea'),('OpacSeparateHoldings','0',NULL,'Separate current branch holdings from other holdings (OPAC)','YesNo'),('OpacSeparateHoldingsBranch','homebranch','homebranch|holdingbranch','Branch used to separate holdings (OPAC)','Choice'),('opacSerialDefaultTab','subscriptions','holdings|serialcollection|subscriptions','Define the default tab for serials in OPAC.','Choice'),('OPACSerialIssueDisplayCount','3','','Number of serial issues to display per subscription in the OPAC','Integer'),('OPACShelfBrowser','1','','Enable/disable Shelf Browser on item details page. WARNING: this feature is very resource consuming on collections with large numbers of items.','YesNo'),('OPACShowBarcode','0','','Show items barcode in holding tab','YesNo'),('OPACShowCheckoutName','0','','Displays in the OPAC the name of patron who has checked out the material. WARNING: Most sites should leave this off. It is intended for corporate or special sites which need to track who has the item.','YesNo'),('OPACShowHoldQueueDetails','none','none|priority|holds|holds_priority','Show holds details in OPAC','Choice'),('OpacShowRecentComments','0',NULL,'If ON a link to recent comments will appear in the OPAC masthead','YesNo'),('OPACShowUnusedAuthorities','1','','Show authorities that are not being used in the OPAC.','YesNo'),('OpacStarRatings','all','disable|all|details',NULL,'Choice'),('OpacSuggestionManagedBy','1','','Show the name of the staff member who managed a suggestion in OPAC','YesNo'),('OpacSuppression','0','','Turn ON the OPAC Suppression feature, requires further setup, ask your system administrator for details','YesNo'),('OpacSuppressionByIPRange','','','Restrict the suppression to IP adresses outside of the IP range','free'),('OpacSuppressionMessage','','Display this message on the redirect page for suppressed biblios','70|10','Textarea'),('OpacSuppressionRedirect','1','Redirect the opac detail page for suppressed records to an explanatory page (otherwise redirect to 404 error page)','','YesNo'),('opacthemes','bootstrap','','Define the current theme for the OPAC interface.','Themes'),('OpacTopissue','0',NULL,'If ON, enables the \'most popular items\' link on OPAC. Warning, this is an EXPERIMENTAL feature, turning ON may overload your server','YesNo'),('OPACURLOpenInNewWindow','0',NULL,'If ON, URLs in the OPAC open in a new window','YesNo'),('OPACUserCSS','',NULL,'Add CSS to be included in the OPAC in an embedded <style> tag.','free'),('OPACUserJS','','70|10','Define custom javascript for inclusion in OPAC','Textarea'),('opacuserlogin','1',NULL,'Enable or disable display of user login features','YesNo'),('OPACViewOthersSuggestions','0',NULL,'If ON, allows all suggestions to be displayed in the OPAC','YesNo'),('OPACXSLTDetailsDisplay','default','','Enable XSL stylesheet control over details page display on OPAC','Free'),('OPACXSLTListsDisplay','default','','Enable XSLT stylesheet control over lists pages display on OPAC','Free'),('OPACXSLTResultsDisplay','default','','Enable XSL stylesheet control over results page display on OPAC','Free'),('OpenLibraryCovers','0',NULL,'If ON Openlibrary book covers will be show','YesNo'),('OpenLibrarySearch','0',NULL,'If Yes Open Library search results will show in OPAC','YesNo'),('OrderPdfFormat','pdfformat::layout3pages','Controls what script is used for printing (basketgroups)','','free'),('OverDriveClientKey','','Client key for OverDrive integration','30','Free'),('OverDriveClientSecret','','Client key for OverDrive integration','30','YesNo'),('OverDriveLibraryID','','Library ID for OverDrive integration','','Integer'),('OverdueNoticeBcc','','','Email address to bcc outgoing overdue notices sent by email','free'),('OverdueNoticeCalendar','0',NULL,'Take the calendar into consideration when generating overdue notices','YesNo'),('OverduesBlockCirc','noblock','noblock|confirmation|block','When checking out an item should overdues block checkout, generate a confirmation dialogue, or allow checkout','Choice'),('OverduesBlockRenewing','allow','allow|blockitem|block','If any of patron checked out documents is late, should renewal be allowed, blocked only on overdue items or blocked on whatever checked out document','Choice'),('patronimages','0',NULL,'Enable patron images for the Staff Client','YesNo'),('PatronQuickAddFields','',NULL,'A list of fields separated by \"|\" to be displayed along with mandatory fields in the patron quick add form if chosen at patron entry','Free'),('PatronSelfModificationBorrowerUnwantedField','',NULL,'Name the fields you don\'t want to display when a patron is editing their information via the OPAC.','free'),('PatronSelfRegistration','0',NULL,'If enabled, patrons will be able to register themselves via the OPAC.','YesNo'),('PatronSelfRegistrationAdditionalInstructions','','','A free text field to display additional instructions to newly self registered patrons.','free'),('PatronSelfRegistrationBorrowerMandatoryField','surname|firstname',NULL,'Choose the mandatory fields for a patron\'s account, when registering via the OPAC.','free'),('PatronSelfRegistrationBorrowerUnwantedField','',NULL,'Name the fields you don\'t want to display when registering a new patron via the OPAC.','free'),('PatronSelfRegistrationDefaultCategory','','','A patron registered via the OPAC will receive a borrower category code set in this system preference.','free'),('PatronSelfRegistrationEmailMustBeUnique','0','If set, the field borrowers.email will be considered as a unique field on self registering',NULL,'YesNo'),('PatronSelfRegistrationExpireTemporaryAccountsDelay','0',NULL,'If PatronSelfRegistrationDefaultCategory is enabled, this system preference controls how long a patron can have a temporary status before the account is deleted automatically. It is an integer value representing a number of days to wait before deleting a temporary patron account. Setting it to 0 disables the deleting of temporary accounts.','Integer'),('PatronSelfRegistrationLibraryList','',NULL,'Only display libraries listed. If empty, all libraries are displayed.','Free'),('PatronSelfRegistrationPrefillForm','1',NULL,'Display password and prefill login form after a patron has self registered','YesNo'),('PatronSelfRegistrationVerifyByEmail','0',NULL,'If enabled, any patron attempting to register themselves via the OPAC will be required to verify themselves via email to activate his or her account.','YesNo'),('PatronsPerPage','20','20','Number of Patrons Per Page displayed by default','Integer'),('PayPalChargeDescription','Koha fee payment',NULL,'This preference defines what the user will see the charge listed as in PayPal','Free'),('PayPalPwd','',NULL,'Your PayPal API password','Free'),('PayPalSandboxMode','1',NULL,'If enabled, the system will use PayPal\'s sandbox server for testing, rather than the production server.','YesNo'),('PayPalSignature','',NULL,'Your PayPal API signature','Free'),('PayPalUser','',NULL,'Your PayPal API username ( email address )','Free'),('Persona','0','','Use Mozilla Persona for login','YesNo'),('PrefillItem','0','','When a new item is added, should it be prefilled with last created item values?','YesNo'),('previousIssuesDefaultSortOrder','asc','asc|desc','Specify the sort order of Previous Issues on the circulation page','Choice'),('printcirculationslips','1','','If ON, enable printing circulation receipts','YesNo'),('PrintNoticesMaxLines','0','','If greater than 0, sets the maximum number of lines an overdue notice will print. If the number of items is greater than this number, the notice will end with a warning asking the borrower to check their online account for a full list of overdue items.','Integer'),('QueryAutoTruncate','1',NULL,'If ON, query truncation is enabled by default','YesNo'),('QueryFuzzy','1',NULL,'If ON, enables fuzzy option for searches','YesNo'),('QueryStemming','1',NULL,'If ON, enables query stemming','YesNo'),('QueryWeightFields','1',NULL,'If ON, enables field weighting','YesNo'),('QuoteOfTheDay','0',NULL,'Enable or disable display of Quote of the Day on the OPAC home page','YesNo'),('RandomizeHoldsQueueWeight','0',NULL,'if ON, the holds queue in circulation will be randomized, either based on all location codes, or by the location codes specified in StaticHoldsQueueWeight','YesNo'),('RecordLocalUseOnReturn','0',NULL,'If ON, statistically record returns of unissued items as local use, instead of return','YesNo'),('RefundLostOnReturnControl','CheckinLibrary','CheckinLibrary|ItemHomeBranch|ItemHoldingBranch','If a lost item is returned, choose which branch to pick rules for refunding.','Choice'),('RenewalPeriodBase','date_due','date_due|now','Set whether the renewal date should be counted from the date_due or from the moment the Patron asks for renewal ','Choice'),('RenewalSendNotice','0','',NULL,'YesNo'),('RenewSerialAddsSuggestion','0',NULL,'If ON, adds a new suggestion at serial subscription renewal','YesNo'),('RentalFeesCheckoutConfirmation','0',NULL,'Allow user to confirm when checking out an item with rental fees.','YesNo'),('RentalsInNoissuesCharge','1',NULL,'Rental charges block checkouts (added to noissuescharge).','YesNo'),('ReplyToDefault','',NULL,'Use this email address as the replyto in emails','Free'),('ReportsLog','0',NULL,'If ON, log information about reports.','YesNo'),('RequestOnOpac','1',NULL,'If ON, globally enables patron holds on OPAC','YesNo'),('ReservesControlBranch','PatronLibrary','ItemHomeLibrary|PatronLibrary','Branch checked for members reservations rights','Choice'),('ReservesMaxPickUpDelay','7','','Define the Maximum delay to pick up an item on hold','Integer'),('ReservesNeedReturns','1','','If ON, a hold placed on an item available in this library must be checked-in, otherwise, a hold on a specific item, that is in the library & available is considered available','YesNo'),('RestrictedPageContent','',NULL,'HTML content of the restricted page','TextArea'),('RestrictedPageLocalIPs','',NULL,'Beginning of IP addresses considered as local (comma separated ex: \"127.0.0,127.0.2\")','Free'),('RestrictedPageTitle','',NULL,'Title of the restricted page (breadcrumb and header)','Free'),('RestrictionBlockRenewing','0',NULL,'If patron is restricted, should renewal be allowed or blocked','YesNo'),('ReturnBeforeExpiry','0',NULL,'If ON, checkout will be prevented if returndate is after patron card expiry','YesNo'),('ReturnLog','1',NULL,'If ON, enables the circulation (returns) log','YesNo'),('ReturnpathDefault','',NULL,'Use this email address as return path or bounce address for undeliverable emails','Free'),('ReturnToShelvingCart','0','','If set, when any item is \'checked in\', it\'s location code will be changed to CART.','YesNo'),('reviewson','1','','If ON, enables patron reviews of bibliographic records in the OPAC','YesNo'),('RisExportAdditionalFields','',NULL,'Define additional RIS tags to export from MARC records in YAML format as an associative array with either a marc tag/subfield combination as the value, or a list of tag/subfield combinations.','textarea'),('RoutingListAddReserves','1','','If ON the patrons on routing lists are automatically added to holds on the issue.','YesNo'),('RoutingListNote','To change this note edit <a href=\"/cgi-bin/koha/admin/preferences.pl?op=search&searchfield=RoutingListNote#jumped\">RoutingListNote</a> system preference.','70|10','Define a note to be shown on all routing lists','Textarea'),('RoutingSerials','1',NULL,'If ON, serials routing is enabled','YesNo'),('SCOUserCSS','',NULL,'Add CSS to be included in the SCO module in an embedded <style> tag.','free'),('SCOUserJS','',NULL,'Define custom javascript for inclusion in the SCO module','free'),('SearchEngine','Zebra','Elasticsearch|Zebra','Search Engine','Choice'),('SearchMyLibraryFirst','0',NULL,'If ON, OPAC searches return results limited by the user\'s library by default if they are logged in','YesNo'),('SearchWithISBNVariations','0',NULL,'If enabled, search on all variations of the ISBN','YesNo'),('SelfCheckHelpMessage','','70|10','Enter HTML to include under the basic Web-based Self Checkout instructions on the Help page','Textarea'),('SelfCheckReceiptPrompt','1','NULL','If ON, print receipt dialog pops up when self checkout is finished','YesNo'),('SelfCheckTimeout','120','','Define the number of seconds before the Web-based Self Checkout times out a patron','Integer'),('SeparateHoldings','0',NULL,'Separate current branch holdings from other holdings','YesNo'),('SeparateHoldingsBranch','homebranch','homebranch|holdingbranch','Branch used to separate holdings','Choice'),('SessionRestrictionByIP','1','Check for change in remote IP address for session security. Disable only when remote IP address changes frequently.','','YesNo'),('SessionStorage','mysql','mysql|Pg|tmp','Use database or a temporary file for storing session data','Choice'),('ShelfBrowserUsesCcode','1','0','Use the item collection code when finding items for the shelf browser.','YesNo'),('ShelfBrowserUsesHomeBranch','1','1','Use the item home branch when finding items for the shelf browser.','YesNo'),('ShelfBrowserUsesLocation','1','1','Use the item location when finding items for the shelf browser.','YesNo'),('ShowAllCheckins','0','','Show all checkins','YesNo'),('ShowPatronImageInWebBasedSelfCheck','0','','If ON, displays patron image when a patron uses web-based self-checkout','YesNo'),('ShowReviewer','full','none|full|first|surname|firstandinitial|username','Choose how a commenter\'s identity is presented alongside comments in the OPAC','Choice'),('ShowReviewerPhoto','1','','If ON, photo of reviewer will be shown beside comments in OPAC','YesNo'),('SlipCSS','',NULL,'Slips CSS url.','free'),('SMSSendDriver','NO::LinkMobilityHTTP','','Sets which SMS::Send driver is used to send SMS messages.','free'),('SMSSendPassword','smspass','','Password used to send SMS messages','free'),('SMSSendUsername','smsuser','','Username/Login used to send SMS messages','free'),('SocialNetworks','0','','Enable/Disable social networks links in opac detail pages','YesNo'),('SpecifyDueDate','1','','Define whether to display \"Specify Due Date\" form in Circulation','YesNo'),('SpecifyReturnDate','1','','Define whether to display \"Specify Return Date\" form in Circulation','YesNo'),('SpineLabelAutoPrint','0','','If this setting is turned on, a print dialog will automatically pop up for the quick spine label printer.','YesNo'),('SpineLabelFormat','<itemcallnumber><copynumber>','30|10','This preference defines the format for the quick spine label printer. Just list the fields you would like to see in the order you would like to see them, surrounded by <>, for example <itemcallnumber>.','Textarea'),('SpineLabelShowPrintOnBibDetails','0','','If turned on, a \"Print Label\" link will appear for each item on the bib details page in the staff interface.','YesNo'),('staffClientBaseURL','',NULL,'Specify the base URL of the staff client','free'),('StaffDetailItemSelection','1',NULL,'Enable item selection in record detail page','YesNo'),('StaffSearchResultsDisplayBranch','holdingbranch','holdingbranch|homebranch','Controls the display of the home or holding branch for staff search results','Choice'),('StaffSerialIssueDisplayCount','3','','Number of serial issues to display per subscription in the Staff client','Integer'),('StaticHoldsQueueWeight','0',NULL,'Specify a list of library location codes separated by commas -- the list of codes will be traversed and weighted with first values given higher weight for holds fulfillment -- alternatively, if RandomizeHoldsQueueWeight is set, the list will be randomly selective','Integer'),('StatisticsFields','location|itype|ccode',NULL,'Define Fields (from the items table) used for statistics members','Free'),('StoreLastBorrower','0','','If ON, the last borrower to return an item will be stored in items.last_returned_by','YesNo'),('SubfieldsToAllowForRestrictedBatchmod','','Define a list of subfields for which edition is authorized when items_batchmod_restricted permission is enabled, separated by spaces. Example: 995$f 995$h 995$j',NULL,'Free'),('SubfieldsToAllowForRestrictedEditing','','Define a list of subfields for which edition is authorized when edit_items_restricted permission is enabled, separated by spaces. Example: 995$f 995$h 995$j',NULL,'Free'),('SubfieldsToUseWhenPrefill','','','Define a list of subfields to use when prefilling items (separated by space)','Free'),('SubscriptionDuplicateDroppedInput','','','List of fields which must not be rewritten when a subscription is duplicated (Separated by pipe |)','Free'),('SubscriptionHistory','simplified','simplified|full','Define the display preference for serials issue history in OPAC','Choice'),('SubscriptionLog','1',NULL,'If ON, enables subscriptions log','YesNo'),('suggestion','1','','If ON, enables patron suggestions feature in OPAC','YesNo'),('SuspendHoldsIntranet','1','Allow holds to be suspended from the intranet.',NULL,'YesNo'),('SuspendHoldsOpac','1','Allow holds to be suspended from the OPAC.',NULL,'YesNo'),('SvcMaxReportRows','10',NULL,'Maximum number of rows to return via the report web service.','Integer'),('SwitchOnSiteCheckouts','0',NULL,'Automatically switch an on-site checkout to a normal checkout','YesNo'),('SyndeticsAuthorNotes','0','','Display Notes about the Author on OPAC from Syndetics','YesNo'),('SyndeticsAwards','0','','Display Awards on OPAC from Syndetics','YesNo'),('SyndeticsClientCode','0','','Client Code for using Syndetics Solutions content','free'),('SyndeticsCoverImages','0','','Display Cover Images from Syndetics','YesNo'),('SyndeticsCoverImageSize','MC','MC|LC','Choose the size of the Syndetics Cover Image to display on the OPAC detail page, MC is Medium, LC is Large','Choice'),('SyndeticsEditions','0','','Display Editions from Syndetics','YesNo'),('SyndeticsEnabled','0','','Turn on Syndetics Enhanced Content','YesNo'),('SyndeticsExcerpt','0','','Display Excerpts and first chapters on OPAC from Syndetics','YesNo'),('SyndeticsReviews','0','','Display Reviews on OPAC from Syndetics','YesNo'),('SyndeticsSeries','0','','Display Series information on OPAC from Syndetics','YesNo'),('SyndeticsSummary','0','','Display Summary Information from Syndetics','YesNo'),('SyndeticsTOC','0','','Display Table of Content information from Syndetics','YesNo'),('TagsEnabled','1','','Enables or disables all tagging features.  This is the main switch for tags.','YesNo'),('TagsExternalDictionary','','','Path on server to local ispell executable, used to set $Lingua::Ispell::path  This dictionary is used as a \"whitelist\" of pre-allowed tags.',''),('TagsInputOnDetail','1','','Allow users to input tags from the detail page.','YesNo'),('TagsInputOnList','0','','Allow users to input tags from the search results list.','YesNo'),('TagsModeration','0','','Require tags from patrons to be approved before becoming visible.','YesNo'),('TagsShowOnDetail','10','','Number of tags to display on detail page.  0 is off.','Integer'),('TagsShowOnList','6','','Number of tags to display on search results list.  0 is off.','Integer'),('template','prog','','Define the preferred staff interface template','Themes'),('ThingISBN','0','','Use with FRBRizeEditions. If ON, Koha will use the ThingISBN web service in the Editions tab on the detail pages.','YesNo'),('TimeFormat','24hr','12hr|24hr','Defines the global time format for visual output.','Choice'),('timeout','1d',NULL,'Inactivity timeout for cookies authentication','Free'),('todaysIssuesDefaultSortOrder','desc','asc|desc','Specify the sort order of Todays Issues on the circulation page','Choice'),('TraceCompleteSubfields','0','0','Force subject tracings to only match complete subfields.','YesNo'),('TraceSubjectSubdivisions','0','1','Create searches on all subdivisions for subject tracings.','YesNo'),('TrackClicks','0',NULL,'Track links clicked','Integer'),('TrackLastPatronActivity','0',NULL,'If set, the field borrowers.lastseen will be updated everytime a patron is seen','YesNo'),('TransfersMaxDaysWarning','3',NULL,'Define the days before a transfer is suspected of having a problem','Integer'),('TransferWhenCancelAllWaitingHolds','0',NULL,'Transfer items when cancelling all waiting holds','YesNo'),('UNIMARCAuthorityField100','afrey50      ba0',NULL,'Define the contents of UNIMARC authority control field 100 position 08-35','Textarea'),('UNIMARCAuthorsFacetsSeparator',', ',NULL,'UNIMARC authors facets separator','short'),('UNIMARCField100Language','fre',NULL,'UNIMARC field 100 default language','short'),('UniqueItemFields','barcode','','Space-separated list of fields that should be unique (used in acquisition module for item creation). Fields must be valid SQL column names of items table','Free'),('UpdateNotForLoanStatusOnCheckin','','NULL','This is a list of value pairs. When an item is checked in, if the not for loan value on the left matches the items not for loan value it will be updated to the right-hand value. E.g. \'-1: 0\' will cause an item that was set to \'Ordered\' to now be available for loan. Each pair of values should be on a separate line.','Free'),('UpdateTotalIssuesOnCirc','0',NULL,'Whether to update the totalissues field in the biblio on each circ.','YesNo'),('uppercasesurnames','0',NULL,'If ON, surnames are converted to upper case in patron entry form','YesNo'),('URLLinkText','',NULL,'Text to display as the link anchor in the OPAC','free'),('UsageStats','0',NULL,'Share anonymous usage data on the Hea Koha community website.','YesNo'),('UsageStatsCountry','',NULL,'The country where your library is located, to be shown on the Hea Koha community website','Choice'),('UsageStatsID','',NULL,'This preference is part of Koha but it should not be deleted or updated manually.','Free'),('UsageStatsLastUpdateTime','',NULL,'This preference is part of Koha but it should not be deleted or updated manually.','Free'),('UsageStatsLibraryName','',NULL,'The library name to be shown on Hea Koha community website','Free'),('UsageStatsLibraryType','','public|school|academic|research|private|societyAssociation|corporate|government|religiousOrg|subscription','The library type to be shown on the Hea Koha community website','Choice'),('UsageStatsLibraryUrl','',NULL,'The library URL to be shown on Hea Koha community website','Free'),('UseAuthoritiesForTracings','1','0','Use authority record numbers for subject tracings instead of heading strings.','YesNo'),('UseBranchTransferLimits','0','','If ON, Koha will will use the rules defined in branch_transfer_limits to decide if an item transfer should be allowed.','YesNo'),('UseControlNumber','0','','If ON, record control number (w subfields) and control number (001) are used for linking of bibliographic records.','YesNo'),('UseCourseReserves','0',NULL,'Enable the course reserves feature.','YesNo'),('useDaysMode','Calendar','Calendar|Days|Datedue','Choose the method for calculating due date: select Calendar to use the holidays module, and Days to ignore the holidays module','Choice'),('useDischarge','','','Allows librarians to discharge borrowers and borrowers to request a discharge','YesNo'),('UseICU','0','1','Tell Koha if ICU indexing is in use for Zebra or not.','YesNo'),('UseKohaPlugins','0','','Enable or disable the ability to use Koha Plugins.','YesNo'),('UseQueryParser','0',NULL,'If enabled, try to use QueryParser for queries.','YesNo'),('UseTransportCostMatrix','0','','Use Transport Cost Matrix when filling holds','YesNo'),('UseWYSIWYGinSystemPreferences','0','','Show WYSIWYG editor when editing certain HTML system preferences.','YesNo'),('Version','16.1104000',NULL,'The Koha database version. WARNING: Do not change this value manually, it is maintained by the webinstaller',NULL),('viewISBD','1','','Allow display of ISBD view of bibiographic records','YesNo'),('viewLabeledMARC','0','','Allow display of labeled MARC view of bibiographic records','YesNo'),('viewMARC','1','','Allow display of MARC view of bibiographic records','YesNo'),('virtualshelves','1','','If ON, enables Lists management','YesNo'),('WaitingNotifyAtCheckin','0',NULL,'If ON, notify librarians of waiting holds for the patron whose items they are checking in.','YesNo'),('WebBasedSelfCheck','0',NULL,'If ON, enables the web-based self-check system','YesNo'),('WhenLostChargeReplacementFee','1',NULL,'If ON, Charge the replacement price when a patron loses an item.','YesNo'),('WhenLostForgiveFine','0',NULL,'If ON, Forgives the fines on an item when it is lost.','YesNo'),('XISBN','0','','Use with FRBRizeEditions. If ON, Koha will use the OCLC xISBN web service in the Editions tab on the detail pages. See: http://www.worldcat.org/affiliate/webservices/xisbn/app.jsp','YesNo'),('XISBNDailyLimit','999','','The xISBN Web service is free for non-commercial use when usage does not exceed 1000 requests per day','Integer'),('XSLTDetailsDisplay','default','','Enable XSL stylesheet control over details page display on intranet','Free'),('XSLTListsDisplay','default','','Enable XSLT stylesheet control over lists pages display on intranet','Free'),('XSLTResultsDisplay','default','','Enable XSL stylesheet control over results page display on intranet','Free'),('z3950AuthorAuthFields','701,702,700',NULL,'Define the MARC biblio fields for Personal Name Authorities to fill biblio.author','free'),('z3950NormalizeAuthor','0','','If ON, Personal Name Authorities will replace authors in biblio.author','YesNo');
/*!40000 ALTER TABLE `systempreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `entry` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_all`
--

DROP TABLE IF EXISTS `tags_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_all` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `biblionumber` int(11) NOT NULL,
  `term` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` int(4) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `tags_borrowers_fk_1` (`borrowernumber`),
  KEY `tags_biblionumber_fk_1` (`biblionumber`),
  CONSTRAINT `tags_biblionumber_fk_1` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tags_borrowers_fk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_all`
--

LOCK TABLES `tags_all` WRITE;
/*!40000 ALTER TABLE `tags_all` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_approval`
--

DROP TABLE IF EXISTS `tags_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_approval` (
  `term` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0',
  `date_approved` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `weight_total` int(9) NOT NULL DEFAULT '1',
  PRIMARY KEY (`term`),
  KEY `tags_approval_borrowers_fk_1` (`approved_by`),
  CONSTRAINT `tags_approval_borrowers_fk_1` FOREIGN KEY (`approved_by`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_approval`
--

LOCK TABLES `tags_approval` WRITE;
/*!40000 ALTER TABLE `tags_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_index`
--

DROP TABLE IF EXISTS `tags_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_index` (
  `term` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `biblionumber` int(11) NOT NULL,
  `weight` int(9) NOT NULL DEFAULT '1',
  PRIMARY KEY (`term`,`biblionumber`),
  KEY `tags_index_biblionumber_fk_1` (`biblionumber`),
  CONSTRAINT `tags_index_biblionumber_fk_1` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tags_index_term_fk_1` FOREIGN KEY (`term`) REFERENCES `tags_approval` (`term`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_index`
--

LOCK TABLES `tags_index` WRITE;
/*!40000 ALTER TABLE `tags_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_holdsqueue`
--

DROP TABLE IF EXISTS `tmp_holdsqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_holdsqueue` (
  `biblionumber` int(11) DEFAULT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `barcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `firstname` text COLLATE utf8_unicode_ci,
  `phone` text COLLATE utf8_unicode_ci,
  `borrowernumber` int(11) NOT NULL,
  `cardnumber` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reservedate` date DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `itemcallnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holdingbranch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickbranch` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `item_level_request` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_holdsqueue`
--

LOCK TABLES `tmp_holdsqueue` WRITE;
/*!40000 ALTER TABLE `tmp_holdsqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_holdsqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_cost`
--

DROP TABLE IF EXISTS `transport_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_cost` (
  `frombranch` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `tobranch` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cost` decimal(6,2) NOT NULL,
  `disable_transfer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`frombranch`,`tobranch`),
  KEY `transport_cost_ibfk_2` (`tobranch`),
  CONSTRAINT `transport_cost_ibfk_1` FOREIGN KEY (`frombranch`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transport_cost_ibfk_2` FOREIGN KEY (`tobranch`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_cost`
--

LOCK TABLES `transport_cost` WRITE;
/*!40000 ALTER TABLE `transport_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `transport_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploaded_files`
--

DROP TABLE IF EXISTS `uploaded_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploaded_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hashvalue` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `filename` text COLLATE utf8_unicode_ci NOT NULL,
  `dir` text COLLATE utf8_unicode_ci NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `dtcreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uploadcategorycode` tinytext COLLATE utf8_unicode_ci,
  `owner` int(11) DEFAULT NULL,
  `public` tinyint(4) DEFAULT NULL,
  `permanent` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploaded_files`
--

LOCK TABLES `uploaded_files` WRITE;
/*!40000 ALTER TABLE `uploaded_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploaded_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `module_bit` int(11) NOT NULL DEFAULT '0',
  `code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `user_permissions_ibfk_1` (`borrowernumber`),
  KEY `user_permissions_ibfk_2` (`module_bit`,`code`),
  CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_permissions_ibfk_2` FOREIGN KEY (`module_bit`, `code`) REFERENCES `permissions` (`module_bit`, `code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userflags`
--

DROP TABLE IF EXISTS `userflags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userflags` (
  `bit` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flagdesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaulton` int(11) DEFAULT NULL,
  PRIMARY KEY (`bit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userflags`
--

LOCK TABLES `userflags` WRITE;
/*!40000 ALTER TABLE `userflags` DISABLE KEYS */;
INSERT INTO `userflags` VALUES (0,'superlibrarian','Access to all librarian functions',0),(1,'circulate','Check out and check in items',0),(2,'catalogue','<b>Required for staff login.</b> Staff access, allows viewing of catalogue in staff client.',0),(3,'parameters','Manage Koha system settings (Administration panel)',0),(4,'borrowers','Add or modify patrons',0),(5,'permissions','Set user permissions',0),(6,'reserveforothers','Place and modify holds for patrons',0),(9,'editcatalogue','Edit catalog (Modify bibliographic/holdings data)',0),(10,'updatecharges','Manage patrons fines and fees',0),(11,'acquisition','Acquisition and/or suggestion management',0),(12,'management','Set library management parameters (deprecated)',0),(13,'tools','Use all tools (expand for granular tools permissions)',0),(14,'editauthorities','Edit authorities',0),(15,'serials','Manage serial subscriptions',0),(16,'reports','Allow access to the reports module',0),(17,'staffaccess','Allow staff members to modify permissions for other staff members',0),(18,'coursereserves','Course reserves',0),(19,'plugins','Koha plugins',0),(20,'lists','Lists',0);
/*!40000 ALTER TABLE `userflags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_edi_accounts`
--

DROP TABLE IF EXISTS `vendor_edi_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_edi_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_activity` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `download_directory` text COLLATE utf8_unicode_ci,
  `upload_directory` text COLLATE utf8_unicode_ci,
  `san` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_code_qualifier` varchar(3) COLLATE utf8_unicode_ci DEFAULT '14',
  `transport` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'FTP',
  `quotes_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `invoices_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `orders_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `responses_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `auto_orders` tinyint(1) NOT NULL DEFAULT '0',
  `shipment_budget` int(11) DEFAULT NULL,
  `plugin` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `vendorid` (`vendor_id`),
  KEY `shipmentbudget` (`shipment_budget`),
  CONSTRAINT `vfk_shipment_budget` FOREIGN KEY (`shipment_budget`) REFERENCES `aqbudgets` (`budget_id`),
  CONSTRAINT `vfk_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `aqbooksellers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_edi_accounts`
--

LOCK TABLES `vendor_edi_accounts` WRITE;
/*!40000 ALTER TABLE `vendor_edi_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_edi_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualshelfcontents`
--

DROP TABLE IF EXISTS `virtualshelfcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualshelfcontents` (
  `shelfnumber` int(11) NOT NULL DEFAULT '0',
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) DEFAULT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `borrowernumber` int(11) DEFAULT NULL,
  KEY `shelfnumber` (`shelfnumber`),
  KEY `biblionumber` (`biblionumber`),
  KEY `shelfcontents_ibfk_3` (`borrowernumber`),
  CONSTRAINT `shelfcontents_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shelfcontents_ibfk_3` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `virtualshelfcontents_ibfk_1` FOREIGN KEY (`shelfnumber`) REFERENCES `virtualshelves` (`shelfnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualshelfcontents`
--

LOCK TABLES `virtualshelfcontents` WRITE;
/*!40000 ALTER TABLE `virtualshelfcontents` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualshelfcontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualshelfshares`
--

DROP TABLE IF EXISTS `virtualshelfshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualshelfshares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelfnumber` int(11) NOT NULL,
  `borrowernumber` int(11) DEFAULT NULL,
  `invitekey` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sharedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `virtualshelfshares_ibfk_1` (`shelfnumber`),
  KEY `virtualshelfshares_ibfk_2` (`borrowernumber`),
  CONSTRAINT `virtualshelfshares_ibfk_1` FOREIGN KEY (`shelfnumber`) REFERENCES `virtualshelves` (`shelfnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `virtualshelfshares_ibfk_2` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualshelfshares`
--

LOCK TABLES `virtualshelfshares` WRITE;
/*!40000 ALTER TABLE `virtualshelfshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualshelfshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualshelves`
--

DROP TABLE IF EXISTS `virtualshelves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualshelves` (
  `shelfnumber` int(11) NOT NULL AUTO_INCREMENT,
  `shelfname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `category` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortfield` varchar(16) COLLATE utf8_unicode_ci DEFAULT 'title',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_on` datetime NOT NULL,
  `allow_add` tinyint(1) DEFAULT '0',
  `allow_delete_own` tinyint(1) DEFAULT '1',
  `allow_delete_other` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`shelfnumber`),
  KEY `virtualshelves_ibfk_1` (`owner`),
  CONSTRAINT `virtualshelves_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualshelves`
--

LOCK TABLES `virtualshelves` WRITE;
/*!40000 ALTER TABLE `virtualshelves` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualshelves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z3950servers`
--

DROP TABLE IF EXISTS `z3950servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z3950servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `db` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `servername` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `checked` smallint(6) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `syntax` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeout` int(11) NOT NULL DEFAULT '0',
  `servertype` enum('zed','sru') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'zed',
  `encoding` text COLLATE utf8_unicode_ci,
  `recordtype` enum('authority','biblio') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'biblio',
  `sru_options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sru_fields` mediumtext COLLATE utf8_unicode_ci,
  `add_xslt` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z3950servers`
--

LOCK TABLES `z3950servers` WRITE;
/*!40000 ALTER TABLE `z3950servers` DISABLE KEYS */;
INSERT INTO `z3950servers` VALUES (1,'porbase.bnportugal.pt',210,'porbase','','','BIBLIOTECA NACIONAL',1,0,'UNIMARC',0,'zed','ISO_5426','biblio','','','');
/*!40000 ALTER TABLE `z3950servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zebraqueue`
--

DROP TABLE IF EXISTS `zebraqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zebraqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biblio_auth_number` bigint(20) unsigned NOT NULL DEFAULT '0',
  `operation` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `server` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `done` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `zebraqueue_lookup` (`server`,`biblio_auth_number`,`operation`,`done`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zebraqueue`
--

LOCK TABLES `zebraqueue` WRITE;
/*!40000 ALTER TABLE `zebraqueue` DISABLE KEYS */;
INSERT INTO `zebraqueue` VALUES (1,1,'specialUpdate','biblioserver',1,'2017-03-07 12:59:14');
/*!40000 ALTER TABLE `zebraqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'koha_name'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-08 16:26:30
