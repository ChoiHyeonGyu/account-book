$(function(){
	var boardform = $("#boardform").dialog({
		autoOpen: false,
		height: 660,
		width: 500,
		modal: true,
		buttons: {
			"작성하기": function() {
				$("#boardpost").submit();
				$( this ).dialog( "close" );//close 의미 dialog 의미."작성하기 의미"
			},
			"취소" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			
		}
	});
	
	$("#boardadd").click(function(){
		boardform.dialog("open");// 보드폼 오픈 어디서 행해지는지.
	});
});