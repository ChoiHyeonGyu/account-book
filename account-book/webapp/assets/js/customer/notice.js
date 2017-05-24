var userId;
$(document).ready(function() {

	$("#noticeAdd").click(function() {
		var id = userId;
		if (id == "superjun3") {
			$("#noticeAddform").modal();
		} else {
			alert("권한이 없습니다.");
		}
	});
});
