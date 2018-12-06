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
	 
	 //判断密码
function checkPwd(){
	//获取用户输入的密码
	var password = document.getElementById("password").value;
	//创建校验规则
	var reg = /^[a-z]\w{5,7}$/;
	//获取span对象
	var span = document.getElementById("passwordSpan");
	//开始校验
	if(password==""||password==null){
		span.innerHTML="密码不能为空";
		span.style.color="red";
		return false;
	}else if(reg.test(password)){
		span.innerHTML="";
		//span.style.color="green";
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
	var password = document.getElementById("password").value;
	var newpwd = document.getElementById("newpwd").value;
	var span = document.getElementById("newpwdSpan");
	if(newpwd==""||newpwd==null){
		span.innerHTML="确认密码不能为空";
		span.style.color="red";
		return false;
	}else if(password==newpwd){
		span.innerHTML="确认密码OK";
		span.style.color="green";
		return true;
	}else{
		span.innerHTML="前后两次密码不一致";
		span.style.color="red";
		return false;
	}
}
function checkSub(){	
	checkPwd();
	checkPwd2();
	return checkPwd()&&checkPwd2();
	
}
</script>
  </head>
  
  <body>
 <div class="content">
  <div class="width1190">
  <jsp:include page="left_menu.jsp"></jsp:include>
    <div class="vip-right">
     <h3 class="vipright-title">修改资料</h3>
     <form action="login_updateupwd2" method="post" onsubmit="return checkSub()">
     <table class="grinfo">
      <tbody>
        <tr>
        <th>当前手机号：</th>
        <td> <strong>${user.phone }</strong></td>
        </tr>
       
        <tr>
        <th>新密码：</th>
        <td>
        <input name="user.password" type="password" id="password" onblur="checkPwd()" placeholder="以字母开头,长度在6~18"/>
        <td width="27%"><span id="passwordSpan"></span></td>
        </td>
        </tr>
        <tr>
        <th>重复新密码：</th>
        <td>
       <input name="newpwd" type="password" id="newpwd" onblur="checkPwd2()"/>
        </td>
        <td width="27%"><span id="newpwdSpan"></span></td>
        </tr>
        <tr>
        <th>&nbsp;</th>
        <td colspan="2">
        <label class="butt" id="butt">
       
        <input type="submit" value="完成修改"/>
       
        </label>
        </td>
        </tr>
        </tbody>
     </table>
     </form>
    </div><!--vip-right/-->
    <div class="clearfix"></div>
  </div><!--width1190/-->
 </div><!--content/-->
  <jsp:include page="footer.jsp"></jsp:include>  
  </body>
</html>
