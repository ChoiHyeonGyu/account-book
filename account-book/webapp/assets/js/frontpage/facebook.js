var obj = null;

function checkLoginState() {
	
	FB.getLoginStatus(function(response) {
		
		if (response.status === 'connected') {
			FB.api('/me?fields=id,email,name,gender,birthday,age_range', function(response) {
				obj = response;
				document.getElementById('fbhidden').click();
			});
	    }
		
		FB.logout(function(response) {
			
		});
	});
	
	$(function(){
		
		$("#fbhidden").click(function(){
			
			if(obj!=null){
				
				$.ajax( {
				    url : "/account-book/fbjoin",
				    type: "POST",
				    dataType: "JSON",
				    data: JSON.stringify(obj),
				    contentType: "application/json; charset=UTF-8",
				    success: function( response ){
				    	$("#fbhidden").val(response.data);
				    	$("#fbpost").submit();
				    },
				    error: function( XHR, status, error ){
				       console.error( status + " : " + error );	       
				    }
				});
				obj = null;
			}
		});
	});
}

window.fbAsyncInit = function() {
	FB.init({
		appId : 326151361133966,
		xfbml : true,
		version : 'v2.8'
	});
	FB.AppEvents.logPageView();
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=326151361133966";	
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));