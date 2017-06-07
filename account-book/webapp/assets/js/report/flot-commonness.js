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
	$.ajax( {
	    url : "/account-book/"+currentid+"/table",
	    type: "POST",
	    dataType: "JSON",
	    data: JSON.stringify(obj3),
	    contentType: "application/json; charset=UTF-8",
	    success: function( response ){
	    	$("#dated1").text(response.data.date.d1);
	    	$("#dated2").text(response.data.date.d2);
	    	$("#dated3").text(response.data.date.d3);
	    	$("#dated4").text(response.data.date.d4);
	    	$("#dated5").text(response.data.date.d5);
	    	$("#dated6").text(response.data.date.d6);
	    	$("#dated7").text(response.data.date.d7);
	    	$("#dated8").text(response.data.date.d8);
	    	$("#dated9").text(response.data.date.d9);
	    	$("#dated10").text(response.data.date.d10);
	    	$("#dated11").text(response.data.date.d11);
	    	$("#dated12").text(response.data.date.d12);
	    	$("#dated13").text(response.data.date.d13);
	    	$("#dated14").text(response.data.date.d14);
	    	$("#dated15").text(response.data.date.d15);
	    	$("#dated16").text(response.data.date.d16);
	    	$("#dated17").text(response.data.date.d17);
	    	$("#dated18").text(response.data.date.d18);
	    	$("#dated19").text(response.data.date.d19);
	    	$("#dated20").text(response.data.date.d20);
	    	$("#dated21").text(response.data.date.d21);
	    	$("#dated22").text(response.data.date.d22);
	    	$("#dated23").text(response.data.date.d23);
	    	$("#dated24").text(response.data.date.d24);
	    	$("#dated25").text(response.data.date.d25);
	    	$("#dated26").text(response.data.date.d26);
	    	$("#dated27").text(response.data.date.d27);
	    	$("#dated28").text(response.data.date.d28);
	    	$("#dated29").text(response.data.date.d29);
	    	$("#dated30").text(response.data.date.d30);
	    	$("#dated31").text(response.data.date.d31);
	    	
	    	var html = "";
	    	for(var i=0; i<lencnt; i++){
	    		$("#cd1").remove();
	    		$("#cd2").remove();
	    		$("#cd3").remove();
	    	}
	    	
	    	for(var i=0; i<response.data.cateday.length; i++){
	    		html += "<tr id='cd1'><td class='fontsize'>"+response.data.cateday[i].category+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d1+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d2+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d3+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d4+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d5+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d6+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d7+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d8+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d9+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d10+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d11+"</td>";
	    		html += "<td class='fontsize'></td></tr>";
	    	}
	    	$("#cateday1").prepend(html);
	    	html = "";
	    	for(var i=0; i<response.data.cateday.length; i++){
	    		html += "<tr id='cd2'><td class='fontsize'>"+response.data.cateday[i].category+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d12+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d13+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d14+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d15+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d16+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d17+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d18+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d19+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d20+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d21+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d22+"</td>";
	    		html += "<td class='fontsize'></td></tr>";
	    	}
	    	$("#cateday2").prepend(html);
	    	html = "";
	    	for(var i=0; i<response.data.cateday.length; i++){
	    		html += "<tr id='cd3'><td class='fontsize'>"+response.data.cateday[i].category+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d23+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d24+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d25+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d26+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d27+"</td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].d28+"</td>";
	    		if(response.data.cateday[i].d29 == undefined){
	    			html += "<td class='fontsize'></td>";
			    	html += "<td class='fontsize'></td>";
	    		} else {
	    			html += "<td class='fontsize'>"+response.data.cateday[i].d29+"</td>";
		    		html += "<td class='fontsize'>"+response.data.cateday[i].d30+"</td>";
	    		}
	    		if(response.data.cateday[i].d31 == undefined){
	    			html += "<td class='fontsize'></td>";
	    		} else {
	    			html += "<td class='fontsize'>"+response.data.cateday[i].d31+"</td>";
	    		}
	    		html += "<td class='fontsize'></td>";
	    		html += "<td class='fontsize'></td>";
	    		html += "<td class='fontsize'>"+response.data.cateday[i].sumresult+"</td></tr>";
	    	}
	    	$("#cateday3").prepend(html);
	    	
	    	$("#cmsumd1").text(response.data.cmsum.d1);
	    	$("#cmsumd2").text(response.data.cmsum.d2);
	    	$("#cmsumd3").text(response.data.cmsum.d3);
	    	$("#cmsumd4").text(response.data.cmsum.d4);
	    	$("#cmsumd5").text(response.data.cmsum.d5);
	    	$("#cmsumd6").text(response.data.cmsum.d6);
	    	$("#cmsumd7").text(response.data.cmsum.d7);
	    	$("#cmsumd8").text(response.data.cmsum.d8);
	    	$("#cmsumd9").text(response.data.cmsum.d9);
	    	$("#cmsumd10").text(response.data.cmsum.d10);
	    	$("#cmsumd11").text(response.data.cmsum.d11);
	    	$("#cmsumd12").text(response.data.cmsum.d12);
	    	$("#cmsumd13").text(response.data.cmsum.d13);
	    	$("#cmsumd14").text(response.data.cmsum.d14);
	    	$("#cmsumd15").text(response.data.cmsum.d15);
	    	$("#cmsumd16").text(response.data.cmsum.d16);
	    	$("#cmsumd17").text(response.data.cmsum.d17);
	    	$("#cmsumd18").text(response.data.cmsum.d18);
	    	$("#cmsumd19").text(response.data.cmsum.d19);
	    	$("#cmsumd20").text(response.data.cmsum.d20);
	    	$("#cmsumd21").text(response.data.cmsum.d21);
	    	$("#cmsumd22").text(response.data.cmsum.d22);
	    	$("#cmsumd23").text(response.data.cmsum.d23);
	    	$("#cmsumd24").text(response.data.cmsum.d24);
	    	$("#cmsumd25").text(response.data.cmsum.d25);
	    	$("#cmsumd26").text(response.data.cmsum.d26);
	    	$("#cmsumd27").text(response.data.cmsum.d27);
	    	$("#cmsumd28").text(response.data.cmsum.d28);
	    	$("#cmsumd29").text(response.data.cmsum.d29);
	    	$("#cmsumd30").text(response.data.cmsum.d30);
	    	$("#cmsumd31").text(response.data.cmsum.d31);
	    	$("#cmsumresult").text(response.data.cmsum.sumresult);
	    	
	    	lencnt = response.data.cateday.length;
	    },
	    error: function( XHR, status, error ){
	       console.error( status + " : " + error );	       
	    }
	});
}