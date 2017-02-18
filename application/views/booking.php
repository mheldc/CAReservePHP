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
						<div>
							<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
								<thead style="border: 1px solid gray;">
									<tr>
										<td class="col-sm-1">Id</td>
										<td class="col-sm-3">Client Name</td>
										<td class="col-sm-6">Accomodation Type</td>
										<td class="col-sm-2">Guest Count</td>
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Guest for Checkout">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-caret-down fa-stack-1x"></i>
											</span>	
										</td>
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Due for Payment">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-caret-down fa-stack-1x"></i>
											</span>	
										</td>
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Add Guest">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-caret-down fa-stack-1x"></i>
											</span>	
										</td>
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Change Room Accomodation">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-caret-down fa-stack-1x"></i>
											</span>	
										</td>
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Guest Request">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-caret-down fa-stack-1x"></i>
											</span>	
										</td>
									</tr>
								</thead>
							</table>
						</div>
						<div style="height: 60%; overflow: hidden;">
							<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
								<tbody id="bookingcontents">
									<!--
									<tr style="width:100%;">
										<td class="col-sm-1">1</td>
										<td class="col-sm-3">Dela Cruz, Juan</td>
										<td class="col-sm-6">UM01 - Umbrella 1</td>
										<td class="col-sm-2">10</td>
										<td class="col-sm-1">
											<a href="#">
												<span class="fa-stack faa-flash animated" style="color:red;">
													<i class="fa fa-square-o fa-stack-2x"></i>
													<i class="fa fa-clock-o fa-stack-1x"></i>
												</span>										
											</a>
										</td>
										<td class="col-sm-1">
											<a href="#">
												<span class="fa-stack">
													<i class="fa fa-square-o fa-stack-2x"></i>
													<i class="fa fa-dollar fa-stack-1x"></i>
												</span>										
											</a>
										</td>
										<td class="col-sm-1">
											<a href="#">
												<span class="fa-stack">
													<i class="fa fa-square-o fa-stack-2x"></i>
													<i class="fa fa-group fa-stack-1x"></i>
												</span>										
											</a>
										</td>
										<td class="col-sm-1">
											<a href="#">
												<span class="fa-stack">
													<i class="fa fa-square-o fa-stack-2x"></i>
													<i class="fa fa-home fa-stack-1x"></i>
												</span>										
											</a>
										</td>
										<td class="col-sm-1">
											<a href="#">
												<span class="fa-stack">
													<i class="fa fa-square-o fa-stack-2x"></i>
													<i class="fa fa-paste fa-stack-1x"></i>
												</span>										
											</a>									
										</td>
									</tr>
								//-->
								</tbody>
							</table>							
						</div>
						<div>
							<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
								<tfoot>
									<tr><td id="bookingcount" colspan="8"></td></tr>
								</tfoot>
							</table>
						</div>
					</div>
					<!-- Payment Modal -->
					<div class="modal fade" id="paymentmodal" tabindex="-1" role="dialog" aria-labelledby="paymentmodalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="paymentmodalLabel">Due for Payment</h4>
								</div>
								<div class="modal-body">
									<div>
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<thead style="border: 1px solid gray;">
												<tr>
													<td class="col-sm-1">Id</td>
													<td class="col-sm-7">Item Description </td>
													<td class="col-sm-1">Sub-Total</td>
												</tr>
											</thead>
										</table>												
									</div>
									<div style="height: 45%; overflow: hidden;">
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<tbody id="paymentlist">
												<tr>
													<td class="col-sm-1">1</td>
													<td class="col-sm-7">Additional Guest (Adult) x 5</td>
													<td class="col-sm-1" style="text-align: right;">3500.00</td>
												</tr>
											</tbody>
										</table>												
									</div>
									<div>
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<tfoot>
												<tr>
													<td colspan="2" class="col-sm-6"><h2>Total Payment Due</h2></td>
													<td class="col-sm-3" style="text-align: right;"><h2 id="paymenttotal">0.00</h4></td>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="settlepymt">Settle Payment</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Additional Guest Modal -->
					<div class="modal fade" id="addguestmodal" tabindex="-1" role="dialog" aria-labelledby="addguestmodalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="addguestmodalLabel">Additional Guest</h4>
								</div>
								<div class="modal-body">
									<form>
										<div class="form-horizontal">
											<div class="form-group form-group-sm">
												<label for="NewAdult" class="col-sm-2 control-label">Adult Guest</label>
												<div class="col-sm-2">
													<input id="addAdult" type="text" class="form-control" placeholder="0" style="text-align: right;">
												</div>
												<div class="col-sm-1">
													x
												</div>
												<div class="col-sm-2">
													<input id="addAdultRate" type="text" class="form-control" readonly="readonly" placeholder="0.00" style="text-align: right;">
												</div>
												<div class="col-sm-1">
													=
												</div>
												<div class="col-sm-3">
													<input id="addAdultST" type="text" class="form-control" readonly="readonly" placeholder="0.00" style="text-align: right;">
												</div>
											</div>
										</div>
										<div class="form-horizontal">
											<div class="form-group form-group-sm">
												<label for="NewChild" class="col-sm-2 control-label">Child Guest</label>
												<div class="col-sm-2">
													<input id="addChild" type="text" class="form-control" placeholder="0" style="text-align: right;">
												</div>
												<div class="col-sm-1">
													x
												</div>
												<div class="col-sm-2">
													<input id="addChildRate" type="text" class="form-control" readonly="readonly" placeholder="0.00" style="text-align: right;">
												</div>
												<div class="col-sm-1">
													=
												</div>
												<div class="col-sm-3">
													<input id="addChildST" type="text" class="form-control" readonly="readonly" placeholder="0.00" style="text-align: right;">
												</div>
											</div>
										</div>
										<div class="form-horizontal">
											<div class="form-group form-group-sm">
												<label for="NewChild" class="col-sm-2 control-label">Child Guest below 2 y/o</label>
												<div class="col-sm-2">
													<input id="addChild2" type="text" class="form-control" placeholder="0" style="text-align: right;">
												</div>
												<div class="col-sm-1">
													x
												</div>
												<div class="col-sm-2">
													<input id="addChildRate2" type="text" class="form-control" readonly="readonly" placeholder="0.00" style="text-align: right;">
												</div>
												<div class="col-sm-1">
													=
												</div>
												<div class="col-sm-3">
													<input id="addChildST20" type="text" class="form-control" readonly="readonly" placeholder="0.00" style="text-align: right;">
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Submit and Go to Payment</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Change/Update Accomodation Modal -->
					<div class="modal fade" id="changeaccmodal" tabindex="-1" role="dialog" aria-labelledby="changeaccmodalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="changeaccmodalLabel">Transfer Accomodation </h4>
								</div>
								<div class="modal-body">
									<form>
										<div class="form-horizontal">
											<div class="form-group form-group-sm">
												<label for="lFromAcc" class="col-sm-3 control-label">From</label>
												<div class="col-sm-6">
													<input id="fromAcc" type="text" class="form-control" readonly="readonly">
												</div>
												<div class="col-sm-1">
													<input id="hfromAcc" type="hidden" value="0">
												</div>
											</div>
											<div class="form-group form-group-sm">
												<label for="tTo" class="col-sm-3 control-label">Transfer to</label>
											</div>
											<div class="form-group form-group-sm">
												<label for="tAccType" class="col-sm-3 control-label">Accomodation Type</label>
												<div class="col-sm-6">
													<select id="tselacc" class="form-control">
														<option value=0> - Select an Accomodation Type - </option>
													</select>
												</div>
											</div>
											<div class="form-group form-group-sm">
												<label for="tAccRoom" class="col-sm-3 control-label">Available Rooms</label>
												<div class="col-sm-6">
													<select id="tselrooms" class="form-control">
														<option value=0> - Select an Available Room - </option>
													</select>
												</div>
											</div>											
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Confirm Transfer</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Guests Additional Requests Modal -->
					<div class="modal fade" id="guestreqmodal" tabindex="-1" role="dialog" aria-labelledby="guestreqmodalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="guestreqmodalLabel">Additional Requests</h4>
								</div>
								<div class="modal-body">
									<form>
										<div class="form-horizontal">
											<div class="form-group form-group-sm">
												<label for="rItem" class="col-sm-3 control-label">Requested Item</label>
												<div class="col-sm-9">
													<select id="rselItems" class="form-control">
														<option value=0> - Select an Item to Request - </option>
													</select>
												</div>
											</div>
											<div class="form-group form-group-sm">
												<label for="rItem" class="col-sm-3 control-label">Requested Qty.</label>
												<div class="col-sm-2">
													<input id="rItemQty" type="text" class="form-control" placeholder="0" style="text-align: right;">
												</div>
												<div class="col-sm-1">
													x
												</div>
												<div class="col-sm-2">
													<input id="rItemPrice" type="text" class="form-control" readonly="readonly" placeholder="0.00" style="text-align: right;">
												</div>
												<div class="col-sm-1">
													=
												</div>
												<div class="col-sm-3">
													<input id="rItemST" type="text" class="form-control" readonly="readonly" placeholder="0.00" style="text-align: right;">
												</div>
											</div>	
										</div>
									</form>
									<div>
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<thead style="border: 1px solid gray;">
												<tr>
													<td class="col-sm-1">Id</td>
													<td class="col-sm-7">Requested Item </td>
													<td class="col-sm-1">Sub-Total</td>
												</tr>
											</thead>
										</table>												
									</div>
									<div style="height: 40%; overflow: hidden;">
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<tbody id="paymentlist">
												<tr>
													<td class="col-sm-1">1</td>
													<td class="col-sm-7">Additional Tables x 2</td>
													<td class="col-sm-1" style="text-align: right;">400.00</td>
												</tr>
												<tr>
													<td class="col-sm-1">1</td>
													<td class="col-sm-7">Additional Chairs x 10</td>
													<td class="col-sm-1" style="text-align: right;">200.00</td>
												</tr>
												<tr>
													<td class="col-sm-1">1</td>
													<td class="col-sm-7">Additional Bath Towels x 3</td>
													<td class="col-sm-1" style="text-align: right;">300.00</td>
												</tr>
											</tbody>
										</table>												
									</div>
									<div>
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<tfoot>
												<tr>
													<td colspan="2" class="col-sm-8">Total Due</td>
													<td class="col-sm-1" style="text-align: right;">900.00</td>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Submit Request and Go to Payment</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="newbooking" class="container-fluid tab-pane fade">
					<div class="row">
						<div class="col-lg-12">
							<h3>Booking Information</h3><hr>
								<h5>Reservation Information</h5>
								&nbsp;
								<div class="form-horizontal">
									<div class="form-group form-group-sm">
										<label for="ResType" class="col-sm-2 control-label">Reservation Type</label>
										<div class="col-sm-3">
											<select id="selrestype" class="form-control">
												<option value=0> Walk-In </option>
												<option value=1> Phone-In/Online Reservation </option>
											</select>
										</div>
										<div id="dresid" class="col-sm-3">
											<input id="reserveid" type="text" class="form-control" placeholder="Reservation Number">
										</div>
									</div>
								</div>
								&nbsp;
								<hr>
								<h5>Accomodation Information</h5>
								&nbsp;
								<div class="form-horizontal">
									<div class="form-group form-group-sm">
										<label for="selroomtype" class="col-sm-2 control-label">Accomodation Type</label>
										<div class="col-sm-6">
											<select id="selroomtype" class="form-control">
												<option value=0> - Select Accomodation Type - </option>
											</select>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="selrooms" class="col-sm-2 control-label">Available Rooms</label>
										<div class="col-sm-6">
											<select id="selrooms" class="form-control">
												<option value=0> - Select an Available Room - </option>
											</select>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="roomrate" class="col-sm-2 control-label">Room Rate</label>
										<div class="col-sm-2">
											<input id="roomrate" type="text" class="form-control" placeholder="0.00" style="text-align: right;">
										</div>
										<div class="col-sm-2 checkbox">
											<label><input id="isovn" type="checkbox">Overnight</label>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="roomcap" class="col-sm-2 control-label">Room Capacity</label>
										<div class="col-sm-2">
											<input id="roomcap" type="text" class="form-control" placeholder="0" style="text-align: right;" readonly="readonly">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="roomdur" class="col-sm-2 control-label">Room Usage Duration</label>
										<div class="col-sm-2">
											<input id="roomdur" type="text" class="form-control" placeholder="Room Duration" style="text-align: right;" readonly="readonly">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="guestcount" class="col-sm-2 control-label">Guest Count</label>
										<div class="col-sm-2">
											<input id="adultguest" type="text" class="form-control" placeholder="No. of Adult" style="text-align: right;">
										</div>
										<div class="col-sm-2">
											<input id="childguest" type="text" class="form-control" placeholder="No. of Children" style="text-align: right;">
										</div>
										<div class="col-sm-2">
											<input id="childguest2" type="text" class="form-control" placeholder="No. of Children < 2yo" style="text-align: right;">
										</div>
									</div>
								</div>
								&nbsp;
								<hr>
								<h5>Guest Information</h5>
								&nbsp;
								<div class="form-horizontal">
									<div class="form-group form-group-sm">
										<label for="gSalutation" class="col-sm-2 control-label">Salutation</label>
										<div class="col-sm-6">
											<select id="gsalutation" class="form-control">
												<option value=0> - Guest salutation - </option>
												<option value=1>Mr.</option>
												<option value=2>Mrs.</option>
												<option value=3>Ms.</option>
											</select>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="gLastName" class="col-sm-2 control-label">Last Name</label>
										<div class="col-sm-6">
											<input id="glastname" type="text" class="form-control" placeholder="Last Name">
										</div>
										<div class="col-sm-1">
											<input class="btn btn-default" id="bguestlist" type="button" data-toggle="modal" data-target="#guestSearch" value="Guest Search">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="gFirstName" class="col-sm-2 control-label">First Name</label>
										<div class="col-sm-6">
											<input id="gfirstname" type="text" class="form-control" placeholder="First Name">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="gMiddleName" class="col-sm-2 control-label">Middle Name</label>
										<div class="col-sm-6">
											<input id="gmiddlename" type="text" class="form-control" placeholder="Middle Name">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="Address" class="col-sm-2 control-label">Address</label>
										<div class="col-sm-6">
											<textarea id="gaddress" class="form-control" placeholder="Address" style="height: 50px;"></textarea>
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="gContactNo" class="col-sm-2 control-label">Contact No.</label>
										<div class="col-sm-3">
											<input id="glandline" type="text" class="form-control" placeholder="Landline No.">
										</div>
										<div class="col-sm-3">
											<input id="gmobile" type="text" class="form-control" placeholder="Mobile No.">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label for="Email" class="col-sm-2 control-label">Email Address</label>
										<div class="col-sm-6">
											<input id="gemail" type="email" class="form-control" placeholder="Email Address">
										</div>
									</div>
								</div>
								<table class="table">
									<tr>
										<td style="text-align: center;">
											<div class="form-horizontal">
												<button id="regbooking" class="btn btn-primary btn-sm">Save Booking</button>
											</div>										
										</td>
									</tr>
								</table>
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
															<button id="findguest" class="btn btn-default btn-sm">Go</button>
														</div>
													</div>
												</div>
											</form>
											<hr>
											<div>
												<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
													<thead style="border: 1px solid gray;">
														<tr>
															<td class="col-sm-1">Guest Id</td>
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
											<div style="height: 45%; overflow: hidden;">
												<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
													<tbody id="guestlist">
														<tr>
															<td class="col-sm-1">1</td>
															<td class="col-sm-7">Dela Cruz, Romel S.</td>
															<td class="col-sm-1">
																<a href="#" data-dismiss="modal">
																	<span class="fa-stack">
																		<i class="fa fa-square-o fa-stack-2x"></i>
																		<i class="fa fa-vcard-o fa-stack-1x"></i>
																	</span>										
																</a>									
															</td>
														</tr>
														<tr>
															<td class="col-sm-1">1</td>
															<td class="col-sm-7">Dela Cruz, Juan D.</td>
															<td class="col-sm-1">
																<a href="#" data-dismiss="modal">
																	<span class="fa-stack">
																		<i class="fa fa-square-o fa-stack-2x"></i>
																		<i class="fa fa-vcard-o fa-stack-1x"></i>
																	</span>										
																</a>									
															</td>
														</tr>
													</tbody>
												</table>												
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>				
			</div>
		</div>
	<!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->