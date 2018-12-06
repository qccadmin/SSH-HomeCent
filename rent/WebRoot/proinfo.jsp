<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
		function deletef() {
		var id1=${follow.userid.userid};
		var id2=${follow.houseid.houseid};
		$.post("hd_delete",{userid:id1,houseid:id2},function(data){
					
					$("#main").load(location.href+" #main");
					
					});
		}
	</script>
	<script type="text/javascript">
		var i=false;
		function addf() {
	
		var user="${user}";
		if(user==""){
		alert("请先登录");
		
		}else{
		
		if(!i){
		
		var id1=${user.userid};
		var id2=${house.houseid};
		$.post("hd_add",{userid:id1,houseid:id2},function(data){
					
					self.location.reload();
					
					});
				
					}
					i=true;
		}}
	</script>
	<script type="text/javascript">
	function showmsg() {
	alert("您还未登录，登录才能关注哦！！");
		
	}
	
	
	</script>
  </head>
  
  
  <body>
 <jsp:include page="header.jsp"></jsp:include>
<iframe src="hd_right?houseid=${house.houseid}" style="float: right" width="225" height="800" scrolling="no"></iframe>
 <div class="content" style="float: left;margin-left: 30px">
  <div class="width1190" style="width:980px;">
   <div class="proImg fl">
    <img src="${house.imgurl}" />
   </div><!--proImg/-->
   <div class="proText fr">
    <h3 class="proTitle">${house.housename }</h3>
    <div class="proText1">
<input type="hidden" id="aaa" value="${house}">
     编号：${house.houseid}<br />
     售价：<s:if test="house.renttype.cid==1"><strong>${house.rentmoney }</strong><span class="font12">元/月</span></s:if>
	 	<s:if test="house.renttype.cid!=1"><strong>${house.rentmoney/10000 }</strong><span class="font12">万</span></s:if><br />
     户型：${house.typeid.room }室 ${house.typeid.hall}厅${house.typeid.toilet}卫<br />
     面积：${house.area}.0㎡<br />
     朝向：${house.orientation.ctext}<br />
     楼层：${house.floor }层<br />
     装修：${house.renovate.ctext}<br />
     小区：${house.haddress }
    </div>
    <div class="xun-car" id="main">
     <a href="javascript:;" class="xwjg">¥<s:if test="house.renttype.cid==1"><strong>${house.rentmoney }</strong><span class="font12">元/月</span></s:if>
	 	<s:if test="house.renttype.cid!=1"><strong>${house.rentmoney/10000 }</strong><span class="font12">万</span></s:if></a>
     <s:if test="follow!=NULL"><a href="javascript:;" title="取消关注" class="projrgwc" onclick="deletef()">取消关注</a></s:if>
     <s:if test="follow==NULL"><a href="javascript:;" class="projrgwc"<s:if test="user==Null">onclick="showmsg()" </s:if>  <s:if test="user!=Null">onclick="addf()"</s:if> >关注房源</a></s:if>
    </div><!--xun-car/-->
   </div><!--proText/-->
   <div class="clears"></div>
  </div><!--width1190/-->
  <div class="proBox" style="width:980px;margin:10px auto;">
  <div class="proEq">
   <ul class="fl">
    <li class="proEqCur">房源详情</li>
    <li>房源图片</li>
    <li>小区介绍</li>
   </ul>
   <div class="lxkf fr"><a href="http://wpa.qq.com/msgrd?v=3&uin=1072631488&site=qq&menu=yes" target="_blank"></a></div>
   <div class="clears"></div>
  </div><!--proEq/-->
  <div class="proList" style="min-height:100px">
<div >
<p style="font-size:20px;line-height: 30px;letter-spacing: 5px">  ${house.discreption}<p>

   <div class="open" style="display:none;">查看全部<span></span></div>
   <div class="stop" style="display:none;">收起<span></span></div>

</div>
 
  </div><!--proList/-->
  
  <div class="proList" style="min-height:100px">
  <s:iterator value="ilist">
  <img  src="<s:property value="urladdress"/>">
  
  </s:iterator>
  
  </div><!--proList/-->
  <div class="proList" style="min-height:100px">
   暂无信息...
  </div><!--proList/-->
  <h1 class="proTitle">周边详情</h1>
   <jsp:include page="housemap.jsp"></jsp:include>
 </div><!--proBox/-->
 
 </div><!--content/-->

<jsp:include page="footer.jsp"></jsp:include>
 
  </body>
</html>
