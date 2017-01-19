/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.17 : Database - careserve
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`careserve` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `careserve`;

/*Table structure for table `ca_guest_info` */

DROP TABLE IF EXISTS `ca_guest_info`;

CREATE TABLE `ca_guest_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `address` text,
  `email` varchar(100) DEFAULT NULL,
  `landline` varchar(25) DEFAULT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_guest_info` */

/*Table structure for table `ca_reservation` */

DROP TABLE IF EXISTS `ca_reservation`;

CREATE TABLE `ca_reservation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guestid` bigint(20) NOT NULL DEFAULT '0',
  `roomid` bigint(20) NOT NULL DEFAULT '0',
  `resdate` date NOT NULL,
  `restimefrom` time DEFAULT NULL,
  `restimeto` time DEFAULT NULL,
  `estguest` int(11) NOT NULL DEFAULT '1',
  `dppaid` bit(1) NOT NULL DEFAULT b'0',
  `dpamount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_reservation` */

/*Table structure for table `ca_reservesetting` */

DROP TABLE IF EXISTS `ca_reservesetting`;

CREATE TABLE `ca_reservesetting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allowmindp` bit(1) NOT NULL DEFAULT b'1',
  `dpratetype` int(11) NOT NULL DEFAULT '0',
  `dpvalue` decimal(10,2) NOT NULL DEFAULT '0.00',
  `allowresperiod` bit(1) NOT NULL DEFAULT b'1',
  `maxreservedays` int(11) NOT NULL DEFAULT '5',
  `sendresmail` bit(1) NOT NULL DEFAULT b'1',
  `recstatus` bit(1) NOT NULL DEFAULT b'1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_reservesetting` */

/*Table structure for table `ca_roles` */

DROP TABLE IF EXISTS `ca_roles`;

CREATE TABLE `ca_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roledesc` varchar(150) NOT NULL DEFAULT 'Default Role',
  `allowlogin` bit(1) DEFAULT b'1',
  `allowbilling` bit(1) DEFAULT b'1',
  `allowreserve` bit(1) DEFAULT b'1',
  `allowinventory` bit(1) DEFAULT b'1',
  `allowcashier` bit(1) DEFAULT b'1',
  `allowsettings` bit(1) DEFAULT b'1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_roles` */

/*Table structure for table `ca_room_rates` */

DROP TABLE IF EXISTS `ca_room_rates`;

CREATE TABLE `ca_room_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `regular` decimal(10,2) NOT NULL DEFAULT '0.00',
  `regtimein` time DEFAULT NULL,
  `regtimeout` time DEFAULT NULL,
  `overnight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ovntimein` time DEFAULT NULL,
  `ovntimeout` time DEFAULT NULL,
  `extension` decimal(10,2) NOT NULL DEFAULT '0.00',
  `extratebase` int(11) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`rmtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_room_rates` */

/*Table structure for table `ca_rooms` */

DROP TABLE IF EXISTS `ca_rooms`;

CREATE TABLE `ca_rooms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) NOT NULL DEFAULT '0',
  `roomcode` varchar(25) NOT NULL,
  `roomdesc` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_rooms` */

/*Table structure for table `ca_roomtype` */

DROP TABLE IF EXISTS `ca_roomtype`;

CREATE TABLE `ca_roomtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typedesc` varchar(50) DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_roomtype` */

/*Table structure for table `ca_users` */

DROP TABLE IF EXISTS `ca_users`;

CREATE TABLE `ca_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginid` varchar(25) NOT NULL,
  `loginpw` text NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `roleid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`firstname`,`lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
