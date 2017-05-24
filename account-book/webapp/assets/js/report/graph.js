$(function() {
	$("#im").click(function(){
		console.log("들어오냐?2");
		$("#import").css("display", "block");
		$("#export").css("display", "none");
	});
	$("#ex").click(function(){
		console.log("들어오냐?");
		$("#import").css("display", "none");
		$("#export").css("display", "block");
	});
});