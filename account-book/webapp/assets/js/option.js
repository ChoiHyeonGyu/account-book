var categoryarray = [];

$(function() {
	var modifyform = $("#modifyform").dialog({
		autoOpen : false,
		height : 150,
		width : 265,
		modal : true,
	
		close : function() {

		}
	});

	for (var i = 0; i < categoryarray.length; i++) {
		var number = categoryarray[i];

		$("#"+categoryarray[i]).click(function(number) {
			modifyform.dialog("open");
		});
	}
});