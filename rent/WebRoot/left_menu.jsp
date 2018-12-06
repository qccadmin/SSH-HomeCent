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
	 $(".nav li:eq(5)").addClass("navCur");
	 })
	 
</script>
<style type="text/css">
a:active{
text-decoration:none;
color:red;

}

</style>

  </head>
  
  <body>
   <jsp:include page="header.jsp"></jsp:include>
  <div class="content">
  <div class="width1190">
   <div class="vip-left">
       <div class="vipNav">
        <h3 class="vipTitle">会员中心</h3>
        <dl>
         <dt class="vipIcon3">账户设置</dt>
          <dd>
          <a href="image" >修改头像</a>
           <a href="ziliao" >我的资料</a>
           <a href="upwd" >账户密码设置</a>
          </dd>
         <dt class="vipIcon1">我的邻居大妈</dt>
          <dd>
           <a href="hd_guanzhu">关注房源</a>
           <c:if test="${user.powerid.powerid==3}"><a href=shenqing>申请社区自由经纪人</a></c:if>
           <a href="user_jingji" >社区自由经纪人</a>
          <c:if test="${user.powerid.powerid==2}"> 
          		<a href="house_prepub" >发布房源</a>
          		<a href="medium_getHouseByMid" >我的房源</a>
				<a href="info_query" >指定购房消息</a>          	
          </c:if> 
         
          </dd>
        </dl>
       </div>
       </div>
       </div>
       </div>
  </body>
</html>
