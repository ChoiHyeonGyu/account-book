var categoryarray = [];
var categoryarray1 = [];
var different = false;
$(function() {
	
	$("#categoryAdd").click(function() {
		$("#categorymodal").modal();
	});
	
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
				"categoryId" : number.target.id/*, "operations":val*/
			};

			$.ajax({
				url : "/account-book/" + currentid + "/categoryModify2",
				type : "POST",
				dataType : "JSON",
				data : JSON.stringify(categoryid),
				contentType : "application/json; charset=UTF-8",
				success : function(response) {
					$("#categoryId").val(response.data.categoryId);
					$("#categoryname").val(response.data.category);
					$("#operations").val(response.data.operations);
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
	}
	
	for (var i = 0; i < categoryarray1.length; i++) {
		var number1 = categoryarray1[i];

		$("#" + categoryarray1[i]).click(function(number1) {
			$("#limitmodifyform").modal();
			var category = {
				"category" : number1.target.id
			};
			$.ajax({
				url : "/account-book/" + currentid + "/limitModify2",
				type : "POST",
				dataType : "JSON",
				data : JSON.stringify(category),
				contentType : "application/json; charset=UTF-8",
				success : function(response) {
					$("#limit").val(response.data.limit);
					$("#category").val(response.data.category);
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
	}
});