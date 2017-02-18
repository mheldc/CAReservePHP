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

/*Table structure for table `ca_booking` */

DROP TABLE IF EXISTS `ca_booking`;

CREATE TABLE `ca_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bksrctypeid` int(11) NOT NULL DEFAULT '0',
  `rsvid` bigint(20) NOT NULL DEFAULT '0',
  `guestid` bigint(20) NOT NULL DEFAULT '0',
  `rmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `roomid` bigint(20) NOT NULL DEFAULT '0',
  `guesta` int(11) NOT NULL DEFAULT '0',
  `guestc` int(11) NOT NULL DEFAULT '0',
  `isovernight` bit(1) NOT NULL DEFAULT b'0',
  `bkstat` bit(1) NOT NULL DEFAULT b'1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`rsvid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking` */

insert  into `ca_booking`(`id`,`bksrctypeid`,`rsvid`,`guestid`,`rmtypeid`,`roomid`,`guesta`,`guestc`,`isovernight`,`bkstat`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,0,0,3,4,29,5,3,'\0','',0,'2017-02-16 22:07:16',0,'2017-02-16 22:07:16'),(2,0,0,4,4,29,5,3,'\0','',0,'2017-02-16 22:10:11',0,'2017-02-16 22:10:11'),(3,0,0,5,3,17,5,5,'\0','',0,'2017-02-16 22:34:45',0,'2017-02-16 22:34:45'),(4,0,0,6,1,8,2,2,'','',0,'2017-02-17 19:25:54',0,'2017-02-17 19:25:54');

/*Table structure for table `ca_booking_guest` */

DROP TABLE IF EXISTS `ca_booking_guest`;

CREATE TABLE `ca_booking_guest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bkid` bigint(20) NOT NULL DEFAULT '0',
  `bcid` bigint(20) NOT NULL DEFAULT '0',
  `gname` varchar(50) DEFAULT NULL,
  `gclass` int(11) NOT NULL DEFAULT '1',
  `timein` time DEFAULT NULL,
  `expdate` datetime DEFAULT NULL,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`bkid`,`bcid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking_guest` */

/*Table structure for table `ca_booking_items` */

DROP TABLE IF EXISTS `ca_booking_items`;

CREATE TABLE `ca_booking_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bkid` bigint(20) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `itemdesc` varchar(150) NOT NULL DEFAULT 'Item-0',
  `itemqty` int(11) NOT NULL DEFAULT '1',
  `itemamt` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ispaid` bit(1) NOT NULL DEFAULT b'0',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking_items` */

insert  into `ca_booking_items`(`id`,`bkid`,`itemtype`,`itemdesc`,`itemqty`,`itemamt`,`ispaid`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,2,1,'CA-11:Cabana 11',1,'1000.00','',0,'2017-02-16 22:10:11',0,'2017-02-18 21:49:57'),(2,2,2,'Additional Guest (Adult) x 5',5,'1000.00','',0,'2017-02-16 22:10:11',0,'2017-02-18 21:49:57'),(3,2,2,'Additional Guest (Child) x 3',3,'300.00','',0,'2017-02-16 22:10:11',0,'2017-02-18 21:49:57'),(4,2,2,'Additional Guest (Adult) x 5',5,'0.00','',0,'2017-02-16 22:10:12',0,'2017-02-18 21:49:57'),(5,3,1,'GA-04:Gazebo 4',1,'1000.00','',0,'2017-02-16 22:34:45',0,'2017-02-18 21:21:49'),(6,3,2,'Additional Guest (Adult) x 5',5,'1000.00','',0,'2017-02-16 22:34:45',0,'2017-02-18 21:21:49'),(7,3,2,'Additional Guest (Child) x 5',5,'500.00','',0,'2017-02-16 22:34:45',0,'2017-02-18 21:21:49'),(8,3,2,'Additional Guest (Adult) x 2',2,'0.00','',0,'2017-02-16 22:34:45',0,'2017-02-18 21:21:49'),(9,4,1,'UM-08:Umbrella 8',1,'500.00','',0,'2017-02-17 19:25:54',0,'2017-02-18 21:52:11'),(10,4,2,'Additional Guest (Adult) x 2',2,'400.00','',0,'2017-02-17 19:25:54',0,'2017-02-18 21:52:11'),(11,4,2,'Additional Guest (Child) x 2',2,'200.00','',0,'2017-02-17 19:25:54',0,'2017-02-18 21:52:11'),(12,4,2,'Additional Guest (Adult) x 1',1,'0.00','',0,'2017-02-17 19:25:54',0,'2017-02-18 21:52:11');

/*Table structure for table `ca_guest_info` */

DROP TABLE IF EXISTS `ca_guest_info`;

CREATE TABLE `ca_guest_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `salutation` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `ca_guest_info` */

insert  into `ca_guest_info`(`id`,`salutation`,`lastname`,`firstname`,`middlename`,`address`,`email`,`landline`,`fax`,`mobile`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,1,'Dela Cruz','Romel','S','safasdfasd','romeldelacruz@gmail.com','6248754',NULL,'09276010064','2017-02-15 17:14:18',0,'2017-02-15 17:14:18',0),(2,1,'Dela Cruz','Romels','S','safasdfasd','romeldelacruz@gmail.com','6248754',NULL,'09276010064','2017-02-15 17:15:13',0,'2017-02-15 17:15:13',0),(3,1,'Dela Cruz','Romel','S','4450 Ampalaya Street, Brgy. Tumana, Marikina City','romeldelacruz@gmail.com','6248754',NULL,'09276010064','2017-02-16 22:07:16',0,'2017-02-16 22:07:16',0),(4,1,'Dela Cruz','Romel','S','4450 Ampalaya Street, Brgy. Tumana, Marikina City','romeldelacruz@gmail.com','6248754',NULL,'09276010064','2017-02-16 22:10:11',0,'2017-02-16 22:10:11',0),(5,1,'Dela Cruz','Romel','S','safasdfasd','romeldelacruz@gmail.com','6248754',NULL,'09276010064','2017-02-16 22:34:44',0,'2017-02-16 22:34:44',0),(6,1,'Dela Cruz','Romel','S','safasdfasd','romeldelacruz@gmail.com','6248754',NULL,'09276010064','2017-02-17 19:25:53',0,'2017-02-17 19:25:53',0);

/*Table structure for table `ca_guest_rates` */

DROP TABLE IF EXISTS `ca_guest_rates`;

CREATE TABLE `ca_guest_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gtype` varchar(25) NOT NULL DEFAULT 'xxx',
  `dayrate` double(10,2) NOT NULL DEFAULT '0.00',
  `dfrom` time DEFAULT NULL,
  `dto` time DEFAULT NULL,
  `nightrate` double(10,2) NOT NULL DEFAULT '0.00',
  `nfrom` time DEFAULT NULL,
  `nto` time DEFAULT NULL,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `ca_guest_rates` */

insert  into `ca_guest_rates`(`id`,`gtype`,`dayrate`,`dfrom`,`dto`,`nightrate`,`nfrom`,`nto`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,'Adult',150.00,'08:00:00','18:59:59',200.00,'19:00:00','07:59:59',0,'2017-02-16 20:59:25',0,'2017-02-16 20:59:25'),(2,'Child',100.00,'08:00:00','18:59:59',100.00,'19:00:00','07:59:59',0,'2017-02-16 20:59:25',0,'2017-02-16 20:59:25'),(3,'Child Below 2yo',0.00,'08:00:00','18:59:59',0.00,'19:00:00','07:59:59',0,'2017-02-16 20:59:25',0,'2017-02-16 20:59:25');

/*Table structure for table `ca_inv_audit` */

DROP TABLE IF EXISTS `ca_inv_audit`;

CREATE TABLE `ca_inv_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) NOT NULL DEFAULT '0',
  `begcount` bigint(20) NOT NULL DEFAULT '1',
  `endcount` bigint(20) NOT NULL DEFAULT '1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_inv_audit` */

/*Table structure for table `ca_inv_items` */

DROP TABLE IF EXISTS `ca_inv_items`;

CREATE TABLE `ca_inv_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemcode` varchar(25) NOT NULL DEFAULT 'xxx',
  `itemdesc` varchar(150) NOT NULL DEFAULT 'Not Defined',
  `itemunit` varchar(50) NOT NULL DEFAULT 'piece',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_inv_items` */

/*Table structure for table `ca_queue_served` */

DROP TABLE IF EXISTS `ca_queue_served`;

CREATE TABLE `ca_queue_served` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid` bigint(20) NOT NULL DEFAULT '0',
  `guestid` bigint(20) NOT NULL DEFAULT '0',
  `message` text,
  `isserved` bit(1) NOT NULL DEFAULT b'0',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`bid`,`guestid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ca_queue_served` */

insert  into `ca_queue_served`(`id`,`bid`,`guestid`,`message`,`isserved`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,3,5,'Please prepare GA-04:Gazebo 4 for guest Romel Dela Cruz for 12 pax.','',0,'2017-02-16 22:34:45',0,'2017-02-16 22:34:45'),(2,4,6,'Please prepare UM-08:Umbrella 8 for guest Romel Dela Cruz for 5 pax.','',0,'2017-02-17 19:25:54',0,'2017-02-17 19:25:54');

/*Table structure for table `ca_reservation` */

DROP TABLE IF EXISTS `ca_reservation`;

CREATE TABLE `ca_reservation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `rsid` varchar(20) NOT NULL DEFAULT 'RESV-000000-00000000',
  `guestid` bigint(20) NOT NULL DEFAULT '0',
  `rmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `roomid` bigint(20) NOT NULL DEFAULT '0',
  `rsdatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isovernight` bit(1) NOT NULL DEFAULT b'0',
  `estguestcnt` int(11) NOT NULL DEFAULT '1',
  `isdppaid` bit(1) NOT NULL DEFAULT b'0',
  `dptypeid` bit(1) NOT NULL DEFAULT b'0',
  `dpamount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rsvstatus` int(11) NOT NULL DEFAULT '0',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`rsid`)
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `ca_room_rates` */

insert  into `ca_room_rates`(`id`,`rmtypeid`,`regular`,`regtimein`,`regtimeout`,`overnight`,`ovntimein`,`ovntimeout`,`extension`,`extratebase`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,1,'500.00','07:00:00','18:59:59','500.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(2,2,'1500.00','07:00:00','18:59:59','1500.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(3,3,'1000.00','07:00:00','18:59:59','1000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(4,4,'1000.00','07:00:00','18:59:59','1000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(5,5,'1300.00','07:00:00','18:59:59','1300.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(6,6,'1500.00','07:00:00','18:59:59','2000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(7,7,'3500.00','07:00:00','18:59:59','3500.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(8,8,'3600.00','07:00:00','18:59:59','3600.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(9,9,'3000.00','07:00:00','18:59:59','3500.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(10,10,'4000.00','07:00:00','18:59:59','4000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(11,11,'15000.00','07:00:00','18:59:59','15000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0);

/*Table structure for table `ca_rooms` */

DROP TABLE IF EXISTS `ca_rooms`;

CREATE TABLE `ca_rooms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) NOT NULL DEFAULT '0',
  `roomcode` varchar(25) NOT NULL,
  `roomdesc` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT '1',
  `recstatus` bit(1) NOT NULL DEFAULT b'1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

/*Data for the table `ca_rooms` */

insert  into `ca_rooms`(`id`,`typeid`,`roomcode`,`roomdesc`,`capacity`,`recstatus`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,1,'UM-01','Umbrella 1',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(2,1,'UM-02','Umbrella 2',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(3,1,'UM-03','Umbrella 3',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(4,1,'UM-04','Umbrella 4',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(5,1,'UM-05','Umbrella 5',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(6,1,'UM-06','Umbrella 6',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(7,1,'UM-07','Umbrella 7',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(8,1,'UM-08','Umbrella 8',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(9,1,'UM-09','Umbrella 9',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(10,1,'UM-10','Umbrella 10',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(11,1,'UM-11','Umbrella 11',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(12,1,'UM-12','Umbrella 12',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(13,1,'UM-13','Umbrella 13',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(14,2,'GA-01','Gazebo 1',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(15,2,'GA-02','Gazebo 2',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(16,3,'GA-03','Gazebo 3',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(17,3,'GA-04','Gazebo 4',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(18,3,'GA-05','Gazebo 5',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(19,4,'CA-01','Cabana 1',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(20,4,'CA-02','Cabana 2',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(21,4,'CA-03','Cabana 3',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(22,4,'CA-04','Cabana 4',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(23,4,'CA-05','Cabana 5',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(24,4,'CA-06','Cabana 6',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(25,4,'CA-07','Cabana 7',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(26,4,'CA-08','Cabana 8',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(27,4,'CA-09','Cabana 9',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(28,4,'CA-10','Cabana 10',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(29,4,'CA-11','Cabana 11',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(30,4,'CA-12','Cabana 12',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(31,4,'CA-13','Cabana 13',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(32,4,'CA-14','Cabana 14',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(33,4,'CA-15','Cabana 15',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(34,4,'CA-16','Cabana 16',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(35,4,'CA-17','Cabana 17',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(36,4,'CA-18','Cabana 18',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(37,4,'CA-19','Cabana 19',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(38,4,'CA-20','Cabana 20',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(39,4,'CA-21','Cabana 21',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(40,4,'CA-22','Cabana 22',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(41,4,'CA-23','Cabana 23',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(42,4,'CA-24','Cabana 24',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(43,4,'CA-25','Cabana 25',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(44,4,'CA-26','Cabana 26',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(45,4,'CA-27','Cabana 27',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(46,4,'CA-28','Cabana 28',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(47,4,'CA-29','Cabana 29',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(48,4,'CA-30','Cabana 30',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(49,5,'CA-31','Cabana 31',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(50,5,'CA-32','Cabana 32',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(51,6,'SR-01','Standard Room 01',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(52,6,'SR-02','Standard Room 02',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(53,6,'SR-03','Standard Room 03',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(54,6,'SR-04','Standard Room 04',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(55,6,'SR-05','Standard Room 05',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(56,6,'SR-06','Standard Room 06',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(57,6,'SR-07','Standard Room 07',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(58,6,'SR-08','Standard Room 08',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(59,7,'FR-01','Family Room 07',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(60,7,'FR-02','Family Room 02',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(61,8,'VI-05','Villa 05 (Open)',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(62,9,'VI-01','Villa 01',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(63,9,'VI-02','Villa 02',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(64,9,'VI-03','Villa 02',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(65,9,'VI-04','Villa 04',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(66,9,'VI-06','Villa 06',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(67,10,'FH-01','Function Hall',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(68,11,'PV-01','Pavillion',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0);

/*Table structure for table `ca_roomtype` */

DROP TABLE IF EXISTS `ca_roomtype`;

CREATE TABLE `ca_roomtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typedesc` varchar(50) DEFAULT NULL,
  `dptype` bit(1) NOT NULL DEFAULT b'0',
  `dpvalue` double NOT NULL DEFAULT '0',
  `recstatus` bit(1) NOT NULL DEFAULT b'1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `ca_roomtype` */

insert  into `ca_roomtype`(`id`,`typedesc`,`dptype`,`dpvalue`,`recstatus`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,'Umbrella (1-13)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(2,'Gazebo (1-2)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(3,'Gazebo (3-5)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(4,'Cabana (1-30)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(5,'Cabana (31-32)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(6,'Standard Rooms','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(7,'Family Rooms','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(8,'Villa 5 (Open)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(9,'Villa (1-6)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(10,'Function Rooms','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(11,'Pavillion','',50,'','2017-02-12 12:39:53',0,'2017-02-12 12:39:53',0);

/*Table structure for table `ca_user_roles` */

DROP TABLE IF EXISTS `ca_user_roles`;

CREATE TABLE `ca_user_roles` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `ca_user_roles` */

insert  into `ca_user_roles`(`id`,`roledesc`,`allowlogin`,`allowbilling`,`allowreserve`,`allowinventory`,`allowcashier`,`allowsettings`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,'CA-Administrator','','','','','','','2017-02-06 02:53:17',0,'2017-02-06 02:53:17',0);

/*Table structure for table `ca_users` */

DROP TABLE IF EXISTS `ca_users`;

CREATE TABLE `ca_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcodeid` varchar(25) NOT NULL DEFAULT '0',
  `loginid` varchar(25) NOT NULL,
  `loginpw` text NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `roleid` bigint(20) NOT NULL DEFAULT '0',
  `recstatus` bit(1) NOT NULL DEFAULT b'1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `ca_users` */

insert  into `ca_users`(`id`,`barcodeid`,`loginid`,`loginpw`,`lastname`,`firstname`,`middlename`,`roleid`,`recstatus`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,'0000000001','ca-admin','ccc1c1812d2258fb841a8e78ff7899a0','Admin','Costa-Abril','',1,'','2017-02-06 02:55:36',0,'2017-02-06 02:55:36',0);

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ci_sessions` */

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('09egu7qake53lfqh3fdt6vaal9ocf0ku','::1',1486617956,'__ci_last_regenerate|i:1486617669;'),('0h7v9qj9532c3br8jqks740ko8tem1nh','::1',1486621456,'__ci_last_regenerate|i:1486621429;'),('0p0hn7koemkk92nfcqnobql1615lo7a6','::1',1487419955,'__ci_last_regenerate|i:1487419245;'),('0q0knub327jrtkcsdr1da7p4jlfj5708','::1',1486892022,'__ci_last_regenerate|i:1486892006;'),('0vd8qsslc5jk7sueomvqcmsgdatpks8i','::1',1486783672,'__ci_last_regenerate|i:1486783389;'),('11fr7bgabth8q3t8alsefhsvesssf7ld','::1',1487330754,'__ci_last_regenerate|i:1487330700;'),('18nm119qbitmb5j1jlpa3g31cm0gmami','::1',1486867242,'__ci_last_regenerate|i:1486867240;'),('1ctjl0cle6030jf03v13pctar8hktcqj','::1',1487421509,'__ci_last_regenerate|i:1487421505;'),('1i0ob93atas5s7ichc02hefavpauucl6','::1',1487411320,'__ci_last_regenerate|i:1487411317;'),('1nkv0dliuk18n9bnc9dq9ni02shktdm1','::1',1486988688,'__ci_last_regenerate|i:1486988530;'),('1vcbfsp4nhb0vbsp1v7c453kt2cvphga','::1',1486984380,'__ci_last_regenerate|i:1486984209;'),('2346u8p0sung29hhv1atp1ka486uemn1','::1',1486649056,'__ci_last_regenerate|i:1486648930;'),('252lcg97vskgq80m0ob15ofvupj5015k','::1',1487254659,'__ci_last_regenerate|i:1487253943;'),('25h84in20ubp8rjj3t83g8e1kr92idan','::1',1486901992,'__ci_last_regenerate|i:1486901893;'),('28g30igbvt2log3hm6m0el4ibr2evle5','::1',1487155799,'__ci_last_regenerate|i:1487155515;'),('2accrd5nvdg20dlb4u7on0fm58mt6pln','::1',1486614910,'__ci_last_regenerate|i:1486614909;'),('2epu3dm510g19o4m688j5r36sune4a4c','::1',1486819007,'__ci_last_regenerate|i:1486819005;'),('2f13e5l6rt0i12voht6e7epo1e0g0une','::1',1487411284,'__ci_last_regenerate|i:1487410993;'),('2hi78vp4fvegr636mlin6ksdla8e65ei','::1',1486648498,'__ci_last_regenerate|i:1486648377;'),('3315q69aa41b3tksvl0ifile2km21tbb','::1',1486646786,'__ci_last_regenerate|i:1486646705;'),('33uvpr39hrcksbequ254pe0742jgj0t6','::1',1486623126,'__ci_last_regenerate|i:1486622850;'),('38jnujkg75hip6ob7ddhga3j5kp9d5ke','::1',1487425941,'__ci_last_regenerate|i:1487425917;'),('3fbtv98lepftau4b2c624o578kaib0ru','::1',1487155173,'__ci_last_regenerate|i:1487153288;'),('3l10l8491tmc007s8crfrc683eu9ia75','::1',1486618749,'__ci_last_regenerate|i:1486618543;'),('40l6ihgv9r33cq2u9dchft3rj6js5frt','::1',1486615367,'__ci_last_regenerate|i:1486615366;'),('41h560s4rlal8mkmc08d7agvn0ana3ol','127.0.0.1',1486325069,'__ci_last_regenerate|i:1486325069;'),('48t32n0et5m33q5t9mphhfrjvc2qisje','::1',1486624253,'__ci_last_regenerate|i:1486623967;'),('4rkfpv8jf6mibknv22shq9sksp6deigb','::1',1487255685,'__ci_last_regenerate|i:1487255651;'),('51v5ah232hd9ij4f1dtlfci9blgolssc','::1',1486623451,'__ci_last_regenerate|i:1486623339;'),('5etfgo020nasooeoradt6kbom4fsl7u2','::1',1487060260,'__ci_last_regenerate|i:1487060074;'),('5k39bo84v8u41p28ib5jlhgsjhtcn9ff','::1',1486796699,'__ci_last_regenerate|i:1486796496;'),('5qni94p1a1rdlvdphq3jaqmh3ct5k9k7','::1',1486786589,'__ci_last_regenerate|i:1486786589;'),('5uqdjs90j9h6vbj5uaflf0sd5r72ccqa','::1',1486784312,'__ci_last_regenerate|i:1486784079;'),('7hlvukveerdeq2komdn4u1klrsbo9s4c','::1',1486652660,'__ci_last_regenerate|i:1486652513;'),('7rl8a290s00kfetip4vm6bhae3s1gq8o','::1',1487168637,'__ci_last_regenerate|i:1487161307;'),('81ih0dnll6s12dqcau2j6a1apuo01p20','::1',1486621982,'__ci_last_regenerate|i:1486621733;'),('88v4k3naucpqd9uekmtscct5p91ollfl','::1',1486781379,'__ci_last_regenerate|i:1486781301;'),('8m4gf990hb2lrlouge4lnflccu4rnnpe','::1',1486802174,'__ci_last_regenerate|i:1486801899;'),('8msbc2sbq88k6k0lsec6hmnfj3qq1but','::1',1486650732,'__ci_last_regenerate|i:1486650732;'),('8r5chrijb81esod561gk4aug61liaqul','::1',1486798594,'__ci_last_regenerate|i:1486798384;'),('8rl8e682ogl546gmahjdu9331bnhi6q6','::1',1486636832,'__ci_last_regenerate|i:1486636832;'),('90oaoc6kirpkgdl43g73dci0qb5i83mp','::1',1487127300,'__ci_last_regenerate|i:1487127270;'),('999jumnf9715q6ivoqj604fsgp7kphvd','::1',1487153231,'__ci_last_regenerate|i:1487152865;'),('9gc71mp9sfvr125b4iagj7r5vk7a9d38','::1',1486784977,'__ci_last_regenerate|i:1486784709;'),('9gocr3g4akgp9u1qjb0913ob1a2mrokq','::1',1486993714,'__ci_last_regenerate|i:1486993464;'),('a02tkadnegp22devpth8rmtf6hqsbl3s','::1',1487421231,'__ci_last_regenerate|i:1487421119;'),('ac1ks83h1qjhte2nlqobpro0u3btb6d8','::1',1487409632,'__ci_last_regenerate|i:1487409629;'),('agl3kacvgsi1g18jcg1g97nlbdm7mg3v','::1',1486802862,'__ci_last_regenerate|i:1486802685;'),('amhismi0sqq4h8hicamnhcqneb1lv9fk','::1',1487092589,'__ci_last_regenerate|i:1487092331;'),('ao6rhh548of414radd8ot86hadhc3me0','::1',1486902435,'__ci_last_regenerate|i:1486902211;'),('ar35s8o5g35odua5acnvsvol9bg98gkh','::1',1487092965,'__ci_last_regenerate|i:1487092800;'),('b1usstdmp6iovue1dbs5sveqlcq12mk2','::1',1486817751,'__ci_last_regenerate|i:1486817452;'),('b47cgjbpl2huhgm0qn6a5cdbo222pd0s','::1',1487091578,'__ci_last_regenerate|i:1487091327;'),('b99ksnno98rs8f8s4kg0qbkhd7kgg4fu','::1',1486782044,'__ci_last_regenerate|i:1486781760;'),('bitqs5voovcl8l3ii212t263q9qkdfel','::1',1486788308,'__ci_last_regenerate|i:1486788308;'),('blumacb2mla0apepvn0ngf38i7uqh663','::1',1486787080,'__ci_last_regenerate|i:1486787080;'),('bmtobeh6v9dftb76hcu70lve5omdprtl','::1',1487160529,'__ci_last_regenerate|i:1487160520;'),('bp4jj568gvbs0shnhnjdp0s60rd2o1rf','::1',1487092301,'__ci_last_regenerate|i:1487091995;'),('bpuvcdhflbuk67b7nnv2kmp89arnjd2b','::1',1486894336,'__ci_last_regenerate|i:1486894227;'),('bumusqqonos4e6h8d60pe1pqed8i141o','::1',1486325118,'__ci_last_regenerate|i:1486324870;init|s:29:\"This is just an intialisation\";'),('c2uijh5q2t32j9e2g3ug2hl6737puvre','::1',1486613785,'__ci_last_regenerate|i:1486613783;'),('c9t927uq1rpr3796qvccelff7ts5nnnp','::1',1486321593,'__ci_last_regenerate|i:1486321593;init|s:29:\"This is just an intialisation\";'),('cr03bklppkc713ilvv21u75hq4557ks8','::1',1486783283,'__ci_last_regenerate|i:1486783074;'),('d0qtgo148np2ios1tg3o1go0s2213h0l','::1',1486782355,'__ci_last_regenerate|i:1486782069;'),('d5cq47t8jfggd2k64pl6mdqjandjgnd4','::1',1486987126,'__ci_last_regenerate|i:1486987124;'),('dknrl99lb0e2msbc7rabk25kuk82o8fa','::1',1486970390,'__ci_last_regenerate|i:1486970388;'),('e2beovpelhp4fj0tq83tricf562310g5','::1',1486618262,'__ci_last_regenerate|i:1486618241;'),('e3ub6auhmcveisj08vcst6rq3lpnonck','::1',1486993781,'__ci_last_regenerate|i:1486993780;'),('e52itdecdbq6gea0j6o0j9n560nl4sbu','::1',1486877605,'__ci_last_regenerate|i:1486877604;'),('e6e14gblnpookbe5ad9j36nq51174bg6','::1',1486818965,'__ci_last_regenerate|i:1486818676;'),('ec4vqi43lag5f4n1ad99tinh7fvslk3i','::1',1486788863,'__ci_last_regenerate|i:1486788799;'),('ecdv167jo4tfnv21m2flpd2tk4l6akuj','::1',1487155415,'__ci_last_regenerate|i:1487155180;'),('eq2ckt28svavd32qv96ai2rl3k7ehjdm','::1',1486838424,'__ci_last_regenerate|i:1486838419;'),('f65qvtr4fti8hr26mjlf5jf7bt3oui3v','::1',1486833446,'__ci_last_regenerate|i:1486833265;'),('f7f26oapere9c0utoafli9l57ifheqen','::1',1486833812,'__ci_last_regenerate|i:1486833566;'),('fdmeu5eoohhpp6gju7d8fshot6na5f8p','::1',1486902674,'__ci_last_regenerate|i:1486902672;'),('g8p3nflilv2c0t7ppulr19jbsqt12jon','::1',1486622038,'__ci_last_regenerate|i:1486622038;'),('gbb4pfhlj869ifi8q9geeij9nrm57fgm','::1',1487139957,'__ci_last_regenerate|i:1487139919;'),('ghqa8fb5gqv694u9qgep0ld7ehgar126','::1',1486651345,'__ci_last_regenerate|i:1486651068;'),('h5htd2ls84h31hagkfmqou6f6pjhad68','::1',1486776498,'__ci_last_regenerate|i:1486776497;'),('hbaq4vi1pmlkk0mj0ah4153kk5mjdueq','::1',1486971305,'__ci_last_regenerate|i:1486971303;'),('hfv80oeeg49v01ui7a2map21jnnlfsfc','::1',1486782754,'__ci_last_regenerate|i:1486782455;'),('hm382i6lsgctmbc2h1pms4gig8v5c2ut','::1',1486651534,'__ci_last_regenerate|i:1486651503;'),('ht0kso5aoplenf6e715qutj1cqesikl1','::1',1486785667,'__ci_last_regenerate|i:1486785611;'),('hvtlf79b2sm18cuq3k6ektej341jtsav','::1',1486983458,'__ci_last_regenerate|i:1486983162;'),('i0sqoprr8hqrvqese9foalvjsl84khts','127.0.0.1',1486325004,'__ci_last_regenerate|i:1486325004;'),('i1opsn96gi9qnge3skeop5i3h6lommuk','::1',1486223430,'__ci_last_regenerate|i:1486223430;init|s:29:\"This is just an intialisation\";'),('iea2u43o1cf9r2m50cthppvrutqedekh','::1',1486837940,'__ci_last_regenerate|i:1486837935;'),('j42rf3gqvs87ed8cv578ia7q7m80qih5','::1',1487150114,'__ci_last_regenerate|i:1487148835;'),('j6cs1rj1d2oc2o8glp5jf26j034qbqr4','::1',1486802204,'__ci_last_regenerate|i:1486802203;'),('joj024sei3iokvdck1v794u1ne2vk3v8','::1',1487410392,'__ci_last_regenerate|i:1487410387;'),('k0amvkqe5nc4b502f2er5uu86aeskgs2','::1',1486325452,'__ci_last_regenerate|i:1486325181;init|s:29:\"This is just an intialisation\";'),('k695dpiicfak6os5rikh9ofdhud1se7q','::1',1486968958,'__ci_last_regenerate|i:1486968772;'),('k6e9gplj46gmete1q6kf7q9cot9nqb8k','::1',1486818046,'__ci_last_regenerate|i:1486817947;'),('k86o2un2um575i2lof0ufkp7qd7f91vg','::1',1487419165,'__ci_last_regenerate|i:1487418881;'),('l40r7mg8q18pbqodi20d8fk1hkstc72r','::1',1486324812,'__ci_last_regenerate|i:1486324538;init|s:29:\"This is just an intialisation\";'),('lfgq3ium6vfs1q31aroakq35trj2sb1i','::1',1487140874,'__ci_last_regenerate|i:1487140491;'),('lotse1cjb7cgq5fvgbkepug6pn2lha2c','::1',1486837681,'__ci_last_regenerate|i:1486837507;'),('m1q7p6k9fg5l3gral32h9jneut83jfr3','::1',1486798947,'__ci_last_regenerate|i:1486798892;'),('m6m6juuc21s4plh4eqvgvuq3a1dss1k8','::1',1486325593,'__ci_last_regenerate|i:1486325566;init|s:29:\"This is just an intialisation\";'),('matb5icehu6a52if46vf4ipjclm2nvmo','::1',1486834836,'__ci_last_regenerate|i:1486834559;'),('metcv4o5jji98ak2msimnf597c9r7lmk','::1',1486383479,'__ci_last_regenerate|i:1486383477;init|s:29:\"This is just an intialisation\";'),('mg5igjndk933303br625aror9b1jh4ko','::1',1486818297,'__ci_last_regenerate|i:1486818296;'),('mhfv7alt8vk3l6tj4r2s38rv1sg06rm7','::1',1487125959,'__ci_last_regenerate|i:1487125661;'),('n8foasrb2lv76nmh1ugm3ulot66viifa','::1',1486835173,'__ci_last_regenerate|i:1486835006;'),('nf6gkv9vs23dvu31rn9s7h9fgnhnlhtf','::1',1486777445,'__ci_last_regenerate|i:1486777350;'),('nssmn5ubtu7d023k78n45028jru5t561','::1',1487421828,'__ci_last_regenerate|i:1487421823;'),('nt178j9m2euu4llb0mbbj70cn8dnpdr4','::1',1486784007,'__ci_last_regenerate|i:1486783707;'),('o5s2reff4trb53bv6uqn6dvkf54s9roe','::1',1486796486,'__ci_last_regenerate|i:1486796194;'),('o6621em97hj096t5ct93fhig57tetcas','::1',1487420661,'__ci_last_regenerate|i:1487420396;'),('o6b5kpu9pas5cm0lfq4unjssn4g0s37i','::1',1487091891,'__ci_last_regenerate|i:1487091693;'),('o7onpjst06m1chou435udk3e3pumsqqo','::1',1486652118,'__ci_last_regenerate|i:1486652118;'),('o8927v77722g98qrgokmce0cm9h1j4th','::1',1486785919,'__ci_last_regenerate|i:1486785919;'),('o8bdv26bphnt9j7vuk95eiq507hfplj4','::1',1486893689,'__ci_last_regenerate|i:1486893389;'),('o8gnbsj29npob8tj4jvvt59ucvek0l1p','::1',1486834188,'__ci_last_regenerate|i:1486833894;'),('ofeusltcp1d665a5ctv09btahv023me1','::1',1487420939,'__ci_last_regenerate|i:1487420739;'),('oqbdk550mrrt0rqh253f2oe0cmueej1r','::1',1486987657,'__ci_last_regenerate|i:1486987505;'),('ou4h9q7arilfh0rai05mp0iiu062odcq','::1',1486816948,'__ci_last_regenerate|i:1486816814;'),('q0pqmaec0v8j1p7neqlfdfcplk1lq64o','::1',1487425913,'__ci_last_regenerate|i:1487425549;'),('qa3tpceaam90iovs5puu194jbn9485pr','127.0.0.1',1486324871,'__ci_last_regenerate|i:1486324871;'),('qr0g64i4c3sbd57ohpikg6et7rmp2nhh','::1',1486998587,'__ci_last_regenerate|i:1486998323;'),('r1igta7e7psv69vn2ush6tticegk8ph9','::1',1486969294,'__ci_last_regenerate|i:1486969112;'),('r2nj1a53ol4nn31or75osr787gblbrc9','::1',1486984050,'__ci_last_regenerate|i:1486983881;'),('r4nvjtd8f347sqbupc78dk3t2gonghs3','::1',1486983706,'__ci_last_regenerate|i:1486983486;'),('r7gmd6fh5fnonj89mgp49tore7q6v3io','::1',1486777124,'__ci_last_regenerate|i:1486776878;'),('rj6hm426ka3fro1a270t2it18epbc1tr','::1',1487159663,'__ci_last_regenerate|i:1487159656;'),('rlabnv4bnckmevhterc78i7riojekfqm','::1',1486783003,'__ci_last_regenerate|i:1486782770;'),('rn0rf3ocn12do9sd1isbmm5mm3b4da3b','::1',1487125628,'__ci_last_regenerate|i:1487125124;'),('sgpr2rbortqp5437tqtoshvlv6etbmag','::1',1487422215,'__ci_last_regenerate|i:1487422128;'),('squ3v62vab2feftmcucc9bahgmb1hr27','::1',1486997065,'__ci_last_regenerate|i:1486997014;'),('t0ogmbmfe57k8lh3s148ccin951i1c8d','::1',1487156023,'__ci_last_regenerate|i:1487155917;'),('t1h8pf6phrver5k0tjrpb6prh9p9jb3e','::1',1486777789,'__ci_last_regenerate|i:1486777789;'),('t8urg05m6utj8p12a3tdis8qh8p83ij7','::1',1487409055,'__ci_last_regenerate|i:1487408759;'),('to2qkii6qoqk2l0smgoqj1bj4mst41e9','::1',1486646290,'__ci_last_regenerate|i:1486646160;'),('u0teomtgc7fnuf21a5pimlqtpo5o3mu5','::1',1486981623,'__ci_last_regenerate|i:1486981378;'),('u1apq3jju57nn6spers7a5iov287d52r','::1',1486785318,'__ci_last_regenerate|i:1486785161;'),('u41ruam80v8h08521neregefeu8isj20','::1',1486817416,'__ci_last_regenerate|i:1486817141;'),('v2p71vohk2edt7b8dtvv231nnq4eg6ra','::1',1486798074,'__ci_last_regenerate|i:1486797816;'),('v5vrhkdp8hmil0fav8122t9nmmjq82bl','::1',1486981953,'__ci_last_regenerate|i:1486981740;'),('vmc5hmf4grro09674kud43rtn6tugt7l','::1',1487127172,'__ci_last_regenerate|i:1487126907;'),('vugeg4d306mjngnoupqtlfg0ecsb97ep','::1',1487061992,'__ci_last_regenerate|i:1487061809;');

/* Procedure structure for procedure `sp_tranusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_tranusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tranusers`(
	ttype 	int,
	recid 	bigint,
	bid		varchar(25),
	lid		varchar(25),
	lpw		text,
	lname	varchar(50),
	fname	varchar(50),
	mname	varchar(50),
	rid		bigint,
	userid 	bigint
)
begin
	declare recordexists int default 0;
	
	-- Insert
	if ttype = 0 then
		set recordexists = (select count(id) from ca_users where `loginid` = lid and `roleid` = rid);
		if recordexists = 0 then
			insert into `ca_users`
				(`barcodeid`, `loginid`, `loginpw`, `lastname`, `firstname`, `middlename`, `roleid`, `datecreated`, `createdbyid`)
			values
				(bid, lid, md5(lpw), lname, fname, mname, rid, now(), userid);
		end if;
		
	-- Update
	elseif ttype = 1 then
	
		set recordexists = (select count(id) from `ca_users` where `loginid` = lid and `roleid` = rid and `id` != recid);
		
		if recordexists = 0 then
			if length(trim(both from lpw)) = 0 then
				update `ca_users` 
				set `barcodeid` = bid, `loginid` = lid, 
					`lastname` = lname, `firstname` = fname, `middlename` = mname, `roleid` = rid, 
					`datemodified` = now(), `modifiedbyid` = userid
				where `id` = recid;			
			else 
				update `ca_users` 
				set `barcodeid` = bid, `loginid` = lid, `loginpw` = md5(lpw), 
					`lastname` = lname, `firstname` = fname, `middlename` = mname, `roleid` = rid, 
					`datemodified` = now(), `modifiedbyid` = userid
				where `id` = recid;					
			end if;	
		end if;
	
	-- Delete
	elseif ttype = 2 then
		update `ca_users` 
		set `recstatus` = 0, `datemodified` = now(), `modifiedbyid` = userid
		where `id` = recid;
				
	-- Purge
	elseif ttype = 3 then
		delete from `ca_users` where `recstatus` = 0;
	
	-- Get List / Information
	elseif ttype = 4 then
		if recid = 0 then
			select 	a.`id`, a.`barcodeid`, 
					concat(a.`lastname`, ', ', a.`firstname`, case when length(trim(a.`middlename`)) = 0 then concat(' ', substring(a.`middlename`,1,1), '.') else '' end) as ename,
					b.`roledesc`
			from 			`ca_users` 		as a
				inner join  `ca_user_roles`	as b on a.`roleid` = b.`id`
			where a.`recstatus` = 1;
			
		else
			select `id`, `barcodeid`, `loginid`, `lastname`, `firstname`, `middlename`, `roleid`
			from `ca_users`
			where `id` = recid;
		end if;
	-- Print
	elseif ttype = 5 then
		select 'Nothing to do here.';
	
	-- Other condition
	else
		select 'Nothing to do here.';
	end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `sp_validatecredentials` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_validatecredentials` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validatecredentials`(lid varchar(25), lpw text)
BEGIN
		declare recordcount int;
		
		set recordcount = (select count(id) from `ca_users` where `loginid` = lid and `loginpw` = md5(lpw));
		
		if recordcount > 0 then
			select	a.`id` as uid, a.`loginid` as lid, a.`lastname` as lname, a.`firstname` as fname,
					b.`allowlogin`, b.`allowbilling`, b.`allowreserve`, b.`allowinventory`, b.`allowcashier`, b.`allowsettings`
			from 			`ca_users` 		as a
				inner join	`ca_user_roles`	as b on a.`roleid` = b.`id`
			where a.`loginid` = lid
			  and a.`loginpw` = md5(lpw);
		end if;
		
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
