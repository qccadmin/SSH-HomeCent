<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<title>找回密码</title>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	  <link rel="stylesheet" href="css/jigsaw.css">
	  	<script src="js/jigsaw.js"></script>
	<script src="js/jquery.js"></script>
	  <style>
	  	
	  #msg {
      width: 100%;
      line-height: 40px;
      font-size: 14px;
      text-align: center;
    }
	  </style>
      <style type="text/css">
           body{

   background:url(images/background.jpg)  no-repeat center center;

   background-size:cover;

   background-attachment:fixed;

   background-color:#CCCCCC;

}
      </style>
      <script type="text/javascript">

		//验证邮箱格式
	    function isEmail() 
	    {
	        var email=document.getElementById("myemail").value;
	        if(email=="")
	    	{
	    		//alert("请输入邮箱！");
	    		document.getElementById("checkmail").style.color="red";
	    		document.getElementById("checkmail").innerHTML="请输入邮箱";
	    	    document.getElementById("myemail").focus();
	    	    return false; 
	    	}
	        var pattern= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/;
    		strEmail=pattern.test(email);
        	if (strEmail)
           		{ 
        		 $.post("login_email2",{email:email},function(data){
        			 $('#checkmail').html(data);
     	        });
        		 return true;
    			}
    		else
        	{
    			document.getElementById("checkmail").style.color="red";//设置邮箱不可用时的字体颜色
    			document.getElementById("checkmail").innerHTML="邮箱格式不合法";
    			document.getElementById("myemail").focus();
    			return false;
    			//alert("邮箱格式不正确！");
    		}
	       }  
	    function checkStrLong() {
            var vstr = document.getElementById("email2").value;
            if(vstr==""){
            	document.getElementById("checkcode").style.color="red";
                document.getElementById("checkcode").innerHTML="请输入验证码";
                return false;
            }
            if (vstr.length <6) {       
            	document.getElementById("checkcode").style.color="red";
                document.getElementById("checkcode").innerHTML="验证码必须是6位";
                return false;
                //document.getElementById("verificationCode").focus();
            }else{
            	document.getElementById("checkcode").innerHTML="";
            	return true;
            
            }
        }
		function checkForm2() { 
			var flag_email = isEmail(); 
			var flag_StrLong = checkStrLong(); 
			if (flag_email==true&&flag_StrLong==true) {
				return true; 
				} else { 
					return false; 
					} 
			}
		
      </script>
      
       <script type="text/javascript">
    var countdown=60;
    function send(obj){
    	if(isEmail()&&countdown==60){
    		var email=document.getElementById("myemail").value;
    		//alert(email);
    		$.post("login_verifyEmail",{email:email},function(data){
    			alert(data);
    			if(data.cunt!=""){
    				layer.alert('验证码已发送！',{ title: '提示框', icon:0, });
    			}else{
    				layer.alert('验证码发送失败！',{ title: '提示框', icon:0, });
    			} 
    			
    		});
    	}
       if(isEmail()){
    	   
    		if (countdown == 0) {
                obj.removeAttribute("disabled");    
                obj.value="获取验证码";
                countdown = 60;
                return;
            } else {
                obj.setAttribute("disabled", true);
                obj.value="重新发送(" + countdown + ")";
                countdown--;
                setTimeout(function() {send(obj) },1000);
            }
    		
    	}
    }       
    
    </script>
  </head>
  
  <body>
    <div class="jq22-container" style="padding-top:100px">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-2" type="radio" name="tab" class="sign-up" checked><label for="tab-2" class="tab">找回密码</label>
				<div class="login-form">
					<form action="login_forget2" method="post" onsubmit="return checkForm2()">
					<div class="sign-up-htm">
						<div class="group">
							<label for="pass" class="label">邮箱地址</label>
							<input id="myemail" name="email" type="text" class="input" onblur="isEmail()">
							<span id="checkmail"> </span>
						</div>
						<div class="group">
							<label for="pass" class="label">邮箱验证码</label>
							<input id="email2"  name="email2" type="text" class="input" onblur="checkStrLong()">
							<span id="checkcode"> </span>
						</div>
						<div class="group">
							<input type="button" class="button" value="获取邮箱验证码" onclick="send(this)">
						</div>
						<div class="group">
							<input type="submit" class="button" value="下一步">
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
