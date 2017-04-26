var categoryarray = [];

$(function() {
	var modifyform = $("#modifyform").dialog({
		autoOpen : false,
		height : 160,
		width : 265,
		modal : true,
		buttons : {
			"수정" : function() {
				$("#modifypost").submit();
				$(this).dialog("close");
			}
		},
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