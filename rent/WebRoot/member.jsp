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
  <link rel="stylesheet" href="./css/global.css">
  <link rel="stylesheet" href="./icheck/minimal/red.css"> 
 <%--  <script src="js/js.js"></script> --%>
  <script type="text/javascript">
   function update(id) {
		var url ='housetype_queryById?ht.tid='+id;
		location = url;
	}
   console.log('134')
  </script>
  </head>
  
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">layui 后台布局</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
        <s:set value="#session.user" var="u"> </s:set>  
          <img src='<s:property value="#u.headimage"/>' class="layui-nav-img">
          <s:property value="#u.username"/>
       
        </a>
       
      </li>
      <li class="layui-nav-item"><a href="login2.jsp">退出系统</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item"><a href="background.jsp">控制台</a></li>
                <li class="layui-nav-item ">
                <a href="javascript:;">房源管理</a>
                <dl class="layui-nav-child">
                    <dd><a class="layui-this" href="about_queryHouse">房源列表</a></dd>
                </dl>
        </li>
        <li class="layui-nav-item ">
                <a href="javascript:;">户型管理</a>
                <dl class="layui-nav-child">
                    <dd><a class="layui-this" href="housetype_queryAllHouseType">户型列表</a></dd>
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
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>户型管理 - 户型列表</legend>
            <div class="layui-field-box">
            <!--  
              <form class="layui-form" action="">
                <div class="layui-form-item" style="text-align:center;">
                  <div class="layui-inline">
                    <div class="layui-input-inline">
                      <input autocomplete="off" class="layui-input" placeholder="请输入名称" type="text" name="name" value="">
                    </div>
                  </div>
                  <div class="layui-inline" style="text-align:left;">
                    <div class="layui-input-inline">
                      <button class="layui-btn"><i class="layui-icon">&#xe615;</i>查询</button>
                    </div>
                  </div>
                </div>
              </form>
             --> 
              <hr>
              <div class="layui-btn-group">
                  <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" onclick="add()" dw-title="新增用户" dw-width="100%" dw-height="100%">
                      <i class="layui-icon">&#xe654;</i>新增
                  </button>
                  <button class="layui-btn layui-btn-xs dw-refresh" onclick="refresh()"> 
                      <i class="layui-icon">&#x1002;</i>刷新
                  </button>
              </div>
              <hr>
              <table class="layui-table">
                  <colgroup>
                      <col width="150">
                      <col width="150">
                      <col width="200">
                      <col>
                      <col>
                  </colgroup>
                  <thead>
                      <tr>
                      <th>户型id</th>
                      <th>室</th>
                      <th>厅</th>
                      <th>卫</th>
                      <th style="text-align:center;">操作</th>
                      </tr> 
                  </thead>
                  <tbody>
                      <tr>
                      
                      
                      <s:set value="housetypelist" var="ht"></s:set>
                      <s:iterator value="ht">
                          <tr>
                         
	                      <td><s:property value="tid"/></td>
	                      <td><s:property value="room"/></td>
	                      <td><s:property value="hall"/></td>
	                      <td><s:property value="toilet"/></td>
	                      <td class="text-center">
                         <div class="layui-btn-group">
                          <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" onclick="update1('housetype_queryById?ht.tid=<s:property value="tid"/>')">
                            <i class="layui-icon">&#xe642;</i>编辑    <!--dw-url="'housetype_queryById?ht.tid='+tid"   onclick="update(<s:property value="tid"/>)   dw-url="create.jsp?tid=<s:property value="tid"/>"-->
                          </button>
                          <button class="layui-btn layui-btn-xs layui-btn-danger dw-delete" onclick="delete1('housetype_deleteHouseType?ht.tid=<s:property value="tid"/>')" >
                            <i class="layui-icon">&#xe640;</i>删除
                          </button>
                        </div>
                      </td>
	                      </tr>
                      </s:iterator>
                      </tr>
                  </tbody>
              </table>
            </div>
        </fieldset>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script type="text/javascript" src="./javascript/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<!-- <script type="text/javascript" src="./icheck/icheck.js"></script> -->
<script type="text/javascript" src="./javascript/dw.js"></script>  
<script type="text/javascript">
layui.use(['layer', 'form'], function(){
	  var layer = layui.layer
	  ,form = layui.form;
	});

	function delete1(url){
		/*  alert(url);*/
		layer.confirm('确认删除吗？',{icon: 7, area: ['200px', '150px'],offset: ['320px', '550px']},function(index){
			 layer.close(index);
			 $.getJSON(url,function(result){
					if(result=='0'){
						layer.msg('删除失败!',{icon: 5,time:1500});
					}else{
						layer.msg('成功删除',{icon: 6,time:1500});
					}
					location.reload();
				}); 
		}); 
	}
	function update1(url){
		layer.open({
			type: 2,
		    shadeClose: true,
		    shade: false,
		    offset: ['200px', '400px'],
		    maxmin: true, //开启最大化最小化按钮
		    area: ['600px', '400px'],
			content: [url,'no'], //iframe的url，no代表不显示滚动条
			end: function(){ //此处用于演示
					location.reload();
			 	 } 
			});

	}
	function refresh(){
		location.reload();
	}
	/* 
	function add(){
		url="create.jsp";
		location=url;
	}
	 */
	function add(){
		layer.open({
			type: 2,
		    shadeClose: true,
		    shade: false,
		    offset: ['200px', '400px'],
		    maxmin: true, //开启最大化最小化按钮
		    area: ['600px', '400px'],
			content: ['addHouseType.jsp','no'], //iframe的url，no代表不显示滚动条
			end: function(){ //此处用于演示
					location.reload();
			 	 } 
			});

	}
</script>
</body>
</html>
