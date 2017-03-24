<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	$disp_login = '';
	$disp_links = '';
	$disp_user = '';
	$disp_reservation = '';
	$disp_booking = '';
	$disp_setup = '';
	$disp_inventory =  '';
	$home_page = str_replace('index.php/','',base_url());
	
	
	if($sdata['allowlogin'] == true){
		if($display == 0){
			$disp_links = ' display:none;';
		} else {
			$disp_login = ' display:none;';
		}
		
		if(isset($sdata['fname']) && isset($sdata['lname'])){
			//$disp_user = $sdata['lname'].', '.$sdata['fname'];
			$disp_user = $sdata['fname'];
		}		
	} else {
		$disp_links = ' display:none;';
	}
	
	if($sdata['allowbilling'] == false){
		$disp_booking = ' style="display:none;"';
	}
	
	if($sdata['allowreserve'] == false){
		$disp_reservation = ' style="display:none;"';
	}
	
	if($sdata['allowsettings'] == false){
		$disp_setup = ' style="display:none;"';
	}
	
	if($sdata['allowinventory'] == false){
		$disp_inventory = ' style="display:none;"';
	}

?>

<div id="wrapper">
	<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<div id="ca_brand">
				<ul class="sidebar-nav">
					<li class="sidebar-brand">
						<a href="#cahome">
							Costa Abrille Resort
						</a>
					</li
				</ul>
			</div>
			<div id="ca_links" class="container" style="position: fixed; top: 70px; <?php echo $disp_links; ?>">
				<ul class="sidebar-nav">
					<li <?php echo $disp_reservation; ?>>
						<a href="<?php echo base_url().'ca/reservation';?>">Reservation</a>
					</li>
					<li <?php echo $disp_booking; ?>>
						<a href="<?php echo base_url().'ca/booking';?>">Booking</a>
					</li>
					
					<li class="dropdown" <?php echo $disp_setup; ?>>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Setup &nbsp;<span class="caret"></span></a>
						<ul class="dropdown-menu inverse-dropdown" aria-labelledby="dropdownMenu1">
							<li><a href="#">Users</a></li>
							<li><a href="#">Rooms</a></li>
							<li style="display: none;"><a href="#">Tools and Utilities</a></li>
							<li style="display: none;"><a href="#">Promos</a></li>
							<li <?php echo $disp_inventory; ?>><a href="#">Inventory</a></li>
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
					<li>
						<a href="<?php echo base_url().'ca/logout';?>">Sign Out [<?php echo $disp_user; ?>]</a>
					</li>
				</ul>
			</div>
			<div id="ca_signin" class="container" style="position: fixed; top: 70px; <?php echo $disp_login; ?>">
				<div class="row">
					<div class="form-horizontal">
						<div class="input-group input-group-sm">
							<span class="input-group-addon" id="basic-addonA1" style="width: 80px; text-align: left;">Staff Id</span>
							<input type="text" id="userid" class="form-control" aria-describedby="basic-addonA1" style="width: 160px;">
						</div>
					</div>
					<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
					<div class="form-horizontal">
						<div class="input-group input-group-sm">
							<span class="input-group-addon" id="basic-addonA1" style="width: 80px; text-align: left;">Password</span>
							<input type="password" id="userpw" class="form-control" aria-describedby="basic-addonA1" style="width: 160px;">
						</div>
					</div>
					<div class="form-horizontal" style="height: 10px;">&nbsp;</div>
					<div class="form-horizontal">
						<button type="button" class="btn btn-default btn-sm" onclick="javascript:auth_user();">Sign In</button>
						<button type="button" class="btn btn-default btn-sm" onclick="javascript:reset();">Cancel</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->
		
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="tab-content">
				<div id="cahome" class="container-fluid tab-pane fade in active">
					<div class="row">
						<div class="col-sm-8">
							<img class="img-responsive img-rounded" src="<?php echo $home_page.'assets/img/cahome.png'; ?>" alt="" style="width:900px; height: 350px;">
						</div>
						<div class="col-sm-4">
							<h1>Costa Abril Resort</h1>
							<p>Costa Abril is a resort offering overnight rooms, a water play for children, and a variety of 3 spacious pools.</p>
							<!--<a class="btn btn-primary btn-lg" href="#">Call to Action!</a>/-->
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4 portfolio-item">
							<a href="#">
								<img class="img-responsive" src="<?php echo $home_page.'assets/img/villa/villa-1.jpg'; ?>" alt="" style="width: 350px; height: 200px;">
							</a>
							<h3>
								<a href="#">Function Rooms</a>
							</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
						</div>
						<div class="col-md-4 portfolio-item">
							<a href="#">
								<img class="img-responsive" src="<?php echo $home_page.'assets/img/villa/villa-2.jpg'; ?>" alt="" style="width: 350px; height: 200px;">
							</a>
							<h3>
								<a href="#">Villa</a>
							</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
						</div>
						<div class="col-md-4 portfolio-item">
							<a href="#">
								<img class="img-responsive" src="<?php echo $home_page.'assets/img/villa/villa-3.jpg'; ?>" alt="" style="width: 350px; height: 200px;">
							</a>
							<h3>
								<a href="#">Standard Rooms</a>
							</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
						</div>
					</div>
				</div>				
			</div>
		</div>
				<!-- Error notifier /-->
		<div class="modal fade" id="ErrModal" tabindex="-1" role="dialog" aria-labelledby="ErrModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="ErrModalLabel">Error Occurred</h4>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td style="width: 50px;">
									<span class="fa-stack fa-3x">
										<i class="fa fa-square-o fa-stack-2x" style="color:red;"></i>
										<i class="fa fa-exclamation-triangle fa-stack-1x" style="color:red;"></i>
									</span>
								</td>
								<td id="errmesg"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Confirmation notifier /-->
		<div class="modal fade" id="ConfModal" tabindex="-1" role="dialog" aria-labelledby="ConfModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="ConfModalLabel">Confirmation Required</h4>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td style="width: 50px;">
									<span class="fa-stack fa-3x">
										<i class="fa fa-square-o fa-stack-2x" style="color:green;"></i>
										<i class="fa fa-question fa-stack-1x" style="color:green;"></i>
									</span>
								</td>
								<td id="confmesg"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button id="bConfirm" type="button" class="btn btn-default" data-dismiss="modal">Confirm</button>
						<button id="bCancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Information notifier /-->
		<div class="modal fade" id="InfoModal" tabindex="-1" role="dialog" aria-labelledby="InfoModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="InfoModalLabel">Notice</h4>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td style="width: 50px;">
									<span class="fa-stack fa-3x">
										<i class="fa fa-square-o fa-stack-2x" style="color:blue;"></i>
										<i class="fa fa-info fa-stack-1x" style="color:blue;"></i>
									</span>
								</td>
								<td id="infomesg"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
						<!--<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>/-->
					</div>
				</div>
			</div>
		</div>
		<button id="mErr" value="Error" data-toggle="modal" data-target="#ErrModal" style="visibility: hidden;">Click Me</button>
		<button id="mConf" value="Confirmation" data-toggle="modal" data-target="#ConfModal" style="visibility: hidden;">Click Me</button>
		<button id="mInfo" value="Information" data-toggle="modal" data-target="#InfoModal" style="visibility: hidden;">Click Me</button>
	<!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->