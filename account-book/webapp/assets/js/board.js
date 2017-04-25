var arrays = [];
var currentid = "";
var path = "";

$(function(){
	var boardform = $("#boardform").dialog({
		autoOpen: false,
		height: 660,
		width: 500,
		modal: true,
		buttons: {
			"작성하기": function() {
				$("#boardpost").submit();
				$( this ).dialog( "close" );
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
		height: 850,
		width: 700,
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
		boardform.dialog("open");
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
			    	$("#contentmonth").text(response.data["0"].month);
			    	$("#contenttitle").text(response.data["0"].title);
			    	$("#contentname").text("작성자 : "+response.data["0"].name);
			    	for(var i=0; i<=100; i++){
			    		$("#contentphoto"+i).css('display', 'block');
			    	}
			    	for(var i=0; i<response.data.length; i++){
			    		$("#contentphoto"+i).attr('src', path+'/image/'+response.data[i].photo);
			    	}
			    	for(var i=response.data.length; i<=100; i++){
			    		$("#contentphoto"+i).css('display', 'none');
			    	}
			    	$("#contentcontent").text(response.data["0"].content);
			    	$("#contentday").text(response.data["0"].day);
			    	$("#contentgood").text("추천 : "+response.data["0"].good);
			    	$("#contenthit").text("조회 : "+response.data["0"].hit);
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
});