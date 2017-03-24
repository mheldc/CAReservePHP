<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class ca extends CI_Controller
	{
		function index(){
			
			$this->load->view('header');
			if(isset($this->session->udata[0]['uid'])){
				$vdata['sdata'] = $this->session->udata[0];
				$vdata['display'] = 1;
			} else {
				$vdata['sdata'] = null;
				$vdata['display'] = 0;
			}
			$this->load->view('main', $vdata);
			$this->load->view('footer');
		}
		
		function login(){
			//$this->session->sess_destroy();
			if(isset($_GET['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->validate_credentials($_GET['pdata']);
				echo json_encode($output);
			}
		}
		
		function logout(){
			$this->session->sess_destroy();
			header("Location: ". str_replace('index.php/','',base_url()));
		}
		
		function booking(){
			$this->load->view('header');
			if(isset($this->session->udata[0]['uid'])){
				$vdata['sdata'] = $this->session->udata[0];
				$vdata['display'] = 1;
				$this->load->view('booking', $vdata);
			} else {
				$vdata['sdata'] = null;
				$vdata['display'] = 0;
				$this->load->view('main', $vdata);
			}
			$this->load->view('footer');
		}
		
		function reservation(){
			$this->load->view('header');
			if(isset($this->session->udata[0]['uid'])){
				$vdata['sdata'] = $this->session->udata[0];
				$vdata['display'] = 1;
				$this->load->view('reservation', $vdata);
			} else {
				$vdata['sdata'] = null;
				$vdata['display'] = 0;
				$this->load->view('main', $vdata);
			}
			$this->load->view('footer');
		}
		
		function inventory(){
			
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
		
		function roomlist(){
			if(isset($_GET['id'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getroomlist($_GET['id']);			
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
		
		function bookings(){
			$this->load->model('ca_model');
			$output = $this->ca_model->getactivebookings();
			echo json_encode($output);
		}
		
		function searchbooking(){
			if(isset($_GET['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getsearchedbooking($_GET['pdata']);
				echo json_encode($output);
			}
		}
		
		function newbooking(){
			if(isset($_POST['pdata'])){
				//$pdata = $_POST['pdata'];
				$this->load->model('ca_model');
				$output = $this->ca_model->addbooking($_POST['pdata']);
				echo json_encode($output);
			}
		}
		
		function guestlist(){
			if(isset($_GET['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getguestlist($_GET['pdata']);
				echo json_encode($output);
			}
		}
		
		function guestinfo(){
			if(isset($_GET['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getguestinfo($_GET['pdata']);
				echo json_encode($output);
			}
		}
		
		function paymentsummary(){
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
		
		function checkout(){
			if(isset($_POST['pdata'])) {
				$this->load->model('ca_model');
				$output = $this->ca_model->flagcheckout($_POST['pdata']);
				echo json_encode($output);	
			}
		}
	
		function guestrates(){
			$this->load->model('ca_model');
			$output = $this->ca_model->getguestrates();
			echo json_encode($output);	
		}
		
		function addguest(){
			if(isset($_POST['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->appendguests($_POST['pdata']);
				echo json_encode($output);
			}
		}
	
		function curaccomodation(){
			if(isset($_GET['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getbookingaccomodation($_GET['pdata']);
				echo json_encode($output);
			}
		}
		
		function transferaccomodation(){
			if(isset($_POST['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->transferaccomodation($_POST['pdata']);
				echo json_encode($output);
			}
		}
		
		function itemtypes(){
			$this->load->model('ca_model');
			$output = $this->ca_model->getitemtypes();
			echo json_encode($output);
		}
		
		function items(){
			if(isset($_GET['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->getitems($_GET['pdata']);
				echo json_encode($output);
			}
		}
		
		function requestitems(){
			if(isset($_POST['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->addrequestitems($_POST['pdata']);
				echo json_encode($output);
			}
		}
		
		function issueresortpasses(){
			if(isset($_POST['pdata'])){
				$this->load->model('ca_model');
				$output = $this->ca_model->logbarcodewristbands($_POST['pdata']);
				echo json_encode($output);
			}			
		}
		
		function receipt(){
			/*
			if(isset($_GET['pdata'])){
				$this->load->model('ca_model');
				$this->ca_model->getreceiptdetails($_GET['pdata']);
			}
			*/
            $data['content'] = '<table style="width:100%;">
									<tr>
										<td style="width: 130; height:83;">
											<img src="./assets/img/logo.png" width="130px" height="83px" alt="No Image">
										</td>
										<td style="width: 74%; height:83; vertical-align: center;">
											<label style="font-family: helvetica; color: rgb(205, 92, 92); font-size: 18px;">BILLING STATEMENT</label>
											<br />
											<label style="font-family: helvetica; color: rgb(205, 92, 92); font-size: 10px;">COSTA ABRIL RESORT</label>
											<br />
											<label style="font-family: helvetica; color: rgb(205, 92, 92); font-size: 8px;">#40 Dao St. San Jose, Rodriguez, Rizal Contact #: 514 1282 | 534 8119 |0922 832 0098</label>
										</td>
									</tr>
								</table>
								<br /><br />
								<table style="width:100%; font-size:9px;">
									<tr>
										<td style="width:15%;">Booking Number:</td>
										<td style="width:35%;">20170307-000001</td>
										<td style="width:15%;">Booking Type:</td>
										<td style="width:35%;">Walk-In</td>
									</tr>
									<tr>
										<td style="width:15%;">Customer Name:</td>
										<td style="width:35%;">Dela Cruz, Juan D.</td>
										<td style="width:15%;">Landline No:</td>
										<td style="width:35%;">1111111</td>
									</tr>
									<tr>
										<td style="width:15%;">Address:</td>
										<td style="width:35%;">Sampaloc Manila</td>
										<td style="width:15%;">Mobile No:</td>
										<td style="width:35%;">1111111</td>
									</tr>
									<tr>
										<td style="width:15%;">Email Addr:</td>
										<td style="width:35%;">sample@example.com</td>
										<td style="width:15%;"></td>
										<td style="width:35%;"></td>
									</tr>
								</table>
								<br />
								<div style="border: 1px solid black; height:20px !important; width:100%;">
									<div style="width:100%;">
										<table border="1">
											<thead>
												<tr style="border-bottom: 1px solid black;">
													<td colspan="3" style="text-align:center; font-size: 12px;">Particulars</td>
												</tr>
												<tr>
													<td style="text-align:left; font-size: 9px; width:80%;"> Item Description</td>
													<td style="text-align:center; font-size: 9px; width:10%;"> Qty</td>
													<td style="text-align:center; font-size: 9px; width:10%;"> Subtotal</td>
												</tr>
											</thead>
										</table>
										<table border="0">
											<tbody>
												<tr><td colspan="3" style="font-size: 8px;">&nbsp;</td></tr>
												<tr>
													<td style="text-align:left; vertical-align: middle; font-size: 9px; width:80%; height:10px;"> Item 1</td>
													<td style="text-align:right; vertical-align: middle; font-size: 9px; width:10%; height:10px;"> 1 &nbsp;</td>
													<td style="text-align:right; vertical-align: middle; font-size: 9px; width:10%; height:10px;"> 100.00 &nbsp;</td>
												</tr>
												<tr>
													<td style="text-align:left; vertical-align: middle; font-size: 9px; width:80%; height:10px;"> Item 2</td>
													<td style="text-align:right; vertical-align: middle; font-size: 9px; width:10%; height:10px;"> 1 &nbsp;</td>
													<td style="text-align:right; vertical-align: middle; font-size: 9px; width:10%; height:10px;"> 100.00 &nbsp;</td>
												</tr>
												<tr>
													<td style="text-align:left; vertical-align: middle; font-size: 9px; width:80%; height:10px;"> Item 3</td>
													<td style="text-align:right; vertical-align: middle; font-size: 9px; width:10%; height:10px;"> 1 &nbsp;</td>
													<td style="text-align:right; vertical-align: middle; font-size: 9px; width:10%; height:10px;"> 100.00 &nbsp;</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tfoot>
												<tr><td colspan="3" style="font-size: 8px;">&nbsp;</td></tr>
												<tr><td colspan="3" style="font-size: 8px;"><hr></td></tr>
												<tr>
													<td colspan="2" style="text-align:left; font-size: 10px; width:80%; vertical-align: middle;"> Total due</td>
													<td style="text-align:right; font-size: 10px; width:20%; vertical-align: middle;"> 300.00 &nbsp;</td>
												</tr>
											</thead>
										</tfoot>
									</div>
								</div>';
            $data['title'] = "Payment Reciept";
            $this->load->helper('tcpdf_helper');
            $this->load->view('reports/receipt',$data);
        }
	
		function occular(){
			$this->load->model('ca_model');
			$output = $this->ca_model->get_occular_requests();
			echo json_encode($output);
		}
		
		function regoccular(){
			
		}
	}
?>