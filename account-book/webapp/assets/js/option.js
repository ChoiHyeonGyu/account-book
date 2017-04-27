var categoryarray = [];

$(function() {
	var modifyform = $("#modifyform").dialog({
		autoOpen : false,
		height : 150,
		width : 265,
		modal : true,
		
		close: function() {
			
		}
	});

	for (var i = 0; i < categoryarray.length; i++) {
		var number = categoryarray[i];

		$("#"+categoryarray[i]).click(function(number) {
			modifyform.dialog("open");
			var cat = {"categoryId":number.target.id};
			
			$.ajax( {
			    url : "/account-book/"+currentid+"/categoryModify",
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(cat),
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
});