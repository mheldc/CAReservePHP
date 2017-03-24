	var restype 	= $('#selrestype'),
		resno		= $('#reserveid'),
		roomtype	= $('#selroomtype'),
		rooms		= $('#selrooms'),
		isovn		= $('#isovn'),
		isovntext	= $('#isovntext'),
		roomrate	= $('#roomrate'),
		roomcap		= $('#roomcap'),
		roomdur		= $('#roomdur'),
		badultcnt	= $('#adultguest'),
		bchildcnt	= $('#childguest'),
		bchildcnt2	= $('#childguest2'),
		childcnt	= $('#addChild'),
		childrate	= $('#addChildRate'),
		childst		= $('#addChildST'),
		childcnt2	= $('#addChild2'),
		childrate2	= $('#addChildRate2'),
		childst2	= $('#addChildST2'),
		adultcnt	= $('#addAdult'),
		adultrate	= $('#addAdultRate'),
		adultst		= $('#addAdultST'),
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
		canbooking  = $('#cancelbooking'),
		settlepymt	= $('#settlepymt'),
		settleclose = $('#settlepymtclose'),
		totalbooked	= $('#bookingcount'),
		totalpymt	= $('#paymenttotal'),
		rcvpymt		= $('#rcvpayment'),
		chgpymt		= $('#changepymt'),
		gpymt		= $('#addPymtdue'),
	
	// Modal variables
		plist		= $('#paymentlist'),
		blist		= $('#bookingcontents'),
		gclear		= $('#bgclear'),
		errmsg		= $('#errmesg'),
		trgerr		= $('#mErr'),
		conmsg		= $('#confmesg'),
		trgcon		= $('#mConf')
		infmsg		= $('#infomesg'),
		trginf		= $('#mInfo'),
		btnconf		= $('#bConfirm'),
		btncan		= $('#bCancel'),
		fromacct	= $('#facctype'),
		fromacc		= $('#facc'),
		fromaccr	= $('#faccrate'),
		toacct		= $('#tacctype'),
		toacc		= $('#tacc'),
		toaccr		= $('#taccrate'),
		toaccrt		= $('#taccratetype'),
		toaccre		= $('#taccreason'),
		aguestclose = $('#appguestclose'),
		aguestsave	= $('#appguestsave'),
		itmadd		= $('#iadd'),
		itemlist	= $('#itemlist'),
		itemtype	= $('#itype'),
		item 		= $('#idesc'),
		itemprice	= $('#iprice'),
		itemqty		= $('#iqty'),
		itemst		= $('#isubtotal'),
		itmtotal	= $('#igtotal'),
		
		bctotal 	= $('#bctotal'),
		bcscan		= $('#bcscanned'),
		bcremain	= $('#bcremaining'),
		bctoscan	= $('#bctoscan'),
		bcwlist		= $('#bcwlist'),
		wbtotal		= $('#bcwtotal'),
		
	// Function variables
		rateflag 	= false,
		srcform		= null,
		coflag		= false,
		
	// Authentication
		uid			= $('#userid'),
		upw			= $('#userpw');

$(function(){
	// Reservation
	$.support.transition = true;
	$('#rEventDate').datetimepicker({format:'DD-MMM-YYYY'});
	$('#rEventTimeStart').datetimepicker({format:'hh:mm A'});
	$('#rEventTimeEnd').datetimepicker({format:'hh:mm A'});	
	$('#resinqdt').datetimepicker({format:'DD-MMM-YYYY'});
	$('#reslogdt').datetimepicker({format:'DD-MMM-YYYY'});
	$('#occ_date').datetimepicker({format:'DD-MMM-YYYY hh:mm A'});
	
	// Booking
	$('[data-toggle="tooltip"]').tooltip();
	$('#resvpanel').hide();
	loadactivebookings();
	get_accomodation_types();
	displayitemtypes();
	guestrates();
	
	/*
	setInterval(function(){
		if (blist.length > 0) {
			loadactivebookings();
		}
	},
	5000);
	*/
	
	restype.on('change', function(){
		if (restype.val() == 1) {
			$('#resvpanel').show();
		} else {
			$('#resvpanel').hide();
		}
	});
	
	roomtype.on('change', function(){
		get_available_rooms(roomtype.val());
	});
	
	rooms.on('change', function(){
		get_room_details(rooms.val());
	});
	
	toacct.on('change', function(){
		get_available_transfer_rooms(toacct.val());
	});
	
	$('#res_acctype').on('change', function(){
		get_available_rooms_rinq($('#res_acctype').val());
	});
	
	toacc.on('change', function(){
		get_room_details_transfer(toacc.val());
	});
	
	isovn.on('change', function(){
		if (roomdata == undefined || roomdata.length == 0) {
			errmsg.empty().append('Please chose an Accomodation type and available accomodations.');
			trgerr.trigger('click');
			this.checked = false;
			return false;
		}
		
		if (this.checked) {
			roomrate.val(roomdata[0]['nightrate']);
			roomdur.val(roomdata[0]['nighttime']);
			isovntext.attr('value','Overnight Rate');
			rateflag = true;
		} else {
			roomrate.val(roomdata[0]['dayrate']);
			roomdur.val(roomdata[0]['daytime']);
			isovntext.attr('value','Daytime Rate');
			rateflag = false;
		}
	});
	
	btnguest.on('click', function() {
		$.ajax({
			url	: wwwnavi + 'ca/guestlist',
			type: 'get',
			data: {pdata:''},
			success : function(r) {
				var obj = JSON.parse(r);
				console.log(r);
				tblguest.empty();
				for(i=0; i < obj.length; i++){
					tblguest.append('<tr>' + 
										'<!-- <td class="col-sm-1">' + obj[i]['id'] + '</td> /-->' + 
										'<td class="col-sm-7">' + obj[i]['gname'] + '</td>' + 
										'<td class="col-sm-1">' + 
											'<a href="#" onclick="javascript:loadguestinfo(' + obj[i]['id'] + ')">' + 
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
	
	$('#resg_list').on('click', function(){
		$.ajax({
			url	: wwwnavi + 'ca/guestlist',
			type: 'get',
			data:{pdata:''},
			success : function(r) {
				var obj = JSON.parse(r);
				console.log(r);
				tblguest.empty();
				for(i=0; i < obj.length; i++){
					tblguest.append('<tr>' + 
										'<!-- <td class="col-sm-1">' + obj[i]['id'] + '</td> /-->' + 
										'<td class="col-sm-7">' + obj[i]['gname'] + '</td>' + 
										'<td class="col-sm-1">' + 
											'<a href="#" onclick="javascript:loadguestinfo_res(' + obj[i]['id'] + ')">' + 
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

	$('#bkg_find').on('click', function(){
		$.ajax({
			url	: wwwnavi + 'ca/guestlist',
			type: 'get',
			data: {pdata:$('#searchedguest').val()},
			success : function(r) {
				var obj = JSON.parse(r);
				console.log(r);
				tblguest.empty();
				for(i=0; i < obj.length; i++){
					tblguest.append('<tr>' + 
										'<!-- <td class="col-sm-1">' + obj[i]['id'] + '</td> /-->' + 
										'<td class="col-sm-7">' + obj[i]['gname'] + '</td>' + 
										'<td class="col-sm-1">' + 
											'<a href="#" onclick="javascript:loadguestinfo(' + obj[i]['id'] + ')">' + 
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
	
	$('#resg_find').on('click', function(){
		$.ajax({
			url	: wwwnavi + 'ca/guestlist',
			type: 'get',
			data: {pdata:$('#searchedguest').val()},
			success : function(r) {
				var obj = JSON.parse(r);
				console.log(r);
				tblguest.empty();
				for(i=0; i < obj.length; i++){
					tblguest.append('<tr>' + 
										'<!-- <td class="col-sm-1">' + obj[i]['id'] + '</td> /-->' + 
										'<td class="col-sm-7">' + obj[i]['gname'] + '</td>' + 
										'<td class="col-sm-1">' + 
											'<a href="#" onclick="javascript:loadguestinfo_res(' + obj[i]['id'] + ')">' + 
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
		if (restype.val() > 0 && resno.val().length == 0) {
			errmsg.empty().append("Reservation number required! \n Please supply a valid Reservation number.");
			trgerr.trigger('click');
			return false;
		}
		if (roomtype.val() == 0 || rooms.val() == 0) {
			errmsg.empty().append("Invalid accomodation type and/or accomodation selected.");
			trgerr.trigger('click');
			return false;
		}
		if (isNaN(roomrate.val()) == true) {
			errmsg.empty().append("Room rate only accept numbers. Please key in a valid value.");
			roomrate.val('0.00');
			trgerr.trigger('click');
			return false;
		}
		if (isNaN(adultcnt.val()) == true) {
			errmsg.empty().append("Adult guest entry only accept numbers. Please key in a valid value.");
			adultcnt.val('0');
			trgerr.trigger('click');
			return false;
		}
		if (isNaN(childcnt.val()) == true) {
			errmsg.empty().append("Child guest entry only accept numbers. Please key in a valid value.");
			childcnt.val('0');
			trgerr.trigger('click');
			return false;
		}
		if (isNaN(childcnt2.val()) == true) {
			errmsg.empty().append("Child guest below 2 y/o entry only accept numbers. Please key in a valid value.");
			childcnt2.val('0');
			trgerr.trigger('click');
			return false;
		}
		if (badultcnt.val() == 0 && bchildcnt.val() == 0 && bchildcnt2.val() == 0) {
			errmsg.empty().append("Invalid guest count supplied there should be at least 1 guest.");
			childcnt2.val('0');
			trgerr.trigger('click');
			return false;
		}
		if (salutation.val() == 0) {
			errmsg.empty().append("Please select a valid guest salutation.");
			trgerr.trigger('click');
			return false;
		}
		if (lname.val().length == 0) {
			errmsg.empty().append("Last name is a required field.");
			trgerr.trigger('click');
			return false;
		}
		if (fname.val().length == 0) {
			errmsg.empty().append("First name is a required field.");
			trgerr.trigger('click');
			return false;
		}
		if (address.val().lenght == 0) {
			errmsg.empty().append("Address is a required field.");
			trgerr.trigger('click');
			return false;
		}
		if (landline.val().length == 0 && mobile.val().length == 0) {
			errmsg.empty().append('Please provide at least 1 valid contact information.');
			trgerr.trigger('click');
			return false;
		}
		
		srcform = 'booking';
		conmsg.empty().append('Proceed saving new booking information?');
		trgcon.trigger('click');
	});

	canbooking.on('click', function(){
		conmsg.empty().append('Are you sure you want to cancel booking?');
		btncan.text('No');
		btnconf.text('Yes');
		srcform = 'cancel_booking';
		trgcon.trigger('click');
	});
	
	btnconf.on('click', function() {
		if (srcform == 'booking') {
			
			bookingdata =
				[
					{booking_info:{srcid:restype.val(), rsid:resno.val(), gid: selguestid, rtid: roomtype.val(), rmid:rooms.val(), rmrt: roomrate.val(), rmnm:$('#selrooms option:selected').text(), ga:badultcnt.val(), gc:bchildcnt.val(), gc2:bchildcnt2.val(), ison:isovn.val()}},
					{guest_info:{sal:salutation.val(), gln: lname.val(), gfn: fname.val(), gmn: mname.val(), gadd:address.val(), geml:email.val(), gland:landline.val(), gmob: mobile.val()}}
				];
			registerbooking(bookingdata);
			infmsg.empty().append('New Booking has been saved.');
			trginf.trigger('click');
			srcform = null;
			clear_booking();
			loadactivebookings();
		}
		else if (srcform == 'cancel_booking') {
			infmsg.empty().append('Booking has been cancelled.');
			trginf.trigger('click');
			srcform = null;
			clear_booking();
		}
		else if (srcform == 'booking_checkout') {
			checkoutguest(selbkid);
		}
		else if (srcform == 'booking_payment') {
			tag_payment(selbkid);
		}
		else if (srcform == 'booking_addguest') {
			var adata, cdata, c2data, gdata = [];
			if (adultcnt.val() > 0 || !adultcnt.val() == '' || !adultcnt.val() == undefined) {
				adata = {bid: selbkid, itype: 2, idesc: 'Additional Guest (Adult) x ' + adultcnt.val(), iqty: adultcnt.val(), iamt: adultst.val(), gtype:'a'};
				gdata.push(adata);
			}
			if (childcnt.val() > 0 || !childcnt.val() == '' || !childcnt.val() == undefined) {
				cdata = {bid: selbkid, itype: 2, idesc: 'Additional Guest (Child) x ' + childcnt.val(), iqty: childcnt.val(), iamt: childst.val(), gtype:'b'};
				gdata.push(cdata);
			}
			if (childcnt2.val() > 0 || !childcnt2.val() == '' || !childcnt2.val() == undefined) {
				c2data = {bid: selbkid, itype: 2, idesc: 'Additional Guest (Child 2 y/o below) x ' + childcnt2.val(), iqty: childcnt2.val(), iamt: childst2.val(), gtype:'c'};
				gdata.push(c2data);
			}
			guestaddition(gdata);
			loadactivebookings();
		}
		else if (srcform == 'transfer_accomodation') {
			transferdata = [{bid: selbkid,
							frmtype: fromacct.val(), frmid: fromacc.val(), frmrt: parseFloat(fromaccr.val().replace(',','')), frmnm:$('#facc option:selected').text(),
							rmtype: toacct.val(), rmid: toacc.val(), rmrt:parseFloat(toaccr.val().replace(',','')), rmnm:$('#tacc option:selected').text(),
							rmk:toaccre.val()}];
			
			transferaccomodation(transferdata);
		}
		else if (srcform == 'add_request_item') {
			var reqitems = {};
			if (requestitems.length == 0) {
				reqitems = {bid: selbkid, idx: 0, itype: itemtype.val(), ritem: item.val(), ritemdesc: $('#idesc option:selected').text(), rqty: itemqty.val(), ist: parseFloat(itemst.val().replace(',',''))}
			} else {
				reqitems = {bid: selbkid, idx: (requestitems.length - 1), itype: itemtype.val(), ritem: item.val(), ritemdesc: $('#idesc option:selected').text(), rqty: itemqty.val(), ist: parseFloat(itemst.val().replace(',',''))}
			}
			
			requestitems.push(reqitems);
			displayrequesteditems();
			srcform = null;
		}		
		else if (srcform == 'cancel_request_item') {
			itemtype.val(0);
			item.empty();
			itemqty.val('');
			itemprice.val('');
			itemst.val('');
			itemlist.empty();
			itmtotal.empty().append('0.00');
			requestitems = [];
			$('#crequestitem').trigger('click');
		}
		else if (srcform == 'save_request_item') {
			if (requestitems.length > 0) {
				save_request_items(requestitems);
				loadactivebookings();
			} else {
				errmsg.empty().append('There are no items to be saved.');
				trgerr.trigger('click');
			}
		}
		else if (srcform == 'cancel_wb_issuance') {
			$('#cbarcode').trigger('click');
			scannedbcodes = [];
			bcwlist.empty();
			bcremain.val(parseInt(bctotal.val()));
			bcscan.val(0);
			bcwtotal.empty().append(0);
			infmsg.empty().append('Wristbands/Passes issuance cancelled.');
			trginf.trigger('click');
		}
		else if (srcform == 'save_wb_issuance') {
			register_passes(scannedbcodes);
		}
		else {
			return false;
		}
	});
	
	settlepymt.on('click', function() {
		if (selbkid > 0) {
			prepaymentsettlement(selbkid);
		} else {
			errmsg.empty().append('There\'s an error tagging payments for this booking. Please call your system provider for support.');
			trgerr.trigger('click');
		}
	});

	gclear.on('click', function() {
		salutation.removeAttr('disabled');
		lname.removeAttr('readonly');
		fname.removeAttr('readonly');
		mname.removeAttr('readonly');
		address.removeAttr('readonly');
		landline.removeAttr('readonly');
		mobile.removeAttr('readonly');
		email.removeAttr('readonly');
		// Clear values
		salutation.val(0);
		lname.val('');
		fname.val('');
		mname.val('');
		address.val('');
		landline.val('');
		mobile.val('');
		email.val('');
		selguestid = 0;
	});

	rcvpymt.on('change', function() {
		if (isNaN(rcvpymt.val()) == true) {
			errmsg.empty().append('A number is expected. Invalid character(s) detected.');
			trgerr.trigger('click');
			rcvpymt.val('0');
			chgpymt.empty().append('0.00')
		} else {
			if (parseFloat(rcvpymt.val()) < parseFloat(totalpymt.text().replace('P ', '').replace(',',''))) {
				errmsg.empty().append('Received payment should be equal or greater than that of the amount due.');
				trgerr.trigger('click');
				return false;
			} else {
				chgpymt.empty().append((parseFloat(rcvpymt.val()) - parseFloat(totalpymt.text().replace('P ', '').replace(',',''))).toFixed(2));
			}
		}
	});
	
	adultcnt.on('change', function(e){
		if (isNaN(adultcnt.val())) {
			errmsg.empty().append('Only numbers are accepted as input.');
			trgerr.trigger('click');
		} else if (parseInt(adultcnt.val()) == 0) {
			errmsg.empty().append('At least one (1) adult guest is required.');
			trgerr.trigger('click');
		} else {
			adultst.val((parseFloat(adultcnt.val()) * parseFloat(adultrate.val())).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			computegrates();
			childcnt.focus();
		}
	}).on('blur', function(){
		if (isNaN(adultcnt.val())) {
			errmsg.empty().append('Only numbers are accepted as input.');
			trgerr.trigger('click');
		} else if (parseInt(adultcnt.val()) == 0) {
			errmsg.empty().append('At least one (1) adult guest is required.');
			trgerr.trigger('click');
		} else {
			adultst.val((parseFloat(adultcnt.val()) * parseFloat(adultrate.val())).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			computegrates();
			childcnt.focus();
		}
	});
	
	childcnt.on('change', function(){
		if (isNaN(childcnt.val())) {
			errmsg.empty().append('Only numbers are accepted as input.');
			trgerr.trigger('click');
		} else if (parseInt(childcnt.val()) == 0) {
			errmsg.empty().append('At least one (1) adult guest is required.');
			trgerr.trigger('click');
		} else {
			childst.val((parseFloat(childcnt.val()) * parseFloat(childrate.val())).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			computegrates();
			childcnt2.focus();
		}
	}).on('blur', function(){
		if (isNaN(childcnt.val())) {
			errmsg.empty().append('Only numbers are accepted as input.');
			trgerr.trigger('click');
		} else if (parseInt(childcnt.val()) == 0) {
			errmsg.empty().append('At least one (1) adult guest is required.');
			trgerr.trigger('click');
		} else {
			childst.val((parseFloat(childcnt.val()) * parseFloat(childrate.val())).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			computegrates();
			childcnt2.focus();
		}		
	});
	
	childcnt2.on('change', function(){
		if (isNaN(childcnt2.val())) {
			errmsg.empty().append('Only numbers are accepted as input.');
			trgerr.trigger('click');
		} else if (parseInt(childcnt2.val()) == 0) {
			errmsg.empty().append('At least one (1) adult guest is required.');
			trgerr.trigger('click');
		} else {
			childst2.val((parseFloat(childcnt2.val()) * parseFloat(childrate2.val())).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			computegrates();
		}
	}).on('blur', function(){
		if (isNaN(childcnt2.val())) {
			errmsg.empty().append('Only numbers are accepted as input.');
			trgerr.trigger('click');
		} else if (parseInt(childcnt2.val()) == 0) {
			errmsg.empty().append('At least one (1) adult guest is required.');
			trgerr.trigger('click');
		} else {
			childst2.val((parseFloat(childcnt2.val()) * parseFloat(childrate2.val())).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			computegrates();
		}
	});
	
	itemtype.on('change', function(){
		displayitems(itemtype.val());
		itemprice.val('');
		itemst.val('');
		itemqty.val('');
	});
	
	item.on('change', function(){
		var obj = JSON.parse(iteminfo);
		if (obj.length > 0) {
			for(i = 0; i < obj.length; i++){
				if (obj[i]['iid'] == item.val()) {
					itemprice.val(parseFloat(obj[i]['iprice']).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					break;
				}
			}
		} else {
			return false;
		}
	});

	itmadd.on('click', function(){
		additem();
	});
	
	itemqty.on('keypress', function(e){
		if (e.which == 13) {
			var isubtotal = parseFloat(itemqty.val()) * parseFloat(itemprice.val().replace(',',''));
			itemst.val(isubtotal.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		}
	}).on('blur', function(){
		var isubtotal = parseFloat(itemqty.val()) * parseFloat(itemprice.val().replace(',',''));
		itemst.val(isubtotal.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	});

	bctoscan.on('keypress', function(){
		if (bctoscan.val().length == 9) {
			setTimeout(
				function(){	
					for(i = 0; i < scannedbcodes.length; i++){
						if (scannedbcodes[i]['bcode'] == bctoscan.val()) {
							errmsg.empty().append('Passes you entered/scanned already exists. System does not accept duplicates.');
							trgerr.trigger('click');
							bctoscan.val('').focus();
							return false;
						}
					}

					bctoscan.removeAttr('disabled');
					var tbcw = {bid: selbkid, bcode: bctoscan.val()};
					scannedbcodes.push(tbcw);
					bcscan.val(scannedbcodes.length);
					wbtotal.empty().append(scannedbcodes.length);
					bcremain.val(parseInt(bctotal.val()) - parseInt(scannedbcodes.length));
					bctoscan.val('').focus();
					scanned_barcodes(scannedbcodes);
					
					if (parseInt(scannedbcodes.length) == parseInt(bctotal.val())) {
						bctoscan.attr('disabled','disabled');
						bctoscan.val('');
						infmsg.empty().append('You have reached the maximum number of passes to scan.');
						trginf.trigger('click');
					}
				}, 2000);
		}
	});
});

function set_booking_id(bid) {
	selbkid = bid;
}

function clear_booking() {
	restype.val(0);
	resno.val('');
	roomtype.val(0);
	rooms.val(0);
	isovn.val(0);
	roomrate.val('0.00');
	roomcap.val('0');
	roomdur.val('');
	bchildcnt.val('');
	bchildcnt2.val('');
	badultcnt.val('');
	salutation.val(0).removeAttr('disabled');
	lname.val('').removeAttr('readonly');
	fname.val('').removeAttr('readonly');
	mname.val('').removeAttr('readonly');
	address.val('').removeAttr('readonly');
	landline.val('').removeAttr('readonly');
	mobile.val('').removeAttr('readonly');
	email.val('').removeAttr('readonly');
	restype.focus();
	bookingdata = [];
	srcform = null;
	selguestid = 0;
}

function get_accomodation_types() {
	$.ajax({
		url: wwwnavi + 'ca/roomtypes',
		type: 'get',
		success: function(r){
			var obj = JSON.parse(r);
			roomtype.empty().append('<option value="0"> - Select Accomodation Type - </option>');
			fromacct.empty().append('<option value="0"> - Select Accomodation Type - </option>');
			toacct.empty().append('<option value="0"> - Select Accomodation Type - </option>');
			$('#res_acctype').empty().append('<option value="0"> - Select Accomodation Type - </option>');
			
			for(i=0; i < obj.length; i++){
				roomtype.append('<option value="' + obj[i]['id'] + '">' + obj[i]['typedesc'] + '</option>');
				fromacct.append('<option value="' + obj[i]['id'] + '">' + obj[i]['typedesc'] + '</option>');
				toacct.append('<option value="' + obj[i]['id'] + '">' + obj[i]['typedesc'] + '</option>');
				$('#res_acctype').append('<option value="' + obj[i]['id'] + '">' + obj[i]['typedesc'] + '</option>');
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

function get_available_transfer_rooms(rtid) {
	$.ajax({
		url: wwwnavi + 'ca/rooms',
		type: 'get',
		data: {id:rtid},
		success: function(r){
			var obj = JSON.parse(r);
			
			toacc.empty().append('<option value="0"> - Select an Available Room - </option>')
			for(i=0; i < obj.length; i++){
				toacc.append('<option value="' + obj[i]['id'] + '">' + obj[i]['room'] + '</option>')
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

function get_available_rooms_rinq(rtid) {
	$.ajax({
		url: wwwnavi + 'ca/roomlist',
		type: 'get',
		data: {id:rtid},
		success: function(r){
			var obj = JSON.parse(r);
			
			$('#res_acc').empty().append('<option value="0"> - Select an Available Room - </option>')
			for(i=0; i < obj.length; i++){
				$('#res_acc').append('<option value="' + obj[i]['id'] + '">' + obj[i]['room'] + '</option>')
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
			isovn.val(roomdata[0]['ratebasis']);
			roomrate.val(roomdata[0]['rates']);
			roomcap.val(roomdata[0]['rmcap']);
			roomdur.val(roomdata[0]['rmdur']);
		},
		fail: function(jqXHR, textStatus){
			console.log('Error occured: ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data');
		}
	});
}

function get_room_details_transfer(rid) {
	$.ajax({
		url: wwwnavi + 'ca/roomdetails',
		type: 'get',
		data: {id:rid},
		success: function(r){
			var obj = JSON.parse(r);
			roomdata = obj;
			toaccrt.val(roomdata[0]['ratebasis']);
			toaccr.val(roomdata[0]['rates']);
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
			$('#glistclose').trigger('click');
			salutation.attr('disabled','disabled');
			lname.attr('readonly','readonly');
			fname.attr('readonly','readonly');
			mname.attr('readonly','readonly');
			address.attr('readonly','readonly');
			landline.attr('readonly','readonly');
			mobile.attr('readonly','readonly');
			email.attr('readonly','readonly');
			selguestid = gid;
		},
		fail	: function(jqXHR, textStatus) {
			console.log('Error occured: ' + textStatus);
		},
		done	: function(r) {
			console.log('Done processing data');
		}
	});
}

function loadguestinfo_res(gid) {
	$.ajax({
		url		: wwwnavi + 'ca/guestinfo',
		type	: 'get',
		data 	: {pdata:gid},
		success	: function(r) {
			var obj = JSON.parse(r);
			for(i = 0; i < obj.length; i++){
				$('#resg_salutation').val(obj[i]['salutation']);
				$('#resg_lname').val(obj[i]['lastname']);
				$('#resg_fname').val(obj[i]['firstname']);
				$('#resg_mname').val(obj[i]['middlename']);
				$('#resg_addr').val(obj[i]['address']);
				$('#resg_landline').val(obj[i]['landline']);
				$('#resg_mobile').val(obj[i]['mobile']);
				$('#resg_email').val(obj[i]['email']);
			}
			$('#glistclose').trigger('click');
			$('#resg_salutation').attr('disabled','disabled');
			$('#resg_lname').attr('readonly','readonly');
			$('#resg_fname').attr('readonly','readonly');
			$('#resg_mname').attr('readonly','readonly');
			$('#resg_addr').attr('readonly','readonly');
			$('#resg_landline').attr('readonly','readonly');
			$('#resg_mobile').attr('readonly','readonly');
			$('#resg_email').attr('readonly','readonly');
			selguestid = gid;
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
				var istimeout = 'visibility:hidden;', withpayables = 'style="visibility:hidden;"', withbctoissue = 'style="visibility:hidden;"';
				if (obj[i]['timeout'] == "1") {
					istimeout = 'visibility:visible;';
				}
				
				if (obj[i]['unpaid'] == "1") {
					withpayables = 'style="visibility:visible;"';
				}
				
				if (obj[i]['bctoissue'] > 0) {
					withbctoissue = 'style="visibility:visible;"';
				}
				
				var el = '<tr style="width:100%;">' +
							'<!--<td class="col-sm-1">'+ obj[i]['bkid'] +'</td> /-->' +
							'<td class="col-sm-4">'+ obj[i]['guestname'] +'</td>' +
							'<td class="col-sm-6">'+ obj[i]['room'] +'</td>' +
							'<td class="col-sm-2">'+ obj[i]['qty'] +'</td>' +
							'<td class="col-sm-1">' +
								'<a href="#" style="' + istimeout + '" onclick="javascript:precheckout('+ obj[i]['bkid'] +');">' +
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
								'<a href="#" data-toggle="modal" data-target="#changeaccmodal" onclick="javascript:accomodationinfo('+ obj[i]['bkid'] +');">' +
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
							'<td class="col-sm-1">' +
								'<a href="#" data-toggle="modal" data-target="#barcodemodal" ' + withbctoissue + ' onclick="javascript:prebarcode_issuance('+ obj[i]['bkid'] +','+ obj[i]['bctoissue'] +',' + obj[i]['bcqty'] + ');">' +
									'<span class="fa-stack">' +
										'<i class="fa fa-square-o fa-stack-2x"></i>' +
										'<i class="fa fa-barcode fa-stack-1x"></i>' +
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
			errmsg.empty().append('Error occured: ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data');
		}
	});
}

function resetbookingsearch() {
	$('#bksearch').val('');
	loadactivebookings();
}

function searchactivebookings() {
	if ($('#bksearch').val().length == 0) {
		errmsg.empty().append('There is no item to search.');
		trgerr.trigger('click');
		return false;
	}
	var si = $('#bksearch');
	
	$.ajax({
		url: wwwnavi + 'ca/searchbooking',
		type: 'get',
		data: {pdata:si.val()},
		success: function(r){
			var obj = JSON.parse(r);
			blist.empty();
			for(i = 0; i < obj.length; i++){
				var istimeout = 'visibility:hidden;', withpayables = 'style="visibility:hidden;"', withbctoissue = 'style="visibility:hidden;"';
				if (obj[i]['timeout'] == "1") {
					istimeout = 'visibility:visible;';
				}
				
				if (obj[i]['unpaid'] == "1") {
					withpayables = 'style="visibility:visible;"';
				}
				
				if (obj[i]['bctoissue'] > 0) {
					withbctoissue = 'style="visibility:visible;"';
				}
				
				var el = '<tr style="width:100%;">' +
							'<!--<td class="col-sm-1">'+ obj[i]['bkid'] +'</td> /-->' +
							'<td class="col-sm-4">'+ obj[i]['guestname'] +'</td>' +
							'<td class="col-sm-6">'+ obj[i]['room'] +'</td>' +
							'<td class="col-sm-2">'+ obj[i]['qty'] +'</td>' +
							'<td class="col-sm-1">' +
								'<a href="#" style="' + istimeout + '" onclick="javascript:precheckout('+ obj[i]['bkid'] +');">' +
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
								'<a href="#" data-toggle="modal" data-target="#changeaccmodal" onclick="javascript:accomodationinfo('+ obj[i]['bkid'] +');">' +
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
							'<td class="col-sm-1">' +
								'<a href="#" data-toggle="modal" data-target="#barcodemodal" ' + withbctoissue + ' onclick="javascript:prebarcode_issuance('+ obj[i]['bkid'] +','+ obj[i]['bctoissue'] +',' + obj[i]['bcqty'] + ');">' +
									'<span class="fa-stack">' +
										'<i class="fa fa-square-o fa-stack-2x"></i>' +
										'<i class="fa fa-barcode fa-stack-1x"></i>' +
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
			errmsg.empty().append('Error occured: ' + textStatus);
			trgerr.trigger('click');
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
								'<!-- <td class="col-sm-1">'+ obj[i]['id'] +'</td> /-->' +
								'<td class="col-sm-7">'+ obj[i]['itemdesc'] +'</td>' +
								'<td class="col-sm-1" style="text-align: right;">'+ (obj[i]['itemamt']).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'</td>' +
							'</tr>';
				plist.append(el);
				paymenttotals = (paymenttotals + parseFloat(obj[i]['itemamt']));
			}
			totalpymt.empty();
			totalpymt.append('P ' + paymenttotals.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
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

function prepaymentsettlement(bkid) {
	if (parseFloat(rcvpymt.val().replace(',','')) >= parseFloat(totalpymt.text().replace('P ', '').replace(',',''))) {
		srcform = 'booking_payment';
		selbkid = bkid;
		conmsg.empty().append('Confirm payment settlement?');
		trgcon.trigger('click');		
	} else {
		rcvpymt.focus();
		errmsg.empty().append('Tendered amount required. Please enter the amount on the Payment Received field.');
		trgerr.trigger('click');
	}
}

function tag_payment(bkid) {
	$.ajax({
		url: wwwnavi + 'ca/tagpayment',
		type: 'post',
		data: {pdata:bkid},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.tag_status == true) {
				selbkid = 0;
				plist.empty();
				totalpymt.empty().append('0.00');
				rcvpymt.val('');
				loadactivebookings();				
				infmsg.empty().append('Payment already settled.');
				trginf.trigger('click');
				//settleclose.trigger('click');
			} else {
				errmsg.empty().append('There\'s an error tagging payments for this booking. Please call your system provider for support.');
				trgerr.trigger('click');
			}
		},
		fail: function(jqXHR, textStatus){
			console.log('Error occured: ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data.');
		}
	});
}

function printreceipt(bid) {
	$.ajax({
		url: wwwnavi + 'ca/receipt',
		type: 'get',
		data: {pdata:bid},
		success: function(r){
			var obj = JSON.parse(r);
		},
		fail: function(jqXHR, textStatus){
			console.log('Error occured: ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data.');
		}
	});
}

function precheckout(bkid) {
	selbkid = bkid;
	srcform = 'booking_checkout';
	conmsg.empty().append('Proceed checkout of selected booking?');
	trgcon.trigger('click');
}

function checkoutguest(bkid) {
	$.ajax({
		url: wwwnavi + 'ca/checkout',
		type: 'post',
		data: {pdata:bkid},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == true) {
				infmsg.empty().append('Guest/Booking has been checked out successfully.');
				trginf.trigger('click');
				selbkid = 0;
				srcform = null;
				loadactivebookings();
			}
			else {
				errmsg.empty().append(obj.mesg);
				trgerr.trigger('click');
				selbkid = 0;
				srcform = null;
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

function resetpymtvalues() {
	rcvpymt.val('');
	chgpymt.empty().append('0.00');
}

function guestrates() {
	$.ajax({
		url: wwwnavi + 'ca/guestrates',
		type: 'get',
		success: function(r){
			var obj = JSON.parse(r);
			adultrate.val(obj[0]['rates']);
			childrate.val(obj[1]['rates']);
			childrate2.val(obj[2]['rates']);
		},
		fail: function(jqXHR, textStatus){
			console.log('Request failed : ' + textStatus);
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});
}

function computegrates() {
	var ast 	= parseFloat(adultst.val().replace(',','')),
		cst 	= parseFloat(childst.val().replace(',','')),
		cst2	= parseFloat(childst2.val().replace(',',''));
		
		if (ast == undefined || ast == '' || isNaN(ast)) {
			ast = 0;
		}
		
		if (cst == undefined || cst == '' || isNaN(cst)) {
			cst = 0;
		}
		
		if (cst2 == undefined || cst2 == '' || isNaN(cst2)) {
			cst2 = 0;
		}
	gpymt.val(parseFloat(ast + cst + cst2).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}

function preguestaddition() {
	srcform = 'booking_addguest';
	conmsg.empty().append('Proceed adding guest? Don\'t forget to settle payment(s).');
	trgcon.trigger('click');
}

function guestaddition(gdata) {
	$.ajax({
		url: wwwnavi + 'ca/addguest',
		type: 'post',
		data: {pdata:gdata},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == true) {
				selbkid = 0;
				srcform = null;
				infmsg.empty().append('Guest(s) have been added to selected booking. Please see and settle payment details.');
				trginf.trigger('click');
				adultcnt.val('');
				childcnt.val('');
				childcnt2.val('');
				adultst.val('0.00');
				childst.val('0.00');
				childst2.val('0.00');
				gpymt.val('0.00');
				aguestclose.trigger('click');
			} else {
				errmsg.empty().append(obj.mesg);
				trgerr.trigger('click');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});	
}

function accomodationinfo(bkid) {
	selbkid = bkid;
	$.ajax({
		url: wwwnavi + 'ca/curaccomodation',
		type: 'get',
		data: {pdata:bkid},
		success: function(r){
			var obj = JSON.parse(r);
			console.log(obj);
			fromacct.empty().append('<option value='+ obj[0]['acctype'] +' selected="selected">'+ obj[0]['acctdesc'] +'</option>');
			fromacc.empty().append('<option value='+ obj[0]['acc'] +' selected="selected">'+ obj[0]['accdesc'] +'</option>');
			fromaccr.val(parseFloat(obj[0]['rates']).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});
}

function confirmtransfer() {
	if (parseFloat(fromaccr.val().replace(',','')) > parseFloat(toaccr.val().replace(',',''))) {
		errmsg.empty().append('Unable to process transfer, selected room must be at least the same or greater than the previous room.');
		trgerr.trigger('click');
		return false;
	}
	
	if (selbkid == 0) {
		errmsg.empty().append('Error occured while processing transfer request. Please contact your system provider.');
		trgerr.trigger('click');
		return false;
	} else {
		srcform = 'transfer_accomodation';
		conmsg.empty().append('Confirm transfer of accomodation?');
		trgcon.trigger('click');
	}
}

function transferaccomodation(tdata) {
	$.ajax({
		url: wwwnavi + 'ca/transferaccomodation',
		type: 'post',
		data: {pdata:tdata},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == true) {
				infmsg.empty().append('Transfer accomodation succeeded.');
				trginf.trigger('click');
				fromacct.val(0);
				fromacc.empty();
				fromaccr.val('');
				toacct.val(0);
				toacc.empty();
				toaccr.val('');
				toaccrt.val(-1);
				toaccre.val('').text('');
				$('#taccclose').trigger('click');
				loadactivebookings();
			} else {
				errmsg.empty().append('Transfer accomodation failed. \n ' + obj.mesg);
				trgerr.trigger('click');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});
}

function clearaccomodation() {
	toacct.val(0);
	toacc.empty();
	toaccr.val('0.00');
	toaccre.val('').text('');
}

function displayrequesteditems() {
	var obj = requestitems,
		itotal = $('#igtotal'),
		itotals = 0;

	itemlist.empty();
	itotal.empty();
	if (obj.length > 0) {
		for(i = 0; i < obj.length; i++){
			var el = '<tr>' + 
						'<!--/<td class="col-sm-1">Id</td>/-->' +
						'<td class="col-sm-6" style="vertical-align: middle; text-align: left;">' + obj[i]['ritemdesc'] + ' x ' + obj[i]['rqty'] + '</td>' +
						'<td class="col-sm-2" style="vertical-align: middle; text-align: right;">'+ parseFloat(obj[i]['ist']).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'</td>' +
						'<td class="col-sm-1">' +
							'<a href="#" onclick="javascript:removeitem(' + obj[i]['idx'] + ');">' +
								'<span class="fa-stack">' +
									'<i class="fa fa-square-o fa-stack-2x"></i>' +
									'<i class="fa fa-remove fa-stack-1x" style="color:red;"></i>' +
								'</span>' +										
							'</a>' +									
						'</td>' +
					'</tr>';
			itemlist.append(el);
			itotals = parseFloat(itotals) + parseFloat(obj[i]['ist']);
		}
		itotal.empty().append(itotals.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		//itemtype.val(0);
		item.val(0);
		itemqty.val('');
		itemprice.val('');
		itemst.val('');
		
	} else {
		return false;
	}
}

function removeitem(itm) {
	requestitems.splice(itm, 1);
	displayrequesteditems();
}

function additem() {
	if (itemtype.val() ==  0 || item.val() == 0) {
		errmsg.empty().append('No item has been selected. Please select a valid item to request/buy.');
		trgerr.trigger('click');
		return false;
	}
	
	if (itemqty.val() == '' || itemqty.val() == undefined || itemqty.val() == 0 || isNaN(itemqty.val())) {
		errmsg.empty().append('Invalid item quantity. Please enter a valid quantity.');
		trgerr.trigger('click');
		return false;
	}
	srcform = 'add_request_item';
	conmsg.empty().append('Confirm adding item for request?');
	trgcon.trigger('click');
}

function cancel_request_items() {
	srcform = 'cancel_request_item';
	conmsg.empty().append('Cancel Item request?');
	trgcon.trigger('click');
}

function presave_items() {
	srcform = 'save_request_item';
	conmsg.empty().append('Confirm saving of items to request?');
	trgcon.trigger('click');
	
}

function save_request_items(d) {
	$.ajax({
		url: wwwnavi + 'ca/requestitems',
		type: 'post',
		data: {pdata:d},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == false) {
				errmsg.empty().append('Error saving items for request. Please contact your system provider for support.');
				trgerr.trigger('click');
			}
			else {
				itemtype.val(0);
				item.empty();
				itemqty.val('');
				itemprice.val('');
				itemst.val('');
				itemlist.empty();
				itmtotal.empty().append('0.00');
				requestitems = [];
				$('#crequestitem').trigger('click');
				infmsg.empty().append('Item request have been saved. Please settle payment to the cashier.');
				trginf.trigger('click');
			}
			
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(resdata){
			console.log('Done processing data.' + resdata);
		}
	});
}

function displayitemtypes() {
	$.ajax({
		url: wwwnavi + 'ca/itemtypes',
		type: 'get',
		success: function(r){
			var obj = JSON.parse(r);
			itemtype.empty().append('<option value="0">- Select an Item Type -</option>');
			for(i = 0; i < obj.length; i++){
				itemtype.append('<option value="' + obj[i]['itid'] + '">' + obj[i]['itdesc'] + '</option>');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(resdata){
			console.log('Done processing data.' + resdata);
		}
	});
}

function displayitems(itype) {
	$.ajax({
		url: wwwnavi + 'ca/items',
		type: 'get',
		data: {pdata:itype},
		success: function(r){
			iteminfo = r;
			var obj = JSON.parse(r);
			item.empty().append('<option value="0">- Select an Item -</option>');
			for(i = 0; i < obj.length; i++){
				item.append('<option value="' + obj[i]['iid'] + '">' + obj[i]['idesc'] + '</option>');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(resdata){
			console.log('Done processing data.' + resdata);
		}
	});
}

function prebarcode_issuance(bid, bti, bcq) {
	selbkid = bid;
	bctotal.val(bti);
	bcscan.val(bcq);
	bcremain.val(parseInt(bti) - parseInt(bcscan.val()));
}

function scanned_barcodes(bc) {
	if (bc.length > 0) {
		bcwlist.empty();
		for(i = 0; i < bc.length; i++){
			var el = '<tr>' + 
						'<td class="col-sm-6">' + bc[i]['bcode'] + '</td>' +
						'<!--/'+
						'<td class="col-sm-1">' +
							'<span class="fa-stack">' +
								'<i class="fa fa-square-o fa-stack-2x"></i>' +
								'<i class="fa fa-caret-down fa-stack-1x"></i>' +
							'</span>' +
						'</td>' +
						'/-->'+
					'</tr>';
			bcwlist.append(el);
		}
	}
}

function cancel_barcode_issuance() {
	srcform = 'cancel_wb_issuance';
	conmsg.empty().append('Are you sure you want to cancel wristband/passes issuance?');
	trgcon.trigger('click');
}

function presave_issuance() {
	if (scannedbcodes.length == 0) {
		errmsg.empty().append('Unable to continue issuance of passes/wristbands due to no wristband/passes codes have not been scanned into the system.');
		trgerr.trigger('click');	
	} else if (bcremain.val() > 0) {
		errmsg.empty().append('Unable to continue issuance of passes/wristbands due to not all wristband/passes codes have been scanned into the system.');
		trgerr.trigger('click');
	}
	else {
		srcform = 'save_wb_issuance';
		conmsg.empty().append('Continue wristband/passes issuance?');
		trgcon.trigger('click');		
	}
}

function register_passes(d) {
	$.ajax({
		url: wwwnavi + 'ca/issueresortpasses',
		type: 'post',
		data: {pdata:d},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == true) {
				infmsg.empty().append('Wrisbands/passes have been logged. Guest must wear the pass before entering the resort.');
				trginf.trigger('click');
				wbtotal.empty().append('0');
				bcwlist.empty();
				bctoscan.removeAttr('disabled');
				$('#cbarcode').trigger('click');
				loadactivebookings();
				scannedbcodes = [];
			} else {
				errmsg.empty().append('Problem occured while logging/registering passes on the server. Please contact your system provider for support.');
				trgerr.trigger('click');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(resdata){
			console.log('Done processing data.' + resdata);
		}
	});
}

function reset_inquiry() {
	$('#resinqdt').val('');
	$('#res_acctype').val(0);
	$('#res_time').val(0);
	$('#inqlist').empty();
}

function display_inqresult() {
	$.ajax({
		url: wwwnavi + 'ca/login',
		type: 'get',
		data: {pdata:{'lid':uid.val(),'lpw':upw.val()}},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == true) {
				//infmsg.empty().append(obj.mesg);
				//trginf.trigger('click');
				location.reload();
			} else {
				errmsg.empty().append(obj.mesg);
				trgerr.trigger('click');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});
}


/* Occular Requests */
function get_occular_requests() {
	var el = $('#occularlist');
	$.ajax({
		url: wwwnavi + 'ca/occular',
		type: 'get',
		success: function(r){
			var obj = JSON.parse(r);
			el.empty();
			for(i = 0; i < obj.length; i++){
				el.append('<tr>' +
								'<td class="col-sm-3" style="text-align: left;">' + obj[i]['gname'] + '</td>' +
								'<td class="col-sm-6" style="text-align: left;">jdc@email.example.com/1234567/123456789011</td>' +
								'<td class="col-sm-1" style="text-align: left;">5</td>' +
								'<td class="col-sm-2" style="text-align: left;">2017-Mar-31 03:00 PM</td>' +
								'<td class="col-sm-1">' +
									'<a href="#" style="text-decoration:none; color:black;" onclick="javascript:tag_occular_done(' + obj[i]['id'] + ');">' +
										'<span class="fa-stack" data-toggle="tooltip" title="Occular Complete">' +
											'<i class="fa fa-square-o fa-stack-2x"></i>' +
											'<i class="fa fa-thumbs-o-up fa-stack-1x"></i>' +
										'</span>' +													
									'</a>' +
								'</td>' +
								'<td class="col-sm-1">' +
									'<a href="#" style="text-decoration:none; color:black;" onclick="javascript:tag_occular_cancelled(' + obj[i]['id'] + ');">' +
										'<span class="fa-stack" data-toggle="tooltip" title="Occular Complete">' +
											'<i class="fa fa-square-o fa-stack-2x"></i>' +
											'<i class="fa fa-times fa-stack-1x"></i>' +
										'</span>' +													
									'</a>' +
								'</td>' +
							'</tr>');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});
}

function save_occular_request(d) {
	$.ajax({
		url: wwwnavi + 'ca/regoccular',
		type: 'post',
		data: {pdata:d},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == true) {
				//infmsg.empty().append(obj.mesg);
				//trginf.trigger('click');
				location.reload();
			} else {
				errmsg.empty().append(obj.mesg);
				trgerr.trigger('click');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});
}

function tag_occular_done(oid) {
	$.ajax({
		url: wwwnavi + 'ca/regoccular',
		type: 'post',
		data: {pdata:d},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == true) {
				//infmsg.empty().append(obj.mesg);
				//trginf.trigger('click');
				location.reload();
			} else {
				errmsg.empty().append(obj.mesg);
				trgerr.trigger('click');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});
}

function tag_occular_cancelled(oid) {
	$.ajax({
		url: wwwnavi + 'ca/regoccular',
		type: 'post',
		data: {pdata:d},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == true) {
				//infmsg.empty().append(obj.mesg);
				//trginf.trigger('click');
				location.reload();
			} else {
				errmsg.empty().append(obj.mesg);
				trgerr.trigger('click');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});
}



function auth_user() {
	if (uid.val().length == 0 || uid.val() == undefined) {
		errmsg.empty().append('You must supply a valid account to log into the system. Please try again.');
		trgerr.trigger('click');
		return false;
	}
	
	if (upw.val().length == 0 || upw.val() == undefined) {
		errmsg.empty().append('You must supply a valid password to log into the system. Please try again.');
		trgerr.trigger('click');
		return false;
	}
	
	$.ajax({
		url: wwwnavi + 'ca/login',
		type: 'get',
		data: {pdata:{'lid':uid.val(),'lpw':upw.val()}},
		success: function(r){
			var obj = JSON.parse(r);
			if (obj.flag == true) {
				//infmsg.empty().append(obj.mesg);
				//trginf.trigger('click');
				location.reload();
			} else {
				errmsg.empty().append(obj.mesg);
				trgerr.trigger('click');
			}
		},
		fail: function(jqXHR, textStatus){
			errmsg.empty().append('Request failed : ' + textStatus);
			trgerr.trigger('click');
		},
		done: function(r){
			console.log('Done processing data.' + r);
		}
	});
}

function signoff() {
	window.location.assign(wwwnavi + 'ca/logout');
}
	
