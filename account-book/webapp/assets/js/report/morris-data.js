$(function() {
	var beanobj = {};
	var oper = {};
	var opernum = 0;
	var data1 = [];
	
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
	    	}
	    	for(var i=0; i<response.data.length; i++){
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
	            resize: true,
	        });
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
		    	}
		    	for(var i=0; i<response.data.length; i++){
					if((response.data[i].lsum / response.data[i].ml) > 1){
					    barcol = '#9440ed';
					    break;
					} else if((response.data[i].lsum / response.data[i].ml) > 0.9) {
						barcol = '#cb4b4b';
						break;
					} else if((response.data[i].lsum / response.data[i].ml) > 0.6) {
						barcol = '#edc240';
						break;
					} else {
						barcol = '#4da74d';
						break;
					}
		    	}
		    	Morris.Bar({
		            element: 'morris-bar-chart',
		            data: data1,
		            xkey: 'y',
		            ykeys: ['a', 'b'],
		            labels: ['예산', '현재 사용한 금액'],
		            hideHover: 'auto',
		            resize: true,
		            barColors: ['#0b62a4', barcol, '#4da74d', '#afd8f8', '#edc240', '#cb4b4b', '#9440ed']
		        });
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
		    	}
		    	for(var i=0; i<response.data.length; i++){
					if((response.data[i].lsum / response.data[i].ml) > 1){
					    barcol = '#9440ed';
					    break;
					} else if((response.data[i].lsum / response.data[i].ml) > 0.9) {
						barcol = '#cb4b4b';
						break;
					} else if((response.data[i].lsum / response.data[i].ml) > 0.6) {
						barcol = '#edc240';
						break;
					} else {
						barcol = '#4da74d';
						break;
					}
		    	}
		    	Morris.Bar({
		            element: 'morris-bar-chart',
		            data: data1,
		            xkey: 'y',
		            ykeys: ['a', 'b'],
		            labels: ['예산', '현재 사용한 금액'],
		            hideHover: 'auto',
		            resize: true,
		            barColors: ['#0b62a4', barcol, '#4da74d', '#afd8f8', '#edc240', '#cb4b4b', '#9440ed']
		        });
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
