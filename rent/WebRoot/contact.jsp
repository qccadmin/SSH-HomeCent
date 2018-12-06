<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<title>邻居大妈</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
   <div class="contleft">
    <ul class="leftNav">
     <li><a href="about_queryInfo">关于我们</a></li>
     <li class="leftNavCur"><a href="about_queryInformation">联系我们</a></li>
    </ul><!--leftNav/-->
   </div><!--contleft/-->
   <div class="contright">
    <h2 class="rightat">联系我们</h2>
        <h4 class="rightat">QQ:1192408431</h4>
        <h4 class="rightat">Email:1192408431@qq.com</h4>
        <h4 class="rightat">客服电话:1010-9666</h4>
        <h4 class="rightat">公司传真:86-21-54744803</h4>
    <div class="about">
     <img src="images/about.jpg" /><br />
    </div>
   </div><!--contright/-->
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--content/-->
 

<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
