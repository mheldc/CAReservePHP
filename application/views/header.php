<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	$libs = str_replace('index.php','assets', base_url());
?>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<title></title>
		<link rel="stylesheet" href="<?php echo $libs . 'jquery/jquery-ui.min.css';?>">
		<link rel="stylesheet" href="<?php echo $libs . 'jquery/jquery-ui.structure.min.css';?>">
		<link rel="stylesheet" href="<?php echo $libs . 'jquery/jquery-ui.theme.min.css';?>">
		<link rel="stylesheet" href="<?php echo $libs . 'bootstrap/css/bootstrap.min.css';?>">
		<link rel="stylesheet" href="<?php echo $libs . 'bootstrap/css/bootstrap-theme.min.css';?>">
		<link rel="stylesheet" href="<?php echo $libs . 'fa/css/font-awesome.min.css';?>">
		<link rel="stylesheet" href="<?php echo $libs . 'bootstrap/css/themes/simple-sidebar.css';?>">
		<link rel="stylesheet" href="<?php echo $libs . 'bootstrap/css/bootstrap-datetimepicker.min.css';?>">
		<style>
			.inverse-dropdown{
			background-color: #222;
			border-color: #080808;
			&>li>a{
			  color: #999;
			  &:hover{
				color: #fff;
				background-color: #000;
			  }
			}
			&>.divider {
			  background-color: #000;
			}
		  }
		</style>
	</head>
	<body>