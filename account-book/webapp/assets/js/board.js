var arrays = [];
var currentid = "";

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
	
	var contentform = $("#contentform").dialog({
		autoOpen: false,
		height: 660,
		width: 500,
		modal: true,
		buttons: {
			"수정하기": function() {
				$( this ).dialog( "close" );
			},
			"삭제하기" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			
		}
	});
	
	$("#boardadd").click(function(){
		boardform.dialog("open");// 보드폼 오픈 어디서 행해지는지.
	});
	
	for(var i=0; i<arrays.length; i++){
		var num = arrays[i];
		$("#"+arrays[i]).click(function(num){
			contentform.dialog("open");
			var obj2 = {"boardid":num.target.id};
			
			$.ajax( {
			    url : "/account-book/"+currentid+"/boardcontent",
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(obj2),
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){
			    	console.log(response);
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
});