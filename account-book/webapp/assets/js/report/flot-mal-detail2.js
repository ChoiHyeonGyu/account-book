//Flot Multiple Axes Line Chart
$(function() {
    function doPlot2(position) {
    	var sm = {"selectmonth": $("#selectedmonth").val()};
    	var data3 = [];
    	var column4 = [];
    	var column5 = [];
    	var column6 = [];
    	
    	$.ajax( {
    	    url : "/account-book/"+currentid+"/mselectedmonth",
    	    type: "POST",
    	    dataType: "JSON",
    	    data: JSON.stringify(sm),
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
    	    	
    	    	$.plot($("#flot-line-chart-mt2"), data3, {
    	            xaxes: [{
    	                mode: 'time',
    	                min: new Date($("#selectedmonth").val()).getTime(),
    	                max: new gettimes($("#selectedmonth").val())
    	            }],
    	            yaxes: [{
    	                min: 0
    	            },
    	            {
    	                alignTicksWithAxis: position == "right" ? 1 : null,
    	                position: position
    	            }],
    	            legend: {
    	                position: 'sw'
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
    }
    
    doPlot2("right");
    
    $("#imt").click(function() {
    	$("#im").submit();
    });
    
    $("#ext").click(function() {
    	$("#ex").submit();
    });
});