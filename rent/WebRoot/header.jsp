<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'head.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript">
function logout(){
	
	if(${user!=null}){
		 if(confirm("确定要退出系统吗？")){
			location.href="login_logout";
		}
	}else{
		alert("您还没有登录，请登录");
	}
	/* if(confirm("确定要退出系统吗？")){
		window.top.location="login2.jsp";
		session.invalidate(); 
		 //location.href="login.jsp";
	 } */
}
</script>
<script type="text/javascript"> 
function shoucang(sTitle,sURL) {
	try { window.external.addFavorite(sURL, sTitle);
	} catch (e) { 
		try { window.sidebar.addPanel(sTitle, sURL, ""); 
		} catch (e) {
			alert("加入收藏失败,请使用Ctrl+D进行添加"); }
		}
	} 
    </script>
<script type="text/javascript">
function setHome(obj,vrl){ 
	try{ obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
	}catch(e){ 
		if(window.netscape) 
		{ try { netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); } 
		catch (e) { alert("此操作被浏览器拒绝!请在浏览器地址栏输入“about:config”并回车,然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。"); } 
		var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); prefs.setCharPref('browser.startup.homepage',vrl); }
		else{ alert("您的浏览器不支持,请按照下面步骤操作:1.打开浏览器设置。2.点击设置网页。3.输入:"+vrl+"点击确定。"); } }};  
</script>

</head>

<body>
	<div class="header">
		<div class="width1190">
			<div class="fl">您好，欢迎来到邻居大妈！</div>
			<div class="fr">
			<c:choose>
			<c:when test="${user.username!=null}">
			欢迎您，${user.username}
			</c:when>
			<c:when test="${user.username=='' || user.email!=null}">
			欢迎您，${user.email}
			</c:when>
			<c:otherwise>
			<a href="login" onclick="login()">登录</a>
			</c:otherwise>
			</c:choose>
		<%-- 	<c:if test="${user.username!=null}">
				欢迎您，${user.username}
				</c:if> 
				<c:if test="${user.username=='' || user.email!=null}">
				欢迎您，${user.email}
				</c:if>
				<c:if test="${user==null || user=='' }">
				<a href="login" onclick="login()">登录</a>
				</c:if> --%> | <a 
					 href="javascript:" onclick="shoucang(document.title,window.location);">加入收藏</a> | <a
					 href="javascript:" onclick="setHome(this,window.location);">设为首页</a>
					  <c:if test="${user != null }"> 
					  | <a  href="ziliao" style="cursor: pointer" >个人中心</a> 
					  | <a  href="javascript:" style="cursor: pointer" onclick="logout()">退出系统</a> 
					</c:if>
					 <!-- <a href="login_logout">退出系统</a>  -->
			</div>
			<div class="clears"></div>
		</div>
		<!--width1190/-->
	</div>
	<!--header/-->
	<div class="logo-phone">
		<div class="width1190">
			<h1 class="logo">
				<a href="house_queryByRentType"><img src="images/logo.png" width="163"
					height="59" /></a>
			</h1>
			<div class="phones">
				<strong>021-63179891</strong>
			</div>
			<div class="clears"></div>
		</div>
		<!--width1190/-->
	</div>
	<!--logo-phone/-->
		<div class="list-nav">
		<div class="width1190">
			<!-- <div class="list">
				<h3>房源分类</h3>
				<div class="list-list">
					<dl>
						<dt>
							<a href="javascript:;">房源区域</a>
						</dt>
						<dd>
							<a href="javascript:;">思明区</a> <a href="javascript:;">湖里区</a> <a
							   href="javascript:;">集美区</a> <a href="javascript:;">海沧区</a> <a
							   href="javascript:;">同安区</a> <a href="javascript:;">翔安区</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<a href="houselist_houselist?renttype=1">租房</a>
						</dt>
						<dd>
							<a href="javascript:;">租金</a> <a href="javascript:;">出租方式</a> <a
								href="javascript:;">面积</a> <a href="javascript:;">房型</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<a href="houselist_houselist?renttype=2">新房</a>
						</dt>
						<dd>
							<a href="javascript:;">价格</a> <a href="javascript:;">面积</a> <a
								href="javascript:;">房型</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<a href="houselist_houselist?renttype=3">二手房</a>
						</dt>
						<dd>
							<a href="javascript:;">价格</a> <a href="javascript:;">面积</a> <a
								href="javascript:;">房型</a>
						</dd>
					</dl>
				</div>
			</div> -->
			<!--list/-->
			<ul class="nav">
				<li><a href="house_queryByRentType">首页</a></li>
				<li><a href="houselist_houselist?renttype=1">租房</a></li>
				<li><a href="houselist_houselist?renttype=2"">新房</a></li>
				<li><a href="houselist_houselist?renttype=3"">二手房</a></li>
				<li class="zhiding"><a href="javascript:;">指定购房</a></li>
				  <c:if test="${user.powerid.powerid == 3 }"><li><a href="shenqing">申请自由经纪人</a></li> </c:if>
				<li><a href="about_queryInfo">关于我们</a></li>
				<div class="clears"></div>
			</ul>
			<!--nav/-->
			<div class="clears"></div>
		</div>
		<!--width1190/-->
	</div>
	<!--list-nav/-->
	<div class="banner" style="background:url(images/ban1.png);background-size:1506px 373px;"></div>

</body>
</html>
