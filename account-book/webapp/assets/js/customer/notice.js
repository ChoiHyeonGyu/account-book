var userIdarray = [];
$(document).ready(function() {

	$("#noticeAdd").click(function() {
		var userId = userIdarray[0];
		if (userId == "superjun3") {
			$("#noticeAddform").modal();
		} else {
			alert("접근 권한이 없습니다.");
		}
	});
});
