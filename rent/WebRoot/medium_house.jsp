<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
 $(function(){
	 //导航定位
	 $(".nav li:eq(5)").addClass("navCur");
	 });
</script>
<script type="text/javascript">
	function down(id){
		if(confirm("确定要下架此房源吗？")){
			$.post("medium_change",{id:id,status:2},function(data){
				$('#houselist').html(data);
			});
			/* location.href="info_deleteInfo?iid="+id; */
		}
		
	}
	function up(id){
		if(confirm("确定要上架此房源吗？")){
			$.post("medium_change",{id:id,status:1},function(data){
				$('#houselist').html(data);
			});
		}
		
	}
</script>
  </head>
  
  <body>
 <div class="content">
  <div class="width1190">
       <jsp:include page="left_menu.jsp"></jsp:include>
    <div class="vip-right">
     <h3 class="vipright-title">社区自由经纪人</h3>
     <div class="jingjiren" id="houselist">
      <c:forEach items="${hlist }" var="i">
	      <dl>
	       <dt><img src="${i.imgurl }" /></dt>
	       <dd> 
	       <h3 class="glyphicon glyphicon-user" style="font-weight: bold;">&nbsp;${i.housename}
	    	
	      
	       <h5 class="wuxing" class="glyphicon glyphicon-home" style="margin-top: 5px;font-weight: bold;">地址： ${i.haddress }</h5> 
	       <h5 class="wuxing" class="glyphicon glyphicon-home" style="font-weight: bold;">房源状态： ${i.hstatus}</h5> 
	       </dd>

	       	<c:if test="${i.hstatus == '上架'}">
	        	<div class="xunzhang" style="width: 150px;margin-top: 30px;"><button type="button"  class="btn btn-danger btn-xs" onclick="down(${i.houseid })">下架</button>&nbsp;</div> 
	       </c:if>
	        <c:if test="${i.hstatus == '下架'}">
	        	<div class="xunzhang" style="width: 150px;margin-top: 30px;"><button type="button"  class="btn btn-success btn-xs" onclick="up(${i.houseid })">上架</button>&nbsp;</div> 
	       </c:if>
	       	<div class="clearfix"></div>
	      
	      </dl>
      
      
      </c:forEach>
     
     </div><!--jingjiren/-->
    </div><!--vip-right/-->
    <div class="clearfix"></div>
  </div><!--width1190/-->
 </div><!--content/-->
 
<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
 
  </body>
</html>
