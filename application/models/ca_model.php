<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class ca_model extends CI_Model
	{
		function index(){
			
		}
		
		function getroomtypes(){
			$rs = $this->db->query('select `id`, `typedesc` from ca_roomtype where `recstatus` = true;');
			return $rs->result_array();
		}
		
		function getrooms($roomtype = 0){
			$rs = $this->db->query('select id, concat(roomcode, ":", roomdesc) as room
									from ca_rooms
									where typeid = ?
										and id not in (select `roomid` from ca_booking)', $roomtype);
			return $rs->result_array();
		}
		
		function getroominfo($roomid = 0){
			$rs = $this->db->query('select a.`typeid` as rtype,
											a.`id` as room,
											a.`capacity` as rmcap,
											concat(date_format(c.`regtimein`,"%h:%i %p")," to ", date_format(c.`regtimeout`,"%h:%i %p")) as daytime,
											c.`regular` as dayrate,
											concat(date_format(c.`ovntimein`,"%h:%i %p")," to ", date_format(c.`ovntimeout`,"%h:%i %p")) as nighttime,
											c.`overnight` as nightrate
									from 			ca_rooms 		as a
										 inner join	ca_roomtype		as b on a.`typeid` = b.`id`
										 inner join  ca_room_rates	as c on a.`typeid` = c.`rmtypeid`
									where a.`id` = ?', $roomid);
			return $rs->result_array();
		}
		
		function getactivebookings(){
			$rs = $this->db->query('select a.`id` as bkid,
											concat(b.`lastname`, ", ", b.`firstname`, case length(trim(both from b.`middlename`)) when 0 then "" else concat(" ", substring(b.`middlename`,1,1),".") end )  as guestname,
											c.`roomdesc` as room,
											f.qty,
											case when count(e.`ispaid`) > 0 then true else false end as unpaid,
											case a.`isovernight` when true then 
												 case when curtime() >= d.`ovntimeout` then true else false end
											else
												 case when curtime() >= d.`regtimeout` then true else false end
											end as timeout
									 from 			ca_booking 			as a
										 inner join 	ca_guest_info   	as b on a.`guestid` = b.`id`
										 inner join 	ca_rooms			as c on a.`roomid` = c.`id`
										 inner join  ca_room_rates		as d on c.`typeid` = d.`rmtypeid`
										 left  join  ca_booking_items	as e on a.`id` = e.`bkid` and e.`ispaid` = false
										 inner join  (select `bkid`, sum(`itemqty`) as qty from `ca_booking_items` where `itemtype` = 2 group by `bkid`) as f on a.`id` = f.`bkid`
									 where a.`bkstat` = true
									 group by a.`id`, e.`ispaid`;');
			return $rs->result_array();
		}
		
		function addbooking($data){
			// Add booking information
			$booking_info = $data[0]['booking_info'];			
			$guest_info = $data[1]['guest_info'];
			$new_gid = 0;
			$new_bid = 0;
			
			if($booking_info['gid'] == 0) {
				$qry = "insert into `ca_guest_info`
							(`salutation`, `lastname`, `firstname`, `middlename`, `address`, `email`, `landline`, `mobile`, `datecreated`, `createdbyid`)
						values
							(?, ?, ?, ?, ?, ?, ?, ?, now(), 0);";
							
				$this->db->query($qry, array($guest_info['sal'], $guest_info['gln'], $guest_info['gfn'], $guest_info['gmn'],
											 $guest_info['gadd'], $guest_info['geml'], $guest_info['gland'], $guest_info['gmob']));
				
				$qry = "select last_insert_id() as recid from ca_guest_info;";
						  
				$rs = $this->db->query($qry);
				
				if($rs->num_rows() > 0){
					$row = $rs->row();
					$new_gid = $row->recid;
				}
				
				$qry = "insert into ca_booking
						(`bksrctypeid`, `rsvid`, `guestid`, `rmtypeid`, `roomid`, `guesta`, `guestc`, `isovernight`, `bkstat`, `createdbyid`, `datecreated`)
					values
						(?, ?, ?, ?, ?, ?, ?, ?, true, 0, now())";
				$this->db->query($qry, array($booking_info['srcid'], $booking_info['rsid'], $new_gid,
											 $booking_info['rtid'], $booking_info['rmid'], $booking_info['ga'],
											 $booking_info['gc'], $booking_info['ison']));				
			} else {
				$qry = "insert into ca_booking
						(`bksrctypeid`, `rsvid`, `guestid`, `rmtypeid`, `roomid`, `guesta`, `guestc`, `isovernight`, `bkstat`, `createdbyid`, `datecreated`)
					values
						(?, ?, ?, ?, ?, ?, ?, ?, true, 0, now())";
				$this->db->query($qry, array($booking_info['srcid'], $booking_info['rsid'], $booking_info['gid'],
											 $booking_info['rtid'], $booking_info['rmid'], $booking_info['ga'],
											 $booking_info['gc'], $booking_info['ison']));
			}
			
			$qry = "select last_insert_id() as recid from `ca_booking`;";
			$rs = $this->db->query($qry);
			if($rs->num_rows() > 0){
				$row = $rs->row();
				$new_bid = $row->recid;
			}
			
			// Add booking items
			// Room
			$qry = "insert into `ca_booking_items`
						(`bkid`, `itemtype`, `itemdesc`, `itemqty`, `itemamt`, `ispaid`, `createdbyid`, `datecreated`)
					values
						(?, ?, ?, ?, ?, false, 0, now());";
			$this->db->query($qry, array($new_bid, 1, $booking_info['rmnm'], 1, $booking_info['rmrt']));
			
			// Add to Queue serve
			$qry = "insert into `ca_queue_served`
						(`bid`, `guestid`, `message`, `isserved`, `createdbyid`, `datecreated`)
					values
						(?, ?, ?, false, 0, now());";
						
			if($new_gid == 0) {$new_gid = $booking_info['gid'];}
			
			$msg = "Please prepare " . $booking_info['rmnm'] . " for guest " . $guest_info['gfn'] . " " . $guest_info['gln'] . " for " . ($booking_info['ga'] + $booking_info['gc'] + $booking_info['gc2']) . " pax.";
			$this->db->query($qry, array($new_bid, $new_gid, $msg));
			
			// Guest
			/* 1 - Adult
			 * 2 - Child above 2 years old and above 4ft
			 * 3 - Child below 2 years old
			 */
			
			$qry = "select `id`, `gtype`, case when curtime() between  dfrom and dto then dayrate else nightrate end as grates
					from ca_guest_rates
					order by `id` asc";
			$rs = $this->db->query($qry);
			$grates = [];
			
			foreach ($rs->result_array() as $row)
			{
					array_push($grates, array($row['id'], $row['gtype'], $row['grates']));
			}
			
			$qry = "insert into `ca_booking_items`
						(`bkid`, `itemtype`, `itemdesc`, `itemqty`, `itemamt`, `ispaid`, `createdbyid`, `datecreated`)
					values
						(?, ?, ?, ?, ?, false, 0, now());";
			
			if($booking_info['ga'] > 0){
				$msg = "Entrance Fee (Adult) x " . $booking_info['ga'];
				$this->db->query($qry, array($new_bid, 2, $msg, $booking_info['ga'], ($booking_info['ga'] * $grates[0][2])));			
			}
			
			if($booking_info['gc'] > 0){
				$msg = "Entrance Fee (Child) x " . $booking_info['gc'];
				$this->db->query($qry, array($new_bid, 2, $msg, $booking_info['gc'], ($booking_info['gc'] * $grates[1][2])));			
			}

			if($booking_info['gc2'] > 0){
				$msg = "Entrance Fee (Child below 2 y/o) x " . $booking_info['gc2'];
				$this->db->query($qry, array($new_bid, 2, $msg, $booking_info['gc2'], ($booking_info['gc2'] * $grates[2][2])));			
			}
		}
		
		function getguestlist($searchparam = ''){
			$qry = "select `id`, concat(`lastname`, ', ', `firstname`, ' ', 
							case length(trim(both from `middlename`)) when 0 then '' else concat(substring(`middlename`,1,1), '.') end) as gname
					from `ca_guest_info`";
			$result = $this->db->query($qry);
			
			return $result->result_array();
		}
		
		function getguestinfo($gid = 0) {
			$qry = "select `salutation`, `lastname`, `firstname`, `middlename`, `address`, `email`, `landline`, `mobile`
					from `ca_guest_info`
					where `id` = ?;";
			$rs = $this->db->query($qry, $gid);
			return $rs->result_array();
		}
		
		function getpaymentsummary($bid = 0){
			$qry = "select `id`, `bkid`, `itemtype`, `itemdesc`, `itemqty`, `itemamt` 
					from ca_booking_items
					where `bkid` = ?
					  and `ispaid` = false;";
			$rs = $this->db->query($qry, $bid);
			return $rs->result_array();
		}
		
		function updatepayment($bid = 0){
			$qry = "update `ca_booking_items`
					set `ispaid` = true, `modifiedbyid` = 0, `datemodified` = now()
					where `bkid` = ?
					  and `ispaid` = false;";
			$this->db->query($qry, $bid);
			
			$qry = "select count(`ispaid`) as paymentdue where `bkid` = ? and `ispaid` = false;";
			$rs = $this->db->query($qry, $bid);
			
			foreach ($rs->result() as $row)
			{
				if($row->paymentdue== 0){
					return(array('tag_status' => true));
				} else {
					return(array('tag_status' => false));
				}
			}
		}
		
		function validate_credentials($data = []){
			if(count($data) > 0 || isset($data)){
				$rs = $this->db->query('call sp_validatecredentials(?,?)', array($data->lid, $data->lpw));
				
			}
		}
	}
?>