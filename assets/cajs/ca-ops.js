$(function(){
	// Reservation
	$.support.transition = true;
	$('#rEventDate').datetimepicker({format:'DD-MMM-YYYY'});
	$('#rEventTimeStart').datetimepicker({format:'hh:mm A'});
	$('#rEventTimeEnd').datetimepicker({format:'hh:mm A'});	
	
	
	// Booking
	var restype 	= $('#selrestype'),
		resno		= $('#reserveid'),
		roomtype	= $('#selroomtype'),
		rooms		= $('#selrooms'),
		isovn		= $('#isovn'),
		roomrate	= $('#roomrate'),
		roomcap		= $('#roomcap'),
		roomdur		= $('#roomdur'),
		childcnt	= $('#childguest'),
		adultcnt	= $('#adultguest'),
		regbooking	= $('#regbooking');
	
	$('[data-toggle="tooltip"]').tooltip();
	resno.hide();
	//console.log('JQuery has been initialised.');
	//auth_user();
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
	
	regbooking.on('click', function(){
		console.log('Booking registered.');	
	});
	
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
	
});

