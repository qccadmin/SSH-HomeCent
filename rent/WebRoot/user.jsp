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
<script type="text/javascript">
 $(function(){
	 //导航定位
	 $(".nav li:eq(6)").addClass("navCur");
	 })
	 var str = '${msg}';
		if(str!=''){
			alert(str);
		}
		
</script>

  </head>
  
  <body>
 <div class="content">
  <div class="width1190">
   <jsp:include page="left_menu.jsp"></jsp:include>
    <div class="vip-right">
     <h2 class="vipright-title">个人资料修改</h2>
     <h3 class="vipright-title">上传头像</h3>
    
    
     <dl class="vip-touxiang">
      <dt>
      <img src="${user.headimage }" width="100" height="100" id="pic"/>
      </dt>
      <dd>
       <form id="form1"  action="updateimage" method="post" enctype="multipart/form-data">
       <input type="file" name="myfile"/><br>
       <input type="submit" value="上传">
       </form>
       <!-- <input type="submit" value="上传"/> 
       <button onclick="submit()">上传</button>-->
       <p>图片格式：GIF、JPG、JPEG、PNG ，最适合尺寸100*100像素</p>
       
      </dd>
      <div class="clearfix"></div>
     </dl>
    </div>
    
    <div class="clearfix"></div>
  </div>
 </div>
  <jsp:include page="footer.jsp"></jsp:include>  
  </body>
</html>
