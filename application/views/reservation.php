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
						<a href="#reservationinq" data-toggle="tab">Reservation Inquiry</a>
					</li>
					<li>
						<a href="#reservationlogs" data-toggle="tab">Reservation Logs</a>
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
				<div id="reservationinq" class="container-fluid tab-pane fade in active">
					<div class="row">
						<h3>Reservation Inquiry</h3>
						<div class="form-horizontal" style="height: 10px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm date">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Reservation Date</span>
								<input id="resinqdt" type="text" class="form-control date" aria-describedby="reservedt" style="width: 200px;" data-toggle="tooltip" title="Click the white box to select a date.">
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Accommodation Type</span>
								<select id="res_acctype" class="form-control" style="width: 300px;"></select>
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Accommodation</span>
								<select id="res_acc" class="form-control" style="width: 300px;"></select>
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Preferred Time</span>
								<select id="res_time" class="form-control" style="width: 300px;">
									<option value="0" selected="selected">Daytime (7AM - 5PM)</option>
									<option value="1">Nighttime (7PM - 5AM)</option>
								</select>
							</div>
						</div>
						<div class="form-horizontal" style="height: 10px;">&nbsp;</div>
						<div class="form-horizontal">
							<button type="button" class="btn btn-default btn-sm" onclick="javascript:display_inqresult();">View Results</button>
							<button type="button" class="btn btn-default btn-sm" onclick="javascript:reset_inquiry();">Clear</button>
						</div><hr>
						<h3>Inquiry results</h3>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<table class="table table-condensed table-striped table-bordered" style="font-family: Calibri !important; font-size:12px !important;">
								<thead>
									<tr>
										<td style="width: 100px; text-align: left;">Guest</td>
										<td style="width: 150px; text-align: left;">Accommodation</td>
										<td style="width: 100px; text-align: left;">Date Reserved</td>
										<td style="width: 150px; text-align: left;">Time Reserved</td>
										<td style="width: 100px; text-align: left;">Status</td>
										<td style="width: 150px; text-align: left;">Remarks</td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="form-horizontal" style="overflow-y: auto; height: 25%;">
							<table class="table table-condensed table-striped" style="font-family: Calibri !important; font-size:13px !important;">
								<tbody id="inqlist">
									<tr>
										<td style="width: 100px; text-align: left;">Dela Cruz, Juan D.</td>
										<td style="width: 150px; text-align: left;">Umbrella - Umbrella 05</td>
										<td style="width: 100px; text-align: left;">10-Apr-2017</td>
										<td style="width: 150px; text-align: left;">Night Time (7PM - 5AM)</td>
										<td style="width: 100px; text-align: left;">Booked</td>
										<td style="width: 150px; text-align: left;">Paid and Booked on 24-MAR-2017</td>
									</tr>
									<tr>
										<td style="width: 100px; text-align: left;">Soho, Jessica D.</td>
										<td style="width: 150px; text-align: left;">Umbrella - Umbrella 06</td>
										<td style="width: 100px; text-align: left;">10-Apr-2017</td>
										<td style="width: 150px; text-align: left;">Night Time (7PM - 5AM)</td>
										<td style="width: 100px; text-align: left;">Cancelled</td>
										<td style="width: 150px; text-align: left;">Cancelled due to schedule already been booked.</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--/
						<div class="form-horizontal">
							<table class="table table-condensed table-striped" style="font-family: Calibri !important; font-size:13px !important;">
								<tfoot>
									<tr>
										<td colspan="6" style="width: 100px; text-align: left;">Results Found: 2</td>
									</tr>
								</tfoot>
							</table>
						</div>
						/-->
					</div>
				</div>
				<div id="reservationlogs" class="container-fluid tab-pane fade">
					<div class="row">
						<h3>Reservation Logs</h3>
						<div class="form-horizontal" style="height: 10px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm date">
								<span class="input-group-addon" style="width: 120px; text-align: left;">Reservation Date</span>
								<input type="text" id="reslogdt" class="form-control" style="width: 200px;" data-toggle="tooltip" title="Click the white box to select a date.">
								&nbsp;
								<button type="button" class="btn btn-default btn-sm">Refresh List</button>
							</div>
						</div>
						<h3>Inquiry results</h3>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<table class="table table-condensed table-striped table-bordered" style="font-family: Calibri !important; font-size:12px !important;">
								<thead>
									<tr>
										<td class="col-sm-2" style="text-align: left;">Guest</td>
										<td class="col-sm-3" style="text-align: left;">Accommodation</td>
										<td class="col-sm-1" style="text-align: left;">Date Reserved</td>
										<td class="col-sm-2" style="text-align: left;">Time Reserved</td>
										<td class="col-sm-1" style="text-align: left;">Status</td>
										<td class="col-sm-5" style="text-align: left;">Remarks</td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="form-horizontal" style="overflow-y: auto; height: 50%;">
							<table class="table table-condensed table-striped" style="font-family: Calibri !important; font-size:13px !important;">
								<tbody id="loglist">
									<tr>
										<td class="col-sm-2" style="text-align: left;">Dela Cruz, Juan D.</td>
										<td class="col-sm-3" style="text-align: left;">Umbrella - Umbrella 05</td>
										<td class="col-sm-1" style="text-align: left;">10-Apr-2017</td>
										<td class="col-sm-2" style="text-align: left;">Night Time (7PM - 5AM)</td>
										<td class="col-sm-1" style="text-align: left;">Booked</td>
										<td class="col-sm-5" style="text-align: left;">Paid and Booked on 24-MAR-2017</td>
									</tr>
									<tr>
										<td class="col-sm-2" style="text-align: left;">Soho, Jessica D.</td>
										<td class="col-sm-3" style="text-align: left;">Umbrella - Umbrella 06</td>
										<td class="col-sm-1" style="text-align: left;">10-Apr-2017</td>
										<td class="col-sm-2" style="text-align: left;">Day Time (7AM - 5PM)</td>
										<td class="col-sm-1" style="text-align: left;">Cancelled</td>
										<td class="col-sm-5" style="text-align: left;">For Confirmation</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--/
						<div class="form-horizontal">
							<table class="table table-condensed table-striped" style="font-family: Calibri !important; font-size:13px !important;">
								<tfoot>
									<tr>
										<td colspan="6" style="width: 100px; text-align: left;">Results Found: 2</td>
									</tr>
								</tfoot>
							</table>
						</div>
						/-->
					</div>
				</div>
				<div id="newreservation" class="container-fluid tab-pane fade">
					<div class="row">
						<h3>New Reservation</h3>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						
						<h5>Guest Information</h5>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Salutation</span>
								<select id="resg_salutation" class="form-control" aria-describedby="basic-addonA1" style="width: 150px;">
									<option value=0 selected="selected">- Guest salutation -</option>
									<option value=1>Mr.</option>
									<option value=2>Mrs.</option>
									<option value=3>Ms.</option>
								</select>
								&nbsp;
								<input class="btn btn-default btn-sm" id="resg_list" type="button" data-toggle="modal" data-target="#guestSearch" value="Guest Search">
								<input class="btn btn-default btn-sm" id="resg_clear" type="button" value="Clear">
							</div>	
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Last Name</span>
								<input id="resg_lname" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="Last Name" style="width: 300px;">
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">First Name</span>
								<input id="resg_fname" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="First Name" style="width: 300px;">
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Middle Name</span>
								<input id="resg_mname" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="Middle Name" style="width: 300px;">
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Address</span>
								<textarea id="resg_addr" class="form-control" aria-describedby="basic-addonA1" placeholder="Address" style="height: 50px; width: 300px;"></textarea>
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Landline No.</span>
								<input type="text" id="resg_landline" class="form-control" aria-describedby="basic-addonA1" placeholder="Landline Number" style="width: 150px;">
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Mobile No.</span>
								<input type="text" id="resg_mobile" class="form-control" aria-describedby="basic-addonA1" placeholder="Mobile Number" style="width: 150px;">
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Email Address</span>
								<input type="text" id="resg_email" class="form-control" aria-describedby="basic-addonA1" placeholder="user@domain.com" style="width: 150px;">
							</div>
						</div>
						<div class="form-horizontal" style="height: 10px;">&nbsp;</div>
						<div class="form-horizontal">
							<table class="table">
								<tr>
									<td style="text-align: center;">
										<div class="form-horizontal">
											<button class="btn btn-primary btn-sm" onclick="javascript:alert('Save reservation');">Process Reservation</button>
											<button class="btn btn-primary btn-sm" onclick="javascript:alert('Cancel reservation');">Cancel</button>
										</div>										
									</td>
								</tr>
							</table>
						</div>
						<!-- Guest List Modal -->
						<div class="modal fade" id="guestSearch" tabindex="-1" role="dialog" aria-labelledby="guestSearchLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="guestSearchLabel">Search Guest List</h4>
									</div>
									<div class="modal-body">
										<form>
											<div class="form-horizontal">
												<div class="form-group form-group-sm">
													<label for="Guest Search" class="col-sm-1 control-label">Find</label>
													<div class="col-sm-9">
														<input id="searchedguest" type="text" class="form-control" placeholder="Guest Last Name or First Name">
													</div>
													<div class="col-sm-2">
														<button id="resg_find" class="btn btn-default btn-sm">Go</button>
													</div>
												</div>
											</div>
										</form>
										<hr>
										<div>
											<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size: 14px !important;">
												<thead style="border: 1px solid gray;">
													<tr>
														<!-- <td class="col-sm-1">Guest Id</td> /-->
														<td class="col-sm-7">Guest Name</td>
														<td class="col-sm-1">
															<span class="fa-stack" data-toggle="tooltip" title="Use Guest Information">
																<i class="fa fa-square-o fa-stack-2x"></i>
																<i class="fa fa-caret-down fa-stack-1x"></i>
															</span>	
														</td>
													</tr>
												</thead>
											</table>												
										</div>
										<div style="height: 45%; overflow-y: auto;">
											<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
												<tbody id="guestlist">
												</tbody>
											</table>												
										</div>
									</div>
									<div class="modal-footer">
										<button id="glistclose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<!--</div>/-->
					</div>
				</div>
				<div id="occularrequest" class="container-fluid tab-pane fade">
					<div class="row">
						<h3>Occular Requests</h3>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Date of Visit</span>
								<input type="text" id="occ_date" class="form-control" style="width: 150px;" data-toggle="tooltip" title="Click the white box to select a date."></input>
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Visitor Count</span>
								<input type="text" id="occ_vcnt" class="form-control" placeholder="0" style="width: 70px;"></input>
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Last Name</span>
								<input type="text" id="occ_lname" class="form-control" style="width: 250px;"></input>
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">First Name</span>
								<input type="text" id="occ_fname" class="form-control" style="width: 250px;"></input>
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Address</span>
								<textarea id="occ_addr" class="form-control" style="width: 250px; height: 100px;"></textarea>
							</div>
						</div>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Contact Numbers</span>
								<input type="text" id="occ_cno" class="form-control" style="width: 250px;"></input>
							</div>
						</div>
						<div class="form-horizontal" style="height:2px;">&nbsp;</div>
						<div class="form-horizontal">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" style="width: 150px; text-align: left;">Email Address</span>
								<input type="email" id="occ_email" class="form-control" style="width: 250px;"></input>
							</div>
						</div>
						<h3>Occular Schedules</h3>
						<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
						<div class="form-horizontal">
							<table class="table table-condensed table-striped table-bordered" style="font-family: Calibri !important; font-size:12px !important;">
								<thead>
									<tr>
										<td class="col-sm-3" style="text-align:left;">Guest</td>
										<td class="col-sm-6" style="text-align:left;">Contact Information</td>
										<td class="col-sm-1" style="text-align:left;">Visitor Count</td>
										<td class="col-sm-2" style="text-align:left;">Date/Time of Visit</td>
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Occular Session Succeeded">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-caret-down fa-stack-1x"></i>
											</span>	
										</td>
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Occular Visit Cancelled">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-caret-down fa-stack-1x"></i>
											</span>	
										</td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="form-horizontal" style="overflow-y:auto; height:20%;">
							<table class="table table-condensed table-striped" style="font-family: Calibri !important; font-size:13px !important;">
								<tbody id="occularlist">
									<tr>
										<td class="col-sm-3" style="text-align: left;">Dela Cruz, Juan D.</td>
										<td class="col-sm-6" style="text-align: left;">jdc@email.example.com/1234567/123456789011</td>
										<td class="col-sm-1" style="text-align: left;">5</td>
										<td class="col-sm-2" style="text-align: left;">2017-Mar-31 03:00 PM</td>
										<td class="col-sm-1">
											<a href="#" style="text-decoration:none; color:black;" onclick="javascript:console.log('occular done');">
												<span class="fa-stack" data-toggle="tooltip" title="Occular Complete">
													<i class="fa fa-square-o fa-stack-2x"></i>
													<i class="fa fa-thumbs-o-up fa-stack-1x"></i>
												</span>													
											</a>
										</td>
										<td class="col-sm-1">
											<a href="#" style="text-decoration:none; color:black;" onclick="javascript:console.log('occular cancelled');">
												<span class="fa-stack" data-toggle="tooltip" title="Occular Complete">
													<i class="fa fa-square-o fa-stack-2x"></i>
													<i class="fa fa-times fa-stack-1x"></i>
												</span>													
											</a>
										</td>
									</tr>
									<tr>
										<td class="col-sm-3" style="text-align:left;">Dela Cruz, Juan D.</td>
										<td class="col-sm-6" style="text-align:left;">jdc@email.example.com/1234567/123456789011</td>
										<td class="col-sm-1" style="text-align:left;">5</td>
										<td class="col-sm-2" style="text-align:left;">2017-Mar-31 03:00 PM</td>
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Occular Complete">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-thumbs-o-up fa-stack-1x"></i>
											</span>	
										</td>
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Occular Complete">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-times fa-stack-1x"></i>
											</span>	
										</td>
									</tr>
								</tbody>
							</table>
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