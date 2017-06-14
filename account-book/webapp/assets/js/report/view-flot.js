//Flot Pie Chart
$(function() {
	var beanobj = {};
	var data1 = [];
	var data2 = [];
	var position = "right";
	var data3 = [];
	var column4 = [];
	var column5 = [];
	var column6 = [];
	var data4 = [];
	
	$.ajax( {
	    url : "/account-book/graphjinanmonth",
	    type: "POST",
	    dataType: "JSON",
	    data: JSON.stringify(beanobj),
	    contentType: "application/json; charset=UTF-8",
	    success: function( response ){
	    	if(response.data.length == 0){
	    		data1[0] = {label: "없음", data: 1};
	    	}
	    	
	    	for(var i=0; i<response.data.length; i++){
		    	data1[i] = {label: response.data[i].category, data: response.data[i].cnt};
	    	}
	    	
	    	var plotObj = $.plot($("#flot-pie-chart"+1), data1, {
	            series: {
	                pie: {
	                    show: true
	                }
	            },
	            grid: {
	                hoverable: true
	            },
	            tooltip: true,
	            tooltipOpts: {
	                content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
	                shifts: {
	                    x: 20,
	                    y: 0
	                },
	                defaultTheme: false
	            }
	        });
	    },
	    error: function( XHR, status, error ){
	       console.error( status + " : " + error );	       
	    }
	});
	
	$.ajax( {
	    url : "/account-book/graphttmonth",
	    type: "POST",
	    dataType: "JSON",
	    data: JSON.stringify(beanobj),
	    contentType: "application/json; charset=UTF-8",
	    success: function( response ){
	    	if(response.data.length == 0){
	    		data2[0] = {label: "없음", data: 1};
	    	}
	    	
	    	for(var i=0; i<response.data.length; i++){
		    	data2[i] = {label: response.data[i].category, data: response.data[i].cnt};
	    	}
	    	
	    	var plotObj = $.plot($("#flot-pie-chart"+2), data2, {
	            series: {
	                pie: {
	                    show: true
	                }
	            },
	            grid: {
	                hoverable: true
	            },
	            tooltip: true,
	            tooltipOpts: {
	                content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
	                shifts: {
	                    x: 20,
	                    y: 0
	                },
	                defaultTheme: false
	            }
	        });
	    },
	    error: function( XHR, status, error ){
	       console.error( status + " : " + error );	       
	    }
	});
	
	$.ajax( {
	    url : "/account-book/allexportgraph",
	    type: "POST",
	    dataType: "JSON",
	    data: JSON.stringify(beanobj),
	    contentType: "application/json; charset=UTF-8",
	    success: function( response ){
	    	if(response.data.length == 0){
	    		data3[0] = {label: "없음", data: 1};
	    	}

	    	for(var i=0; i<response.data.length; i++){
	    		column4[i] = response.data[i].category;
	    	}
	    	column5 = column4.removeDup();
	    	
	    	for(var i=0; i<response.data.length; i++){
	    		for(var j=0; j<column5.length; j++){
	    			if(column6[j]==null || column6[j]==undefined){
	    				column6[j] = new Array([response.data[i].day, response.data[i].lsum]);
	    				break;
	    			}
	    			if(column5[j] == response.data[i].category){
	    				column6[j].push([response.data[i].day, response.data[i].lsum]);
	    				break;
	    			}
	    		}
	    	}
	    	
	    	for(var i=0; i<column5.length; i++){
	    		data3[i] = {label: column5[i], data: column6[i]};
	    	}
	    	
	    	$.plot($("#flot-line-chart-yt"), data3, {
	            xaxes: [{
	                mode: 'time',
	                min: dtp,
	                max: dtn
	            }],
	            yaxes: [{
	                min: 0
	            },
	            {
	                alignTicksWithAxis: position == "right" ? 1 : null,
	                position: position
	            }],
	            legend: {
	                position: 'nw'
	            },
	            grid: {
	                hoverable: true
	            },
	            tooltip: true,
	            tooltipOpts: {
	                content: "%s %x %y",
	                xDateFormat: "%y-%m-%d",

	                onHover: function(flotItem, $tooltipEl) {
	                    
	                }
	            }
	        });
	    },
	    error: function( XHR, status, error ){
	       console.error( status + " : " + error );	       
	    }
	});
	
	$.ajax( {
	    url : "/account-book/alllimitgraph",
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
	            element: 'morris-bar-chart-all',
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
	
	if(profit.length){
		$("#graph-import option:selected").text(profit);
		$("#graph-gender option:selected").text(gender);
		$("#graph-age option:selected").text(age);
		$("#graph-age1 option:selected").text(age1);
		viewchangedata();
	}
	
	function viewchangedata(){
		var selectobj = {"profit":$("#graph-import option:selected").text(), "gender":$("#graph-gender option:selected").text(), "age":$("#graph-age option:selected").text(), 
				"age1":$("#graph-age1 option:selected").text()};
		data1 = [];
		data2 = [];
		data3 = [];
		column4 = [];
		column5 = [];
		column6 = [];
		data4 = [];
		$("svg").remove();
    	$(".morris-default-style").remove();
		
		$.ajax( {
		    url : "/account-book/transgraphavg",
		    type: "POST",
		    dataType: "JSON",
		    data: JSON.stringify(selectobj),
		    contentType: "application/json; charset=UTF-8",
		    success: function( response ){		    	
		    	// 그래프1
		    	if(response.data.gjms.length == 0){
		    		data1[0] = {label: "없음", data: 1};
		    	}
		    	
		    	for(var i=0; i<response.data.gjms.length; i++){
			    	data1[i] = {label: response.data.gjms[i].category, data: response.data.gjms[i].cnt};
		    	}
		    	
		    	var plotObj = $.plot($("#flot-pie-chart"+1), data1, {
		            series: {
		                pie: {
		                    show: true
		                }
		            },
		            grid: {
		                hoverable: true
		            },
		            tooltip: true,
		            tooltipOpts: {
		                content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
		                shifts: {
		                    x: 20,
		                    y: 0
		                },
		                defaultTheme: false
		            }
		        });
		    	
		    	// 그래프2
		    	if(response.data.gtms.length == 0){
		    		data2[0] = {label: "없음", data: 1};
		    	}
		    	
		    	for(var i=0; i<response.data.gtms.length; i++){
			    	data2[i] = {label: response.data.gtms[i].category, data: response.data.gtms[i].cnt};
		    	}
		    	
		    	var plotObj = $.plot($("#flot-pie-chart"+2), data2, {
		            series: {
		                pie: {
		                    show: true
		                }
		            },
		            grid: {
		                hoverable: true
		            },
		            tooltip: true,
		            tooltipOpts: {
		                content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
		                shifts: {
		                    x: 20,
		                    y: 0
		                },
		                defaultTheme: false
		            }
		        });
		    	
		    	// 그래프3
		    	if(response.data.aegs.length == 0){
		    		data3[0] = {label: "없음", data: 1};
		    	}

		    	for(var i=0; i<response.data.aegs.length; i++){
		    		column4[i] = response.data.aegs[i].category;
		    	}
		    	column5 = column4.removeDup();
		    	
		    	for(var i=0; i<response.data.aegs.length; i++){
		    		for(var j=0; j<column5.length; j++){
		    			if(column6[j]==null || column6[j]==undefined){
		    				column6[j] = new Array([response.data.aegs[i].day, response.data.aegs[i].lsum]);
		    				break;
		    			}
		    			if(column5[j] == response.data.aegs[i].category){
		    				column6[j].push([response.data.aegs[i].day, response.data.aegs[i].lsum]);
		    				break;
		    			}
		    		}
		    	}
		    	
		    	for(var i=0; i<column5.length; i++){
		    		data3[i] = {label: column5[i], data: column6[i]};
		    	}
		    	
		    	$.plot($("#flot-line-chart-yt"), data3, {
		            xaxes: [{
		                mode: 'time',
		                min: dtp,
		                max: dtn
		            }],
		            yaxes: [{
		                min: 0
		            },
		            {
		                alignTicksWithAxis: position == "right" ? 1 : null,
		                position: position
		            }],
		            legend: {
		                position: 'nw'
		            },
		            grid: {
		                hoverable: true
		            },
		            tooltip: true,
		            tooltipOpts: {
		                content: "%s %x %y",
		                xDateFormat: "%y-%m-%d",

		                onHover: function(flotItem, $tooltipEl) {
		                    
		                }
		            }
		        });
		    	
		    	// 그래프4
		    	for(var i=0; i<response.data.algs.length; i++){
			    	data1[i] = {y: response.data.algs[i].category, a: response.data.algs[i].ml, b: response.data.algs[i].lsum};
			    	if((response.data.algs[i].lsum / response.data.algs[i].ml) < 0.6){
					    barcolnum[i] = 2;
					} else if((response.data.algs[i].lsum / response.data.algs[i].ml) < 0.9) {
						barcolnum[i] = 4;
					} else if((response.data.algs[i].lsum / response.data.algs[i].ml) < 1) {
						barcolnum[i] = 5;
					} else {
						barcolnum[i] = 6;
					}
		    	}
		    	Morris.Bar({
		            element: 'morris-bar-chart-all',
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
	}
	
	$("#graph-import").change(function(){
		viewchangedata();
	});
	
	$("#graph-gender").change(function(){
		viewchangedata();
	});
	
	$("#graph-age").change(function(){
		viewchangedata();
	});
	
	$("#graph-age1").change(function(){
		viewchangedata();
	});
});