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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
