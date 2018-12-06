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
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/js.js"></script>
  <script type="text/javascript">
      function add() {
		/* url="housetype_updateHouseType";
		location=url; */
		var form=document.getElementById('housetype');
		form.submit();
		window.close();
	}
  </script>
  </head>

<body>
<div class="layui-container">  
    <div class="layui-row">
        <div class="layui-col-lg12">
            <fieldset class="layui-elem-field">
            	
                <legend>户型管理 - 新增户型</legend>
                <div class="layui-field-box">
                    <form class="layui-form" action="housetype_addHouseType" id="housetype">

		                <div class="layui-form-item">
		                        <label class="layui-form-label">室</label>
		                        <div class="layui-input-block">
		                        <input type="text" name="room" value=" <s:property value="ht.room"/>" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
		                        </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">厅</label>
                            <div class="layui-input-block">
                            <input type="text" name="hall" value="<s:property value="ht.hall"/>" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">卫</label>
                            <div class="layui-input-block">
                            <input type="text" name="toilet" value=" <s:property value="ht.toilet"/>" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <!-- 
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码框</label>
                            <div class="layui-input-inline">
                            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">辅助文字</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">选择框</label>
                            <div class="layui-input-block">
                            <select name="city" lay-verify="required">
                                <option value=""></option>
                                <option value="0">北京</option>
                                <option value="1">上海</option>
                                <option value="2">广州</option>
                                <option value="3">深圳</option>
                                <option value="4">杭州</option>
                            </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">复选框</label>
                            <div class="layui-input-block">
                            <input type="checkbox" name="like[write]" title="写作">
                            <input type="checkbox" name="like[read]" title="阅读" checked>
                            <input type="checkbox" name="like[dai]" title="发呆">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开关</label>
                            <div class="layui-input-block">
                            <input type="checkbox" name="switch" lay-skin="switch">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">单选框</label>
                            <div class="layui-input-block">
                            <input type="radio" name="sex" value="男" title="男">
                            <input type="radio" name="sex" value="女" title="女" checked>
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">文本域</label>
                            <div class="layui-input-block">
                            <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
                            </div>
                        </div>
                         -->
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="formDemo" onclick="add()">立即提交</button>
                            <!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
                            </div>
                        </div>
                        
                    </form>
                </div>
            </fieldset>
        </div>
    </div>
</div>
<script type="text/javascript" src="./javascript/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<%-- <script type="text/javascript" src="./javascript/dw_form_submit.js"></script> --%>
</body>
</html>
