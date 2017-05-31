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
	
	$("#showoptions").click(function() {
			$("#viewoptions").modal();
	});

	$("#tt").click(function(event){
		event.preventDefault();
		console.log("dddddddddd");
		myBtnform1.dialog("open");
	});
	
	
});
