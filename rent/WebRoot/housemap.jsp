<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <title>根据地址查询经纬度</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="images/favicon.ico" />

    <script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=CMKZU3U1W2l7nkFjuK1MKi0pQnQ2sOWL"></script>

</head>

<body >

    <div style="width:940px;margin:auto;">   
  
        
        <div id="container" 
            style="
                margin:10px auto; 
                width: 940px; 
                height: 500px; 
            
                border: 1px solid gray;
                overflow:hidden;">
        </div>
    </div>

</body>
<script type="text/javascript">
    var map = new BMap.Map("container");
    
    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

    map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
    map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件
    map.addControl(new BMap.OverviewMapControl({ isOpen: true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT }));   //右下角，打开

    var localSearch = new BMap.LocalSearch(map);
    localSearch.enableAutoViewport(); //允许自动调节窗体大小

    map.clearOverlays();//清空原来的标注
    var keyword = "${house.haddress }";
    localSearch.setSearchCompleteCallback(function (searchResult) {
        var poi = searchResult.getPoi(0);
        
        map.centerAndZoom(poi.point, 19);
        
        var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地方对应的经纬度
          
       
        map.addOverlay(marker);
        var content = "<h2 style='margin:0 0 5px 0;padding:0.2em 0'>${house.housename }</h2>" + "<br/>"+"<img src='${house.imgurl}'style='width: 200px;height: 150px;' />"+ "<br/><br/>" + "<p style='font-size:14px;'>"+"地址   :  ${house.haddress }"+ "</p>";
        var infoWindow = new BMap.InfoWindow(  content );
      
        marker.addEventListener("click", function () { this.openInfoWindow(infoWindow); });
        // marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
    });
    localSearch.search(keyword);

</script>
</html>
