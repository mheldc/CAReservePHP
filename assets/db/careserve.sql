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
  `bsource` int(1) NOT NULL DEFAULT '0',
  `bsrcid` bigint(20) NOT NULL DEFAULT '0',
  `bid` varchar(25) NOT NULL DEFAULT 'xxx',
  `guestid` bigint(20) NOT NULL DEFAULT '0',
  `rmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `rmid` bigint(20) NOT NULL DEFAULT '0',
  `overnight` bit(1) NOT NULL DEFAULT b'0',
  `guestcount` int(11) NOT NULL DEFAULT '1',
  `adultshare` int(11) NOT NULL DEFAULT '1',
  `childshare` int(11) NOT NULL DEFAULT '1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`bsrcid`,`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_guest_info` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_queue_served` */

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `ca_room_rates` */

insert  into `ca_room_rates`(`id`,`rmtypeid`,`regular`,`regtimein`,`regtimeout`,`overnight`,`ovntimein`,`ovntimeout`,`extension`,`extratebase`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,1,'1000.00','07:00:00','17:00:00','1000.00','19:00:00','05:00:00','1000.00',1,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(2,2,'1500.00','07:00:00','17:00:00','1500.00','19:00:00','05:00:00','1500.00',1,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(3,3,'2000.00','07:00:00','17:00:00','2000.00','19:00:00','05:00:00','2000.00',1,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(4,4,'2500.00','07:00:00','17:00:00','2500.00','19:00:00','05:00:00','2500.00',1,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `ca_rooms` */

insert  into `ca_rooms`(`id`,`typeid`,`roomcode`,`roomdesc`,`capacity`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,1,'UM01','Umbrella 1',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(2,1,'GA01','Gazebo 1',15,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(3,1,'CA01','Cabanas 1',20,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(4,2,'ST01','Standard Room 1',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(5,2,'ST02','Standard Room 2',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(6,2,'ST03','Standard Room 3',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(7,2,'ST04','Standard Room 4',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(8,2,'ST05','Standard Room 5',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(9,2,'ST06','Standard Room 6',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(10,2,'ST07','Standard Room 7',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(11,2,'ST08','Standard Room 8',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(12,2,'FA01','Family Room 1',20,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(13,2,'FA02','Family Room 2',20,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(14,3,'VI01','Villa 1',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(15,3,'VI02','Villa 2',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(16,3,'VI03','Villa 3',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(17,3,'VI04','Villa 4',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(18,3,'VI05','Villa 5 (Open Villa)',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(19,3,'VI06','Villa 6',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(20,4,'FH01','Function Hall 1',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0),(21,4,'PV01','Pavillon 1',10,'2017-02-09 00:06:32',0,'2017-02-09 00:06:32',0);

/*Table structure for table `ca_roomtype` */

DROP TABLE IF EXISTS `ca_roomtype`;

CREATE TABLE `ca_roomtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typedesc` varchar(50) DEFAULT NULL,
  `dptype` bit(1) NOT NULL DEFAULT b'0',
  `dpvalue` double NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `ca_roomtype` */

insert  into `ca_roomtype`(`id`,`typedesc`,`dptype`,`dpvalue`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,'Cottages','',0,'2017-02-09 00:06:03',0,'2017-02-09 00:06:03',0),(2,'Rooms','',0,'2017-02-09 00:06:03',0,'2017-02-09 00:06:03',0),(3,'Villa','',0,'2017-02-09 00:06:03',0,'2017-02-09 00:06:03',0),(4,'Function Hall','',0,'2017-02-09 00:06:03',0,'2017-02-09 00:06:03',0);

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

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('09egu7qake53lfqh3fdt6vaal9ocf0ku','::1',1486617956,'__ci_last_regenerate|i:1486617669;'),('0h7v9qj9532c3br8jqks740ko8tem1nh','::1',1486621456,'__ci_last_regenerate|i:1486621429;'),('2accrd5nvdg20dlb4u7on0fm58mt6pln','::1',1486614910,'__ci_last_regenerate|i:1486614909;'),('33uvpr39hrcksbequ254pe0742jgj0t6','::1',1486623126,'__ci_last_regenerate|i:1486622850;'),('3l10l8491tmc007s8crfrc683eu9ia75','::1',1486618749,'__ci_last_regenerate|i:1486618543;'),('40l6ihgv9r33cq2u9dchft3rj6js5frt','::1',1486615367,'__ci_last_regenerate|i:1486615366;'),('41h560s4rlal8mkmc08d7agvn0ana3ol','127.0.0.1',1486325069,'__ci_last_regenerate|i:1486325069;'),('48t32n0et5m33q5t9mphhfrjvc2qisje','::1',1486624253,'__ci_last_regenerate|i:1486623967;'),('51v5ah232hd9ij4f1dtlfci9blgolssc','::1',1486623451,'__ci_last_regenerate|i:1486623339;'),('81ih0dnll6s12dqcau2j6a1apuo01p20','::1',1486621982,'__ci_last_regenerate|i:1486621733;'),('bumusqqonos4e6h8d60pe1pqed8i141o','::1',1486325118,'__ci_last_regenerate|i:1486324870;init|s:29:\"This is just an intialisation\";'),('c2uijh5q2t32j9e2g3ug2hl6737puvre','::1',1486613785,'__ci_last_regenerate|i:1486613783;'),('c9t927uq1rpr3796qvccelff7ts5nnnp','::1',1486321593,'__ci_last_regenerate|i:1486321593;init|s:29:\"This is just an intialisation\";'),('e2beovpelhp4fj0tq83tricf562310g5','::1',1486618262,'__ci_last_regenerate|i:1486618241;'),('g8p3nflilv2c0t7ppulr19jbsqt12jon','::1',1486622038,'__ci_last_regenerate|i:1486622038;'),('i0sqoprr8hqrvqese9foalvjsl84khts','127.0.0.1',1486325004,'__ci_last_regenerate|i:1486325004;'),('i1opsn96gi9qnge3skeop5i3h6lommuk','::1',1486223430,'__ci_last_regenerate|i:1486223430;init|s:29:\"This is just an intialisation\";'),('k0amvkqe5nc4b502f2er5uu86aeskgs2','::1',1486325452,'__ci_last_regenerate|i:1486325181;init|s:29:\"This is just an intialisation\";'),('l40r7mg8q18pbqodi20d8fk1hkstc72r','::1',1486324812,'__ci_last_regenerate|i:1486324538;init|s:29:\"This is just an intialisation\";'),('m6m6juuc21s4plh4eqvgvuq3a1dss1k8','::1',1486325593,'__ci_last_regenerate|i:1486325566;init|s:29:\"This is just an intialisation\";'),('metcv4o5jji98ak2msimnf597c9r7lmk','::1',1486383479,'__ci_last_regenerate|i:1486383477;init|s:29:\"This is just an intialisation\";'),('qa3tpceaam90iovs5puu194jbn9485pr','127.0.0.1',1486324871,'__ci_last_regenerate|i:1486324871;');

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
