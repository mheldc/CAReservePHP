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
										and id not in (select `roomid` from ca_booking where `bkstat` = true)', $roomtype);
			return $rs->result_array();
		}
		
		function getroominfo($roomid = 0){
			$rs = $this->db->query('select a.`typeid` as rtype,
											a.`id` as room,
											a.`capacity` as rmcap,
											case 
												when date_format(now(),"%H%i%s") between date_format(c.`regtimein`,"%H%i%s") and date_format(c.`regtimeout`,"%H%i%s")
													then concat(date_format(c.`regtimein`,"%h:%i %p")," to ", date_format(c.`regtimeout`,"%h:%i %p"))
												when date_format(now(),"%H%i%s") >= date_format(c.`ovntimein`,"%H%i%s") or date_format(now(),"%H%i%s") <= date_format(c.`ovntimeout`,"%H%i%s")
													then concat(date_format(c.`ovntimein`,"%h:%i %p")," to ", date_format(c.`ovntimeout`,"%h:%i %p"))
												else "None"
											end as rmdur,
											case a.`typeid`
												when 6 then
													case 
														when date_format(now(),"%H%i%s") between 70000 and 115959 then c.`regular`
														when date_format(now(),"%H%i%s") between 120000 and 185959 then c.`regular` - 500
														when date_format(now(),"%H%i%s") between 190000 and 235959 then c.`overnight`
														when date_format(now(),"%H%i%s") between 0 and 65959 then c.`overnight` - 500
														else 0
													end
												else
													case 
														when date_format(now(),"%H%i%s") between date_format(c.`regtimein`,"%H%i%s") and date_format(c.`regtimeout`,"%H%i%s") then c.`regular`
														when date_format(now(),"%H%i%s") >= date_format(c.`ovntimein`,"%H%i%s") or date_format(now(),"%H%i%s") <= date_format(c.`ovntimeout`,"%H%i%s") then c.`overnight`
														else 0
													end 
												end as rates,
												case 
													when date_format(now(),"%H%i%s") between date_format(c.`regtimein`,"%H%i%s") and date_format(c.`regtimeout`,"%H%i%s") then 0
													when date_format(now(),"%H%i%s") >= date_format(c.`ovntimein`,"%H%i%s") or date_format(now(),"%H%i%s") <= date_format(c.`ovntimeout`,"%H%i%s") then 1
													else -1
												end ratebasis
									from 			ca_rooms 		as a
										 inner join	ca_roomtype		as b on a.`typeid` = b.`id`
										 inner join ca_room_rates	as c on a.`typeid` = c.`rmtypeid`
									where a.`id` = ?', $roomid);
			return $rs->result_array();
		}
		
		function getactivebookings(){
			$rs = $this->db->query('select 	a.`id` as bkid,
											concat(b.`lastname`, ", ", b.`firstname`, case length(trim(both from b.`middlename`)) when 0 then "" else concat(" ", substring(b.`middlename`,1,1),".") end )  as guestname,
											c.`roomdesc` as room,
											f.qty,
											ifnull(g.bcqty, 0) as bcqty,
											case when count(e.`ispaid`) > 0 then true else false end as unpaid,
											case a.`isovernight` when true then 
												case when now() >= concat(date_add(cast(substring(a.datecreated,1, 10) as date), interval 1 day), " ", d.`ovntimeout`) then true else false end
											else
												case when now() >= concat(cast(substring(a.datecreated,1, 10) as date), " ", d.`regtimeout`) then true else false end
											end as timeout,
											case 
												when ifnull(g.bcqty, 0) < (a.`guesta` + a.`guestc` + a.`guestc2`)
													then (a.`guesta` + a.`guestc` + a.`guestc2`) - ifnull(g.bcqty, 0)
												else 0
											end as bctoissue
									from 			ca_booking 			as a
										inner join 	ca_guest_info   	as b on a.`guestid` = b.`id`
										inner join 	ca_rooms			as c on a.`roomid` = c.`id`
										inner join  ca_room_rates		as d on c.`typeid` = d.`rmtypeid`
										left  join  ca_booking_items	as e on a.`id` = e.`bkid` and e.`ispaid` = false
										inner join  (select `bkid`, sum(`itemqty`) as qty from `ca_booking_items` where `itemtype` = 2 group by `bkid`) as f on a.`id` = f.`bkid`
										left  join  (select `bkid`, sum(`bcid`) as bcqty from `ca_booking_guest` group by `bkid`) as g on a.`id` = g.`bkid`
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
			$isovn = false;
			
			if($booking_info['ison'] == "1"){
				$isovn = true;
			}
			
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
							(`bksrctypeid`, `rsvid`, `guestid`, `rmtypeid`, `roomid`, `rmrate`, `guesta`, `guestc`, `guestc2`, `isovernight`, `bkstat`, `createdbyid`, `datecreated`)
						values
							(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, true, 0, now());";
				$this->db->query($qry, array($booking_info['srcid'], $booking_info['rsid'], $new_gid,
											 $booking_info['rtid'], $booking_info['rmid'], $booking_info['rmrt'],
											 $booking_info['ga'], $booking_info['gc'],  $booking_info['gc2'], $isovn));			
			} else {
				$qry = "insert into ca_booking
							(`bksrctypeid`, `rsvid`, `guestid`, `rmtypeid`, `roomid`, `rmrate`, `guesta`, `guestc`, `guestc2`, `isovernight`, `bkstat`, `createdbyid`, `datecreated`)
						values
							(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, true, 0, now());";
				$this->db->query($qry, array($booking_info['srcid'], $booking_info['rsid'], $booking_info['gid'],
											 $booking_info['rtid'], $booking_info['rmid'], $booking_info['rmrt'],
											 $booking_info['ga'], $booking_info['gc'],  $booking_info['gc2'], $isovn));	
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
			
			$msg = "Prepare : " . $booking_info['rmnm'];
			$this->db->query($qry, array($new_bid, $new_gid, $msg));
			
			// Guest
			/* 1 - Adult
			 * 2 - Child above 2 years old and above 4ft
			 * 3 - Child below 2 years old
			 */
			
			$qry = "select `id`, `gtype`, case when curtime() between dfrom and dto then dayrate else nightrate end as grates
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
					from `ca_guest_info`
					order by `lastname`, `firstname` asc";
			$result = $this->db->query($qry);
			
			return $result->result_array();
		}
		
		function getguestinfo($gid = 0){
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
			
			$qry = "select count(`ispaid`) as paymentdue from `ca_booking_items` where `bkid` = ? and `ispaid` = false;";
			$rs = $this->db->query($qry, $bid);
			$row = $rs->row();
			
			if ($row->paymentdue == 0) {
				return array('tag_status' => true);
			} else {
				return array('tag_status' => false);
			}
		}
		
		function getreceiptdetails($bid = 0){
			$qry = "select `bkid`, `itemtype`, `itemdesc`, `itemqty`, `itemamt`, `ispaid`, `isprinted`
					from `ca_booking_items`
					where `bkid` = ?
					  and `ispaid` = true
					  and `isprinted` = false;";
			$rcp = $this->db->query($qry, $bid);
			
			$qry = 'select	a.`id` as bid,
							concat(date_format(a.`datecreated`, "%Y%m%d"), "-", lpad(a.`id`,6,"0")) as cbid,
							concat(b.`lastname`, ", ", b.`firstname`, case length(trim( both from b.`middlename`)) when 0 then "" else concat(" ", substring(b.`middlename`, 1, 1)) end) as gname,
							b.`address`,
							b.`landline`,
							b.`mobile`,
							b.`email`,
							c.`typedesc` as roomtype,
							d.`roomdesc` as room
					from 			`ca_booking` 	as a
						inner join	`ca_guest_info` as b on a.`guestid` = b.`id`
						inner join 	`ca_roomtype`   as c on a.`rmtypeid` = c.`id`
						inner join 	`ca_rooms`		as d on a.`roomid` = d.`id`
					where a.id = ?';
			$bki = $this->db->query($qry, $bid);		
			
			$qry = "update `ca_booking_items` set `isprinted` = true where `bkid` = ? and `isprinted` = false;";
			$this->db->query($qry, $bid);
			
			$output = array('bill_items' => $rcp->result_array(),
							'bk_info' => $bki->result_array());
			
			return $output;
		}
		
		function flagcheckout($bid = 0){
			
			$checked_out = false;
			$with_unpaid = false;
			$checkout_result;
			
			$qry = 'select count(`id`) as unpaid from `ca_booking_items` where `ispaid` = false and `bkid` = ?';
			$rs = $this->db->query($qry, $bid);
			$row =  $rs->row();
			
			if($row->unpaid == 0) { $with_unpaid = false; } else { $with_unpaid = true; }
			
			if($with_unpaid == false) {
				$qry = 'update `ca_booking`
						set `bkstat` = false, `modifiedbyid` = 0, `datemodified` = now()
						where `id` = ?';
				$this->db->query($qry, $bid);
				
				$qry = 'select count(`id`) as recid from `ca_booking` where `id` = ? and `bkstat` = true;';
				$rs = $this->db->query($qry, $bid);
				$row = $rs->row();
				
				if($row->recid == 0) { $checked_out = true; } else { $checked_out = false; }
				
				if($checked_out == false) {
					$checkout_result = array('flag' => false, 'mesg' => 'There are problems while checking out, please call your system provider for support.');
				} else {
					$checkout_result = array('flag' => true, 'mesg' => 'Ok');
				}
			}
			else {
				$checkout_result = array('flag' => false, 'mesg' => 'There are item(s) that is due for payment. Please settle first before checking out.');
			}
			
			return $checkout_result;
		}
				
		function getguestrates(){
			$qry = 'select `id`,
							case 
								when cast(now() as datetime) >= cast(concat(curdate(), " ", `dfrom`) as datetime) then `dayrate`
								when cast(now() as datetime) >= cast(concat(curdate(), " ", `nfrom`) as datetime) then `nightrate`
								else 0
							end as rates
					from ca_guest_rates;';
			$rs = $this->db->query($qry);
			return $rs->result_array();
			
		}
		
		function appendguests($data){
			if(isset($data)){
				$bkid = 0;
				$gc_a = 0;
				$gc_b = 0;
				$gc_c = 0;
				
				$qry = 'insert into `ca_booking_items`
							(`bkid`, `itemtype`, `itemdesc`, `itemqty`, `itemamt`, `createdbyid`, `datecreated`)
						values
							(?, ?, ?, ?, ?, 0, now());';
				foreach($data as $d){
					$this->db->query($qry, array($d['bid'], $d['itype'], $d['idesc'], $d['iqty'], $d['iamt']));
					$bkid = $d['bid'];
					
					if($d['gtype'] == 'a'){
						$gc_a = $d['iqty'];
					} elseif($d['gtype'] == 'b'){
						$gc_b = $d['iqty']; 
					} elseif($d['gtype'] == 'c'){
						$gc_c = $d['iqty']; 
					} else {
						$gc_a = 0;
						$gc_b = 0;
						$gc_c = 0;
					}
				}
				
				$qry = 'update `ca_booking` 
						set `guesta` = `guesta` + ?, `guestc` = `guestc` + ?, `guestc2` = `guestc2` + ?
						where `id` = ?;';
						
				$this->db->query($qry, array($gc_a, $gc_b, $gc_c, $bkid));
				
				return array('flag' => true, 'mesg' => 'Ok');
			} else {
				return array('flag' => false, 'mesg' => 'Encountered problems while adding new guest. Please contact your system provider for support.');
			}
		}
		
		function getbookingaccomodation($bid = 0){
			if(isset($bid)){
				$qry = 'select a.`id` as bid,
								a.`rmtypeid` as acctype,
								d.`typedesc` as acctdesc,
								a.`roomid` as acc,
								c.`roomdesc` as accdesc,
								a.`rmrate` as rates
						from 		   `ca_booking`    as a
							inner join `ca_room_rates` as b on a.`rmtypeid` = b.`rmtypeid`
							inner join `ca_rooms`	   as c on a.`roomid` = c.`id`
							inner join `ca_roomtype`   as d on a.`rmtypeid` = d.`id`
						where a.`id` = ? and a.`bkstat` = true;';
				$rs = $this->db->query($qry, $bid);
				return $rs->result_array();
				
			} else {
				return array('flag' => false, 'mesg' => 'Encountered problems while adding new guest. Please contact your system provider for support.');
			}
		}
		
		
		function transferaccomodation($data){
			$ti = $data[0];
			$tid = 0;
			
			$qry = 'insert into `ca_booking_transfers`
						(`bid`, `frmtypeid`, `frmid`, `frmrate`, `newrmtypeid`, `newrmid`, `rmrate`, `remarks`, `createdbyid`, `datecreated`)
					values
						(?, ?, ?, ?, ?, ?, ?, ?, 0, now());';
			$this->db->query($qry, array($ti['bid'],
										 $ti['frmtype'], $ti['frmid'], $ti['frmrt'],
										 $ti['rmtype'], $ti['rmid'], $ti['rmrt'], $ti['rmk']));
			
			$qry = 'update `ca_booking`
					set `rmtypeid` = ?, `roomid` = ?, `rmrate` = ?
					where `id` = ?;';
			$this->db->query($qry, array($ti['rmtype'], $ti['rmid'], $ti['rmrt'],$ti['bid']));
			
			if($ti['frmrt'] < $ti['rmrt'] || $ti['frmrt'] == $ti['rmrt'] ){
				$tamount = floatval($ti['rmrt'] - $ti['frmrt']);
				$qry = 'insert into `ca_booking_items` 
							(`bkid`, `itemtype`, `itemdesc`, `itemqty`, `itemamt`, `createdbyid`, `datecreated`)
						values
							(?, ?, ?, ?, ?, 0, now());';
							
				$this->db->query($qry, array($ti['bid'], 1, $ti['rmnm'], 1, $tamount));
			}
			
			$mesg = 'Transfer : From '. $ti['frmnm'] .' to ' . $ti['rmnm'];
			$qry = 'insert into `ca_queue_served`
						(`bid`, `guestid`, `message`, `isserved`, `createdbyid`, `datecreated`)
					select `id`, `guestid`, ?, false, 0, now()
					from `ca_booking` where `id` = ?;';
			$this->db->query($qry, array($mesg, $ti['bid']));
			
			$qry = 'select `id` as recid from `ca_booking_transfers`
					where `bid` = ?
					  and `newrmtypeid` = ?
					  and `newrmid` = ?
					order by `id` desc limit 1;';
			$rs = $this->db->query($qry, array($ti['bid'], $ti['rmtype'], $ti['rmid']));
			
			if($rs->num_rows() > 0){
				$row = $rs->row();
				$tid = $row->recid;
			}
			
			if($tid == 0){
				return array('flag' => false, 'mesg' => 'Error occured while processing transfer accomodation. Please contact you system provider for support.');
			} else {
				return array('flag' => true, 'mesg' => 'Ok');
			}
			
		}
		
		function getitemtypes(){
			$qry = 'select `id` as itid, `typedesc` as itdesc  from `ca_invtypes` where `typestat` = true;';
			$rs = $this->db->query($qry);
			return $rs->result_array();
		}
		
		function getitems($itype = 0){
			$qry = 'select `id` as iid, `itemdesc` as idesc, `itemdesc` as idesc2, `price` as iprice
					from `ca_invitems`
					where `itemstat` = true
					  and `typeid` = ?;';
			$rs = $this->db->query($qry, $itype);
			return $rs->result_array();
		}
		
		function addrequestitems($data){
			if(count($data) > 0){
				foreach($data as $d){
					$qry = 'insert into `ca_booking_items`
								(`bkid`, `itemtype`, `itemdesc`, `itemqty`, `itemamt`, `ispaid`, `createdbyid`, `datecreated`)
							values
								(?, 3, ?, ?, ?, false, 0, now());';
					$this->db->query($qry, array($d['bid'], $d['ritemdesc'] .' x'. $d['rqty'] , $d['rqty'], $d['ist']));
				}
				
				$bkid = $data[0]['bid'];
				
				$qry = 'select count(`id`) as icnt from `ca_booking_items` where `bkid` = ? and `itemtype` = 3 and `ispaid` = false;';
				$rs = $this->db->query($qry, $bkid);
				
				$row = $rs->row();
				
				if(count($data) == $row->icnt){
					return array('flag' => true);
				}
				else {
					return array('flag' => false);
				}
			}
		}
		
		function logbarcodewristbands($data){
			
			$bkid = 0;
			foreach($data as $d){
				$qry = 'insert into `ca_booking_guest`
							(`bkid`, `bcid`, `timein`, `expdate`, `createdbyid`, `datecreated`)
						select 	a.`id`,
								?, 
								curtime() as timein, 
								case a.`isovernight`
									when true 
										then case 
												when date_format(a.`datecreated`,"%H%i%s") >= 0 and 
													 date_format(a.`datecreated`,"%H%i%s") < 70000 
													then concat(date_format(a.`datecreated`,"%Y-%m-%d"), " ", b.`ovntimeout`)
												else concat(date_format(date_add(a.`datecreated`, interval 1 day),"%Y-%m-%d"), " ", b.`ovntimeout`)
											 end
									when false then concat(date_format(a.`datecreated`,"%Y-%m-%d"), " ", b.`regtimeout`)
									else now()
								end as expdate,
								0 as cbid,
								now() as today
						from 			`ca_booking` 	as a
							inner join 	`ca_room_rates` as b on a.`rmtypeid` = b.`rmtypeid`
						where a.`id` = ?';				
				$bkid = $d['bid'];
				$this->db->query($qry, array($d['bcode'], $d['bid']));
			}
			
			$qry = 'select count(`id`) as wbc from `ca_booking_guest` where `bkid` = ?;';
			$rs = $this->db->query($qry, $bkid);
			$row = $rs->row();
			
			if(count($data) == $row->wbc){
				return array('flag' => true);
			} else {
				return array('flag' => false);
			}
		}
		
		function validate_credentials($data = []){
			if(count($data) > 0 || isset($data)){
				$rs = $this->db->query('call sp_validatecredentials(?,?)', array($data->lid, $data->lpw));
				
			}
		}
	}
?>