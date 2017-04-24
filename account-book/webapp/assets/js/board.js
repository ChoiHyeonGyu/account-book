$(function(){
	var boardform = $("#boardform").dialog({
		autoOpen: false,
		height: 660,
		width: 500,
		modal: true,
		buttons: {
			"작성하기": function() {
				$( this ).dialog( "close" );
			},
			"취소" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			
		}
	});
	
	$("#boardadd").click(function(){
		boardform.dialog("open");
	});
});