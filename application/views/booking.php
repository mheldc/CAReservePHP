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
					<a href="#activebooking" data-toggle="tab" onclick="javascript:loadactivebookings();">Active Bookings</a>
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
						<!-- Booking Header /-->
						<div>
							<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
								<thead style="border: 1px solid gray;">
									<tr>
										<!-- <td class="col-sm-1">Id</td> /-->
										<td class="col-sm-4">Client Name</td>
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
										<td class="col-sm-1">
											<span class="fa-stack" data-toggle="tooltip" title="Claim Wristbands">
												<i class="fa fa-square-o fa-stack-2x"></i>
												<i class="fa fa-caret-down fa-stack-1x"></i>
											</span>	
										</td>
									</tr>
								</thead>
							</table>
						</div>
						<!-- Booking Body /-->
						<div style="height: 60%; overflow-y: auto;">
							<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
								<tbody id="bookingcontents">
								</tbody>
							</table>							
						</div>
						<!-- Booking Footer /-->
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
									<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:resetpymtvalues();"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="paymentmodalLabel">Due for Payment</h4>
								</div>
								<div class="modal-body">
									<div>
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<thead style="border: 1px solid gray;">
												<tr>
													<!-- <td class="col-sm-1">Id</td> /-->
													<td class="col-sm-7">Item Description </td>
													<td class="col-sm-1">Sub-Total</td>
												</tr>
											</thead>
										</table>												
									</div>
									<div style="height: 40%; overflow-y: auto;">
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<tbody id="paymentlist">
											</tbody>
										</table>												
									</div>
									<div>
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<tfoot>
												<tr>
													<td colspan="2" class="col-sm-6"><h5>Total Payment Due</h5></td>
													<td class="col-sm-3" style="text-align: right;"><h5 id="paymenttotal">0.00</h5></td>
												</tr>
												<tr>
													<td colspan="2" class="col-sm-6"><h5>Payment Received</h5></td>
													<td class="col-sm-3" style="text-align: right;">
														<input id="rcvpayment" type="text" class="form-control col-lg-3" placeholder="0.00" style="text-align: right;">
													</td>
												</tr>
												<tr>
													<td colspan="2" class="col-sm-6"><h5>Change</h5></td>
													<td class="col-sm-3" style="text-align: right;"><h5 id="changepymt">0.00</h5></td>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-default" id="settlepymtclose" data-dismiss="modal" onclick="javascript:resetpymtvalues();">Close</button>
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
									<div class="form-horizontal">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addonA1" style="width: 150px;">Adult</span>
											<input id="addAdult" type="text" style="width: 50px; text-align: center;" maxlength="3" class="form-control" placeholder="0" aria-describedby="basic-addonA1">
											<span class="input-group-addon" id="basic-addonA2" style="width: 20px;">x</span>
											<input id="addAdultRate" type="text" style="width: 100px; text-align: right;" disabled="disabled" class="form-control" placeholder="0.00" aria-describedby="basic-addonA2">
											<span class="input-group-addon" id="basic-addonA3" style="width: 20px;">=</span>
											<input id="addAdultST" type="text" style="width: 120px; text-align: right;" readonly="readonly" class="form-control" placeholder="0.00" aria-describedby="basic-addonA3">
										</div>										
									</div>
									<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1" style="width: 150px;">Child</span>
											<input id="addChild" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1" style="width: 50px; text-align: center;">
											<span class="input-group-addon" id="basic-addon1" style="width: 20px;">x</span>
											<input id="addChildRate" type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addon1" style="width: 100px; text-align: right;" readonly="readonly">
											<span class="input-group-addon" id="basic-addon1" style="width: 20px;">=</span>
											<input id="addChildST" type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addon1" style="width: 120px; text-align: right;" readonly="readonly">
										</div>										
									</div>
									<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1" style="width: 150px;">Child < 2 y/o</span>
											<input id="addChild2" type="text" class="form-control" placeholder="0" aria-describedby="basic-addon1" style="width: 50px; text-align: center;">
											<span class="input-group-addon" id="basic-addon1" style="width: 20px;">x</span>
											<input id="addChildRate2" type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addon1" style="width: 100px; text-align: right;" readonly="readonly">
											<span class="input-group-addon" id="basic-addon1" style="width: 20px;">=</span>
											<input id="addChildST2" type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addon1" style="width: 120px; text-align: right;" readonly="readonly">
										</div>										
									</div>
									<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1" style="width: 150px;">Due for Payment</span>
											<span class="input-group-addon" id="basic-addon1" style="width: 20px;">P</span>
											<input id="addPymtdue" type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addon1" readonly="readonly" style="width: 150px; text-align: right;" onclick="javascript:preguestaddition();">
										</div>										
									</div>
									
								</div>
								<div class="modal-footer">
									<button id="appguestclose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button id="appguestsave" type="button" class="btn btn-primary" onclick="javascript:preguestaddition();">Submit and Go to Payment</button>
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
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 200px;">Current Accomodation</span>
										</div>										
									</div>
									<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 100px;">Type</span>
											<select id="facctype" class="form-control" aria-describedby="basic-addonA1"  style="width: 350px;" disabled="disabled"></select>
										</div>										
									</div>
									<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 100px;">Accomodation</span>
											<select id="facc" class="form-control" aria-describedby="basic-addonA1"  style="width: 350px;" disabled="disabled"></select>
										</div>										
									</div>
									<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 100px;">Rental Fee</span>
											<input id="faccrate" type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addonA1" style="width: 100px; text-align: right;" disabled="disabled" >
										</div>										
									</div>
									<br>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 200px;">Accomodation to Transfer</span>
										</div>										
									</div>
									<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 100px;">Type</span>
											<select id="tacctype" class="form-control" aria-describedby="basic-addonA1"  style="width: 350px;"></select>
										</div>										
									</div>
									<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 100px;">Accomodation</span>
											<select id="tacc" class="form-control" aria-describedby="basic-addonA1"  style="width: 350px;">></select>
										</div>										
									</div>
									<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 100px;">Rate Basis</span>
											<select id="taccratetype" type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addonA1" style="width: 150px;" disabled="disabled">
												<option value=0>Daytime Rate</option>
												<option value=1>Overnight Rate</option>
											</select>
										</div>										
									</div>
									<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 100px;">Rental Fee</span>
											<input id="taccrate" type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addonA1" style="width: 100px; text-align: right;" disabled="disabled">
										</div>										
									</div>
									<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 100px;">Reason</span>
											<textarea id="taccreason" class="form-control" placeholder="Reason for Transfer (optional)" aria-describedby="basic-addonA1" style="width: 300px; height: 100px;" ></textarea>
										</div>										
									</div>
								</div>
								<div class="modal-footer">
									<button id="taccclose" type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:clearaccomodation();">>Close</button>
									<button id="taccconfirm" type="button" class="btn btn-primary" onclick="javascript:confirmtransfer();">Confirm Transfer</button>
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
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 120px; text-align: left;">Item Type</span>
											<select id="itype" class="form-control" aria-describedby="basic-addonA1" style="width: 350px;"></select>
										</div>										
									</div>
									<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 120px; text-align: left;">Requested Item</span>
											<select id="idesc" class="form-control" aria-describedby="basic-addonA1" style="width: 350px;"></select>
										</div>										
									</div>
									<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
									<div class="form-horizontal">
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="basic-addonA1" style="width: 120px; text-align: left;">Price</span>
											<input id="iqty" type="text" style="width: 50px; text-align: center;" maxlength="3" class="form-control" placeholder="0" aria-describedby="basic-addonA1">
											<span class="input-group-addon" id="basic-addonA2" style="width: 20px;">x</span>
											<input id="iprice" type="text" style="width: 100px; text-align: right;" disabled="disabled" class="form-control" placeholder="0.00" aria-describedby="basic-addonA2">
											<span class="input-group-addon" id="basic-addonA3" style="width: 20px;">=</span>
											<input id="isubtotal" type="text" style="width: 140px; text-align: right;" readonly="readonly" class="form-control" placeholder="0.00" aria-describedby="basic-addonA3">
										</div>										
									</div>
									<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
									<div class="form-horizontal">
										<input id="iadd" class="btn btn-default btn-sm" type="button" value="Add Item">									
									</div>
									<div class="form-horizontal" style="height: 10px;">&nbsp;</div>
									<div class="form-horizontal">
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<thead style="border: 1px solid gray;">
												<tr>
													<td class="col-sm-6">Requested Item</td>
													<td class="col-sm-2" style="text-align: right;">Subtotal</td>
													<td class="col-sm-1">
														<span class="fa-stack" data-toggle="tooltip" title="Guest for Checkout">
															<i class="fa fa-square-o fa-stack-2x"></i>
															<i class="fa fa-caret-down fa-stack-1x"></i>
														</span>	
													</td>
												</tr>
											</thead>
										</table>												
									</div>
									<div style="height: 30%; overflow-y: auto;">
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<tbody id="itemlist">
											</tbody>
										</table>												
									</div>
									<div>
										<table class="table table-condensed table-striped table-responsive" style="font-family: Calibri !important; font-size:14px !important;">
											<tfoot>
												<tr>
													<td colspan="2" class="col-sm-8"><h4>Total Due</h4></td>
													<td class="col-sm-1" style="text-align: right;" ><h4 id="igtotal">900.00</h4></td>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal" style="visibility: hidden;" id="crequestitem">
									<button type="button" class="btn btn-default" onclick="javascript:cancel_request_items();">Cancel</button>
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
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Booking Type</span>
										<select id="selrestype" class="form-control" aria-describedby="basic-addonA1" style="width: 300px;">
											<option value=0> Walk-In </option>
											<option value=1> Phone-In/Online Reservation </option>
										</select>
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div id="resvpanel" class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Reservation No.</span>
										<input id="reserveid" type="text" class="form-control" placeholder="Reservation Number">
									</div>	
								</div>
								<hr>
								<h5>Accomodation Information</h5>
								<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Type</span>
										<select id="selroomtype" class="form-control" aria-describedby="basic-addonA1" style="width: 300px;"> </select>
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Available</span>
										<select id="selrooms" class="form-control" aria-describedby="basic-addonA1" style="width: 300px;"> </select>
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Used Rate</span>
										<select id="isovn" class="form-control" aria-describedby="basic-addonA1" style="width: 150px;" disabled="disabled">
											<option value="0">Daytime Rate</option>
											<option value="1">Overnight Rate</option>
										</select>
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Rate</span>
										<input id="roomrate" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="0.00" style="width: 150px; text-align: right;" disabled="disabled">
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Capacity</span>
										<input id="roomcap" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="0" maxlength="4" style="width: 70px; text-align: right;" disabled="disabled">
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Usage Duration</span>
										<input id="roomdur" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="0" style="width: 150px; text-align: right;" disabled="disabled">
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;"><b>Guest Count</b></span>
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Adult</span>
										<input id="adultguest" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="0" maxlength="4" style="text-align: center; width: 70px;">
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Child 2 y/o - up</span>
										<input id="childguest" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="0" maxlength="4" style="text-align: center; width: 70px;">
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Child below 2 y/o</span>
										<input id="childguest2" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="0" maxlength="4" style="text-align: center; width: 70px;">
									</div>	
								</div>
								<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
								<hr>
								<h5>Guest Information</h5>
								<div class="form-horizontal" style="height: 5px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Salutation</span>
										<select id="gsalutation" class="form-control" aria-describedby="basic-addonA1" style="width: 150px;">
											<option value=0 selected="selected">- Guest salutation -</option>
											<option value=1>Mr.</option>
											<option value=2>Mrs.</option>
											<option value=3>Ms.</option>
										</select>
										&nbsp;
										<input class="btn btn-default btn-sm" id="bguestlist" type="button" data-toggle="modal" data-target="#guestSearch" value="Guest Search">
										<input class="btn btn-default btn-sm" id="bgclear" type="button" value="Clear">
									</div>	
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Last Name</span>
										<input id="glastname" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="Last Name" style="width: 300px;">
									</div>
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">First Name</span>
										<input id="gfirstname" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="First Name" style="width: 300px;">
									</div>
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Middle Name</span>
										<input id="gmiddlename" type="text" class="form-control" aria-describedby="basic-addonA1" placeholder="Middle Name" style="width: 300px;">
									</div>
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Address</span>
										<textarea id="gaddress" class="form-control" aria-describedby="basic-addonA1" placeholder="Address" style="height: 50px; width: 300px;"></textarea>
									</div>
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Landline No.</span>
										<input type="text" id="glandline" class="form-control" aria-describedby="basic-addonA1" placeholder="Landline Number" style="width: 150px;">
									</div>
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Mobile No.</span>
										<input type="text" id="gmobile" class="form-control" aria-describedby="basic-addonA1" placeholder="Mobile Number" style="width: 150px;">
									</div>
								</div>
								<div class="form-horizontal" style="height: 2px;">&nbsp;</div>
								<div class="form-horizontal">
									<div class="input-group input-group-sm">
										<span class="input-group-addon" id="basic-addonA1" style="width: 120px;">Email Address</span>
										<input type="text" id="gemail" class="form-control" aria-describedby="basic-addonA1" placeholder="user@domain.com" style="width: 150px;">
									</div>
								</div>
								<div class="form-horizontal" style="height: 10px;">&nbsp;</div>
								<div class="form-horizontal">
									<table class="table">
										<tr>
											<td style="text-align: center;">
												<div class="form-horizontal">
													<button id="regbooking" class="btn btn-primary btn-sm">Save Booking</button>
													<button id="cancelbooking" class="btn btn-primary btn-sm">Cancel</button>
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