var arrays = [];
var currentid = "";
var path = "";
var obj2 = {};
var cmtnum = 0;
var cmtnum1 = 0;
var cmtuid = 0;
var cmtuid1 = 0;

$(function(){
	
	var boardform = $("#boardform").dialog({
		autoOpen: false,
		height: 660,
		width: 500,
		modal: true,
		buttons: {
			
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
			"수정": function() {
				if(currentid != $("#editId").val()){
					alert("너가 수정을 할 수 있을 것 같아?");
				} else {
					contenteditform.dialog("open");
				}
				$( this ).dialog( "close" );
			},
			"삭제" : function() {
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
			"수정": function() {
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
	
	var comments1form = $("#comment1form").dialog({
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
		    	for(var i=0; i<=1000; i++){
		    		$("#commentname"+i).css('display', 'block');
		    		$("#commentdate"+i).css('display', 'block');
		    		$("#commentreply"+i).css('display', 'block');
		    		$("#commentdelete"+i).css('display', 'block');
		    		$("#commentcontent"+i).css('display', 'block');
		    		$("#commentffect"+i).css('display', 'block');
		    	}
		    	for(var i=0; i<response.data.length; i++){
		    		$("#commentname"+i).text("작성자 : "+response.data[i].name);
		    		$("#commentdate"+i).text(response.data[i].day);
		    		$("#commentcontent"+i).text(response.data[i].content);
		    		cmtnum = response.data[i].commentId;
		    		cmtuid = response.data[i].id
		    		$("#commentreply"+i).click(function(){
		    			comments1form.dialog("open");
		    			
		    			var obj3 = {"commentid":cmtnum};
		    			
		    			$.ajax( {
		    			    url : "/account-book/"+currentid+"/replylist",
		    			    type: "POST",
		    			    dataType: "JSON",
		    			    data: JSON.stringify(obj3),
		    			    contentType: "application/json; charset=UTF-8",
		    			    success: function( response ){
		    			    	for(var i=0; i<=1000; i++){
		    			    		$("#comment1name"+i).css('display', 'block');
		    			    		$("#comment1date"+i).css('display', 'block');
		    			    		$("#comment1delete"+i).css('display', 'block');
		    			    		$("#comment1content"+i).css('display', 'block');
		    			    		$("#comment1effect"+i).css('display', 'block');
		    			    	}
		    			    	for(var i=0; i<response.data.length; i++){
		    			    		$("#comment1name"+i).text("작성자 : "+response.data[i].name);
		    			    		$("#comment1date"+i).text(response.data[i].day);
		    			    		$("#comment1content"+i).text(response.data[i].content);
		    			    		cmtnum1 = response.data[i].commentId;
		    			    		cmtuid1 = response.data[i].id
		    			    		$("#comment1delete"+i).click(function(){
		    			    			var obj4 = {"commentid":cmtnum1, "id":cmtuid1};
		    			    			
		    			    			$.ajax( {
		    			    			    url : "/account-book/"+currentid+"/commentremove",
		    			    			    type: "POST",
		    			    			    dataType: "JSON",
		    			    			    data: JSON.stringify(obj4),
		    			    			    contentType: "application/json; charset=UTF-8",
		    			    			    success: function( response ){
		    			    			    	if(response.result == "fail"){
		    			    			    		alert("너가 삭제할 수 있을 것 같아?");
		    			    			    	}
		    			    			    },
		    			    			    error: function( XHR, status, error ){
		    			    			       console.error( status + " : " + error );	       
		    			    			    }
		    			    			});
		    			    			
		    			    			comments1form.dialog("close");
		    			    		});
		    			    	}
		    			    	if(response.data.length == 0){
		    			    		for(var i=0; i<=1000; i++){
		    			    			$("#comment1name"+i).css('display', 'none');
		    				    		$("#comment1date"+i).css('display', 'none');
		    				    		$("#comment1delete"+i).css('display', 'none');
		    				    		$("#comment1content"+i).css('display', 'none');
		    				    		$("#comment1effect"+i).css('display', 'none');
		    				    	}
		    			    	} else {
		    			    		for(var i=response.data.length; i<=1000; i++){
		    			    			$("#comment1name"+i).css('display', 'none');
		    				    		$("#comment1date"+i).css('display', 'none');
		    				    		$("#comment1delete"+i).css('display', 'none');
		    				    		$("#comment1content"+i).css('display', 'none');
		    				    		$("#comment1effect"+i).css('display', 'none');
		    				    	}
		    			    	}
		    			    	$("#commentId").val(cmtnum);
		    			    },
		    			    error: function( XHR, status, error ){
		    			       console.error( status + " : " + error );	       
		    			    }
		    			});
		    		});
		    		$("#commentdelete"+i).click(function(){
		    			var obj4 = {"commentid":cmtnum, "id":cmtuid};
		    			
		    			$.ajax( {
		    			    url : "/account-book/"+currentid+"/commentremove",
		    			    type: "POST",
		    			    dataType: "JSON",
		    			    data: JSON.stringify(obj4),
		    			    contentType: "application/json; charset=UTF-8",
		    			    success: function( response ){
		    			    	if(response.result == "fail"){
		    			    		alert("너가 삭제할 수 있을 것 같아?");
		    			    	}
		    			    },
		    			    error: function( XHR, status, error ){
		    			       console.error( status + " : " + error );	       
		    			    }
		    			});
		    			
		    			commentsform.dialog("close");
		    		});
		    	}
		    	if(response.data.length == 0){
		    		for(var i=0; i<=1000; i++){
		    			$("#commentname"+i).css('display', 'none');
			    		$("#commentdate"+i).css('display', 'none');
			    		$("#commentreply"+i).css('display', 'none');
			    		$("#commentdelete"+i).css('display', 'none');
			    		$("#commentcontent"+i).css('display', 'none');
			    		$("#commenteffect"+i).css('display', 'none');
			    	}
		    	} else {
		    		for(var i=response.data.length; i<=1000; i++){
		    			$("#commentname"+i).css('display', 'none');
			    		$("#commentdate"+i).css('display', 'none');
			    		$("#commentreply"+i).css('display', 'none');
			    		$("#commentdelete"+i).css('display', 'none');
			    		$("#commentcontent"+i).css('display', 'none');
			    		$("#commenteffect"+i).css('display', 'none');
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
			    	
			    	$("#comment1Name").val(response.data["0"].name);
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
	
	$("#good").click(function(){		
		$.ajax( {
		    url : "/account-book/"+currentid+"/good",
		    type: "POST",
		    dataType: "JSON",
		    data: JSON.stringify(obj2),
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){
		    	if(response.result == "fail"){
		    		alert("이미 추천을 하셨습니다.");
		    	} else {
		    		alert("이 게시글이 추천되었습니다.");
		    	}
		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       
		    }
		});
	});
});