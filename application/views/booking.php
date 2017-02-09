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
					<a href="#activebooking" data-toggle="tab">Active Bookings</a>
				</li>
				<li>
					<a href="#newbooking" data-toggle="tab">New Booking</a>
				</li>
				<li>
					<a href="#">Home</a>
				</li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="tab-content">
				<div id="activebooking" class="container-fluid tab-pane fade in active">
					<div class="row ">
						<h3>Active Bookings</h3><hr>
						<table class="table" style="font-family: Calibri !important; font-size:14px !important;">
							<thead class="thead-inverse">
								<tr>
									<td>Id</td>
									<td>Client Name</td>
									<td>Accomodation Type</td>
									<td>Guest Count</td>
									<td style="width: 10px !important;"></td>
									<td style="width: 20px !important;"></td>
									<td style="width: 20px !important;"></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Dela Cruz, Juan</td>
									<td>UM01 - Umbrella 1</td>
									<td>10</td>
									<td style="text-align: center; width: 20px !important;">
										<a href="#" data-toggle="tooltip" title="Add Guests">
											<span class="fa-stack">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-group fa-stack-1x"></i>
											</span>										
										</a>
									</td>
									<td style="text-align: center; width: 20px !important;">
										<a href="#" data-toggle="tooltip" title="Change Room Accomodation">
											<span class="fa-stack">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-home fa-stack-1x"></i>
											</span>										
										</a>
									</td>
									<td style="text-align: center; width: 20px !important;">
										<a href="#" data-toggle="tooltip" title="Guest Requests">
											<span class="fa-stack">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-paste fa-stack-1x"></i>
											</span>										
										</a>									
									</td>
								</tr>
							</tbody>
							<tfoot class="tfoot-inverse">
								<tr><td colspan="7">Total Active bookings for the day : 9</td></tr>
							</tfoot>
						</table>
					</div>
				</div>
				<div id="newbooking" class="container-fluid tab-pane fade">
					<div class="row">
						<div class="col-lg-12">
							<h3>Booking Information</h3><hr>
							<form>
								<h5>Reservation Information</h5>
								&nbsp;
								<div class="form-horizontal">
									<div class="form-group form-group-sm">
										<label for="ResType" class="col-sm-2 control-label">Reservation Type</label>
										<div class="col-sm-2 checkbox">
											<label><input type="radio" name="optReserve" checked="checked"> &nbsp;Walk-In</label>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="ResType" class="col-sm-2 control-label"></label>
										<div class="col-sm-2 checkbox">
											<label><input type="radio" name="optReserve"> &nbsp;Phone-In</label>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="ResType" class="col-sm-2 control-label"></label>
										<div class="col-sm-2 checkbox">
											<label><input type="radio" name="optReserve"> &nbsp;Online</label>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="ResType" class="col-sm-2 control-label">Reservation Number</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" placeholder="Reservation Number">
										</div>
									</div>
								</div>
								&nbsp;
								<hr>
								<h5>Guest Information</h5>
								&nbsp;
								<div class="form-horizontal">
									<div class="form-group form-group-sm">
										<label for="gLastName" class="col-sm-2 control-label">Last Name</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" placeholder="Last Name">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="gFirstName" class="col-sm-2 control-label">First Name</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" placeholder="First Name">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="gMiddleName" class="col-sm-2 control-label">Middle Name</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" placeholder="Middle Name">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="Address" class="col-sm-2 control-label">Address</label>
										<div class="col-sm-6">
											<textarea class="form-control" placeholder="Address" style="height: 100px;"></textarea>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="gMiddleName" class="col-sm-2 control-label">Contact No.</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" placeholder="Landline No.">
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" placeholder="Mobile No.">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="Email" class="col-sm-2 control-label">Email Address</label>
										<div class="col-sm-6">
											<input type="email" class="form-control" placeholder="Email Address">
										</div>
									</div>
								</div>
								&nbsp;
								<hr>
								<h5>Room Rentals</h5>
								&nbsp;
								<div class="form-horizontal">
									<div class="form-group form-group-sm">
										<label for="bRoomType" class="col-sm-2 control-label">Room Type</label>
										<div class="col-sm-6">
											<select class="form-control">
												<option value=0> - Select Room Type - </option>
											</select>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="bRoomType" class="col-sm-2 control-label">Available Rooms</label>
										<div class="col-sm-6">
											<select class="form-control">
												<option value=0> - Select an Available Room - </option>
											</select>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="RoomRate" class="col-sm-2 control-label">Room Rate</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" placeholder="Room Rate" style="text-align: right;" readonly="readonly">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="RoomDetails" class="col-sm-2 control-label">Room Capacity</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" placeholder="Room Capacity" style="text-align: right;" readonly="readonly">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="RoomDetails" class="col-sm-2 control-label">Room Duration</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" placeholder="Room Duration" style="text-align: right;" readonly="readonly">
										</div>
										<div class="col-sm-2 checkbox">
											<label><input type="checkbox">Overnight</label>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>				
			</div>
		</div>
	<!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->