var arrays = [];
var arrays2 = [];
var obj2 = {};
var obj3 = {};
var cmtnum = 0;
var cmtnum1 = 0;
var cmtuid = 0;
var cmtuid1 = 0;

$(function(){

	$("#boardadd").click(function(){
		$("#boardform").modal();
	});
	
	$("#commentsviewer").click(function(){
		$("#commentform").modal();
		
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
		    			$("#comment1form").modal();
		    			
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
		    			    			
		    			    			window.location.reload();
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
		    			
		    			window.location.reload();
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
		$("#backstory"+arrays[i]).click(function(num){
			$("#contentform").modal();
			obj2 = {"boardid":num.target.title};
			$("#showgp").css('display', 'none');
			
			$.ajax( {
			    url : "/account-book/"+currentid+"/boardcontent",
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(obj2),
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){
			    	$("#contentmonth").text(response.data["0"].month);
			    	if(response.data["0"].defaultcheck == true){
			    		$("#showgp").css('display', 'block');
			    		if(obj3.boardid != num.target.title){
			    			obj3 = {"boardid":num.target.title, "month":response.data["0"].month.replace(".", "/")};
			    			flushtable(obj3);
			    			requiredmonth(obj3);
			    		}
			    	}
			    	$("#contenttitle").text(response.data["0"].title);
			    	$("#contentname").text(response.data["0"].name);
			    	for(var i=0; i<=100; i++){
			    		$("#contentphoto"+i).css('display', 'block');
			    	}
			    	for(var i=0; i<response.data.length; i++){
			    		if(response.data[i].photo.match(".無") == null){
			    			$("#contentphoto"+i).attr('src', path+'/image/'+response.data[i].photo);
			    		}
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
	
	for(var i=0; i<arrays2.length; i++){
		var num = arrays2[i];
		$("#mystory"+arrays2[i]).click(function(num){
			$("#contentform").modal();
			obj2 = {"boardid":num.target.title};
			$("#showgp").css('display', 'none');
			
			$.ajax( {
			    url : "/account-book/"+currentid+"/boardcontent",
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(obj2),
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){
			    	$("#contentmonth").text(response.data["0"].month);
			    	if(response.data["0"].defaultcheck == true){
			    		$("#showgp").css('display', 'block');
			    		if(obj3.boardid != num.target.title){
			    			obj3 = {"boardid":num.target.title, "month":response.data["0"].month.replace(".", "/")};
			    			flushtable(obj3);
			    		}
			    		requiredmonth(response.data["0"].month);
			    	}
			    	$("#contenttitle").text(response.data["0"].title);
			    	$("#contentname").text(response.data["0"].name);
			    	for(var i=0; i<=100; i++){
			    		$("#contentphoto"+i).css('display', 'block');
			    	}
			    	for(var i=0; i<response.data.length; i++){
			    		if(response.data[i].photo.match(".無") == null){
			    			$("#contentphoto"+i).attr('src', path+'/image/'+response.data[i].photo);
			    		}
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
	
	$("#contentsedit").click(function(){
		if(currentid != $("#editId").val()){
			alert("너가 수정을 할 수 있을 것 같아?");
		} else {
			$("#contenteditform").modal();
		}
	});
	
	$("#contentschange").click(function(){
		if(currentid != $("#editId").val()){
			alert("너가 수정을 할 수 있을 것 같아?");
		} else {
			$("#contenteditpost").submit();
		}
	});
	
	$("#contentsdelete").click(function(){
		if(currentid != $("#editId").val()){
			alert("너가 삭제를 할 수 있을 것 같아?");
		} else {
			$("#contentremovepost").submit();
		}
	});
	
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
	
	$("#defaultcheck").click(function(){
		if($("#defaultcheck").val() == "" || $("#defaultcheck").val() == "false"){
			$("#defaultcheck").val(true);
		} else {
			$("#defaultcheck").val(false);
		}
	});
});