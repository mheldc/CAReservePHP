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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking_items` */

insert  into `ca_booking_items`(`id`,`bkid`,`itemtype`,`itemdesc`,`itemqty`,`itemamt`,`ispaid`,`isprinted`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,1,1,'SR-01:Standard Room 01',1,'2000.00','','\0',0,'2017-03-07 21:39:09',0,'2017-03-09 22:08:32'),(2,1,2,'Entrance Fee (Adult) x 2',2,'400.00','','\0',0,'2017-03-07 21:39:09',0,'2017-03-09 22:08:32'),(3,1,2,'Entrance Fee (Child) x 2',2,'200.00','','\0',0,'2017-03-07 21:39:09',0,'2017-03-09 22:08:32'),(4,1,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','','\0',0,'2017-03-07 21:39:09',0,'2017-03-09 22:08:32'),(5,1,2,'Additional Guest (Adult) x 5',5,'750.00','','\0',0,'2017-03-07 21:40:11',0,'2017-03-09 22:08:32'),(6,1,2,'Additional Guest (Child) x 3',3,'300.00','','\0',0,'2017-03-07 21:43:00',0,'2017-03-09 22:08:32'),(7,1,1,'FR-01:Family Room 07',1,'1500.00','','\0',0,'2017-03-07 22:02:43',0,'2017-03-09 22:08:32'),(8,2,1,'UM-01:Umbrella 1',1,'500.00','\0','\0',0,'2017-03-08 00:27:42',0,'2017-03-08 00:27:42'),(9,2,2,'Entrance Fee (Adult) x 2',2,'400.00','\0','\0',0,'2017-03-08 00:27:42',0,'2017-03-08 00:27:42'),(10,1,3,'Coca-Cola softdrinks 1.5L x5',5,'275.00','','\0',0,'2017-03-09 22:08:14',0,'2017-03-09 22:08:32');

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

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('082smfepe39h3fvpamq69b3hn6g18k5i','::1',1489343290,'__ci_last_regenerate|i:1489342705;'),('270rm0r8v8at49b7o59qr0sckunqg7r6','::1',1489342394,'__ci_last_regenerate|i:1489341998;'),('4gtk72u514mifcj7fdk5d7sfbccjt6ar','::1',1489345846,'__ci_last_regenerate|i:1489345547;'),('8kgsc7acdla2qume98cvbiuha0pb4qcc','::1',1489352882,'__ci_last_regenerate|i:1489352528;'),('dfk10nrkelqgsffbv8cbp47kkainaij6','::1',1489345547,'__ci_last_regenerate|i:1489344076;'),('dofnf8mfegsc5q6et5eb7v3ittop16fe','::1',1489343648,'__ci_last_regenerate|i:1489343294;'),('f03c7gpv37hgsth07mbe2kjs3skg96lm','::1',1489349023,'__ci_last_regenerate|i:1489348724;'),('f0ic1kl3ug6qqp35nkqc94hcv4b9g6ff','::1',1489352110,'__ci_last_regenerate|i:1489351795;'),('fpvvhm23p72d1u872mc8vu6seva62hcr','::1',1489346161,'__ci_last_regenerate|i:1489345849;'),('ggrqu3pobobole1dcj21aiutcjjjjple','::1',1489346499,'__ci_last_regenerate|i:1489346164;'),('gl4u9arit2ih6jlvbo9hr57anoubnn90','::1',1489350282,'__ci_last_regenerate|i:1489349027;'),('mhehmk4ce78jioaki4gecdhv0ob81a55','::1',1489350643,'__ci_last_regenerate|i:1489350282;'),('mv6u3dhf1i5kjfg6v36dioenj8v48fvn','::1',1489351794,'__ci_last_regenerate|i:1489351408;'),('nbga2s2ul87ju23esihbt2o7j5shdmf6','::1',1489347599,'__ci_last_regenerate|i:1489347297;'),('ojgvgn9d1miovldmd7mm69n8vo5oheg1','::1',1489352525,'__ci_last_regenerate|i:1489352112;'),('p76merqeafv2u4u5d0skcstu77qno43r','::1',1489348720,'__ci_last_regenerate|i:1489348339;'),('pa77vuoo53qnglb1efaqc1k3mmjt4o8d','::1',1489348335,'__ci_last_regenerate|i:1489348023;'),('qh5u1oagnrvn8salvkcpuhj3khgm3vr3','::1',1489351387,'__ci_last_regenerate|i:1489350646;'),('ravshbla1f6spbah9ignqogg59s7qhvd','::1',1489347296,'__ci_last_regenerate|i:1489346514;'),('rbjqb7e3j7ejjuol2bkc9t0a0v9bgitt','::1',1489342703,'__ci_last_regenerate|i:1489342396;'),('rj0jgh6m0u07t397tbtk326patfigqnm','::1',1489353245,'__ci_last_regenerate|i:1489352884;'),('tga9koi3ct4hlhgu3g328e8c7j939ugj','::1',1489348021,'__ci_last_regenerate|i:1489347603;'),('tm7t7hvvosvu4vjmgqkon39nret54na0','::1',1489341602,'__ci_last_regenerate|i:1489340540;'),('vlmqsnivoahbr0vlp01sufsc7bf9nian','::1',1489344072,'__ci_last_regenerate|i:1489343649;'),('vmh9vdcodnc2jug4vn6fnes91f69ira5','::1',1489341996,'__ci_last_regenerate|i:1489341603;');

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
