<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	class setup extends CI_Controller
	{
		public function index()
		{
			$this->load->view('header');
			$this->load->view('reservation');
			$this->load->view('footer');
		}
	}
?>