<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class ca extends CI_Model
	{
		function index(){
			
		}
		
		function validate_credentials($data = []){
			if(count($data) > 0 || isset($data)){
				$rs = $this->db->query('call sp_validatecredentials(?,?)', array($data->lid, $data->lpw));
				
			}
		}
	}
?>