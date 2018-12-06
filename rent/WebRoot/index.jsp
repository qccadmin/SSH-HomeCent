<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
 function getid(id){
    	 	var url='hd_query?houseid='+id;
    		  location=url;
      }

</script>
  </head>
  
  <body>

   <jsp:include page="header.jsp"></jsp:include>
	
 <div class="content">
  <div class="width1190">
   <h2 class="title">租房 <a href="houselist_houselist?renttype=1">更多&gt;&gt;</a></h2>
   <div class="index-fang-list">
    <dl>
     <dt><a style="cursor: pointer" onclick="getid(${zuhouselist[0].houseid})"><img src="${zuhouselist[0].imgurl}" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="proinfo.jsp"></a>${zuhouselist[0].housename}</h3>
      <div class="hui">${zuhouselist[0].typeid.room}室${zuhouselist[0].typeid.hall}厅${zuhouselist[0].typeid.toilet}卫 | ${zuhouselist[0].area}m² | ${zuhouselist[0].renovate.ctext}</div>
     </dd>
    </dl>
    <dl>
     <dt><a style="cursor: pointer" onclick="getid(${zuhouselist[1].houseid})"><img src="${zuhouselist[1].imgurl}" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="proinfo.jsp"></a>${zuhouselist[1].housename}</h3>
      <div class="hui">${zuhouselist[1].typeid.room}室${zuhouselist[1].typeid.hall}厅${zuhouselist[1].typeid.toilet}卫 | ${zuhouselist[1].area}m² | ${zuhouselist[1].renovate.ctext}</div>
     </dd>
    </dl>
    <dl>
     <dt><a style="cursor: pointer" onclick="getid(${zuhouselist[2].houseid})"><img src="${zuhouselist[2].imgurl}" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="proinfo.jsp"></a>${zuhouselist[2].housename}</h3>
      <div class="hui">${zuhouselist[2].typeid.room}室${zuhouselist[2].typeid.hall}厅${zuhouselist[2].typeid.toilet}卫 | ${zuhouselist[2].area}m² | ${zuhouselist[2].renovate.ctext}</div>
     </dd>
    </dl>
    <dl>
     <dt><a style="cursor: pointer" onclick="getid(${zuhouselist[3].houseid})"><img src="${zuhouselist[3].imgurl}" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="proinfo.jsp"></a>${zuhouselist[3].housename}</h3>
      <div class="hui">${zuhouselist[3].typeid.room}室${zuhouselist[3].typeid.hall}厅${zuhouselist[3].typeid.toilet}卫 | ${zuhouselist[3].area}m² | ${zuhouselist[3].renovate.ctext}</div>
     </dd>
    </dl>
    <div class="clears"></div>
   </div><!--index-fang-list/-->
   
   <h2 class="title">新房 <a href="houselist_houselist?renttype=2">更多&gt;&gt;</a></h2>
   <div class="index-fang-list">
    <dl>
     <dt><a style="cursor: pointer" onclick="getid(${xinhouselist[0].houseid})"><img src="${xinhouselist[0].imgurl}" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="proinfo.jsp"></a>${xinhouselist[0].housename}</h3>
      <div class="hui">${xinhouselist[0].typeid.room}室${xinhouselist[0].typeid.hall}厅${xinhouselist[0].typeid.toilet}卫 | ${xinhouselist[0].area}m² | ${xinhouselist[0].renovate.ctext}</div>
     </dd>
    </dl>
    <dl>
     <dt><a style="cursor: pointer" onclick="getid(${xinhouselist[1].houseid})"><img src="${xinhouselist[1].imgurl}" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="proinfo.jsp"></a>${xinhouselist[1].housename}</h3>
      <div class="hui">${xinhouselist[1].typeid.room}室${xinhouselist[1].typeid.hall}厅${xinhouselist[1].typeid.toilet}卫 | ${xinhouselist[1].area}m² | ${xinhouselist[1].renovate.ctext}</div>
     </dd>
    </dl>
    <dl>
     <dt><a style="cursor: pointer" onclick="getid(${xinhouselist[2].houseid})"><img src="${xinhouselist[2].imgurl}" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="proinfo.jsp"></a>${xinhouselist[2].housename}</h3>
      <div class="hui">${xinhouselist[2].typeid.room}室${xinhouselist[2].typeid.hall}厅${xinhouselist[2].typeid.toilet}卫 | ${xinhouselist[2].area}m² | ${xinhouselist[2].renovate.ctext}</div>
     </dd>
    </dl>
    <dl>
     <dt><a style="cursor: pointer" onclick="getid(${xinhouselist[3].houseid})"><img src="${xinhouselist[3].imgurl}" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="proinfo.jsp"></a>${xinhouselist[3].housename}</h3>
      <div class="hui">${xinhouselist[3].typeid.room}室${xinhouselist[3].typeid.hall}厅${xinhouselist[3].typeid.toilet}卫 | ${xinhouselist[3].area}m² | ${xinhouselist[3].renovate.ctext}</div>
     </dd>
    </dl>
    <div class="clears"></div>
   </div><!--index-fang-list/-->
   
   <h2 class="title">二手房 <a href="houselist_houselist?renttype=3">更多&gt;&gt;</a></h2>
   <div class="index-ershou">
    <div class="in-er-left">
     <a style="cursor: pointer" onclick="getid(${erhouselist[0].houseid})"><img src="${erhouselist[0].imgurl}" width="380" height="285" /></a>
     <div class="in-er-left-text"><strong class="fl">${erhouselist[0].discreption}</strong><strong class="fr alignRight">¥ ${erhouselist[0].rentmoney/10000 }万</strong></div>
    </div><!--in-er-left/-->
    <div class="in-er-right">
     <dl>
      <dt><a style="cursor: pointer" onclick="getid(${erhouselist[1].houseid})"><img src="${erhouselist[1].imgurl}" width="150" height="115" /></a></dt>
      <dd>
       <h3><a style="cursor: pointer" onclick="getid(${erhouselist[1].houseid})">${erhouselist[1].housename}</a></h3>
       <div class="in-er-right-text">
        ${erhouselist[1].discreption}
       </div>
       <div class="price">¥<strong>${erhouselist[1].rentmoney/10000 }万</strong></div>
      </dd>
      <div class="clears"></div>
     </dl>
     <dl>
      <dt><a style="cursor: pointer" onclick="getid(${erhouselist[2].houseid})"><img src="${erhouselist[2].imgurl}" width="150" height="115" /></a></dt>
      <dd>
       <h3><a style="cursor: pointer" onclick="getid(${erhouselist[2].houseid})">${erhouselist[2].housename}</a></h3>
       <div class="in-er-right-text">
        ${erhouselist[2].discreption}
       </div>
       <div class="price">¥<strong>${erhouselist[2].rentmoney/10000 }万</strong></div>
      </dd>
      <div class="clears"></div>
     </dl>
     <dl>
      <dt><a style="cursor: pointer" onclick="getid(${erhouselist[3].houseid})"><img src="${erhouselist[3].imgurl}" width="150" height="115" /></a></dt>
      <dd>
       <h3><a style="cursor: pointer" onclick="getid(${erhouselist[3].houseid})">${erhouselist[3].housename}</a></h3>
       <div class="in-er-right-text">
        ${erhouselist[3].discreption}
       </div>
       <div class="price">¥<strong>${erhouselist[3].rentmoney/10000 }万</strong></div>
      </dd>
      <div class="clears"></div>
     </dl>
     <dl>
      <dt><a style="cursor: pointer" onclick="getid(${erhouselist[4].houseid})"><img src="${erhouselist[4].imgurl}" width="150" height="115" /></a></dt>
      <dd>
       <h3><a style="cursor: pointer" onclick="getid(${erhouselist[4].houseid})">${erhouselist[4].housename}</a></h3>
       <div class="in-er-right-text">
        ${erhouselist[4].discreption}
       </div>
       <div class="price">¥<strong>${erhouselist[4].rentmoney/10000 }万</strong></div>
      </dd>
      <div class="clears"></div>
     </dl>
     <div class="clears"></div>
    </div><!--in-er-right/-->
    <div class="clears"></div>
   </div><!--index-ershou/-->
  </div><!--width1190/-->
 </div><!--content/-->
 <div class="xinren">
  <div class="width1190">
   <dl style="background:url(images/icon1.jpg) left center no-repeat;">
    <dt>承诺</dt>
    <dd>真实可信100%真房源<br />链家承诺，假一赔百</dd>
   </dl>
   <dl style="background:url(images/icon2.jpg) left center no-repeat;">
    <dt>权威</dt>
    <dd>独家房源 覆盖全城<br />房源信息最权威覆盖最广</dd>
   </dl>
   <dl style="background:url(images/icon3.jpg) left center no-repeat;">
    <dt>信赖</dt>
    <dd>万名置业顾问 专业服务<br />百万家庭的信赖之选</dd>
   </dl>
   <dl style="background:url(images/icon4.jpg) left center no-repeat;">
    <dt>安全</dt>
    <dd>安心承诺 保驾护航<br />多重风险防范机制 无后顾之忧</dd>
   </dl>
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--xinren/-->
<jsp:include page="footer.jsp"></jsp:include>  

  </body>
</html>
