var userIdarray = [];
var qnaIdarray = [];
$(document).ready(function() {

	var userId = userIdarray[0];
	if (userId == "admin") {
		$("#qnaAdd").click(function() {
			$("#qnaAddform").modal();
		});
	} else {
		$("#qnaAdd").hide();
	}

	if (userId == "admin") {
		$("#qnaModify").click(function() {
			var userId = userIdarray[0];
			var qi = qnaIdarray[0];
			console.log(qi);
			$("#qnaModifyform").modal();
			var qnaId = {
				"qnaId" : qi
			};
			$.ajax({// 여기서 부터 통신이 시작된다.
				url : "/account-book/" + currentid + "/qnamodify1",// 보낼주소
				type : "POST",
				dataType : "JSON",
				data : JSON.stringify(qnaId),// 제이슨 보낼때 형식, 그리고 내가 원하는 1가지
												// (listid)를 가지고 json방식으로 컨트롤러로
												// 간다,.
				contentType : "application/json; charset=UTF-8",
				success : function(response) {// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에
												// 담겨진다.
					console.log(response);
					$("#qnaTitle").val(response.data.qnaTitle);// 1.리스폰스 정보를
																// 가지고 웹
																// data.list로 간다
																// 아이디를 통해2.웹에
																// 쏘아지는 정보들 !!!!
																// 이건 폼안에쏘아진다.
					$("#qnaContent").val(response.data.qnaContent);// !!! 폼에
																	// 아이디를 만들고
																	// 여기 샵내용물을
																	// 매칭한다 그럼
																	// 정보가 쏘아진다.
					$("#qnaId").val(response.data.qnaId);
				},

			});
		});
	} else {
		$("#qnaModify").hide();
	}

	$("#qnadeletebutton").click(function() {
		var qd = qnaIdarray[0];
		$("#qdeleteId").val(qd)
		$("#qnadeletepost").submit();
	});
});
