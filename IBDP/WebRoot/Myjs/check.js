function checkR()
{	
 var f=document.getElementById("Rfile").value;
 
 var f_type=f.substring(f.lastIndexOf("."));
 //alert(f_type);
 //alert(v.getAttribute("type")+","+(v.getAttribute("type")!="checkbox")+","+v.value);
 if ((f_type!=".R")&&(f_type!=".r"))
  {
   alert("R程序必须为.R文件！");
   return false;
  }
 
  return true;
}
function mysubmitcheck()
{	
 for(var i=0;i<document.forms[0].elements.length-2;i++)
 { 
  var v=document.forms[0].elements[i];
  
 if ((v.getAttribute("type")!="checkbox"))	
 {
 //alert(v.getAttribute("type")+","+(v.getAttribute("type")!="checkbox")+","+v.value);
 if (v.value=="")
  {
   alert("表单内不能存在空项");
   return false;
  }
 }
 }
  return true;
}
function checkemail()
{

$("#error").css("display", "none");  
    var email = $.trim($("#email").val());  
    var error = "<label id=\"error\" class=\"validate_input_error\" style=\"color:red\">请正确填写电话号码，例如:13511111111或010-11111111</label>";  
    //如果为1开头则验证手机号码  
    if(!email.test (/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/))
    {
    	 $("#email").after(error);  
         $("#email").focus();  
         return false;  
    }  
   
    return true;  

}