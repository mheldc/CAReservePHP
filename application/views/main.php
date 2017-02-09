<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
?>

<div id="wrapper">
	<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">]
				<li class="sidebar-brand">
					<a href="#">
						Costa Abrille Resort
					</a>
				</li>
				<li>
					<a href="javascript:window.location.assign('');">Reservation</a>
				</li>
				<li>
					<a href="#">Booking</a>
				</li>
				<li>
					<a href="#">Inventory</a>
				</li>
				<li>
					<a href="#">Users</a>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Setup &nbsp;<span class="caret"></span></a>
					<ul class="dropdown-menu inverse-dropdown" aria-labelledby="dropdownMenu1">
						<li><a href="#">Rooms</a></li>
						<li><a href="#">Tools and Utilities</a></li>
						<li><a href="#">Promos</a></li>
						<!--
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
						//-->
					</ul>
				</li>
				<li>
					<a href="#">About</a>
				</li>
				<li>
					<a href="#">Contact</a>
				</li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="login-container">
						<div id="output"></div>
						<div class="avatar"></div>
						<div class="form-box">
							<form action="" method="">
								<input name="user" type="text" placeholder="username">
								<input type="password" placeholder="password">
								<button class="btn btn-info btn-block login" type="submit">Login</button>
							</form>
						</div>
					</div>
					
			</div>
		</div>
	<!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->