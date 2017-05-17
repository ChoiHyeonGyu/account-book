$(function(){
	var myBtnform1 = $("#editprofile").dialog({
		autoOpen: false,
		height: 800,
		width: 600,
		modal: true,
		buttons: {
			"확인": function() {
				//$( "#dialog-upload-form form" ).submit();
				$("#commit1	").submit();
				$( this ).dialog( "close" );
			},
			"취소" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
				
		}
	});
	
	var optionsform = $("#viewoptions").dialog({
		autoOpen: false,
		height: 860,
		width: 790,
		modal: true,
		title: "설정",
		buttons: {

		},
		close: function() {
				
		}
	});

	$("#tt").click(function(event){
		event.preventDefault();
		console.log("dddddddddd");
		myBtnform1.dialog("open");
	});
	
	$("#showoptions").click(function(event){
		event.preventDefault();
		optionsform.dialog("open");
	});
});
