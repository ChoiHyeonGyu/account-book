$(function(){
	
	var loginform = $( "#loginform" ).dialog({
		autoOpen: false,
		height: 280,
		width: 300,
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
		height: 280,
		width: 300,
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
	
	$("#login").click(function(event){
		event.preventDefault();
		loginform.dialog("open");
	});
	
	$("#join").click(function(event){
		event.preventDefault();
		joinform.dialog("open");
	});
});