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
	<title>邻居大妈</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
 $(function(){
	 //导航定位
	 $(".nav li:eq(6)").addClass("navCur");
	 })
</script>

  </head>
  
  <body>
   <jsp:include page="header.jsp"></jsp:include>
 <div class="content">
  <div class="width1190">
   <div class="reg-logo">
   <form id="signupForm" method="post" action="" class="zcform">
        <p class="clearfix">
        	<label class="one" for="agent">用户名：</label>
        	<input id="agent" name="agent" type="text" class="required" value placeholder="请输入您的用户名" />
        </p>
        
        <p class="clearfix">
         	<label class="one"  for="password">登录密码：</label>
        	<input id="password" name="password" type="password" class="{required:true,rangelength:[8,20],}" value placeholder="请输入密码" />
        </p>
        <p class="clearfix">
        	<label class="one" for="confirm_password">确认密码：</label>
        	<input id="confirm_password" name="confirm_password" type="password" class="{required:true,equalTo:'#password'}" value placeholder="请再次输入密码" />
        </p>
        <!--<p class="clearfix agreement">
        	<input type="checkbox" />
            <b class="left">已阅读并同意<a href="#">《用户协议》</a></b>
        </p>-->
       	<p class="clearfix"><input class="submit" type="submit" value="立即注册"/></p>  
    </form>
    <div class="reg-logo-right">
     <h3>如果您已有账号，请</h3>
     <a href="login.jsp" class="logo-a">立即登录</a>
    </div><!--reg-logo-right/-->
    <div class="clears"></div>
  </div><!--reg-logo/-->
  </div><!--width1190/-->
 </div><!--content/-->
 
 <jsp:include page="footer.jsp"></jsp:include>
 
  </body>
</html>
