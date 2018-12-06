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
	$(document).ready(function(){
		query(1);
	});
		function query(renttype) {
	
		var id1=${user.userid};
		
		$.post("hd_queryBytype",{userid:id1,renttype:renttype},function(data){
					$("#q").html(data);
					
					document.getElementById('q').style.display="block";
					});
				
					}
	</script>
	<script type="text/javascript">
		function deletef(id,cid) {
		var id1=${user.userid};
		if(confirm("您真的要取消关注么？")){
		$.post("hd_delete",{userid:id1,houseid:id},function(data){
					
					query(cid);
					
					});
					}
		}
		
		function tell() {
			alert("该房源已下架！");
		}
	</script>
	
  </head>
  
  <body>

 <div class="content">
  <div class="width1190">
  <jsp:include page="left_menu.jsp"></jsp:include>
    <div  class="vip-right">
     <h3 class="vipright-title">关注房源</h3>
     <ul class="guanzhueq">
      <li class="guanzhueqcur"><a href="javascript:;" onclick="query(1)">租房</a></li>
      <li><a href="javascript:;" onclick="query(2)">新房</a></li>
      <li><a href="javascript:;" onclick="query(3)">二手房</a></li>
      <div class="clearfix"></div>
     </ul><!--guanzhueq/-->
       <div id="q"  class="guanzhulist">
       </div><!--guanzhulist/-->
    </div><!--vip-right/-->
    <div class="clearfix"></div>
  </div><!--width1190/-->
 </div><!--content/-->
 
<jsp:include page="footer.jsp"></jsp:include>
 
  </body>
</html>
