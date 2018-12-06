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
		<title>用户登录注册界面</title>
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
    //验证用户名
		function checkName(){
		//获取用户输入的名字
		var name = document.getElementById("username").value;
		//获取span对象
		var span = document.getElementById("nameSpan");
		//开始校验
		if(name==""||name==null){
			span.innerHTML="用户名不能为空";
			span.style.color="red";
			return false;
		}else {
			span.innerHTML="";
			//span.style.color="green";
			return true;
		}
	}
		//验证密码
		function checkPassword(){
		//获取用户输入的名字
		var password = document.getElementById("password").value;
		//获取span对象
		var span = document.getElementById("passwordSpan");
		//开始校验
		if(password==""||password==null){
			span.innerHTML="密码不能为空";
			span.style.color="red";
			return false;
		}else {
			span.innerHTML="";
			//span.style.color="green";
			return true;
		}
	}
		function checkForm() { 
			var flag_username = checkName(); 
			var flag_password = checkPassword(); 
			if (flag_username==true&&flag_password==true) {
				return true; 
				} else { 
					return false; 
					} 
			}
		
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
        		 $.post("login_email",{email:email},function(data){
        			 $('#checkmail').html(data);
        			/*  document.getElementById("checkmail").innerHTML="该邮箱已存在"; */
        			//var str="邮箱已存在";
     	        	/* alert(data);
     	        	if(console.log(str.indexOf("已存在") != -1 )){
     	        		document.getElementById("checkmail").style.color="green";//设置邮箱可用是的字体颜色
     	        		document.getElementById("checkmail").innerHTML="邮箱合法";
     	        		return true; 
     	        	}else{
     	        		document.getElementById("checkmail").style.color="red";
     		    		document.getElementById("checkmail").innerHTML="该邮箱已存在";
     		    		document.getElementById("myemail").focus();
     		    	    return false; 
     	        	} */
     	        	
     	        });
        		 return true;
    			}
    		else
        	{
    			document.getElementById("checkmail").style.color="red";//设置邮箱不可用时的字体颜色
    			document.getElementById("checkmail").innerHTML="请输入正确的邮箱";
    			document.getElementById("myemail").focus();
    			return false;
    			//alert("邮箱格式不正确！");
    		}
	       
	       // alert(email);
	    	
	    	
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

	  //验证密码
		function checkPassword2(){
		//获取用户输入的名字
		var password = document.getElementById("password2").value;
		//获取span对象
		var span = document.getElementById("passwordSpan2");
		//开始校验
		if(password==""||password==null){
			span.innerHTML="密码不能为空";
			span.style.color="red";
			return false;
		}else {
			span.innerHTML="";
			//span.style.color="green";
			return true;
		}
	}
		//验证滑块
		/* function checkCaptcha(){
		//获取用户输入的名字
		var captcha = document.getElementById("captcha");
		//alert(captcha);
		//获取span对象
		var span = document.getElementById("msg");
		//开始校验
		if(captcha!=""||captcha!=null){
			span.innerHTML="核对失败";
			span.style.color="green";
			return false;
		}else {
			span.innerHTML="";
			//span.style.color="green";
			return true;
		}
		
	} */
		function checkForm2() { 
			var flag_username = checkName(); 
			var flag_password = checkPassword2(); 
			var flag_StrLong = checkStrLong(); 
			if (flag_username==true&&flag_password==true&&flag_StrLong==true) {
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
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
				<div class="login-form">
					<form action="login_login" method="post" onsubmit="return checkForm()">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">用户名或邮箱</label>
							<input id="username" name="username"  type="text" class="input" onblur="checkName()">
							<span id="nameSpan" class="label"></span>
							
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="password"  name="password" type="password" class="input" data-type="password" onblur="checkPassword()">
							<span id="passwordSpan" class="label"></span>
						</div>
						<div class="group">
							<div class="container">
							    <div id="captcha" style="position: relative" data-type="password"></div>
								<div id="msg"></div>
							</div>
						</div>
						<!-- 
						<div class="group">
							<input id="check" type="checkbox" class="check" checked>
							<label for="check"><span class="icon"></span> 保持登录</label>
						</div>
						 -->						
						<div class="group">
							<input type="submit" class="button" value="登录">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="forgetUpwd2.jsp">忘记密码?</a>
						</div>
					</div>
					</form>
					<form action="login_register" method="post" onsubmit="return checkForm2()">
					<div class="sign-up-htm">
						<div class="group">
							<label for="pass" class="label">邮箱地址</label>
							<input id="myemail" name="email" type="text" class="input" onblur="isEmail()">
							<span id="checkmail"> </span>
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="password2" name="password" type="password" class="input" data-type="password" onblur="checkPassword2()">
						    <span id="passwordSpan"> </span>
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
							<input type="submit" class="button" value="注册">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-1">已有账号?</a>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>	

<script>
var str='${msg}';
if(str!=''){
	alert(str);
}
 	 jigsaw.init(document.getElementById('captcha'), function () {
 		document.getElementById('msg').innerHTML = '核对成功！' 
  })
</script>
  </body>
</html>
