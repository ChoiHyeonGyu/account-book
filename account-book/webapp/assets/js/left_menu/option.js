var categoryarray = [];
var different = false;
$(function() {
	var modifyform = $("#modifyform1").dialog({
		autoOpen : false,
		height : 150,
		width : 265,
		modal : true,
		buttons : {
			"확인" : function() {
				//$( "#dialog-upload-form form" ).submit();
				$("#modifypost").submit();
				$(this).dialog("close");
			},
			"취소" : function() {
				$(this).dialog("close");
			}
		},

		close : function() {

		}
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
			modifyform.dialog("open");
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