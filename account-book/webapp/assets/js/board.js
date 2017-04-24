$(function(){
	var boardform = $("#boardform").dialog({
		autoOpen: false,
		height: 230,
		width: 265,
		modal: true,
		buttons: {
			"작성하기": function() {
				$("#loginpost").submit();
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