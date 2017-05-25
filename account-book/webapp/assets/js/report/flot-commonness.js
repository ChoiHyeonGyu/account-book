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