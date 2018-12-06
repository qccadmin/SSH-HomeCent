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
var str='${msg}';
if(str!=''){
	alert(str);
}
//判断密码
function checkPwd(){
	//获取用户输入的密码
	var pwd = document.getElementById("password").value;
	//创建校验规则
	var reg = /^[a-z]\w{5,7}$/;
	//获取span对象
	var span = document.getElementById("pwdSpan");
	//开始校验
	if(pwd==""||pwd==null){
		span.innerHTML="密码不能为空";
		span.style.color="red";
		return false;
	}else if(reg.test(pwd)){
		span.innerHTML="OK";
		span.style.color="green";
		return true;
	}else{
		span.innerHTML="密码不合法";
		span.style.color="red";
		return false;
	}
	checkPwd2();
}
//确认密码
function checkPwd2(){
	var pwd = document.getElementById("password").value;
	var pwd2 = document.getElementById("pwd2").value;
	var span = document.getElementById("pwd2Span");
	if(pwd2==""||pwd2==null){
		span.innerHTML="确认密码不能为空";
		span.style.color="red";
		return false;
	}else if(pwd==pwd2){
		span.innerHTML="OK";
		span.style.color="green";
		return true;
	}else{
		span.innerHTML="前后两次密码不一致";
		span.style.color="red";
		return false;
	}
}
//校验提交
function checkSub(){
	checkPwd();
	checkPwd2();
	return checkPwd()&&checkPwd2();
	
}
</script>
  </head>
  
  <body>
    <div class="jq22-container" style="padding-top:100px">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">重置密码</label>
				<div class="login-form">
					<form action="login_updateupwd" method="post">
					<div >
					<input id="phone" name="phone" type="hidden" value="${phone }"/>
						<div class="group">
							<label for="user" class="label">新密码</label>
							<input type="password" name="password" id="password" class="input" onblur="checkPwd()"/>
						</div>
						<span id="pwdSpan" style="margin-left: 30px;margin-top: 5px"></span>
						<div class="group">
							<label for="pass" class="label">确认密码</label>
							<input type="password" name="pwd2" id="pwd2" value="" class="input" onblur="checkPwd2()"/>
					</div>
							<span id="pwd2Span" style="margin-left: 30px;margin-top: 5px"></span>
						<div class="group">
							<div class="container">
							    <div id="captcha" style="position: relative" data-type="password"></div>
								<div id="msg"></div>
							</div>
						</div>
						
						<div class="group">
							<input type="submit" class="button" value="确定">
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>	
	<script src="js/jigsaw.js"></script>
  </body>
</html>
