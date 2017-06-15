var noticeIdarray = [];
$(document).ready(function() {
	for(var i=0; i<5; i++){
		$("#"+noticeIdarray[i]+"n").click(function(i){
			$("#"+i.target.id.replace('n', 'form')).submit();
		});
	}
});
