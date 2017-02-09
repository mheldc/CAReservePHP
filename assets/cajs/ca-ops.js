$(function(){
	$('[data-toggle="tooltip"]').tooltip();
	//console.log('JQuery has been initialised.');
	//auth_user();
});

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