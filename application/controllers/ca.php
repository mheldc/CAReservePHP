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
		
		function reservation(){
			
		}
		
		function booking(){
			
		}
	}
?>