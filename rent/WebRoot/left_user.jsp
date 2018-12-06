<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 <link rel="stylesheet" rev="stylesheet" href="https://include.anjukestatic.com/anjuke-zu/res/20181124.3115.2/b/Zufang_Web_View_Broker.css" type="text/css" />
    
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>

<style type="text/css">
a:active{
text-decoration:none;
color:red;
}

</style>

  </head>
  
  <body>
  

   <div class="vip-left"  style="width: 225px;float: right;margin-right: 20px;position: relative; ">
     
        <div class="broker-card">
    <div class="broker-border">
                <img class="broker-photo" src="${house.mediumid.userid.headimage }" title="https://pic1.ajkimg.com/display/anjuke/204809fcd6e1e1b68b9f17be26b1dc00/367x487x0x1/100x133.jpg"  />
        
        <h2 class="broker-name" title="${house.mediumid.userid.username }"><strong>${house.mediumid.userid.username }</strong></h2>
             <div class="broker-level">
                <div class="broker-level clearfix">
    <span class="stars-title">等级：</span>
    	<div class="stars-wrap-bk" style="width:72px">
        <p class="stars-bg" style="width:72px"><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i></p>
        <p class="stars-solid" style="width:72px"><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i></p>
	</div>
	<!-- 如果持平显示与同城平均水平持平 -->
	<div class="tip-box">
                	<!-- prd上规定如果等于平均水平展示‘与同城平均水平持平’ -->
        <p>打败了56.2%的同城经纪人</p>
                <i class="icon-arrow"><span></span></i>
    </div>
</div>                </div>
        
                <div class="broker-medal broker-line">
            勋章：
            <div class="jjr-medal"><i class="iconfont jjr-icn-broker" title="服务年限超过一年，业务熟练的经纪人">&#xE159;</i></div>        </div>
        
        <div class="brokercard-scorewrap clearfix">
    <span class="brokercard-scoretitle">得分：</span>
    <div class="brokercard-scoredetail">
        <div class="brokercard-sd-cont clearfix">
                        <span class="score-up clearfix no-pd-left" style="height: 30px;">
                <em class="score-num" style="margin-top: -7px;">5.0</em><br><em>房源</em>
            </span>
            
                        <span class="score-up clearfix" style="height: 30px;">
                <em class="score-num" style="margin-top: -7px;">5.0</em><br><em>服务</em>
            </span>
            
                        <span class="score-up clearfix no-bd-rg" style="height: 30px;">
                <em class="score-num" style="margin-top: -7px;">5.0</em><br><em>评价</em>
            </span>
            
        </div>
        <div class="brokercard-sd-tip" style="bottom:47px;">
            <i class="arr-down"><i></i></i>

            <div class="score-up"><span class="mg-r">房源真实：<em class="score-num">5.0</em><i class="score-tag"></i></span><span>打败了35.8%的同城经纪人</span>            </div>

            <div class="score-up"><span class="mg-r">服务效率：<em class="score-num">5.0</em><i class="score-tag"></i></span><span>打败了29.5%的同城经纪人</span>            </div>

            <div class="score-up"><span class="mg-r">用户评价：<em class="score-num">5.0</em><i class="score-tag"></i></span><span>打败了76.7%的同城经纪人</span>            </div>
        </div>
    </div>
</div>


        
    </div >
        <!-- 如果是隐私通话的城市 -->
    <div class="card-phone-click" ><i class="iconfont phone">&#xE060;</i><span id="uphone" onclick="showphone()" >点击查看电话</span></div>
    </div>

    </div>

  </body>
  <script type="text/javascript">
  function showphone(){
  
    var phone= ${house.mediumid.userid.phone} ;

    document.getElementById('uphone').innerHTML =phone;
  }
  </script>
</html>
