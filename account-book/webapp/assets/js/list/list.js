var listarray = [];// 첫번째 여기로 푸쉬값이 담긴다.

$(function(){
	var myBtnform = $( "#listadd" ).dialog({
		autoOpen: false,
		height: 720,
		width: 600,
		modal: true,
		buttons: {
			
		},
		close: function() {
				 
		}
	});
		

	$( "#datepicker" ).datepicker({
			dateFormat: 'yymmdd',
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			changeMonth: true,
			changeYear:true,
			showMonthAfterYear:true
		});
	
	
/*	var myBtnform1 = $("#modify").dialog({
		autoOpen: false,
		height: 800,
		width: 600,
		modal: false,
		buttons: {
			"확인": function() {
				//$( "#dialog-upload-form form" ).submit();
				$("#modify1").submit();
				$( this ).dialog( "close" );
			},
			"취소" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
				
		}
	});*/
		
	var mm1 = $( "#modify" ).dialog({// div 
		autoOpen: false,
		height: 800,
		width: 600,
		modal: false,
		buttons: {
			"확인": function() {
				//$( "#dialog-upload-form form" ).submit();
				$("#modify11").submit();
				$( this ).dialog( "close" );
			},
			"취소" : function() {
				$( this ).dialog( "close" );
			}
			
		},
		close: function() {
				
		}
	});
	
	
	/*$("#confirm").click(function(){
		var id = $("#id").val();
		$.ajax( {
		    url : "/account-book/checkid?id="+id,
		    type: "GET",
		    dataType: "JSON",
		    data: "",
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){
		    	if(response.result == "fail"){
		    		alert("이미 있는 ID입니다.");
			    	return;
			    }
		    	if(response.result == "success"){
		    		alert("사용하실 수 있는 ID입니다.");
			    	return;
			    }
		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       
		    }
		});
	});
	
	$("#create").click(function(event){
		 회원 가입 폼 유효성 검증(validation) 
		
		var id = $( "#id" ).val();
		if( id == "" ) {
			alert( "아이디가 비어 있습니다." );
			$( "#id" ).focus();
			return;
		}
		
		var password = $( "#password" ).val();
		if( password == "" ) {
			alert( "비밀번호가 비어 있습니다." );
			$( "#password" ).focus();
			return;
		}
		
		var passwordConfirm = $( "#passwordConfirm" ).val();
		if( passwordConfirm != password ) {
			alert( "비밀번호가 다릅니다." );
			$( "#passwordConfirm" ).focus();
			return;
		}
		
		var name = $( "#name" ).val();
		if( name == "" ) {
			alert( "이름이 비어 있습니다." );
			$( "#name" ).focus();
			return;
		}
		
		var total = $( "#total" ).val();
		if( total == "" ) {
			alert( "총액이 비어있습니다." );
			$( "#total" ).focus();
			return;
		}
		joinform.submit();
	});*/
	
	$("#myBtn").click(function(event){
		event.preventDefault();
		myBtnform.dialog("open");
	});
	/*$("#listvo").click(function(event){
		event.preventDefault();
		console.log("dddddddddd");
		myBtnform1.dialog("open");
	});*/
	
	/*$("#commit").submit(function(){
		if(String(Number($("#money").val())) == "NaN"){
			alert("숫자로만 입력해주세요.");
			$("#money").focus();
			return false;
		}
	});*/
	
	/*for(var i=0; i<listarray.length; i++){// 포문이돌고 num값으로 찍은 푸쉬값이 담긴다.
		var num = listarray[i];
		$("#"+listarray[i]).click(function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
			console.log(num);
			
			mm1.dialog("open");//여기서 폼을 띄운다,.
			
			var listid = {"listid":num.target.id};// 보내는 데이터 , 컨트롤러 보내기전 정보  packing sending to the controller.!!!
			
			$.ajax( {// 여기서 부터 통신이 시작된다.
			    url : "/account-book/"+currentid+"/modify",// 보낼주소
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(listid),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
			    	console.log(response);
			    	$("#listId").val(response.data.listId);//1.리스폰스 정보를 가지고 웹 data.list로 간다 아이디를 통해2.웹에 쏘아지는 정보들 !!!! 이건 폼안에쏘아진다.
			    	$("#listpaid").val(response.data.paid);//!!! 폼에 아이디를 만들고 여기 샵내용물을 매칭한다 그럼 정보가 쏘아진다.
			    	$("#listbank").val(response.data.bank);
			    	$("#listcategory").val(response.data.category);
			    	$("#listoperations").val(response.data.operations);
			    	$("#listmoney").val(response.data.money);
			    	$("#listname").val(response.data.name);
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}*/
});

var formap = function(_listarray){
	var mapform = $("#map_ma").dialog({
		autoOpen: false,
		height: 600,
		width: 700,
		modal: true,
		title: "맵",
		buttons: {
			
		},
		close: function() {
				 
		}
	});
	
	for(var i=0; i<_listarray.length; i++){
		var num = _listarray[i];
		$("#maps"+num).click(function(num){
			mapform.dialog("open");
			var lid = {"lid":num.target.id};
			$.ajax( {
			    url : "/account-book/"+currentid+"/maps",
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(lid),
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){
			    	console.log(response);
			    	// var myLatlng = new google.maps.LatLng(35.837143, 128.558612); 위치값 위도 경도
			    	var Y_point = response.data.locationY; // Y 좌표
			    	var X_point = response.data.locationX; // X 좌표
			    	var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
			    	var markerTitle = "사용한 위치"; // 현재 위치 마커에 마우스를 오버올 때 나타나는 정보
			    	var markerMaxWidth = 300; // 마커를 클릭했을 때 나타나는 말풍선의 최대 크기
			    	
			    	// 말풍선 내용
			    	var contentString = '<div>'+'<h2>'+response.data.category+'</h2>'+'<p>'+response.data.name+'&emsp;'+response.data.money+'</p>'+'<p>'+response.data.day+'</p>'+'</div>';
			    	
			    	var myLatlng = new google.maps.LatLng(Y_point, X_point);
			    	var mapOptions = {
			    		zoom: zoomLevel,
			    		center: myLatlng,
			    		mapTypeId: google.maps.MapTypeId.ROADMAP
			    	}
			    	var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
			    	var marker = new google.maps.Marker({
			    		position: myLatlng,
			    		map: map,
			    		title: markerTitle
			    	});
			    	var infowindow = new google.maps.InfoWindow({
			    		content: contentString,
			    		maxWizzzdth: markerMaxWidth
			    	});
			    	google.maps.event.addListener(marker, 'click', function(){
			    		infowindow.open(map, marker);
			    	});
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
}

var currmap = function(){
	var again = false;
	var mapform = $("#map_ma").dialog({
		autoOpen: false,
		height: 600,
		width: 700,
		modal: true,
		title: "맵",
		buttons: {
			
		},
		close: function() {
			
		}
	});
	
	var myLatlng = function(){};
	var mapOptions = {};
	var map = function(){};
	var marker = function(){};
	var infowindow = function(){};
	
	var Y_point = 37.494622; // Y 좌표
	var X_point = 127.027610; // X 좌표
	var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerTitle = "사용한 위치를 찍어보세요"; // 현재 위치 마커에 마우스를 오버올 때 나타나는 정보
	var markerMaxWidth = 300; // 마커를 클릭했을 때 나타나는 말풍선의 최대 크기
	
	// 말풍선 내용
	var contentString = '<div>사용한 위치를 찍어보세요</div>';
		
	$("#btnmap").click(function(){
		if(again == false){
			myLatlng = new google.maps.LatLng(Y_point, X_point);
			mapOptions = {
				zoom: zoomLevel,
				center: myLatlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			}
			map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
			marker = new google.maps.Marker({
				position: myLatlng,
				map: map,
				title: markerTitle
			});
			infowindow = new google.maps.InfoWindow({
				content: contentString,
				maxWizzzdth: markerMaxWidth
			});
			
			google.maps.event.addListener(marker, 'click', function(){
				infowindow.open(map, marker);
			});
			
			google.maps.event.addListener(map, 'click', function(mouseEvent){
				/*console.log(mouseEvent.latLng.lat());
				console.log(mouseEvent.latLng.lng());*/
				$("#lat").val(mouseEvent.latLng.lat());
				$("#lng").val(mouseEvent.latLng.lng());
				Y_point = mouseEvent.latLng.lat();
				X_point = mouseEvent.latLng.lng();
				myLatlng = new google.maps.LatLng(Y_point, X_point);
				marker = new google.maps.Marker({
					position: myLatlng,
					map: map,
					title: markerTitle
				});
				
				infowindow.open(map, marker);
			});
		}
		mapform.dialog("open");
		again = true;
	});
}

$(function(){
	currmap();
	formap(listarray);
});

function listreload(){
	//window.location.reload();
}

function my1Function(val) {
	for(var i=0; i<listarray.length; i++){// 포문이돌고 num값으로 찍은 푸쉬값이 담긴다.
		var num = listarray[i];
		console.log(num);
		$("#"+listarray[i]).focusout(function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
			console.log(num);
			
			/*mm1.dialog("open");//여기서 폼을 띄운다,.
*/			
			var list = {"listId":num.target.id,"day":val/*"listpaid":num.data.listpaid,"listbank":num.data.listbank,"listcategory":num.data.listcategory,
					"listoperations":num.data.listoperations,"listmoney":num.data.listmoney,"listname":num.data.listname*/}
			$.ajax( {// 여기서 부터 통신이 시작된다.
			    url : "/account-book/"+currentid+"/modify1",// 보낼주소
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(list),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
			    	console.log(response);
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
}

function my2Function(val) {
	for(var i=0; i<listarray.length; i++){// 포문이돌고 num값으로 찍은 푸쉬값이 담긴다.
		var num = listarray[i];
		console.log(num);
		$("#"+listarray[i]+"a").focusout(function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
			console.log(num);
			
			
			var list = {"listId":num.target.id,"name":val};
			$.ajax( {// 여기서 부터 통신이 시작된다.
			    url : "/account-book/"+currentid+"/modify2",// 보낼주소
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(list),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
			    	console.log(response);
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
}
function my3Function(val) {
	for(var i=0; i<listarray.length; i++){// 포문이돌고 num값으로 찍은 푸쉬값이 담긴다.
		var num = listarray[i];
		console.log(num);
		$("#"+listarray[i]+"b").focusout(function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
			console.log(num);
			
			
			var list = {"listId":num.target.id,"money":val/*"listpaid":num.data.listpaid,"listbank":num.data.listbank,"listcategory":num.data.listcategory,
					"listoperations":num.data.listoperations,"listmoney":num.data.listmoney,"listname":num.data.listname*/}
			$.ajax( {// 여기서 부터 통신이 시작된다.
			    url : "/account-book/"+currentid+"/modify3",// 보낼주소
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(list),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
			    	console.log(response);
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
}
function my4Function(val) {
	for(var i=0; i<listarray.length; i++){// 포문이돌고 num값으로 찍은 푸쉬값이 담긴다.
		var num = listarray[i];
		console.log(num);
		$("#"+listarray[i]+"c").focusout(function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
			console.log(num);
			
			
			var list = {"listId":num.target.id,"bank":val/*"listpaid":num.data.listpaid,"listbank":num.data.listbank,"listcategory":num.data.listcategory,
					"listoperations":num.data.listoperations,"listmoney":num.data.listmoney,"listname":num.data.listname*/}
			$.ajax( {// 여기서 부터 통신이 시작된다.
			    url : "/account-book/"+currentid+"/modify4",// 보낼주소
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(list),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
			    	console.log(response);
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
}
function my5Function(val) {
	for(var i=0; i<listarray.length; i++){// 포문이돌고 num값으로 찍은 푸쉬값이 담긴다.
		var num = listarray[i];
		console.log(num);
		$("#"+listarray[i]+"e").focusout(function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
			console.log(num);
			
			
			var list = {"listId":num.target.id,"paid":val/*"listpaid":num.data.listpaid,"listbank":num.data.listbank,"listcategory":num.data.listcategory,
					"listoperations":num.data.listoperations,"listmoney":num.data.listmoney,"listname":num.data.listname*/}
			$.ajax( {// 여기서 부터 통신이 시작된다.
			    url : "/account-book/"+currentid+"/modify5",// 보낼주소
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(list),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
			    	console.log(response);
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
} 
function my6Function(val) {
	for(var i=0; i<listarray.length; i++){// 포문이돌고 num값으로 찍은 푸쉬값이 담긴다.
		var num = listarray[i];
		console.log(num);
		$("#"+listarray[i]+"d").focusout(function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
			console.log(num);
			
			
			var list = {"listId":num.target.id,"operations":val/*"listpaid":num.data.listpaid,"listbank":num.data.listbank,"listcategory":num.data.listcategory,
					"listoperations":num.data.listoperations,"listmoney":num.data.listmoney,"listname":num.data.listname*/}
			$.ajax( {// 여기서 부터 통신이 시작된다.
			    url : "/account-book/"+currentid+"/modify6",// 보낼주소
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(list),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
			    	console.log(response);
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
} 
function my7Function(val) {
	for(var i=0; i<listarray.length; i++){// 포문이돌고 num값으로 찍은 푸쉬값이 담긴다.
		var num = listarray[i];
		console.log(num);
		$("#"+listarray[i]+"f").focusout(function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
			console.log(num);
			var list = {"listId":num.target.id,"category":val/*"listpaid":num.data.listpaid,"listbank":num.data.listbank,"listcategory":num.data.listcategory,
					,"listmoney":num.data.listmoney,"listname":num.data.listname*/}
			$.ajax( {// 여기서 부터 통신이 시작된다.
			    url : "/account-book/"+currentid+"/modify7",// 보낼주소
			    type: "POST",
			    dataType: "JSON",
			    data: JSON.stringify(list),//제이슨 보낼때 형식, 그리고 내가 원하는 1가지 (listid)를 가지고 json방식으로 컨트롤러로 간다,.
			    contentType: "application/json; charset=UTF-8",
			    success: function( response ){// 쿼리문을 돌고 들어온 정보는 이렇게 reponse에 담겨진다.
			    	console.log(response);
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );	       
			    }
			});
		});
	}
}