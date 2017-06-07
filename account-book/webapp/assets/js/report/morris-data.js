$(function() {
	var beanobj = {};
	var oper = {};
	var opernum = 0;
	var data1 = [];
	var html = "";
    var html2 = "";
	var listarray = [];
	var html3 = "";
    var html4 = "";
    var html5 = "";
    var list = "";
    var list2 = "";
    var list3 = "";
	var lisgetid="";
	
	var d = new Date();
	var gfy = d.getFullYear();
	var gm = d.getMonth()+1;
	if(d.getMonth() < 9){
		$("#yearmonth").text(gfy+".0"+gm);
	} else {
		$("#yearmonth").text(gfy+"."+gm);
	}
	
	$.ajax( {
	    url : "/account-book/"+currentid+"/limitgraph",
	    type: "POST",
	    dataType: "JSON",
	    data: JSON.stringify(beanobj),
	    contentType: "application/json; charset=UTF-8",
	    success: function( response ){
	    	console.log(response);
	    	for(var i=0; i<response.data.length; i++){
		    	data1[i] = {y: response.data[i].category, a: response.data[i].ml, b: response.data[i].lsum};
		    	if((response.data[i].lsum / response.data[i].ml) < 0.6){
				    barcolnum[i] = 2;
				} else if((response.data[i].lsum / response.data[i].ml) < 0.9) {
					barcolnum[i] = 4;
				} else if((response.data[i].lsum / response.data[i].ml) < 1) {
					barcolnum[i] = 5;
				} else {
					barcolnum[i] = 6;
				}
	    	}
	    	Morris.Bar({
	            element: 'morris-bar-chart',
	            data: data1,
	            xkey: 'y',
	            ykeys: ['a', 'b'],
	            labels: ['예산', '현재 사용한 금액'],
	            hideHover: 'auto',
	            resize: true
	        });
	    	barcolnum = [];
		    numcnt = -1;
	    },
	    error: function( XHR, status, error ){
	       console.error( status + " : " + error );	       
	    }
	});
	
	$("#cl").click(function(){ //왼쪽버튼 .
		gm = gm - 1;
		if(gm == 0){
			gfy = gfy - 1;// 왜뺌
			gm = 12; 
		}
		
		if(gm < 10){
			$("#yearmonth").text(gfy+".0"+gm);
		} else {
			$("#yearmonth").text(gfy+"."+gm);
		}
		
		data1 = [];
		$("svg").remove();
    	$(".morris-default-style").remove();
    	
		opernum = opernum - 1;// 버튼을 누루면 -1 or 1추가됨 .이 값으로 어떻게 값을 꺼낼수 있는지 궁금함.
		oper = {operation: opernum};// operation 어디에 선언된 것인지( )
		listarray = [];
		$.ajax( {
		    url : "/account-book/"+currentid+"/movelimitgraph",
		    type: "POST",
		    dataType: "JSON",
		    data: JSON.stringify(oper),
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){
		    	if(response.data.length == 0){
		    		data1[0] = {y: "없음", a: 0, b: 0};// 달력 버튼으로 뭘 찾으려는 것인지.
		    	}
		    	for(var i=0; i<response.data.length; i++){
			    	data1[i] = {y: response.data[i].category, a: response.data[i].ml, b: response.data[i].lsum};
			    	if((response.data[i].lsum / response.data[i].ml) < 0.6){
					    barcolnum[i] = 2;
					} else if((response.data[i].lsum / response.data[i].ml) < 0.9) {
						barcolnum[i] = 4;
					} else if((response.data[i].lsum / response.data[i].ml) < 1) {
						barcolnum[i] = 5;
					} else {
						barcolnum[i] = 6;
					}
		    	}
		    	Morris.Bar({
		            element: 'morris-bar-chart',
		            data: data1,
		            xkey: 'y',
		            ykeys: ['a', 'b'],
		            labels: ['예산', '현재 사용한 금액'],
		            hideHover: 'auto',
		            resize: true
		        });
		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       // 여기서 에러나면 뭐때문인지.
		    }
		});
		barcolnum = [];
	    numcnt = -1;
	  /* var listgetid = {"listId":num.target.id,"":val,}*/
	    $.ajax( {
		    url : "/account-book/"+currentid+"/movelist",
		    type: "POST",
		    dataType: "JSON",
		    data: JSON.stringify(oper),
		    contentType: "application/json; charset=UTF-8",  
		    success: function( response ){
		    	console.log(response);
		    	$(".listoriginal").remove();// 한번 비워야 내가 부르고 싶은 달의 것만 꺼낼수 있다. .
	    		for(var i=0; i<response.data.list.length; i++){
	    			if(response.data.list[i].bank == undefined){
	    				response.data.list[i].bank = "";
					}
	    			if(response.data.list[i].paid == "현금"){
	    				list = "<option value='"+response.data.list[i].paid+"'>"+response.data.list[i].paid+"</option><option value='카드'>카드</option>";
	    			} else {
	    				list = "<option value='"+response.data.list[i].paid+"'>"+response.data.list[i].paid+"</option><option value='현금'>현금</option>";
	    			}
	    			if(response.data.list[i].operations =="수입"){
	    				list2 = "<option value='"+response.data.list[i].operations+"' selected='selected'>"+response.data.list[i].operations+"</option><option value='-'>지출</option><option value='0'>투자</option>";
	    			} else if(response.data.list[i].operations == "지출") {
	    				list2 = "<option value='+'>수입</option><option value='"+response.data.list[i].operations+"' selected='selected'>"+response.data.list[i].operations+"</option><option value='0'>투자</option>";
	    			} else {
	    				list2 = "<option value='+'>수입</option><option value='-'>지출</option><option value='"+response.data.list[i].operations+"' selected='selected'>"+response.data.list[i].operations+"</option>";
	    			}
	    			for(var j=0; j<response.data.categorylist.length; j++){
	    				if(response.data.list[i].category == response.data.categorylist[j].category){/* list 포문은 해당 페이지 정보 밖에 없음 카테고리 list는 컨트롤러에서 받은 모든카테고리를 불러온다 */
	    					list3 += "<option value='"+response.data.categorylist[j].category+"' selected='selected'>"+response.data.categorylist[j].category+"</option>"
	    				} else {
	    					list3 += "<option value='"+response.data.categorylist[j].category+"'>"+response.data.categorylist[j].category+"</option>"
	    				}
	    			}
	    			html = "<tr class='listoriginal'>"+
									"<td><input id='"+response.data.list[i].listId+"' value='"+response.data.list[i].day+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input id='"+response.data.list[i].listId+"a' value='"+response.data.list[i].name+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input id='"+response.data.list[i].listId+"b' value='"+response.data.list[i].moneyresult+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><select id='"+response.data.list[i].listId+"e' class='tableinput searchbox2' required>"+list+"</select></td>"+
									"<td><select id='"+response.data.list[i].listId+"d' class='tableinput searchbox2' required>"+list2+"</select></td>"+
									"<td><input id='"+response.data.list[i].listId+"c' value='"+response.data.list[i].bank+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><select id='"+response.data.list[i].listId+"f' class='tableinput searchbox2' required>"+list3+"</select></td>"+
									"<td><strong id='maps"+response.data.list[i].listId+"' class='fa fa-map-marker fa-2x sr-contact col-lg-offset-4 tablecoler' style='background: #ececec'></strong></td>"+
									"<td><a href='"+path+"/"+currentid+"/listdelete?listId="+response.data.list[i].listId+"' class='col-lg-offset-5 tablecoler glyphicon glyphicon-trash'></a></td>"+
								"</tr>";//path +currentid > main
	    			list3 = "";
	    			$("#listbody").append(html);// 이걸 써줘야 for문으로 돌린 값들 다 더해서 리스트로 뿌릴수 있다.
	    			listarray.push(response.data.list[i].listId);
	    			
	    			var num = listarray[i];
	    			$("#listbody").on("focusout", "#"+listarray[i], function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"day":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"a", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"name":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"b", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"money":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"e", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"paid":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"d", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"operations":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"c", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"bank":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"f", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"category":num.target.value};
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
	    		
	    		$(".pager").remove();
	    		if(response.data.prevPage > 0){
    				html3 = "<li><a href='"+path+"/"+currentid+"/list?pagination="+response.data.prevPage+"&searching="+response.data.searching+"&operation="+opernum+"'>◀</a></li>";
    			}
    			for(var i=response.data.beginPage; i<=(response.data.beginPage+response.data.listSize-1); i++){// 포문 해석문제..
    				if(response.data.endPage < i){
    					html4 += "<li>"+i+"</li>";
    				} else if(response.data.pagination == i) {
    					html4 += "<li class='selected'>"+i+"</li>";
    				} else {
    					html4 += "<li><a href='"+path+"/"+currentid+"/list?pagination="+(response.data.pagination+1)+"&searching="+response.data.searching+"&operation="+opernum+"'>"+i+"</a></li>";
    				}
    			}
    			if(response.data.nextPage > 0){
    				html5 = "<li><a href='"+path+"/"+currentid+"/list?pagination="+response.data.nextPage+"&searching="+response.data.searching+"&operation="+opernum+"'>▶</a></li>";
    			}
    			
    			html2 = "<div class='pager'>"+
							"<ul>"+html3+html4+html5+"</ul>"+
						"</div>";
    			$("#listall").append(html2);
	    		
	    		formap(listarray);
	    		html4 = "";//설명 필요.
	    		$("#v4").text(response.data.v4.moneyresult);
	    		$("#v2").text(response.data.v2.moneyresult);
	    		$("#v3").text(response.data.v3.moneyresult);
	    		$("#v5").text(response.data.v5.moneyresult);

		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       
		    }
		});
	}); 

	
	
	$("#cr").click(function(){
		gm = gm + 1;
		if(gm == 13){
			gfy = gfy + 1;
			gm = 1;
		}
		
		if(gm < 10){
			$("#yearmonth").text(gfy+".0"+gm);
		} else {
			$("#yearmonth").text(gfy+"."+gm);
		}
		
		data1 = [];
		$("svg").remove();
    	$(".morris-default-style").remove();
    	
		opernum = opernum + 1;
		oper = {operation: opernum};
		listarray = [];
		
		$.ajax( {
		    url : "/account-book/"+currentid+"/movelimitgraph",
		    type: "POST",
		    dataType: "JSON",
		    data: JSON.stringify(oper),
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){
		    	if(response.data.length == 0){
		    		data1[0] = {y: "없음", a: 0, b: 0};
		    	}
		    	for(var i=0; i<response.data.length; i++){
			    	data1[i] = {y: response.data[i].category, a: response.data[i].ml, b: response.data[i].lsum};
			    	if((response.data[i].lsum / response.data[i].ml) < 0.6){
					    barcolnum[i] = 2;
					} else if((response.data[i].lsum / response.data[i].ml) < 0.9) {
						barcolnum[i] = 4;
					} else if((response.data[i].lsum / response.data[i].ml) < 1) {
						barcolnum[i] = 5;
					} else {
						barcolnum[i] = 6;
					}
		    	}
		    	Morris.Bar({
		            element: 'morris-bar-chart',
		            data: data1,
		            xkey: 'y',
		            ykeys: ['a', 'b'],
		            labels: ['예산', '현재 사용한 금액'],
		            hideHover: 'auto',
		            resize: true
		        });
		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       
		    }
		});
		barcolnum = [];
	    numcnt = -1;
	    
	    $.ajax( {
		    url : "/account-book/"+currentid+"/movelist",
		    type: "POST",
		    dataType: "JSON",
		    data: JSON.stringify(oper),
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){
		    	console.log(response);
		    	$(".listoriginal").remove();
	    		for(var i=0; i<response.data.list.length; i++){
	    			if(response.data.list[i].bank == undefined){
	    				response.data.list[i].bank = "";
					}
	    			if(response.data.list[i].paid == "현금"){
	    				list = "<option value="+response.data.list[i].paid+">"+response.data.list[i].paid+"</option><option value='카드'>카드</option>";
	    			} else {
	    				list = "<option value="+response.data.list[i].paid+">"+response.data.list[i].paid+"</option><option value='현금'>현금</option>";
	    			}
	    			if(response.data.list[i].operations =="수입"){
	    				list2 = "<option value='"+response.data.list[i].operations+"' selected='selected'>"+response.data.list[i].operations+"</option><option value='-'>지출</option><option value='0'>투자</option>";
	    			} else if(response.data.list[i].operations == "지출") {
	    				list2 = "<option value='+'>수입</option><option value='"+response.data.list[i].operations+"' selected='selected'>"+response.data.list[i].operations+"</option><option value='0'>투자</option>";
	    			} else {
	    				list2 = "<option value='+'>수입</option><option value='-'>지출</option><option value='"+response.data.list[i].operations+"' selected='selected'>"+response.data.list[i].operations+"</option>";
	    			}
	    			for(var j=0; j<response.data.categorylist.length; j++){
	    				if(response.data.list[i].category == response.data.categorylist[j].category){
	    					list3 += "<option value='"+response.data.categorylist[j].category+"' selected='selected'>"+response.data.categorylist[j].category+"</option>"
	    				} else {
	    					list3 += "<option value='"+response.data.categorylist[j].category+"'>"+response.data.categorylist[j].category+"</option>"
	    				}
	    			}
	    			html = "<tr class='listoriginal'>"+
									"<td><input id='"+response.data.list[i].listId+"' value='"+response.data.list[i].day+"' class='mine tablecoler' onchange='my1Function(this.value)' style='background: #ececec'></td>"+
									"<td><input id='"+response.data.list[i].listId+"a' value='"+response.data.list[i].name+"' class='mine tablecoler' onchange='my2Function(this.value)' style='background: #ececec'></td>"+
									"<td><input id='"+response.data.list[i].listId+"b' value='"+response.data.list[i].moneyresult+"' class='mine tablecoler' onchange='my3Function(this.value)' style='background: #ececec'></td>"+
									"<td><select id='"+response.data.list[i].listId+"e' class='tableinput searchbox2' onchange='my5Function(this.value)' required>"+list+"</select></td>"+
									"<td><select id='"+response.data.list[i].listId+"d' class='tableinput searchbox2' onchange='my6Function(this.value)' required>"+list2+"</select></td>"+
									"<td><input id='"+response.data.list[i].listId+"c' value='"+response.data.list[i].bank+"' class='mine tablecoler' onchange='my4Function(this.value)' style='background: #ececec'></td>"+
									"<td><select id='"+response.data.list[i].listId+"f' class='tableinput searchbox2' onchange='my7Function(this.value)' required>"+list3+"</select></td>"+
									"<td><strong id='maps"+response.data.list[i].listId+"' class='fa fa-map-marker fa-2x sr-contact col-lg-offset-4 tablecoler' style='background: #ececec'></strong></td>"+
									"<td><a href='"+path+"/"+currentid+"/listdelete?listId="+response.data.list[i].listId+"' class='col-lg-offset-5 tablecoler glyphicon glyphicon-trash'></a></td>"+
								"</tr>";//path +currentid > main
	    			$("#listbody").append(html);
	    			list3 = "";
	    			listarray.push(response.data.list[i].listId);
	    			
	    			var num = listarray[i];// 사용가능 번호만 옮긴후 .펑션 사용,
	    			$("#listbody").on("focusout", "#"+listarray[i], function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"day":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"a", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"name":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"b", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"money":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"e", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"paid":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"d", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"operations":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"c", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"bank":num.target.value};
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
	    			$("#listbody").on("focusout", "#"+listarray[i]+"f", function(num){// 어느걸 찍을지 모르기 때문 #+listarray[i].click(function(num))을 입력한다.
	    				console.log(num);
	    				
	    				var list = {"listId":num.target.id,"category":num.target.value};
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
	    		
	    		$(".pager").remove();
	    		if(response.data.prevPage > 0){
    				html3 = "<li><a href='"+path+"/"+currentid+"/list?pagination="+response.data.prevPage+"&searching="+response.data.searching+"&operation="+opernum+"'>◀</a></li>";
    			}
    			for(var i=response.data.beginPage; i<=(response.data.beginPage+response.data.listSize-1); i++){
    				if(response.data.endPage < i){
    					html4 += "<li>"+i+"</li>";
    				} else if(response.data.pagination == i) {
    					html4 += "<li class='selected'>"+i+"</li>";
    				} else {
    					html4 += "<li><a href='"+path+"/"+currentid+"/list?pagination="+(response.data.pagination+1)+"&searching="+response.data.searching+"&operation="+opernum+"'>"+i+"</a></li>";
    				}
    			}
    			if(response.data.nextPage > 0){
    				html5 = "<li><a href='"+path+"/"+currentid+"/list?pagination="+response.data.nextPage+"&searching="+response.data.searching+"&operation="+opernum+"'>▶</a></li>";
    			}
    			
    			html2 = "<div class='pager'>"+
							"<ul>"+html3+html4+html5+"</ul>"+
						"</div>";
    			$("#listall").append(html2);
    			
	    		formap(listarray);
	    		html4 = "";
	    		$("#v4").text(response.data.v4.moneyresult);
	    		$("#v2").text(response.data.v2.moneyresult);
	    		$("#v3").text(response.data.v3.moneyresult);
	    		$("#v5").text(response.data.v5.moneyresult);

		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );	       
		    }
		});
	});

    /*Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2010 Q1',
            iphone: 2666,
            ipad: null,
            itouch: 2647
        }, {
            period: '2010 Q2',
            iphone: 2778,
            ipad: 2294,
            itouch: 2441
        }, {
            period: '2010 Q3',
            iphone: 4912,
            ipad: 1969,
            itouch: 2501
        }, {
            period: '2010 Q4',
            iphone: 3767,
            ipad: 3597,
            itouch: 5689
        }, {
            period: '2011 Q1',
            iphone: 6810,
            ipad: 1914,
            itouch: 2293
        }, {
            period: '2011 Q2',
            iphone: 5670,
            ipad: 4293,
            itouch: 1881
        }, {
            period: '2011 Q3',
            iphone: 4820,
            ipad: 3795,
            itouch: 1588
        }, {
            period: '2011 Q4',
            iphone: 15073,
            ipad: 5967,
            itouch: 5175
        }, {
            period: '2012 Q1',
            iphone: 10687,
            ipad: 4460,
            itouch: 2028
        }, {
            period: '2012 Q2',
            iphone: 8432,
            ipad: 5713,
            itouch: 1791
        }],
        xkey: 'period',
        ykeys: ['iphone', 'ipad', 'itouch'],
        labels: ['iPhone', 'iPad', 'iPod Touch'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 12
        }, {
            label: "In-Store Sales",
            value: 30
        }, {
            label: "Mail-Order Sales",
            value: 20
        }],
        resize: true
    });
    
    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2006',
            a: 100,
            b: 90
        }, {
            y: '2007',
            a: 75,
            b: 65
        }, {
            y: '2008',
            a: 50,
            b: 40
        }, {
            y: '2009',
            a: 75,
            b: 65
        }, {
            y: '2010',
            a: 50,
            b: 40
        }, {
            y: '2011',
            a: 75,
            b: 65
        }, {
            y: '2012',
            a: 100,
            b: 90
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true
    });*/
});
