$(function(){
	var isOverlap = false;
	var word = "";
	
	$("#modify").click(function(event){
		event.preventDefault();
		modifyform.dialog("open");
	});
	
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
	
});