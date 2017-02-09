<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	class setup extends CI_Controller
	{
		public function index()
		{
			$this->session->set_userdata('init', "This is just an intialisation");
			$this->load->view('header');
			$this->load->view('main');
			$this->load->view('footer');
			
			//$this->load->view('reports/quotation_template');
			//$this->printQuotation();
			echo $this->session->init;
		}
		
		public function roomtype(){
			
		}
		
		public function rooms(){
			
		}
		
		public function promos(){
			
		}
		
		public function userroles(){
			
		}
		
		public function users(){
			
		}
		
		public function printQuotation(){
			$dtToday = date("j F Y");
			$qTemplate = $this->load->view('reports/quotation_template', [], true);
			$this->createPDF($qTemplate);
		}
		
		public function createPDF($html=''){
			$dompdf = new Dompdf\Dompdf();
			//$html = $this->load->view('welcome_message', [], true);
			$dompdf->loadHtml($html);
			$dompdf->setPaper('A4','portrait');
			$dompdf->render();
			$pdf = $dompdf->output();
			$dompdf->stream();
		}
	}
?>