<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>房源位置</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="http://api.map.baidu.com/api?key=kRHuqFbkaoDcf5CsmOY0fwlpOZZgMxkt&v=1.1&services=true"></script>
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

  </head>
  
  <body style="background:#CBE1FF" >
    <div style="width:730px;">   
        <div id="container" 
            style="position: absolute;
                margin-top:5px; 
                width: 1305px; 
                height: 550px; 
                top: 50; 
                border: 1px solid gray;
                overflow:hidden;">
        </div>
    </div>
</body>
<script type="text/javascript">
    var map = new BMap.Map("container");
    map.centerAndZoom(new BMap.Point(118.182758, 24.494937), 12);
    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
 
    map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
    map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件
    map.addControl(new BMap.OverviewMapControl({ isOpen: true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT }));   //右下角，打开
 
    var localSearch = new BMap.LocalSearch(map);
    localSearch.enableAutoViewport(); //允许自动调节窗体大小
    
    $(document).ready(function(){
    	searchByStationName()
    });
    
function searchByStationName() {
    map.clearOverlays();//清空原来的标注
    var keyword = '${address}';
    console.log(keyword);
    localSearch.setSearchCompleteCallback(function (searchResult) {
        var poi = searchResult.getPoi(0);
        //document.getElementById("result_").value = poi.point.lng + "," + poi.point.lat;
        map.centerAndZoom(poi.point, 13);
        var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地方对应的经纬度
        map.addOverlay(marker);
        //var content = document.getElementById("text_").value + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
        //var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p>");
        marker.addEventListener("click", function () { this.openInfoWindow(infoWindow); });
        //marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
    });
    localSearch.search(keyword);
} 
</script>
    
  </body>
</html>
