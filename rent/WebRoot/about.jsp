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
     <li class="leftNavCur"><a href="about.jsp">关于我们</a></li>
     <li><a href="about_queryInformation">联系我们</a></li>
    </ul><!--leftNav/-->
   </div><!--contleft/-->
   <div class="contright">
    <h2 class="rightat">公司简介</h2>
    <div class="about">
     <img src="images/about.jpg" /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
厦门邻居大妈房地产经纪有限公司（以下简称“邻居大妈”）成立于20018年11月19日，是一家集房产交易服务、资产管理服务为一体以数
据驱动的价值链房产服务平台，业务覆盖二手房交易、新房交易、租赁、装修服务等。
<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邻居大妈目前已覆盖北京、上海、广州、深圳、天津、武汉、成都、青岛、重庆、大连、合肥等28个地区，全国门店数量约8000
家，旗下经纪人超过13万名。为不断提高购房服务体验，邻居大妈积极布局线上平台。
<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前线上已覆盖PC端、邻居大妈APP、邻居大妈网手机版等终端，是具备集房源信息搜索、产品研发、大数据处理、服务标准建立为一
体的综合型房产服务平台。平台为买卖双方用户提供全面真实的房产相关信息及咨询服务，并满足用户估价、约带看等个性化服
务。旨在不断提高服务效率、提升服务体验，为用户提供更安全、更便捷、更舒心的综合房产服务。
<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邻居大妈以“推动行业进步，让房屋交易不再难”为品牌使命，希望通过持之以恒的创新以及新技术的探索和运用，建立和有效
管理高质量的房地产服务标准，推动行业进步。
<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018年11月30日，邻居大妈在美国纳斯达克上市，一举打破首日涨幅最高等多项纪录，并成为首家进入纳斯达克成分股的中国公司。通过数年来的市场表现，邻居大妈优异的业绩与值得依赖的回报，使之成为中国企业价值的代表，傲然屹立于全球资本市场。
    </div>
   </div><!--contright/-->
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--content/-->
<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
