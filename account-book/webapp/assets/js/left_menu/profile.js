$(function() {
	
	$("#tt").click(function() {
		var profileModify = {};
		$("#editprofile").modal();
		
		$.ajax( {// 여기서 부터 통신이 시작된다.
		    url : "/account-book/"+currentid+"/profileModify",// 보낼주소
		    type: "POST",
		    dataType: "JSON",
		    data: JSON.stringify(profileModify),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
		    	$("#nameModify").val(response.data.name);//1.리스폰스 정보를 가지고 웹 data.list로 간다 아이디를 통해2.웹에 쏘아지는 정보들 !!!! 이건 폼안에쏘아진다.
		    	$("#passwordModify").val(response.data.password);//!!! 폼에 아이디를 만들고 여기 샵내용물을 매칭한다 그럼 정보가 쏘아진다.
		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       
		    }
		});
	});


});
