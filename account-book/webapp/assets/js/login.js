$(function(){
	
	var loginform = $( "#loginform" ).dialog({
		autoOpen: false,
		height: 230,
		width: 265,
		modal: true,
		buttons: {
			"로그인": function() {
				//$( "#dialog-upload-form form" ).submit();
				$( this ).dialog( "close" );
			},
			"ID/Password 찾기" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
				
		}
	});
	
	var joinform = $( "#joinform" ).dialog({
		autoOpen: false,
		height: 930,
		width: 600,
		modal: true,
		buttons: {
			"생성하기": function() {
				//$( "#dialog-upload-form form" ).submit();
				$( this ).dialog( "close" );
			},
		},
		close: function() {
				
		}
	});
	
	$("#create").click(function(event){
			joinform.submit();
	});
	
	$("#login").click(function(event){
		event.preventDefault();
		loginform.dialog("open");
	});
	
	$("#join").click(function(event){
		event.preventDefault();
		joinform.dialog("open");
	});
});