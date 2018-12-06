<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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

<title>My JSP 'footer.jsp' starting page</title>

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
</head>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
	function isHave() {
		var room = document.getElementById("room").value;
		var hall = document.getElementById("hall").value;
		var toilet = document.getElementById("toilet").value;
		$.post("housetype_judge", {
			"ht.room" : room,
			"ht.hall" : hall,
			"ht.toilet" : toilet
		}, function(data) {
			$('#myspan').html(data);
		});
	}

	function infoMedium() {
		var userid = document.getElementById("userid").value;
		/* $(".bg100").hide();
		$(".zhidinggoufang").fadeOut(); */
		if(userid==""){
			if(confirm("登录才能指定哦，现在要登录吗？")){
				location.href="login";
			}
		}else{
			var regionid = document.getElementById("regionid").value;
			var cid = document.getElementById("cid").value;
			var room = document.getElementById("room").value;
			var hall = document.getElementById("hall").value;
			var toilet = document.getElementById("toilet").value;
			$.post("point_infoMedium", {
				"regionid" : regionid,
				"cid" : cid,
				"ht.room" : room,
				"ht.hall" : hall,
				"ht.toilet" : toilet
			}, function(data) {
				alert("已发送！请等待经纪人与您联系！");
				$(".bg100").hide();
				$(".zhidinggoufang").fadeOut();
			});
		}
		
	}
</script>
<body>

	<div class="footer">
		<div class="width1190">
			<div class="fl">
				<a href="house_queryByRentType"><strong>邻居大妈</strong></a><a href="about_queryInfo">关于我们</a><a
					href="about_queryInformation">联系我们</a><a href="user.jsp">个人 中心</a>
			</div>
			<div class="fr">
				<dl>
					<dt>
						<img src="images/erweima.png" width="76" height="76" />
					</dt>
					<dd>
						微信扫一扫<br />房价点评，精彩发布
					</dd>
				</dl>
				<dl>
					<dt>
						<img src="images/erweima.png" width="76" height="76" />
					</dt>
					<dd>
						微信扫一扫<br />房价点评，精彩发布
					</dd>
				</dl>
				<div class="clears"></div>
			</div>
			<div class="clears"></div>
		</div>
		<!--width1190/-->
	</div>
	<!--footer/-->
	<div class="copy">
		Copyright@ 2018 邻居大妈 版权所有 闽ICP备1234567号-0&nbsp;&nbsp;&nbsp;&nbsp;技术支持：<a
			target="_blank" href="http://www.webqin.net/">秦 王网络</a>
	</div>
	<div class="bg100"></div>
	<div class="zhidinggoufang">
		<h2>
			指定购房 <span class="close">X</span>
		</h2>
		<input type="hidden" id="userid" value="${user.userid }"/>
		<form method="post">
			<div class="zhiding-list">
				<label>选择区域：</label>
				<s:select name="regionid" list="rlist" listValue="regionname"
					listKey="regionid"></s:select>


			</div>
			<div class="zhiding-list">
				<label>方式：</label>
				<s:select name="cid" list="clist" listValue="ctext" listKey="cid"></s:select>

			</div>
			<div class="zhiding-list">
				<label>选择户型：</label> <input type="number" name="ht.room" id="room"
					min="1" value="1" style="width: 40px;height: 25px;" onkeyup="isHave()"/>&nbsp;室&nbsp;- <input
					type="number" value="0" name="ht.hall" id="hall" min="0"
					style="width: 40px;height: 25px;" onkeyup="isHave()" />&nbsp;厅&nbsp;- <input
					type="number" value="0" name="ht.toilet" id="toilet" min="0"
					style="width: 40px;height: 25px;"  onkeyup="isHave()" />&nbsp;卫&nbsp;
				<span id="myspan"></span>
			</div>
			<div class="zhidingsub">
				<input type="button" value="向经纪人发送邮件" onclick="infoMedium()"/>
			</div>
		</form>
		<div class="zhidingtext">
			<h3>指定购房注意事宜：</h3>
			<p>1、请详细输入您所需要购买的房源信息(精确到小区)</p>
			<p>2、制定购房申请提交后，客服中心会在24小时之内与您取得联系</p>
			<p>3、如有任何疑问，请随时拨打我们的电话：400-000-0000</p>
		</div>
		<!--zhidingtext/-->
	</div>
</body>
</html>
