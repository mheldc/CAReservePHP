<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class ca extends CI_Controller
	{
		function index(){
			$this->load->view('header');
			$this->load->view('booking');
			$this->load->view('footer');
		}
		
		function login(){
			if(isset($_POST['data'])){
				$data = $_POST['data'];
				$this->load->model('ca');
			
			} else {
				echo 'Invalid or no data sent.';
			}
			/*
            if(isset($this->session->userid)){
                $this->reservation();
            } else {
                if(isset($_POST['data'])){
                    $this->load->model('ca');
				   // $data = $this->ca->validate_credentials($_POST['data']);
                    
                }
            }
            */
		}
		
		function roomtypes(){
			$this->load->model('ca_model');
			$output = $this->ca_model->getroomtypes();
			
			echo json_encode($output);
		}
		
		function rooms(){
			if(isset($_GET['id'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getrooms($_GET['id']);			
				echo json_encode($output);
			}
		}
		
		function roomdetails(){
			if(isset($_GET['id'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getroominfo($_GET['id']);			
				echo json_encode($output);
			}
		}
		
		function reservation(){
			
		}
		
		function bookings(){
			$this->load->model('ca_model');
			$output = $this->ca_model->getactivebookings();
			echo json_encode($output);
		}
		
		function newbooking(){
			if(isset($_POST['pdata'])){
				//$pdata = $_POST['pdata'];
				$this->load->model('ca_model');
				$output = $this->ca_model->addbooking($_POST['pdata']);
				echo json_encode($output);
				//echo json_encode(array($pdata[0]['booking_info']['srcid']));
			}
		}
		
		function guestlist(){
			$this->load->model('ca_model');
			$output = $this->ca_model->getguestlist();
			echo json_encode($output);
		}
		
		function guestinfo(){
			if(isset($_GET['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getguestinfo($_GET['pdata']);
				echo json_encode($output);
			}
		}
		
		function paymentsummary() {
			if(isset($_GET['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getpaymentsummary($_GET['pdata']);
				echo json_encode($output);
			}
		}
		
		function tagpayment(){
			if(isset($_POST['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->updatepayment($_POST['pdata']);
				echo json_encode($output);				
			}
		}
	}
?>