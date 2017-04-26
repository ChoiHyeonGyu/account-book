var arrays = [];
var currentid = "";
var path = "";
var obj2 = {};

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
				if(currentid != $("#editId").val()){
					alert("너가 수정을 할 수 있을 것 같아?");
				} else {
					contenteditform.dialog("open");
				}
				$( this ).dialog( "close" );
			},
			"삭제하기" : function() {
				if(currentid != $("#editId").val()){
					alert("너가 삭제를 할 수 있을 것 같아?");
				} else {
					$("#contentremovepost").submit();
				}
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			
		}
	});
	
	var contenteditform = $("#contenteditform").dialog({
		autoOpen: false,
		height: 660,
		width: 500,
		modal: true,
		buttons: {
			"수정하기": function() {
				$("#contenteditpost").submit();
				$( this ).dialog( "close" );
			},
			"취소" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			
		}
	});
	
	var commentsform = $("#commentform").dialog({
		autoOpen: false,
		height: 660,
		width: 500,
		modal: true,
		buttons: {
		},
		close: function() {
			
		}
	});
	
	$("#boardadd").click(function(){
		boardform.dialog("open");
	});
	
	$("#commentsviewer").click(function(){
		commentsform.dialog("open");
		
		$.ajax( {
		    url : "/account-book/"+currentid+"/commentlist",
		    type: "POST",
		    dataType: "JSON",
		    data: JSON.stringify(obj2),
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){
		    	console.log(response);
		    	for(var i=0; i<=1000; i++){
		    		$("#commentname"+i).css('display', 'block');
		    		$("#commentdate"+i).css('display', 'block');
		    		$("#commentreply"+i).css('display', 'block');
		    		$("#commentdelete"+i).css('display', 'block');
		    		$("#commentcontent"+i).css('display', 'block');
		    		$("#commneteffect"+i).css('display', 'block');
		    	}
		    	for(var i=0; i<response.data.length; i++){
		    		$("#commentname"+i).text("작성자 : "+response.data[i].name);
		    		$("#commentdate"+i).text(response.data[i].day);
		    		$("#commentcontent"+i).text(response.data[i].content);
		    	}
		    	if(response.data.length == 0){
		    		for(var i=0; i<=1000; i++){
		    			$("#commentname"+i).css('display', 'none');
			    		$("#commentdate"+i).css('display', 'none');
			    		$("#commentreply"+i).css('display', 'none');
			    		$("#commentdelete"+i).css('display', 'none');
			    		$("#commentcontent"+i).css('display', 'none');
			    		$("#commneteffect"+i).css('display', 'none');
			    	}
		    	} else {
		    		for(var i=response.data.length; i<=1000; i++){
		    			$("#commentname"+i).css('display', 'none');
			    		$("#commentdate"+i).css('display', 'none');
			    		$("#commentreply"+i).css('display', 'none');
			    		$("#commentdelete"+i).css('display', 'none');
			    		$("#commentcontent"+i).css('display', 'none');
			    		$("#commneteffect"+i).css('display', 'none');
			    	}
		    	}
		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       
		    }
		});
	});
	
	for(var i=0; i<arrays.length; i++){
		var num = arrays[i];
		$("#"+arrays[i]).click(function(num){
			contentform.dialog("open");
			obj2 = {"boardid":num.target.id};
			
			$.ajax( {
			    url : "/account-book/"+currentid+"/boardcontent",
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(obj2),
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){
			    	$("#contentmonth").text(response.data["0"].month);
			    	$("#contenttitle").text(response.data["0"].title);
			    	$("#contentname").text("작성자 : "+response.data["0"].name);
			    	for(var i=0; i<=100; i++){
			    		$("#contentphoto"+i).css('display', 'block');
			    	}
			    	for(var i=0; i<response.data.length; i++){
			    		$("#contentphoto"+i).attr('src', path+'/image/'+response.data[i].photo);
			    	}
			    	if(response.data[0].photo.indexOf('無',0) != -1){
			    		for(var i=0; i<=100; i++){
				    		$("#contentphoto"+i).css('display', 'none');
				    	}
			    	} else {
			    		for(var i=response.data.length; i<=100; i++){
				    		$("#contentphoto"+i).css('display', 'none');
				    	}
			    	}
			    	$("#contentcontent").text(response.data["0"].content);
			    	$("#contentday").text(response.data["0"].day);
			    	$("#contentgood").text("추천 : "+response.data["0"].good);
			    	$("#contenthit").text("조회 : "+response.data["0"].hit);
			    	
			    	$("#editboardId").val(response.data["0"].boardId);
			    	$("#editId").val(response.data["0"].id);
			    	$("#editmonth option:selected").text(response.data["0"].month);
			    	$("#edittitle").val(response.data["0"].title);
			    	$("#editcontent").text(response.data["0"].content);
			    	
			    	$("#removeboardId").val(response.data["0"].boardId);
			    	$("#removeId").val(response.data["0"].id);
			    	
			    	$("#commentboardId").val(response.data["0"].boardId);
			    	$("#commentName").val(response.data["0"].name);
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
});