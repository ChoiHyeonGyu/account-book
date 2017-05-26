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
	
	$("#cl").click(function(){
		gm = gm - 1;
		if(gm == 0){
			gfy = gfy - 1;
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
    	
		opernum = opernum - 1;
		oper = {operation: opernum};
		
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
	    			html = "<tr class='listoriginal'>"+
									"<td><input value='"+response.data.list[i].day+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].name+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].moneyresult+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].paid+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].operations+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].bank+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].category+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><strong id='maps"+response.data.list[i].listId+"' class='fa fa-map-marker fa-2x sr-contact col-lg-offset-4 tablecoler' style='background: #ececec'></strong></td>"+
									"<td><a href='"+path+"/"+currentid+"/listdelete?listId="+response.data.list[i].listId+"' class='col-lg-offset-5 tablecoler glyphicon glyphicon-trash'></a></td>"+
								"</tr>";
	    			$("#listbody").append(html);
	    			listarray.push(response.data.list[i].listId);
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
	    		listarray = [];
	    		html4 = [];
	    		
	    		$("#v2").text(response.data.v2.moneyresult);
	    		$("#v3").text(response.data.v3.moneyresult);
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
	    			html = "<tr class='listoriginal'>"+
									"<td><input value='"+response.data.list[i].day+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].name+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].moneyresult+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].paid+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].operations+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].bank+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><input value='"+response.data.list[i].category+"' class='mine tablecoler' style='background: #ececec'></td>"+
									"<td><strong id='maps"+response.data.list[i].listId+"' class='fa fa-map-marker fa-2x sr-contact col-lg-offset-4 tablecoler' style='background: #ececec'></strong></td>"+
									"<td><a href='"+path+"/"+currentid+"/listdelete?listId="+response.data.list[i].listId+"' class='col-lg-offset-5 tablecoler glyphicon glyphicon-trash'></a></td>"+
								"</tr>";
	    			$("#listbody").append(html);
	    			listarray.push(response.data.list[i].listId);
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
	    		listarray = [];
	    		html4 = [];
	    		
	    		$("#v2").text(response.data.v2.moneyresult);
	    		$("#v3").text(response.data.v3.moneyresult);
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
