<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	 var str = '${msg}';
		if(str!=''){
			alert(str);
		}

	//验证用户名
	function checkName(){
	//获取用户输入的名字
	var password = document.getElementById("username").value;
	//获取span对象
	var span = document.getElementById("nameSpan");
	//开始校验
	if(password==""||password==null){
		span.innerHTML="用户名不能为空";
		span.style.color="red";
		return false;
	}else {
		span.innerHTML="";
		//span.style.color="green";
		return true;
	}
}
	//验证手机号
	function checkPhone(){
	//获取用户输入的手机号
	var password = document.getElementById("phone").value;
	//创建校验规则
	var reg = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
	//获取span对象
	var span = document.getElementById("phoneSpan");
	//开始校验
	if(password==""||password==null){
		span.innerHTML="手机号不能为空";
		span.style.color="red";
		return false;
	}else if(reg.test(password)){
		span.innerHTML="";
		//span.style.color="green";
		return true;
	}else{
		span.innerHTML="手机号不合法";
		span.style.color="red";
		return false;
	}
}
	//验证年龄
	function checkAge(){
	//获取用户输入的年龄
	var password = document.getElementById("age").value;
	//获取span对象
	var span = document.getElementById("ageSpan");
	//开始校验
	if(password==""||password==null){
		span.innerHTML="年龄不能为空";
		span.style.color="red";
		return false;
	}else {
		span.innerHTML="";
	//	span.style.color="green";
		return true;
	}
}
	//验证邮箱
	function checkEmail(){
	//获取用户输入的邮箱
	var password = document.getElementById("email").value;
	//创建校验规则
	var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
	//获取span对象
	var span = document.getElementById("emailSpan");
	//开始校验
	if(password==""||password==null){
		span.innerHTML="邮箱不能为空";
		span.style.color="red";
		return false;
	}else if(reg.test(password)){
		span.innerHTML="";
		//span.style.color="green";
		return true;
	}else{
		span.innerHTML="邮箱不合法";
		span.style.color="red";
		return false;
	}
}
	//验证住址
	function checkUaddress(){
	//获取用户输入的住址
	var password = document.getElementById("uaddress").value;
	//获取span对象
	var span = document.getElementById("uaddressSpan");
	//开始校验
	if(password==""||password==null){
		span.innerHTML="住址不能为空";
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
		var flag_phone = checkPhone(); 
		var flag_age = checkAge();
		//var flag_email = checkEmail();
		var flag_uaddress = checkUaddress();
		if (flag_username==true&&flag_phone==true&&flag_age==true&&flag_uaddress==true) {
			return true; 
			} else { 
				return false; 
				} 
		}
	
</script>

  </head>
  
  <body>
    <div class="content">
  <div class="width1190">
   <jsp:include page="left_menu.jsp"></jsp:include>
    <div class="vip-right">
     <h2 class="vipright-title">个人资料修改</h2>

     
     <h3 class="vipright-title">完善资料</h3>
  <form action="login_updateById" method="post" onsubmit="return checkForm()"> 
     <table class="grinfo">
        <tbody>
       <%--  <input type="hidden" id="userid" name="user.userid"  value="${ user.userid}"/>
        <input type="hidden" id="password" name="user.password"  value="${ user.password}"/> --%>
        <tr>
        <th>&nbsp;邮 &nbsp; &nbsp;箱：</th>
        <td> 
          <strong>${user.email}</strong>
        </td>
        </tr>
        <tr>
        <th>真实姓名：</th>
        <td> 
      <input type="text" id="username" name="user.username" value="${ user.username}" onblur="checkName()"/>
        </td>
         <td width="27%"><span id="nameSpan"></span></td>
        </tr>
         <tr>
        <th>联系方式：</th>
        <td>
        <input class="inp inw" type="text" id="phone" name="user.phone" value="${ user.phone}" onblur="checkPhone()" maxlength="14">
        </td>
        <td width="27%"><span id="phoneSpan"></span></td>
        </tr>
        <tr>
        <th>性 &nbsp; &nbsp;别：</th>
        <td>
        
        <input type="radio" value="女" id="rbSex1" name="user.sex" <c:if test="${user.sex== '女'}"> checked="checked" </c:if>>
        <label for="rbSex2">女</label>
          
         
        <input type="radio" value="男" id="rbSex2" name="user.sex"  <c:if test="${user.sex== '男' || user.sex==null}"> checked="checked"  </c:if>>
        <label for="rbSex2">男</label>
        
        <span id="Sex_Tip"></span>
        </td>
        </tr>
        <tr>
        <th>年 &nbsp; &nbsp;龄：</th>
        <td>
        <input class="inp inw" type="text" id="age" name="user.age" value="${ user.age}" onblur="checkAge()">
        </td>
            <td width="27%"><span id="ageSpan"></span></td>
        </tr>
        <%-- <tr>
        <th>&nbsp;邮 &nbsp; &nbsp;箱：</th>
        <td>
        <input class="inp inw" type="text" id="email" name="user.email" value="${ user.email}" onblur="checkEmail()">
        </td>
            <td width="27%"><span id="emailSpan"></span></td>
        </tr> --%>
        <tr>
        <th>&nbsp;住 &nbsp; &nbsp;址：</th>
        <td>
        <input class="inp inw" type="text" maxlength="15" id="uaddress" name="user.uaddress" value="${ user.uaddress}" onblur="checkUaddress()">
        </td>
            <td width="27%"><span id="uaddressSpan"></span></td>
        </tr>
          <tr>
        <th>&nbsp;职 &nbsp; &nbsp;业：</th>
        <td>
        <input class="inp inw" type="text" maxlength="15" id="profession" name="user.profession" value="${ user.profession}">
        </td>
        </tr>
        <tr>
       <%--  <input type="hidden" id="powerid" name="user.powerid"  value="${ user.powerid}"/>
          <input type="hidden" id="headimage" name="user.headimage"  value="${ user.headimage}"/> --%>
        <th>&nbsp;</th>
        <td colspan="2">
        <label class="butt" id="butt">
        <input type="submit" class="member_mod_buttom" value="提交" />
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
