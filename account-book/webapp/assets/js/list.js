var listarray = [];// 첫번째 여기로 푸쉬값이 담긴다.

$(function(){
	var myBtnform = $( "#listadd" ).dialog({
		autoOpen: false,
		height: 720,
		width: 600,
		modal: true,
		buttons: {
			
		},
		close: function() {
				
		}
	});
		
/*	var myBtnform1 = $("#modify").dialog({
		autoOpen: false,
		height: 800,
		width: 600,
		modal: false,
		buttons: {
			"확인": function() {
				//$( "#dialog-upload-form form" ).submit();
				$("#modify1").submit();
				$( this ).dialog( "close" );
			},
			"취소" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
				
		}
	});*/
		
	var mm1 = $( "#modify" ).dialog({// div 
		autoOpen: false,
		height: 800,
		width: 600,
		modal: false,
		buttons: {
			"확인": function() {
				//$( "#dialog-upload-form form" ).submit();
				$("#modify11").submit();
				$( this ).dialog( "close" );
			},
			"취소" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
				
		}
	});
	
	
	/*$("#confirm").click(function(){
		var id = $("#id").val();
		$.ajax( {
		    url : "/account-book/checkid?id="+id,
		    type: "GET",
		    dataType: "JSON",
		    data: "",
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){
		    	if(response.result == "fail"){
		    		alert("이미 있는 ID입니다.");
			    	return;
			    }
		    	if(response.result == "success"){
		    		alert("사용하실 수 있는 ID입니다.");
			    	return;
			    }
		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       
		    }
		});
	});
	
	$("#create").click(function(event){
		 회원 가입 폼 유효성 검증(validation) 
		
		var id = $( "#id" ).val();
		if( id == "" ) {
			alert( "아이디가 비어 있습니다." );
			$( "#id" ).focus();
			return;
		}
		
		var password = $( "#password" ).val();
		if( password == "" ) {
			alert( "비밀번호가 비어 있습니다." );
			$( "#password" ).focus();
			return;
		}
		
		var passwordConfirm = $( "#passwordConfirm" ).val();
		if( passwordConfirm != password ) {
			alert( "비밀번호가 다릅니다." );
			$( "#passwordConfirm" ).focus();
			return;
		}
		
		var name = $( "#name" ).val();
		if( name == "" ) {
			alert( "이름이 비어 있습니다." );
			$( "#name" ).focus();
			return;
		}
		
		var total = $( "#total" ).val();
		if( total == "" ) {
			alert( "총액이 비어있습니다." );
			$( "#total" ).focus();
			return;
		}
		joinform.submit();
	});*/
	
	$("#myBtn").click(function(event){
		event.preventDefault();
		myBtnform.dialog("open");
	});
	$("#listvo").click(function(event){
		event.preventDefault();
		console.log("dddddddddd");
		myBtnform1.dialog("open");
	});
	
	for(var i=0; i<listarray.length; i++){// 포문이돌고 num값으로 찍은 푸쉬값이 담긴다.
		var num = listarray[i];
		$("#"+listarray[i]).click(function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
			console.log(num);
			mm1.dialog("open");//여기서 폼을 띄운다,.
			
			var listid = {"listid":num.target.id};// 보내는 데이터 sending to the controller.!!!
			
			$.ajax( {// 여기서 부터 통신이 시작된다.
			    url : "/account-book/"+currentid+"/modify",// 보낼주소
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(listid),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
			    	console.log(response);
			    	$("#listId").val(response.data.listId);//웹에 쏘아지는 정보들 !!!! 이건 폼안에쏘아진다.
			    	$("#listpaid").val(response.data.paid);//!!! 폼에 아이디를 만들고 여기 샵내용물을 매칭한다 그럼 정보가 쏘아진다.
			    	$("#listbank").val(response.data.bank);
			    	$("#listcategory").val(response.data.category);
			    	$("#listoperations").val(response.data.operations);
			    	$("#listmoney").val(response.data.money);
			    	$("#listname").val(response.data.name);
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
});
	