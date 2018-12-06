<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	  
	  <style>
	  	
	  #msg {
      width: 100%;
      line-height: 40px;
      font-size: 14px;
      text-align: center;
    }
	  </style>
	  <script type="text/javascript">
	  var str = '${msg}';
		if(str!=''){
			alert(str);
		}
		//产生验证码
		function createCode(){
			var code = Math.floor(Math.random()*9000+1000);
			//alert(code);
			var span = document.getElementById("codeSpan");
			span.value=code;
			span.innerHTML=code;
			
	        //alert(document.getElementById("codeSpan").value);
			//span.value=code;
		}
		function checkPhone(){
			//获取用户输入的用户名
			var phone = document.getElementById("phone").value;
			//创建校验规则
			var reg = /^1[3,4,5,7,8]\d{9}$/;
			//获取span对象
			var span = document.getElementById("phoneSpan");
			//开始校验
			if(phone==""||phone==null){
				span.innerHTML="手机号不能为空";
				span.style.color="red";
				return false;
			}else if(reg.test(phone)){
				span.innerHTML="";
				return true;
			}else{
				span.innerHTML="手机号不合法";
				span.style.color="red";
				return false;
			}
		}
		 //校验验证码是否输入正确
	    function checkCode(){
	    	//获取用户输入的验证码
	    	var a = document.getElementById("code").value;
	    	//获取随机产生的验证码
	    	var b = document.getElementById("codeSpan").value;
	    	var span = document.getElementById("codespan");
	    	//校验结果
	    	if(a==""||a==null){
	    		span.innerHTML="验证码不能为空";
	    		span.style.color="red";
	            return false;
	    		
	    	}else if(a==b){
	    		span.innerHTML="";
	    		return true;
	    	}else{
	    		span.innerHTML="验证码错误";
	    		span.style.color="red";
	    		return false;
	    	}
	    }
	  //校验提交
	    function checkSub(){
			checkPhone();
			checkCode();
			return checkPhone()&&checkCode();
	    	
	    }
	  </script>
  </head>
  
  <body>
    <div class="jq22-container" style="padding-top:100px">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">找回密码</label>
				<div class="login-form">
					<form action="login_forget" method="post">
					<div >
						<div class="group">
							<label for="user" class="label">手机号</label>
							<input name="phone" type="text" id="phone" class="input" onblur="checkPhone()">
						</div>
						<span id="phoneSpan" style="margin-left: 30px;margin-top: 5px"></span>
						<div class="group">
							<label for="pass" class="label">验证码</label>
							<input name="code" type="text" id="code" placeholder="验证码" class="input" onblur="checkCode()">&nbsp;&nbsp;
							<span id="codespan" style="margin-left: 30px;margin-top: 5px"></span>
							<div>
								<input id="codeSpan" onclick="createCode()" style="background-image: url('images/code.jpg.gif'); font-size: 20px ;"/>
						</div>
						
					</div>
						<div class="group">
							<div class="container">
							    <div id="captcha" style="position: relative" data-type="password"></div>
								<div id="msg"></div>
							</div>
						</div>
						
						<div class="group">
							<input type="submit" class="button" value="下一步">
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>	
	<script src="js/jigsaw.js"></script>

  </body>
</html>
