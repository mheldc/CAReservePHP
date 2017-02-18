	var restype 	= $('#selrestype'),
		resno		= $('#reserveid'),
		roomtype	= $('#selroomtype'),
		rooms		= $('#selrooms'),
		isovn		= $('#isovn'),
		roomrate	= $('#roomrate'),
		roomcap		= $('#roomcap'),
		roomdur		= $('#roomdur'),
		childcnt	= $('#childguest'),
		childcnt2	= $('#childguest2'),
		adultcnt	= $('#adultguest'),
		btnguest	= $('#bguestlist'),
		tblguest	= $('#guestlist'),
		sguest		= $('#searchedguest'),
		salutation	= $('#gsalutation'),
		lname		= $('#glastname'),
		fname		= $('#gfirstname'),
		mname		= $('#gmiddlename'),
		address		= $('#gaddress'),
		landline	= $('#glandline'),
		mobile		= $('#gmobile'),
		email		= $('#gemail'),
		regbooking	= $('#regbooking'),
		settlepymt	= $('#settlepymt'),
		totalbooked	= $('#bookingcount'),
		totalpymt	= $('#paymenttotal');
	
	// Modal variables
		plist		= $('#paymentlist'),
		blist		= $('#bookingcontents');

$(function(){
	// Reservation
	$.support.transition = true;
	$('#rEventDate').datetimepicker({format:'DD-MMM-YYYY'});
	$('#rEventTimeStart').datetimepicker({format:'hh:mm A'});
	$('#rEventTimeEnd').datetimepicker({format:'hh:mm A'});	
	
	// Booking
	$('[data-toggle="tooltip"]').tooltip();
	resno.hide();
	loadactivebookings();
	get_accomodation_types();
	
	restype.on('change', function(){
		if (restype.val() == 1) {
			resno.show();
		} else {
			resno.hide();
		}
	});
	
	roomtype.on('change', function(){
		get_available_rooms(roomtype.val());
	});
	
	rooms.on('change', function(){
		get_room_details(rooms.val());
	});
	
	isovn.on('change', function(){
		
		if (roomdata == undefined) {
			return false;
		}
		if (this.checked) {
			roomrate.val(roomdata[0]['nightrate']);
			roomdur.val(roomdata[0]['nighttime']);
		} else {
			roomrate.val(roomdata[0]['dayrate']);
			roomdur.val(roomdata[0]['daytime']);
		}
	});
	
	btnguest.on('click', function() {
		$.ajax({
			url	: wwwnavi + 'ca/guestlist',
			type: 'get',
			success : function(r) {
				var obj = JSON.parse(r);
				console.log(r);
				tblguest.empty();
				for(i=0; i < obj.length; i++){
					tblguest.append('<tr>' + 
										'<td class="col-sm-1">' + obj[i]['id'] + '</td>' + 
										'<td class="col-sm-7">' + obj[i]['gname'] + '</td>' + 
										'<td class="col-sm-1">' + 
											'<a href="javascript:loadguestinfo('+ obj[i]['id'] +');">' + 
												'<span class="fa-stack">' + 
													'<i class="fa fa-square-o fa-stack-2x"></i>' + 
													'<i class="fa fa-vcard-o fa-stack-1x"></i>' + 
												'</span>' + 				
											'</a>' + 									
										'</td>' + 
									'</tr>');
				}
			},
			fail : function(jqXHR, textStatus) {
				console.log('Error occurred : ' + textStatus);
			},
			done : function(r) {
				console.log('Loding of guest list succeeded.');
			}
		});
	});
	
	regbooking.on('click', function(){
		
		if (confirm("Continue saving new booking?") == true) {
			bookingdata =
			[
				{booking_info:{srcid:restype.val(), rsid:resno.val(), gid: selguestid, rtid: roomtype.val(), rmid:rooms.val(), rmrt: roomrate.val(), rmnm:$('#selrooms option:selected').text(), ga:adultcnt.val(), gc:childcnt.val(), gc2:childcnt2.val(), ison:isovn.prop("checked")}},
				{guest_info:{sal:salutation.val(), gln: lname.val(), gfn: fname.val(), gmn: mname.val(), gadd:address.val(), geml:email.val(), gland:landline.val(), gmob: mobile.val()}}
			];
			registerbooking(bookingdata);
		}
	});

	settlepymt.on('click', function() {
		if (confirm("Confirm payment settlement?") == true) {
			if (selbkid > 0) {
				tag_payment(selbkid);
				plist.empty();
				totalpymt.empty().append('0.00');
			} else {
				alert('An error occured while tagging payment. Please call your system provider.');
			}
		}
	});
});

function set_booking_id(bid) {
	selbkid = bid;
	console.log(selbkid);
}

function clear_booking() {
	restype.val(0);
	resno.val('');
	roomtype.val(0);
	rooms.val(0);
	isovn.prop('checked', false);
	roomrate.val('0.00');
	roomcap.val('0');
	roomdur.val('');
	childcnt.val('');
	childcnt2.val('');
	adultcnt.val('');
	salutation.val(0);
	lname.val('');
	fname.val('');
	mname.val('');
	address.val('');
	landline.val('');
	mobile.val('');
	email.val('');
	restype.focus();
	bookingdata = [];
}

function get_accomodation_types() {
	$.ajax({
		url: wwwnavi + 'ca/roomtypes',
		type: 'get',
		success: function(r){
			var obj = JSON.parse(r);
			roomtype.empty();
			roomtype.append('<option value="0"> - Select Accomodation Type - </option>')
			for(i=0; i < obj.length; i++){
				roomtype.append('<option value="' + obj[i]['id'] + '">' + obj[i]['typedesc'] + '</option>')
			}
		},
		fail: function(jqXHR, textStatus){
			console.log('Error occured: ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data');
		}
	});
}

function get_available_rooms(rtid) {
	$.ajax({
		url: wwwnavi + 'ca/rooms',
		type: 'get',
		data: {id:rtid},
		success: function(r){
			//console.log(r);
			var obj = JSON.parse(r);
			
			rooms.empty();
			rooms.append('<option value="0"> - Select an Available Room - </option>')
			for(i=0; i < obj.length; i++){
				rooms.append('<option value="' + obj[i]['id'] + '">' + obj[i]['room'] + '</option>')
			}
		},
		fail: function(jqXHR, textStatus){
			console.log('Error occured: ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data');
		}
	});
}

function get_room_details(rid) {
	$.ajax({
		url: wwwnavi + 'ca/roomdetails',
		type: 'get',
		data: {id:rid},
		success: function(r){
			var obj = JSON.parse(r);
			roomdata = obj;
			
			roomrate.val(roomdata[0]['dayrate']);
			roomcap.val(roomdata[0]['rmcap']);
			roomdur.val(roomdata[0]['daytime']);
		},
		fail: function(jqXHR, textStatus){
			console.log('Error occured: ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data');
		}
	});
}
	
function registerbooking(d) {
	console.log('function call registerbooking success.');
	$.ajax({
		url		: wwwnavi + 'ca/newbooking',
		type	: 'post',
		data 	: {pdata:d},
		success	: function(r) {
			console.log(r);
		},
		fail	: function(jqXHR, textStatus) {
			console.log('Error occured: ' + textStatus);
		},
		done	: function(r) {
			console.log('Done processing data');
			clear_booking();
		}
	});
}

function loadguestinfo(gid) {
	console.log(gid);
	$.ajax({
		url		: wwwnavi + 'ca/guestinfo',
		type	: 'get',
		data 	: {pdata:gid},
		success	: function(r) {
			var obj = JSON.parse(r);
			for(i = 0; i < obj.length; i++){
				salutation.val(obj[i]['salutation']);
				lname.val(obj[i]['lastname']);
				fname.val(obj[i]['firstname']);
				mname.val(obj[i]['middlename']);
				address.val(obj[i]['address']);
				landline.val(obj[i]['landline']);
				mobile.val(obj[i]['mobile']);
				email.val(obj[i]['email']);
			}
		},
		fail	: function(jqXHR, textStatus) {
			console.log('Error occured: ' + textStatus);
		},
		done	: function(r) {
			console.log('Done processing data');
		}
	});
}

function loadactivebookings() {
	$.ajax({
		url: wwwnavi + 'ca/bookings',
		type: 'get',
		success: function(r){
			var obj = JSON.parse(r);
			blist.empty();
			for(i = 0; i < obj.length; i++){
				var istimeout = 'visibility:hidden;', withpayables = 'style="visibility:hidden;"';
				if (obj[i]['timeout'] == "1") {
					istimeout = 'visibility:visible;';
				}
				
				if (obj[i]['unpaid'] == "1") {
					withpayables = 'style="visibility:visible;"';
				}
				
				var el = '<tr style="width:100%;">' +
							'<td class="col-sm-1">'+ obj[i]['bkid'] +'</td>' +
							'<td class="col-sm-3">'+ obj[i]['guestname'] +'</td>' +
							'<td class="col-sm-6">'+ obj[i]['room'] +'</td>' +
							'<td class="col-sm-2">'+ obj[i]['qty'] +'</td>' +
							'<td class="col-sm-1">' +
								'<a href="#" style="' + istimeout + '">' +
									'<span class="fa-stack faa-flash animated" style="color:red;' + istimeout + '">' +
										'<i class="fa fa-square-o fa-stack-2x"></i>' +
										'<i class="fa fa-clock-o fa-stack-1x"></i>' +
									'</span>' +										
								'</a>' +
							'</td>' +
							'<td class="col-sm-1">' +
								'<a href="#" data-toggle="modal" data-target="#paymentmodal"  '+ withpayables +' onclick="javascript:loaditemsforpayment('+ obj[i]['bkid'] +');">' +
									'<span class="fa-stack" '+ withpayables +'>' +
										'<i class="fa fa-square-o fa-stack-2x"></i>' +
										'<i class="fa fa-dollar fa-stack-1x"></i>' +
									'</span>	' +									
								'</a>' +
							'</td>' +
							'<td class="col-sm-1">' +
								'<a href="#" data-toggle="modal" data-target="#addguestmodal" onclick="javascript:set_booking_id('+ obj[i]['bkid'] +');">' +
									'<span class="fa-stack">' +
										'<i class="fa fa-square-o fa-stack-2x"></i>' +
										'<i class="fa fa-group fa-stack-1x"></i>' +
									'</span>' +										
								'</a>' +
							'</td>' +
							'<td class="col-sm-1">' +
								'<a href="#" data-toggle="modal" data-target="#changeaccmodal" onclick="javascript:set_booking_id('+ obj[i]['bkid'] +');">' +
									'<span class="fa-stack">' +
										'<i class="fa fa-square-o fa-stack-2x"></i>' +
										'<i class="fa fa-home fa-stack-1x"></i>' +
									'</span>' +										
								'</a>' +
							'</td>' +
							'<td class="col-sm-1">' +
								'<a href="#" data-toggle="modal" data-target="#guestreqmodal" onclick="javascript:set_booking_id('+ obj[i]['bkid'] +');">' +
									'<span class="fa-stack">' +
										'<i class="fa fa-square-o fa-stack-2x"></i>' +
										'<i class="fa fa-paste fa-stack-1x"></i>' +
									'</span>' +										
								'</a>' +									
							'</td>' +
						'</tr>';
				blist.append(el);
				totalbooked
					.empty()
					.append('Total Active bookings for the day : ' + obj.length);
			}
		},
		fail: function(jqXHR, textStatus){
			console.log('Error occured: ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data');
		}
	});
}

function loaditemsforpayment(bid) {
	$.ajax({
		url: wwwnavi + 'ca/paymentsummary',
		type: 'get',
		data: {pdata:bid},
		success: function(r){
			console.log(r);
			var obj = JSON.parse(r);
			var paymenttotals = 0;
			plist.empty();
			
			for (i = 0; i < obj.length; i++) {
				var el = 	'<tr>' +
								'<td class="col-sm-1">'+ obj[i]['id'] +'</td>' +
								'<td class="col-sm-7">'+ obj[i]['itemdesc'] +'</td>' +
								'<td class="col-sm-1" style="text-align: right;">'+ obj[i]['itemamt'] +'</td>' +
							'</tr>';
				plist.append(el);
				paymenttotals = (paymenttotals + parseFloat(obj[i]['itemamt']));
			}
			totalpymt.empty();
			totalpymt.append('P ' + paymenttotals.toFixed(2));
			selbkid = bid;
		},
		fail: function(jqXHR, textStatus){
			console.log('Error occured: ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data');
		}
	});
}

function tag_payment(bkid) {
	$.ajax({
		url: wwwnavi + 'ca/tagpayment',
		type: 'post',
		data: {pdata:bkid},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj[0]['tag_status'] == true) {
				alert('Payment has been settled.');
				selbkid = 0;
				loadactivebookings();
			} else {
				alert('Error tagging payment.');
			}
		},
		fail: function(jqXHR, textStatus){
			console.log('Error occured: ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data');
		}
	});
}
	
function auth_user() {
	userdata = {'data':{'lid':'ca-admin','lpw':'ca-admin'}};
	requrl = wwwnavi + 'ca/login';
	
	console.log(requrl);
	
	$.ajax({
		url: requrl,
		type: 'post',
		data: userdata,
		success: function(resdata){
			console.log(resdata);
		},
		fail: function(jqXHR, textStatus){
			console.log('Request failed : ' + textStatus);
		},
		done: function(resdata){
			console.log('Done processing data.' + resdata);
		}
	});
}
	
