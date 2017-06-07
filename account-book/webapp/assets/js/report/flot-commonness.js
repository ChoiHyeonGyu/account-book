var beanobj = {};
var dtp = new Date().getTime()-(365.2425 * 24 * 60 * 60 * 1000);
var dtn = new Date().getTime();

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

function gettimes(month){
	var dtn2 = null;
	var month_array = ["01", "03", "05", "07", "08", "10", "12"];
	var month_array2 = ["04", "06", "09", "11"];
	for(var i=0; i<7; i++){
		if(month.substr(-2) == month_array[i]){
    		dtn2 = new Date(month).getTime()+(31 * 24 * 60 * 60 * 1000)-1;
    	}
	}
	if(month.substr(-2) == "02") {
		dtn2 = new Date(month).getTime()+(28 * 24 * 60 * 60 * 1000)-1;
	}
	for(var i=0; i<4; i++){
		if(month.substr(-2) == month_array2[i]) {
    		dtn2 = new Date(month).getTime()+(30 * 24 * 60 * 60 * 1000)-1;
    	}
	}
	return new Date(dtn2);
}

function requiredmonth(month){
	var position = "right";
	var sm = {"selectmonth": month.replace(".", "/")};
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
	                min: new Date(month.replace(".", "/")).getTime(),
	                max: new gettimes(month.replace(".", "/"))
	            }],
	            yaxes: [{
	                min: 0
	            },
	            {
	                alignTicksWithAxis: position == "right" ? 1 : null,
	                position: position
	            }],
	            legend: {
	                position: 'we'
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