<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	$home_page = str_replace('index.php/','',base_url());
	if($sdata['allowreserve'] == false){
		header("Location: ". $home_page);
	}
?>

<div id="wrapper">
	<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<div class="form-horizontal">
				<ul class="sidebar-nav">
					<li class="sidebar-brand">
						<a href="<?php echo $home_page; ?>">
							Costa Abrille Resort
						</a>
					</li>
					<li>
						<a href="<?php echo $home_page; ?>">Home</a>
					</li>
					<li>
						<a href="#activereservation" data-toggle="tab" onclick="">Active Reservations</a>
					</li>
					<li>
						<a href="#newreservation" data-toggle="tab">New Reservation</a>
					</li>
					<li>
						<a href="#occularrequest" data-toggle="tab">Occular Requests</a>
					</li>
				</ul>				
			</div>
		</div>
		<!-- /#sidebar-wrapper -->
		
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="tab-content">
				<div id="activereservation" class="container-fluid tab-pane fade in active">
					<div class="row">
						This is the reservation
						<input type="text" class="form-control date" id="thisisdt">
					</div>
				</div>
				<div id="newreservation" class="container-fluid tab-pane fade">
					<div class="row">
						
					</div>
				</div>
				<div id="occularrequest" class="container-fluid tab-pane fade">
					<div class="row">
						
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