<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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

  </head>
  
  <body>
   
 <div class="content">
  <div class="width1190">
  <jsp:include page="left_menu.jsp"></jsp:include>
    <div class="vip-right">
     <h3 class="vipright-title">社区自由经纪人</h3>
     <div class="jingjiren">
      <s:set value="mlist" var="mt"></s:set>
      <s:iterator value="mt">
         <dl>
       <dt><img src='<s:property value="userid.headimage"/>' /></dt>
       <dd>
        <h3>高级经纪人&nbsp&nbsp&nbsp&nbsp <s:property value="userid.username"/> <img src="images/phone2.jpg" /><s:property value="userid.phone"/> </h3>
        <div class="wuxing"><img src="images/wuxing.jpg" width="104" height="16" /></div>
        <div class="dizhi">主营板块:厦门市 - <s:property value="quyu"/> -</div>
       </dd>
       <div class="xunzhang"><img src="images/xunzhang.jpg" width="51" height="50" /></div>
       <div class="clearfix"></div>
        </dl> 
      </s:iterator>
     </div><!--jingjiren/-->
    </div><!--vip-right/-->
    <div class="clearfix"></div>
  </div><!--width1190/-->
 </div><!--content/-->
 <jsp:include page="footer.jsp"></jsp:include>  
 
  </body>
</html>
