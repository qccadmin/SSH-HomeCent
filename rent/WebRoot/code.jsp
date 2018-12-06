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
    
    <title>My JSP 'code.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function getnum(){
	var obj=document.getElementById("xtype").value;
	//alert(obj);
	$.post("code_count",{"code.ctype":obj},function(data){
		//alert(data);
		$("#mydiv").html(data);
	});
}

</script>
  </head>
  
  <body>
    <form action="code_query" method="post">
    请选择：<select name="code.ctype">
    <option value="级别">级别</option>
    <option value="部门">部门</option>
    </select>
    <input type="submit" value="查询"/>
    </form>
    <s:iterator value="list">
    id:<s:property value="cid"/>,
    类型： <s:property value="ctype"/>, 
  内容:   <s:property value="context"/><br>
    </s:iterator>
    <br>
    <br><hr>
    请输入要查询的类型：<input type="text" id="xtype" onblur="getnum()"/>
    <div id="mydiv"></div>
  </body>
</html>
