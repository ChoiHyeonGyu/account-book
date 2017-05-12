

$(function(){
	var myBtnform1 = $("#listadd1").dialog({
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

	$("#tt").click(function(event){
		event.preventDefault();
		console.log("dddddddddd");
		myBtnform1.dialog("open");
	});
});
