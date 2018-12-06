<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>layout 后台大布局 - Layui</title>
  <link rel="stylesheet" href="./layui/css/layui.css">
  </head>
  
  <body>
 <div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">邻居大妈后台管理</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
   
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
        <s:set value="#session.user" var="u"> </s:set>  
          <img src='<s:property value="#u.headimage"/>' class="layui-nav-img">
          <s:property value="#u.username"/>
        </a><!--  
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>-->
        </dl>
      </li>
      <li class="layui-nav-item"><a href="login2.jsp">退出系统</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item"><a class="layui-this" href="background.jsp">控制台</a></li>
                <li class="layui-nav-item ">
                <a href="javascript:;">房源管理</a>
                <dl class="layui-nav-child">
                    <dd><a class="layui-this" href="about_queryHouse">房源列表</a></dd>
                </dl>
        </li>
        <li class="layui-nav-item">
                <a href="javascript:;">户型管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="housetype_queryAllHouseType">户型列表</a></dd>
                </dl>
        </li>
        <li class="layui-nav-item">
                <a href="javascript:;">区域管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="region_queryAllRegion">区域列表</a></dd>
                </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body" align="center" style="background:url(images/houtai.jpeg) no-repeat ">
        
  </div>
  <div class="layui-footer" style="background:	#97FFFF; color:#E066FF">
    <!-- 底部固定区域 -->
     www.neighboraunt.com 
  </div>
  
</div>
<script type="text/javascript" src="./javascript/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./javascript/index.js"></script>
  </body>
</html>
