<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>邻居大妈</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<style type="text/css">
#myimage{
   padding-left: 70px;
}

</style>
<script type="text/javascript">
 $(function(){
	 //导航定位
	 $(".nav li:eq(5)").addClass("navCur");
	 })
	  var str = '${msg}';
		if(str!=''){
			alert(str);
		}

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
		//验证年龄
		function checkAge(){
		//获取用户输入的年龄
		var age = document.getElementById("age").value;
		//创建校验规则
		var reg = /^(1[3-9])|([2-9]\d)$/;
		//获取span对象
		var span = document.getElementById("ageSpan");
		//开始校验
		if(age==""||age==null){
			span.innerHTML="年龄不能为空";
			span.style.color="red";
			return false;
		}else if(reg.test(age)){
			span.innerHTML="";
			//span.style.color="green";
			return true;
		}else{
			span.innerHTML="年龄不合法";
			span.style.color="red";
			return false;
		}
	}
		//验证邮箱
		function checkPhone(){
		//获取用户输入的邮箱
		var email = document.getElementById("phone").value;
		//创建校验规则
		var reg = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
		//获取span对象
		var span = document.getElementById("phoneSpan");
		//开始校验
		if(email==""||email==null){
			span.innerHTML="手机号不能为空";
			span.style.color="red";
			return false;
		}else if(reg.test(email)){
			span.innerHTML="";
			//span.style.color="green";
			return true;
		}else{
			span.innerHTML="手机号不合法";
			span.style.color="red";
			return false;
		}
	}

		//验证服务商圈
		function checkRegion(){
		//获取用户输入的名字
		var regionname = document.getElementById("bee_county1").value;
		//获取span对象
		var span = document.getElementById("regionnameSpan");
		//开始校验
		if(regionname==""||regionname==null){
			span.innerHTML="服务商圈不能为空";
			span.style.color="red";
			return false;
		}else {
			span.innerHTML="";
			//span.style.color="green";
			return true;
		}
	}
		//验证住址
		function checkUaddress(){
		//获取用户输入的住址
		var address = document.getElementById("uaddress").value;
		//获取span对象
		var span = document.getElementById("uaddressSpan");
		//开始校验
		if(address==""||address==null){
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
			var flag_uaddress = checkUaddress();
			var flag_username = checkName(); 
			var flag_region = checkRegion(); 
			var flag_age = checkAge();
			var flag_phone = checkPhone();
			if (flag_username==true&&flag_region==true&&flag_age==true&&flag_phone==true&&flag_uaddress==true) {
				return true; 
				} else { 
					return false; 
					} 
			}
</script>
<script type="text/javascript">
/* 动态设置Select的默认值 */
    var name="思明区";
	document.getElementsByName("regionname")[0].value=name;
</script>
  </head>
  
  <body>
 <div class="content">
  <div class="width1190">
  <jsp:include page="left_menu.jsp"></jsp:include>
    <div class="vip-right">
     <h3 class="vipright-title">申请社区自由经纪人</h3>
     <form action="login_shenqing2" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
    <div id="myimage">
      <img src="${user.headimage }" width="100" height="100" />
      </div>
      <!-- <dd>
       
        <input type="file" name="myfile"/><br><br>
       <p>图片格式：GIF、JPG、JPEG、PNG ，最适合尺寸100*100像素</p>
      </dd> -->
      <div class="clearfix"></div>
     </dl><!--vip-touxiang/-->
     <table class="grinfo">
        <tbody>
        
        <tr>
        <th>邮&nbsp;&nbsp;箱：：</th>
        <td> <strong>${user.email}</strong>
        </td>
        </tr>
        <tr>
        <th> 当前权限：</th>
        <td> <strong>${user.powerid.role}</strong>
        </td>
        </tr>
      
        <tr>
        <th><span class="red">*</span> 真实姓名：</th>
        <td>
        <input class="inp inw" type="text" id="username" name="user.username" value="${user.username }" maxlength="14" onblur="checkName()" >
         <span id="nameSpan"></span>
        </td>
        </tr>
       
        <tr>
        <th><span class="red">*</span> 年&nbsp;&nbsp;龄：</th>
        <td>
        <input class="inp inw" type="text" id="age" name="user.age" value="${user.age }" maxlength="14" onblur="checkAge()" >
       <span id="ageSpan">年龄在13-99之间</span>
        </td>
        </tr>
        <tr>
        <th><span class="red">*</span> 联系方式：</th>
        <td>
        <input class="inp inw" type="text" id="phone" name="user.phone" value="${user.phone }" onblur="checkPhone()">
        <span id="phoneSpan">请输入11位手机号</span>
        </td>
        </tr>
           
        <tr>
        <th><span class="red">*</span> 性 &nbsp; &nbsp;别：</th>
        <td>
        <input type="radio" value="女" id="rbSex1" name="user.sex" <c:if test="${user.sex== '女'}"> checked="checked" </c:if>>
        <label for="rbSex2">女</label>
          
         
        <input type="radio" value="男" id="rbSex2" name="user.sex"  <c:if test="${user.sex== '男' || user.sex==null}"> checked="checked"  </c:if>>
        <label for="rbSex2">男</label>
        <span id="Sex_Tip"></span>
        </td>
        </tr>
        <tr>
        <th><span class="red">*</span> 显示个人电话：</th>
        <td>
        <input type="radio" value="1" id="rbShowtel1" name="is_showtel" checked="">
        <label for="rbShowtel1">是</label>
        <input type="radio" value="0" id="rbShowtel2" name="is_showtel">
        <label for="rbShowtel2">否</label><br>
        
        （是否允许前台显示个人电话，如果不允许我们将为你提供400转接服务）
        </td>
        </tr>
        <tr>
        <th><span class="red">*</span> 选择服务商圈：</th>
        <td>
        <div id="bee_countys1">
        <select id="bee_county1" name="regionname" multiple="multiple" size="2" onblur="checkRegion()" >
        <c:forEach items="${regionlist }" var="re">
        
        <option value="${re.regionname}">${re.regionname }</option>
       </c:forEach>
        </select>
          <span id="regionnameSpan">可以多选</span>
        <script>mod_street($('#bee_county1').val(),'1','');</script>
        </div>
        </td>
        </tr>
        <tr>
        <th><span class="red">*</span>填写服务区域：</th>
        <td>
        <input type="text" id="uaddress" name="user.uaddress" value="${user.uaddress }" onblur="checkUaddress()" >
        <span id="uaddressSpan"></span>
        </td>
        </tr>
        <tr>
        <th>&nbsp;</th>
        <td colspan="2">
        <label class="butt" id="butt">
      
        <input id="s1" type="submit" value="提交申请" />
     
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
