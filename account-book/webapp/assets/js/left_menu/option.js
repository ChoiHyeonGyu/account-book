var categoryarray = [];
var different = false;
$(function() {
	
	
	$("#limitmodify").submit(function(){
		
		if(String(Number($("#limit").val())) == "NaN"){
			alert("숫자로만 입력해주세요.");
			$("#limit").focus();
			return false;
		}
		
	});
	
	for (var i = 0; i < categoryarray.length; i++) {
		var number = categoryarray[i];

		$("#" + categoryarray[i]).click(function(number) {
			$("#modifyform").modal();
			var categoryid = {
				"categoryId" : number.target.id
			};

			$.ajax({
				url : "/account-book/" + currentid + "/categoryModify",
				type : "POST",
				dataType : "JSON",
				data : JSON.stringify(categoryid),
				contentType : "application/json; charset=UTF-8",
				success : function(response) {
					console.log(response);
					$("#categoryId").val(response.data.categoryId);
					$("#categoryname").val(response.data.category);
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
	}
});