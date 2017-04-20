function checkLoginState() {
	
	FB.getLoginStatus(function(response) {
		console.log(response);
		
		if (response.status === 'connected') {
			
			FB.api('/me', function(response) {
				console.log(JSON.stringify(response));
			});
			
	    }
	});
	
	FB.logout(function(response) {
		
	});
}

window.fbAsyncInit = function() {
	FB.init({
		appId : 287459421697705,
		xfbml : true,
		version : 'v2.9'
	});
	FB.AppEvents.logPageView();
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=287459421697705";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));