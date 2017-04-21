$(function(){
	var isOverlap = false;
	var word = "";
	
	var loginform = $( "#loginform" ).dialog({
		autoOpen: false,
		height: 230,
		width: 265,
		modal: true,
		buttons: {
			"로그인": function() {
				//$( "#dialog-upload-form form" ).submit();
				$( this ).dialog( "close" );
			},
			"ID/Password 찾기" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
				
		}
	});
	
	var joinform = $( "#joinform" ).dialog({
		autoOpen: false,
		height: 930,
		width: 600,
		modal: true,
	
		close: function() {
				
		}
	});
	
	$("#confirm").click(function(){
		var obj = {id:$("#id").val()};
		
		$.ajax( {
		    url : "/account-book/checkid",
		    type: "POST",
		    dataType: "JSON",
		    data: JSON.stringify(obj),
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){
		    	if(response.result == "fail"){
		    		alert("이미 있는 ID입니다.");
			    	return;
			    }
		    	if(response.result == "success"){
		    		alert("사용하실 수 있는 ID입니다.");
		    		isOverlap = true;
			    	return;
			    }
		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       
		    }
		});
	});
	
	$("#joinpost").submit(function(){
		/* 회원 가입 폼 유효성 검증(validation) */
		
		if(isOverlap==false){
			alert("중복을 확인해주세요.");
			$("#id").focus();
			word = $("#id").val();
			return false;
		}
		
		var password = $( "#password" ).val();		
		var passwordConfirm = $( "#passwordConfirm" ).val();
		if( passwordConfirm != password ) {
			alert( "비밀번호가 다릅니다." );
			$( "#passwordConfirm" ).focus();
			return false;
		}
		
		if($("#year option:selected").val() == "Year"){
			alert("생년을 선택하세요.");
			return false;
		} else if($("#month option:selected").val() == "Month") {
			alert("생월을 선택하세요.");
			return false;
		} else if($("#day option:selected").val() == "Day") {
			alert("생일을 선택하세요.");
			return false;
		}
		
		if(String(Number($("#total").val())) == "NaN"){
			alert("숫자로만 입력해주세요.");
			$("#total").focus();
			return false;
		}
		
		if(word.val() != $("#id").val()){
			alert("중복을 확인해주세요.");
			$("#id").focus();
			isOverlap = false;
			return false;
		}
		isOverlap = false;
		return true;
	});
	
	$("#login").click(function(event){
		event.preventDefault();
		loginform.dialog("open");
	});
	
	$("#join").click(function(event){
		event.preventDefault();
		joinform.dialog("open");
	});
});