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