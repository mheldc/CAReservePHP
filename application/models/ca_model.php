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
		
		function addbooking($data){
			$rsguest = $this->db->query('');
		}
		
		function validate_credentials($data = []){
			if(count($data) > 0 || isset($data)){
				$rs = $this->db->query('call sp_validatecredentials(?,?)', array($data->lid, $data->lpw));
				
			}
		}
	}
?>