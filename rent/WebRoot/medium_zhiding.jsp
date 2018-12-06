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
	function updateinfo(id){
		$.post("info_updateInfo",{iid:id},function(data){
			$('#jingjiren').html(data);
		});
	}
	function deleteinfo(id){
		if(confirm("确定要删除吗？")){
			$.post("info_deleteInfo",{iid:id},function(data){
				$('#jingjiren').html(data);
			});
			/* location.href="info_deleteInfo?iid="+id; */
		}
		
	}
	/* var msg=${msg}
	if(msg != ""){
		alert(msg);
	} */
</script>
  </head>
  
  <body>
 <div class="content">
  <div class="width1190">
       <jsp:include page="left_menu.jsp"></jsp:include>
    <div class="vip-right">
     <h3 class="vipright-title">社区自由经纪人</h3>
     <div class="jingjiren" id="jingjiren">
      <c:forEach items="${ilist }" var="i">
	      <dl>
	       <dt><img src="${i.userid.headimage }" /></dt>
	       <c:if test="${i.status =='未读' }">
	       <dd>
	       (未读) <h3 class="glyphicon glyphicon-user" style="font-weight: bold;">&nbsp;${i.userid.username }&nbsp;<label  style="font-size: 10px;">联系电话： ${i.userid.phone }</label></h3>
	      
	       <div class="wuxing" style="margin-top: 5px;font-weight: bold;">您有房源符合此用户需求！</div> 
	       </dd>
	        <div class="xunzhang" style="width: 150px;margin-top: 30px;"><button type="button"  class="btn btn-success btn-xs" onclick="updateinfo(${i.iid })">标记已读</button>&nbsp;<button type="button" onclick="deleteinfo(${i.iid })" class="btn btn-danger btn-xs">删除</button></div>
	       <div class="clearfix"></div>
	       </c:if>
	        <c:if test="${i.status =='已读' }">
	       <dd>
	        <h3 class="glyphicon glyphicon-user" >&nbsp;${i.userid.username }&nbsp;<label  style="font-size: 10px;">联系电话： ${i.userid.phone }</label></h3>
	      
	       <div class="wuxing" style="margin-top: 5px;">您有房源符合此用户需求！</div> 
	       </dd>
	        <div class="xunzhang" style="width: 100px;margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  class="btn btn-danger btn-xs" onclick="deleteinfo(${i.iid })">删除</button></div>
	       <div class="clearfix"></div>
	       </c:if>
	      
	      </dl>
      
      
      </c:forEach>
     
     </div><!--jingjiren/-->
    </div><!--vip-right/-->
    <div class="clearfix"></div>
  </div><!--width1190/-->
 </div><!--content/-->
 
<jsp:include page="footer.jsp"></jsp:include>
 
  </body>
</html>
