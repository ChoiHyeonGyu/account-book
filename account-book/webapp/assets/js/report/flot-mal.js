var dtp = new Date().getTime()-(365.2425 * 24 * 60 * 60 * 1000);
var dtn = new Date().getTime();

//Flot Multiple Axes Line Chart
$(function() {  
    function doPlot(position) {
    	Array.prototype.valueIndex=function(pval)
    	{
    	 var idx = -1;
    	 if(this==null || this==undefined || pval==null || pval==undefined){
    	 }else{
    	  for(var i=0;i<this.length;i++){
    	   if(this[i]==pval){
    	    idx = i;
    	    break;
    	   }
    	  }
    	 }
    	 return idx
    	};

    	Array.prototype.removeDup=function()
    	{
    	 var resultArray = [];
    	 if(this==null || this==undefined){
    	 }else{
    	  for(var i=0;i<this.length;i++){
    	   var el = this[i];
    	   if(resultArray.valueIndex(el) === -1) resultArray.push(el);
    	  }
    	 }
    	 return resultArray;
    	};
    	
    	var data2 = [];
    	var data3 = [];
    	var column1 = [];
    	var column2 = [];
    	var column3 = [];
    	var column4 = [];
    	var column5 = [];
    	var column6 = [];
    	
    	$.ajax( {
    	    url : "/account-book/"+currentid+"/importgraph",
    	    type: "POST",
    	    dataType: "JSON",
    	    data: JSON.stringify(beanobj),
    	    contentType: "application/json; charset=UTF-8",
    	    success: function( response ){
    	    	if(response.data.length == 0){
    	    		data2[0] = {label: "없음", data: 1};
    	    	}

    	    	for(var i=0; i<response.data.length; i++){
    	    		column1[i] = response.data[i].category;
    	    	}
    	    	column2 = column1.removeDup();
    	    	
    	    	for(var i=0; i<response.data.length; i++){
    	    		for(var j=0; j<column2.length; j++){
    	    			if(column3[j]==null || column3[j]==undefined){
    	    				column3[j] = new Array([response.data[i].day, response.data[i].lsum]);
    	    				break;
    	    			}
    	    			if(column2[j] == response.data[i].category){
    	    				column3[j].push([response.data[i].day, response.data[i].lsum]);
    	    				break;
    	    			}
    	    		}
    	    	}
    	    	
    	    	for(var i=0; i<column2.length; i++){
    	    		data2[i] = {label: column2[i], data: column3[i]};
    	    	}
    	    	
    	    	$.plot($("#flot-line-chart-mt1"), data2, {
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
    	
    	$.ajax( {
    	    url : "/account-book/"+currentid+"/exportgraph",
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
    	    	
    	    	$.plot($("#flot-line-chart-mt2"), data3, {
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
    
    doPlot("right");

    $("button").click(function() {
        doPlot($(this).text());
    });
});