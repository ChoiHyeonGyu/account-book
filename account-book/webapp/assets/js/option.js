$(function(){
	
	
	var modifyform = $( "#modifyform" ).dialog({
		autoOpen: false,
		height: 230,
		width: 265,
		modal: true,
		buttons: {
			"수정": function() {
				$("#modifypost").submit();
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			
		}
	});
	
	$("#categorymodify").click(function(event){
		modifyform.dialog("open");
	});
	
});