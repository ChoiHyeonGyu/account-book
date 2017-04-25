$(function(){
	
	var myBtnform = $( "#listadd" ).dialog({
		autoOpen: false,
		height: 230,
		width: 265,
		modal: true,
		buttons: {
			"확인": function() {
				//$( "#dialog-upload-form form" ).submit();
				$("#commit").submit();
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
});