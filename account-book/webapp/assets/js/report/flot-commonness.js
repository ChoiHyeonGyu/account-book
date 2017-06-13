var beanobj = {};
var dtp = new Date().getTime()-(365.2425 * 24 * 60 * 60 * 1000);
var dtn = new Date().getTime();
var lencnt = 0;

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

function requiredmonth(obj3){
	var position = "right";
	var data3 = [];
	var column4 = [];
	var column5 = [];
	var column6 = [];
	
	$.ajax( {
	    url : "/account-book/"+currentid+"/mselectedmonth2",
	    type: "POST",
	    dataType: "JSON",
	    data: JSON.stringify(obj3),
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
	                min: new Date(obj3.month).getTime(),
	                max: new gettimes(obj3.month)
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

function flushtable(obj3){
	for(var i=0; i<32; i++){
		$("#dated"+(i+1)).text("");
		$("#cmsumd"+(i+1)).text("");
	}
	$.ajax( {
	    url : "/account-book/"+currentid+"/table",
	    type: "POST",
	    dataType: "JSON",
	    data: JSON.stringify(obj3),
	    contentType: "application/json; charset=UTF-8",
	    success: function( response ){
	    	console.log(response);
	    	for(var i=0; i<response.data.date.length; i++){
	    		$("#dated"+(i+1)).text(response.data.date[i].day2);
	    	}
	    	
	    	var html = "";
	    	for(var i=0; i<lencnt; i++){
	    		$("#cd1").remove();
	    		$("#cd2").remove();
	    		$("#cd3").remove();
	    	}
	    	
	    	var check = 0;
	    	for(var i=0; i<=response.data.cateday[response.data.cateday.length-1].ml; i++){
	    		html += "<tr id='cd1'><td class='fontsize'>"+response.data.cateday[i].category+"</td>";
	    		for(var j=0; j<(response.data.cateday[response.data.cateday.length-1].ml+1)*11; j++){
	    			if(response.data.cateday[i].category == response.data.cateday[j].category){
	    				html += "<td class='fontsize'>"+response.data.cateday[j].day2+"</td>";
	    				check = j;
	    			}
	    		}
	    		html += "<td class='fontsize'></td></tr>";
	    	}
	    	$("#cateday1").prepend(html);
	    	html = "";
	    	check += 1;
	    	var middlecheck = check;
	    	for(var i=0; i<=response.data.cateday[response.data.cateday.length-1].ml; i++){
	    		html += "<tr id='cd2'><td class='fontsize'>"+response.data.cateday[i].category+"</td>";
	    		for(var j=middlecheck; j<(response.data.cateday[response.data.cateday.length-1].ml+1)*22; j++){
	    			if(response.data.cateday[i].category == response.data.cateday[j].category){
	    				html += "<td class='fontsize'>"+response.data.cateday[j].day2+"</td>";
	    				check = j;
	    			}
	    		}
	    		html += "<td class='fontsize'></td></tr>";
	    	}
	    	$("#cateday2").prepend(html);
	    	html = "";
	    	check += 1;
	    	for(var i=0; i<=response.data.cateday[response.data.cateday.length-1].ml; i++){
	    		html += "<tr id='cd3'><td class='fontsize'>"+response.data.cateday[i].category+"</td>";
	    		if(response.data.cateday[response.data.cateday.length-2].cnt == 30){
	    			for(var j=check; j<(response.data.cateday[response.data.cateday.length-1].ml+1)*32; j++){
		    			if(response.data.cateday[i].category == response.data.cateday[j].category){
		    				if(j >= ((response.data.cateday[response.data.cateday.length-1].ml+1)*32) - (response.data.cateday[response.data.cateday.length-1].ml+1)){
		    					html += "<td class='fontsize'></td>";
								html += "<td class='fontsize'></td>";
		    				}
		    				html += "<td class='fontsize'>"+response.data.cateday[j].day2+"</td>";
		    			}
		    		}
				}
	    		if(response.data.cateday[response.data.cateday.length-2].cnt == 29){
					for(var j=check; j<(response.data.cateday[response.data.cateday.length-1].ml+1)*31; j++){
		    			if(response.data.cateday[i].category == response.data.cateday[j].category){
		    				if(j >= ((response.data.cateday[response.data.cateday.length-1].ml+1)*31) - (response.data.cateday[response.data.cateday.length-1].ml+1)){
		    					html += "<td class='fontsize'></td>";
			    				html += "<td class='fontsize'></td>";
								html += "<td class='fontsize'></td>";
		    				}
		    				html += "<td class='fontsize'>"+response.data.cateday[j].day2+"</td>";
		    			}
		    		}
				}
	    		if(response.data.cateday[response.data.cateday.length-2].cnt == 27){
					for(var j=check; j<(response.data.cateday[response.data.cateday.length-1].ml+1)*29; j++){
		    			if(response.data.cateday[i].category == response.data.cateday[j].category){
		    				if(j >= ((response.data.cateday[response.data.cateday.length-1].ml+1)*29) - (response.data.cateday[response.data.cateday.length-1].ml+1)){
		    					html += "<td class='fontsize'></td>";
								html += "<td class='fontsize'></td>";
			    				html += "<td class='fontsize'></td>";
			    				html += "<td class='fontsize'></td>";
								html += "<td class='fontsize'></td>";
		    				}
		    				html += "<td class='fontsize'>"+response.data.cateday[j].day2+"</td>";
		    			}
		    		}
				}
	    		html += "</tr>";
	    	}
	    	$("#cateday3").prepend(html);
	    	
	    	for(var i=0; i<response.data.cmsum.length; i++){
	    		if(i == response.data.cmsum.length-1){
	    			$("#cmsumd32").text(response.data.cmsum[i].day2);
	    		} else {
	    			$("#cmsumd"+(i+1)).text(response.data.cmsum[i].day2);
	    		}
	    	}
	    	
	    	lencnt = response.data.cateday.length;
	    },
	    error: function( XHR, status, error ){
	       console.error( status + " : " + error );	       
	    }
	});
}