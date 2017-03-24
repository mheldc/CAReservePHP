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
  `rmrate` double(10,2) NOT NULL DEFAULT '0.00',
  `guesta` int(11) NOT NULL DEFAULT '0',
  `guestc` int(11) NOT NULL DEFAULT '0',
  `guestc2` int(11) NOT NULL DEFAULT '0',
  `isovernight` bit(1) NOT NULL DEFAULT b'0',
  `bkstat` bit(1) NOT NULL DEFAULT b'1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`rsvid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking` */

insert  into `ca_booking`(`id`,`bksrctypeid`,`rsvid`,`guestid`,`rmtypeid`,`roomid`,`rmrate`,`guesta`,`guestc`,`guestc2`,`isovernight`,`bkstat`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,0,0,12,7,59,3500.00,7,5,1,'','',0,'2017-03-07 21:39:09',0,'2017-03-07 21:39:09'),(2,0,0,8,1,1,500.00,2,0,0,'','',0,'2017-03-08 00:27:42',0,'2017-03-08 00:27:42');

/*Table structure for table `ca_booking_guest` */

DROP TABLE IF EXISTS `ca_booking_guest`;

CREATE TABLE `ca_booking_guest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bkid` bigint(20) NOT NULL DEFAULT '0',
  `bcid` varchar(20) NOT NULL DEFAULT '''0000000000''',
  `gname` varchar(50) DEFAULT NULL,
  `gclass` int(11) NOT NULL DEFAULT '1',
  `timein` time DEFAULT NULL,
  `expdate` datetime DEFAULT NULL,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`bkid`,`bcid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking_guest` */

insert  into `ca_booking_guest`(`id`,`bkid`,`bcid`,`gname`,`gclass`,`timein`,`expdate`,`createdbyid`,`datecreated`) values (1,2,'1234567890',NULL,1,'03:23:46','2017-03-08 06:59:59',0,'2017-03-13 03:23:46'),(2,2,'0987654321',NULL,1,'03:23:46','2017-03-08 06:59:59',0,'2017-03-13 03:23:46');

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
  `isprinted` bit(1) NOT NULL DEFAULT b'0',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking_items` */

insert  into `ca_booking_items`(`id`,`bkid`,`itemtype`,`itemdesc`,`itemqty`,`itemamt`,`ispaid`,`isprinted`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,1,1,'SR-01:Standard Room 01',1,'2000.00','','\0',0,'2017-03-07 21:39:09',0,'2017-03-09 22:08:32'),(2,1,2,'Entrance Fee (Adult) x 2',2,'400.00','','\0',0,'2017-03-07 21:39:09',0,'2017-03-09 22:08:32'),(3,1,2,'Entrance Fee (Child) x 2',2,'200.00','','\0',0,'2017-03-07 21:39:09',0,'2017-03-09 22:08:32'),(4,1,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','','\0',0,'2017-03-07 21:39:09',0,'2017-03-09 22:08:32'),(5,1,2,'Additional Guest (Adult) x 5',5,'750.00','','\0',0,'2017-03-07 21:40:11',0,'2017-03-09 22:08:32'),(6,1,2,'Additional Guest (Child) x 3',3,'300.00','','\0',0,'2017-03-07 21:43:00',0,'2017-03-09 22:08:32'),(7,1,1,'FR-01:Family Room 07',1,'1500.00','','\0',0,'2017-03-07 22:02:43',0,'2017-03-09 22:08:32'),(8,2,1,'UM-01:Umbrella 1',1,'500.00','\0','\0',0,'2017-03-08 00:27:42',0,'2017-03-08 00:27:42'),(9,2,2,'Entrance Fee (Adult) x 2',2,'400.00','\0','\0',0,'2017-03-08 00:27:42',0,'2017-03-08 00:27:42'),(10,1,3,'Coca-Cola softdrinks 1.5L x5',5,'275.00','','\0',0,'2017-03-09 22:08:14',0,'2017-03-09 22:08:32'),(11,2,3,'Videoke unit + Song book x1',1,'1200.00','\0','\0',0,'2017-03-24 11:15:12',0,'2017-03-24 11:15:12');

/*Table structure for table `ca_booking_transfers` */

DROP TABLE IF EXISTS `ca_booking_transfers`;

CREATE TABLE `ca_booking_transfers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid` bigint(20) NOT NULL DEFAULT '0',
  `frmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `frmid` bigint(20) NOT NULL DEFAULT '0',
  `frmrate` double(10,2) NOT NULL DEFAULT '0.00',
  `newrmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `newrmid` bigint(20) NOT NULL DEFAULT '0',
  `rmrate` double(10,2) NOT NULL DEFAULT '0.00',
  `remarks` text,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking_transfers` */

insert  into `ca_booking_transfers`(`id`,`bid`,`frmtypeid`,`frmid`,`frmrate`,`newrmtypeid`,`newrmid`,`rmrate`,`remarks`,`createdbyid`,`datecreated`) values (1,1,6,51,2000.00,7,59,3500.00,'Crowded in initially booked accommodation.',0,'2017-03-07 22:02:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `ca_guest_info` */

insert  into `ca_guest_info`(`id`,`salutation`,`lastname`,`firstname`,`middlename`,`address`,`email`,`landline`,`fax`,`mobile`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,1,'Dela Cruz','Juan','D','Bulacan, Bulacan','jddc@example.noemail.com','021111111',NULL,'09911111111','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(2,3,'Wang','Malou','A','Binondo, Manila','maw@example.noemail.com','022222222',NULL,'09922222222','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(3,3,'Soho','Jessica','E','Ilocos Norte','jes@gma-network.com','023333333',NULL,'09933333333','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(4,1,'Tejol','Marlon','A','Makati City','marlon_tejol@yahoo.com','023333333',NULL,'09933333333','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(5,1,'Dela Cruz','Romel','S','Marikina City','rsdc@gma-network.com','023333333',NULL,'09933333333','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(6,2,'Villa-Abrille','Teresa','M','San Jose, Montalban, Rizal','tmva.hvill@yahoo.com','025555555',NULL,'09995555555','2017-02-22 17:18:12',0,'2017-02-22 17:18:12',0),(7,1,'Villa-Abrille','Gildon','M','San Jose, Montalban, Rizal','gmva.hvill@yahoo.com','',NULL,'','2017-02-22 20:08:23',0,'2017-02-22 20:08:23',0),(8,1,'Villa-Abrille','Daryl','T','san Jose, Montalban, Rizal','dtva.ca@yahoo.com','',NULL,'','2017-02-22 20:17:13',0,'2017-02-22 20:17:13',0),(9,3,'Wang','Malou','A','Binondo, Manila','maw@example.noemail.com','022222222',NULL,'09922222222','2017-02-22 20:24:14',0,'2017-02-22 20:24:14',0),(10,3,'Arellano','Glaiza','E','#5 Marcos Cruz Street, Brgy. Sta. Elena,','','',NULL,'09276010064','2017-02-26 22:52:16',0,'2017-02-26 22:52:16',0),(11,1,'Vodka','Mojito','J','Scandinavia','mjv@email.com','',NULL,'','2017-02-27 00:00:05',0,'2017-02-27 00:00:05',0),(12,3,'Obispo','Sinag','M','Pelangi, Quezon Province','','02 1111111',NULL,'','2017-03-07 21:39:09',0,'2017-03-07 21:39:09',0);

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

/*Table structure for table `ca_invaudit` */

DROP TABLE IF EXISTS `ca_invaudit`;

CREATE TABLE `ca_invaudit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_invaudit` */

/*Table structure for table `ca_invitems` */

DROP TABLE IF EXISTS `ca_invitems`;

CREATE TABLE `ca_invitems` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) NOT NULL DEFAULT '0',
  `itemcode` varchar(25) NOT NULL DEFAULT 'xxx',
  `itemdesc` varchar(150) NOT NULL DEFAULT 'Not Specified',
  `price` double(10,2) NOT NULL DEFAULT '0.00',
  `itemstat` bit(1) NOT NULL DEFAULT b'1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `modifieddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `ca_invitems` */

insert  into `ca_invitems`(`id`,`typeid`,`itemcode`,`itemdesc`,`price`,`itemstat`,`createdbyid`,`datecreated`,`modifiedbyid`,`modifieddate`) values (1,1,'CO-01','Charcoal 500g pack',25.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(2,1,'CO-02','Coca-Cola softdrinks 1.5L',55.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(3,1,'CO-03','Royal softdrinks 1.5L',55.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(4,1,'CO-04','Sprite softdrinks 1.5L',55.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(5,1,'CO-05','Piatos Sourcream 300g',45.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(6,1,'CO-06','Piatos Cheese 300g',45.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(7,2,'NC-01','Barbecue Grill small',500.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(8,2,'NC-02','Barbecue Grill large',550.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(9,2,'NC-03','Videoke unit + Song book',1200.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31');

/*Table structure for table `ca_invtypes` */

DROP TABLE IF EXISTS `ca_invtypes`;

CREATE TABLE `ca_invtypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typedesc` varchar(100) DEFAULT NULL,
  `typestat` bit(1) NOT NULL DEFAULT b'1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ca_invtypes` */

insert  into `ca_invtypes`(`id`,`typedesc`,`typestat`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,'Consumable','',0,'2017-02-28 20:11:02',0,'2017-02-28 20:11:02'),(2,'Non-Consumable','',0,'2017-02-28 20:11:02',0,'2017-02-28 20:11:02');

/*Table structure for table `ca_occular_requests` */

DROP TABLE IF EXISTS `ca_occular_requests`;

CREATE TABLE `ca_occular_requests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `occdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastname` varchar(50) NOT NULL DEFAULT 'Doe',
  `firstname` varchar(50) NOT NULL DEFAULT 'John',
  `middlename` varchar(50) DEFAULT NULL,
  `address` text,
  `contactnos` varchar(100) NOT NULL DEFAULT '0000000',
  `email` varchar(100) NOT NULL DEFAULT 'N/A',
  `estguestcnt` int(11) NOT NULL DEFAULT '1',
  `visitflag` bit(1) NOT NULL DEFAULT b'0',
  `cancelflag` bit(1) NOT NULL DEFAULT b'0',
  `remarks` text,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_occular_requests` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `ca_queue_served` */

insert  into `ca_queue_served`(`id`,`bid`,`guestid`,`message`,`isserved`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,1,12,'Prepare : SR-01:Standard Room 01','\0',0,'2017-03-07 21:39:09',0,'2017-03-07 21:39:09'),(2,1,12,'Transfer : From Standard Room 01 to FR-01:Family Room 07','\0',0,'2017-03-07 22:02:44',0,'2017-03-07 22:02:44'),(3,2,8,'Prepare : UM-01:Umbrella 1','\0',0,'2017-03-08 00:27:42',0,'2017-03-08 00:27:42');

/*Table structure for table `ca_reservation` */

DROP TABLE IF EXISTS `ca_reservation`;

CREATE TABLE `ca_reservation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `guestid` bigint(20) NOT NULL DEFAULT '0',
  `rmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `roomid` bigint(20) NOT NULL DEFAULT '0',
  `rsdatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isovernight` bit(1) NOT NULL DEFAULT b'0',
  `estguestcnt` int(11) NOT NULL DEFAULT '1',
  `ispaid` bit(1) NOT NULL DEFAULT b'0',
  `rsvstatus` int(11) NOT NULL DEFAULT '0',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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

insert  into `ca_users`(`id`,`barcodeid`,`loginid`,`loginpw`,`lastname`,`firstname`,`middlename`,`roleid`,`recstatus`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,'0000000001','ca-admin','ccc1c1812d2258fb841a8e78ff7899a0','Admin','Admininstrator','',1,'','2017-02-06 02:55:36',0,'2017-02-06 02:55:36',0);

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

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('0hqo1j4vlr8i2ip82gcnv3ums7g9boej','::1',1490329736,'__ci_last_regenerate|i:1490329698;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('0qtokdud85fid0d6hn6qgl5sjdbp5t64','::1',1490277622,'__ci_last_regenerate|i:1490276639;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('1a53vld5hf87h0kh3o7e8gsnp53mkh1d','::1',1490291755,'__ci_last_regenerate|i:1490291457;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('22g59p7gthtf0hqv0sa22qd4m810pvej','::1',1490330013,'__ci_last_regenerate|i:1490330011;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('2ek5n5ukncqtrrcd4mkec88ldvdd8e4d','::1',1490328733,'__ci_last_regenerate|i:1490328569;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('44ba1nuqh69hbpv13iqdqvb2m1vqs9df','::1',1490345047,'__ci_last_regenerate|i:1490345045;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('4dcu4rbigul62gjq6s50k1tqsumn6jg5','::1',1490342478,'__ci_last_regenerate|i:1490342476;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('4edphl2o1lkorof3im4upgp7mdsmdarf','::1',1490336390,'__ci_last_regenerate|i:1490336388;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('5d54m4uhvba3ojtl9bn3oeqaido8r02p','::1',1490331984,'__ci_last_regenerate|i:1490331708;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('5mi0ao57mrj9la907u8nklj2pn648dab','::1',1490257687,'__ci_last_regenerate|i:1490257405;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('62jbtpsf5im09ft71vrqf1t55plpfrg9','::1',1490374569,'__ci_last_regenerate|i:1490374568;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('6eljjl15a7bq4rujoum1pvepv82hjl45','::1',1490343710,'__ci_last_regenerate|i:1490343437;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('6j1d66p9k1l44q700ksgn9o03biklk4t','::1',1490348620,'__ci_last_regenerate|i:1490348618;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('728fbbo86lbv62ac18cm8lohs7b0a9p7','::1',1490342025,'__ci_last_regenerate|i:1490341922;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('80fn70b614t584k53ulef52dful9r4t0','::1',1490278266,'__ci_last_regenerate|i:1490277965;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('9nsci5ihgoh7noeiq9suabphtad4luu7','::1',1490260092,'__ci_last_regenerate|i:1490260024;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('9o3cpjmdkegqiqb9ce74f1g2518fdv5i','::1',1490336832,'__ci_last_regenerate|i:1490336712;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('ac202vi3vs4hbbd676rpovebo1mmrm2l','::1',1490326493,'__ci_last_regenerate|i:1490326492;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('akddg1e499382spj44qa1tnh101bvpc0','::1',1490327785,'__ci_last_regenerate|i:1490327548;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('bemu87vrq8eo5qulkf83r33rcdru396s','::1',1490258003,'__ci_last_regenerate|i:1490257709;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('bilkh2u24kla7cdqapu7rs3car8pvak9','::1',1490343403,'__ci_last_regenerate|i:1490343106;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('dbcb0b6fghg68aecnpj3nk44bmlvrfj9','::1',1490333029,'__ci_last_regenerate|i:1490332758;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('denrrjquhui61eeniacs3r3tv3k51mn0','::1',1490359600,'__ci_last_regenerate|i:1490359578;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('dfaivkusimsa23v153e2kc8v8omkbcq5','::1',1490361772,'__ci_last_regenerate|i:1490361662;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('dhunmjf1jl528ta6df8eudecfqeo2ech','::1',1490344884,'__ci_last_regenerate|i:1490344652;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('eoak6jgaq8f6kek6j0moi5125sae9a1l','::1',1490396810,'__ci_last_regenerate|i:1490396805;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('esth8rgg1b00o9vr5te911392q0l32ed','::1',1490332073,'__ci_last_regenerate|i:1490332011;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('fqvfh36qfebb9pt8dnl020h75ult3akl','::1',1490362434,'__ci_last_regenerate|i:1490362295;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('ibnts4sh4rqltgrke1qkhrhasovlqs1v','::1',1490257251,'__ci_last_regenerate|i:1490257054;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('iocoq7kuduc55h5ivu5vedh1osj3i6ol','::1',1490327236,'__ci_last_regenerate|i:1490326997;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('is5qlfotk1s6h6uv4lm67li00rcpnvrg','::1',1490328536,'__ci_last_regenerate|i:1490328234;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('jbe2ikauu3llecu0ih9lr186os2ht4ig','::1',1490361294,'__ci_last_regenerate|i:1490360992;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('js5mj1r2okqfq8l4v7mas5u3dsbkffb7','::1',1490258170,'__ci_last_regenerate|i:1490258041;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('k21d4v6ebv66836n1rfecs9p7pi5hqks','::1',1490395045,'__ci_last_regenerate|i:1490394926;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('kbdja1n15t0edfo9fpf7gps67cbvanfo','::1',1490372576,'__ci_last_regenerate|i:1490372561;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('kjn9pq04dghooae3lvkn2ss5jbmjo3t1','::1',1490326364,'__ci_last_regenerate|i:1490326065;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('ku71v3f4m0r8sin3unggb5etuk36slk5','::1',1490333637,'__ci_last_regenerate|i:1490333529;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('l13j08apl33f979cn29he7sq5gd1mho3','::1',1490277932,'__ci_last_regenerate|i:1490277626;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('llut5c1d4qhbiknlu6b0hkk0v6o9kgot','::1',1490360679,'__ci_last_regenerate|i:1490360674;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('lo1ler4c80cf8b0fai02o25cg4ttet05','::1',1490349543,'__ci_last_regenerate|i:1490349477;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('lviel8uht8nl7f900m7ao7t32e5lb28p','::1',1490362649,'__ci_last_regenerate|i:1490362628;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('m35ub4fio4a345hfdnfr061e8p9fiqrq','::1',1490375678,'__ci_last_regenerate|i:1490375676;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('n2g4mlk6c0b5os6k5f461dd9ju5palhi','::1',1490347110,'__ci_last_regenerate|i:1490347042;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('n3u41hu0re9ognmd9jkhei6nr9ae2lmm','::1',1490328082,'__ci_last_regenerate|i:1490327884;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('opn0pvduoj92pe13qqknj0s5lmq31m1i','::1',1490330819,'__ci_last_regenerate|i:1490330534;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('p0h89cv2sqtm7oodc6fkdii3kefl47lq','::1',1490276634,'__ci_last_regenerate|i:1490276324;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('pdo2lk1a2r16a3c50lj9aqqdqh34cr66','::1',1490325399,'__ci_last_regenerate|i:1490325282;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('rekqu6n6qne2ava8j29h609pjb326n63','::1',1490394841,'__ci_last_regenerate|i:1490394609;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('rfq6b6d0c0hmgbh7v7acg7bc993sk2h8','::1',1490337148,'__ci_last_regenerate|i:1490337146;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('rhq9b5rtte5e9bb2dvoeinlpi1clj8d9','::1',1490361642,'__ci_last_regenerate|i:1490361346;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('s3q1v2p8b402gn3d1pftioubl8j4pmc9','::1',1490341822,'__ci_last_regenerate|i:1490341574;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('spdmrmtj1p92j9dtqstcosudqlif2ai8','::1',1490343989,'__ci_last_regenerate|i:1490343904;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('tbo9vqfa6vfldjouhi4n93fp8pkgu8fu','::1',1490333405,'__ci_last_regenerate|i:1490333118;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('tcnp2gu0h8tldqj8k1f0lh6bckpniej4','::1',1490278535,'__ci_last_regenerate|i:1490278309;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('tjk6ieqs0blog99briln5hshuprdo2dc','::1',1490329095,'__ci_last_regenerate|i:1490328950;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('u6qed277cr5297ch6058m3ak9qto90k7','::1',1490344535,'__ci_last_regenerate|i:1490344285;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('ue5kc3t1qnl5ge70lsq1fsvbq0694b5p','::1',1490337672,'__ci_last_regenerate|i:1490337596;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('vj1cq9a0g7dgbotsgoj49fp44q2s5gn9','::1',1490333979,'__ci_last_regenerate|i:1490333950;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}'),('vl17tr1dcojhvhbj6fjm5vo0iu803bj4','::1',1490346811,'__ci_last_regenerate|i:1490346688;udata|a:1:{i:0;a:10:{s:3:\"uid\";s:1:\"1\";s:3:\"lid\";s:8:\"ca-admin\";s:5:\"lname\";s:5:\"Admin\";s:5:\"fname\";s:14:\"Admininstrator\";s:10:\"allowlogin\";s:1:\"1\";s:12:\"allowbilling\";s:1:\"1\";s:12:\"allowreserve\";s:1:\"1\";s:14:\"allowinventory\";s:1:\"1\";s:12:\"allowcashier\";s:1:\"1\";s:13:\"allowsettings\";s:1:\"1\";}}');

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
