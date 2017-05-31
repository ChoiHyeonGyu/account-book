$(function() {
	

	$("#tt").click(function() {
		$("#editprofile").modal();
	});

	$("#graph1").click(function() {
		$("#viewgraph1").modal();
	});

	$("#showoptions").click(function() {
		$("#viewoptions").modal();
	});

	$("#tt").click(function(event) {
		event.preventDefault();
		console.log("dddddddddd");
		myBtnform1.dialog("open");
	});

});
