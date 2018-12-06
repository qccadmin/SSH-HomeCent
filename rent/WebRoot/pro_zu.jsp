<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	<link type="text/css" href="layui/css/layui.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/js.js"></script>
	<script src="http://at.alicdn.com/t/font_934164_a2jm98ex7qd.js" type="text/javascript"></script>
	<style type="text/css">
	  .icon {
	    /* 通过设置 font-size 来改变图标大小 */
	    width: 1.3em; height: 1.3em;
	    /* 图标和文字相邻时，垂直对齐 */
	    vertical-align: -0.15em;
	    /* 通过设置 color 来改变 SVG 的颜色/fill */
	    fill: currentColor;
	    /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
	       normalize.css 中也包含这行 */
	    overflow: hidden;
	  }
	
	</style>


  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
 <div class="content">
  <div class="width1190">
   <div  class="pro-search">
    <table>
     <tr>
      <th>房源区域：</th>
      <td>
       <a href="javascript:;" class="pro-cur"  mapkey="regionid.regionid" onclick="unchange(this)">不限</a>
       <c:forEach items="${liregion}" var="region">
      	 <a href="javascript:;" mapkey="regionid.regionid" mapvalue="${region.regionid }" onclick="change(this)">${region.regionname }</a>
       </c:forEach>
      </td>
     </tr>
     
    
   <tr>
      
      <c:if test="${renttype ==1}">
      <th>租金：</th>
      <td>
       <a href="javascript:;" class="pro-cur" mapkey="rentmoney" onclick="unchange(this)">不限</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="0,500" onclick="change(this)">500以下</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="500,1000" onclick="change(this)">501-1000</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="1001,2000" onclick="change(this)">1001-2000</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="2001,3000" onclick="change(this)">2001-3000</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="3001" onclick="change(this)">3001以上</a>
       <input type="number" class="prtext" id="jiage1" /> - <input type="number" class="prtext" id="jiage2" /> 元 
       <button id="btnjiage" class="proSub" onclick="zidingyi('jiage',1,'rentmoney','btnjiage')">确定</button>
      </td>
      </c:if>
      <c:if test="${renttype ==2}">
      <th>价格：</th>
      <td>
       <a href="javascript:;" class="pro-cur" mapkey="rentmoney" onclick="unchange(this)">不限</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="0,400000" onclick="change(this)">40万以下</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="400000,600000" onclick="change(this)">40万-60万</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="600000,900000" onclick="change(this)">60万-90万</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="900000,1200000" onclick="change(this)">90万-120万</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="1200000" onclick="change(this)">120万以上</a>
      <input type="number" class="prtext" id="jiage1" /> - <input type="number" class="prtext" id="jiage2" />万 元 
       <button id="btnjiage" class="proSub" onclick="zidingyi('jiage',10000,'rentmoney','btnjiage')">确定</button>
      </td>
      </c:if>
       <c:if test="${renttype ==3}">
      <th>价格：</th>
      <td>
       <a href="javascript:;" class="pro-cur" mapkey="rentmoney" onclick="unchange(this)">不限</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="0,300000" onclick="change(this)">30万以下</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="300000,450000" onclick="change(this)">30万-45万</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="450000,750000" onclick="change(this)">45万-75万</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="750000,1000000" onclick="change(this)">75万-100万</a>
       <a href="javascript:;" mapkey="rentmoney" mapvalue="1000000" onclick="change(this)">100万以上</a>
      <input type="number" class="prtext" id="jiage1" /> - <input type="number" class="prtext" id="jiage2" />万 元 
       <button id="btnjiage" class="proSub" onclick="zidingyi('jiage',10000,'rentmoney','btnjiage')">确定</button>
      </td>
      </c:if>
    </tr>   
      
     <tr>
      <th>面积：</th>
      <td>
       <a href="javascript:;" class="pro-cur" mapkey="area" onclick="unchange(this)">不限</a>
       <a href="javascript:;" mapkey="area" mapvalue="0,20" onclick="change(this)">20平方以下</a>
       <a href="javascript:;" mapkey="area" mapvalue="21,40" onclick="change(this)">21-40平方</a>
       <a href="javascript:;" mapkey="area" mapvalue="41,60" onclick="change(this)">41-60平方</a>
       <a href="javascript:;" mapkey="area" mapvalue="61,80" onclick="change(this)">61-80平方</a>
       <a href="javascript:;" mapkey="area" mapvalue="81,100" onclick="change(this)">81-100平方</a>
       <a href="javascript:;" mapkey="area" mapvalue="101" onclick="change(this)">101平方以上</a>
      	 <input type="number" class="prtext" id="ipinfang1" /> - <input type="number" class="prtext" id="ipinfang2" /> 平方 
       <button id="btnarea" class="proSub" onclick="zidingyi('ipinfang',1,'area','btnarea')">确定</button>
      </td>
     </tr>
     <tr>
      <th>房型：</th>
      <td>
       <a href="javascript:;" class="pro-cur" mapkey="typeid.tid" onclick="unchange(this)">不限</a>
       <c:forEach items="${liht}" var="htype">
       <!-- room=1, hall=1, toilet=1 -->
      	 <a href="javascript:;" mapkey="typeid.tid" mapvalue="${htype.tid }" onclick="change(this)">${htype.room }室${htype.hall }厅${htype.toilet }卫</a>
       </c:forEach>
      
      </td>
     </tr>
    </table>
  <!--   <div class="paixu">
     <strong>排序：</strong>
     <a href="javascript:;" class="pai-cur">默认</a>
     <a href="javascript:;">价格 &or;</a>
     <a href="javascript:;">最新 &or;</a>
    </div> -->
   </div><!--pro-search/-->
  </div><!--width1190/-->
  <div id="showlistdiv" class="width1190">
     
   <div id="houselistdiv0" class="pro-left">
    
    
    
    
   </div><!--pro-left/-->
    
    

   
   <div class="pro-right">
    <h2 class="right-title">新上房源</h2>
    <div class="right-pro">
     <s:iterator value="linewhouse" var="newhouse">
	     <dl>
	      <dt><a href="hd_query?houseid=${newhouse.houseid }"><img src="<s:property value='#newhouse.imgurl'/>" /></a></dt>
	      <dd>
	       <h3><a href="hd_query?houseid=${newhouse.houseid }"><s:property value='#newhouse.housename'/></a></h3>
	       <div class="pro-fang"><s:property value='#newhouse.typeid.room'/>室<s:property value='#newhouse.typeid.hall'/>厅<s:property value='#newhouse.typeid.toilet'/>卫     <s:property value='#newhouse.area'/>平 <s:property value='#newhouse.orientation.ctext'/></div>
	       <div class="right-price"><s:property value='#newhouse.rentmoney'/>元</div>
	      </dd>
	     </dl>
     </s:iterator>
     
     
    </div><!--right-pro/-->
   </div><!--pro-right/-->
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--content/-->
 
 <div id="showurldiv" style="display: none; text-align:center;">
	<br><br>
	<svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-lianjie"></use>
    </svg>
    &nbsp;&nbsp;&nbsp;&nbsp;
      <div class="layui-input-inline">
      
        <input id="inputurl" type="tel" autocomplete="off" class="layui-input">
      </div>
      <br><br><br>
 	<img id="imgurl" alt="" src="" height="250px">
 </div>
 
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">

	var renttype = '${renttype}';
	var re = false;
	var divi = 0;
	$(document).ready(function(){
		liu();
		
	}); 
 	var map = {};
 	function change(obj){
 		var mapkey = $(obj).attr("mapkey");
 		var mapvalue = $(obj).attr("mapvalue");
 		map[mapkey] = mapvalue;
 		submit();
 	}
 	function unchange(obj){
 		var mapkey = $(obj).attr("mapkey");
 		delete map[mapkey];
 		submit();
 	}
 	function zidingyi(str,cheng,mapkey,id){
 		var value1 = parseInt($.trim($("#"+str+1).val()));
 		var value2 = parseInt($.trim($("#"+str+2).val()));
 		if(value1==null||value1==''||isNaN(value1)||value2==null||value2==''||isNaN(value2)){
 			layer.tips('请正确输入数字', '#'+id);
 			return;
 		}
 		
 		if(value1<value2){
 			var mapvalue = value1*cheng+','+value2*cheng;
 	 		map[mapkey] = mapvalue;
 	 		submit();
 		}else {
 			var mapvalue = value2*cheng+','+value1*cheng;
 	 		map[mapkey] = mapvalue;
 	 		submit();
 		}
 		
 		/* console.log(value1)
 		console.log(value2) */
 	}
 	function submit(){
 		console.log(map)
 		$("#houselistdiv"+divi).remove();
 		divi += 1;
 		$("#showlistdiv").prepend('<div id="houselistdiv'+divi+'" class="pro-left"></div>')
 		liu();
 	}
 	function svgbig(obj){
 		$(obj).css('width','2em');
 		$(obj).css('height','2em');
 	}
 	function svgsmall(obj){
 		$(obj).css('width','1.3em');
 		$(obj).css('height','1.3em');
 	}
 	
</script>

<script src="layui/layui.all.js"></script>
<script>
	//一般直接写在一个js文件中
	layui.use(['layer', 'form'], function(){
	  var layer = layui.layer
	  ,form = layui.form;
	});
	function showmap(address){
		layer.open({
			type: 2,
		    shadeClose: false,
		    shade: false,
		    title: '房源位置',
		    offset: ['50px', '50px'],
		    maxmin: true, //开启最大化最小化按钮
		    area: ['1200px', '600px'],
			content: ['houselist_showmap?address='+address,'no'], //iframe的url，no代表不显示滚动条
			end: function(){ //此处用于演示
					//location.reload();
			 	 } 
			});
 	}
	function showurl(id){
		var curWwwPath=window.document.location.href;
		//获取主机地址之后的目录如：/Tmall/index.jsp
		var pathName=window.document.location.pathname;
		var pos=curWwwPath.indexOf(pathName);
		//获取主机地址，如： http://localhost:8080
		var localhostPaht=curWwwPath.substring(0,pos);
		//获取带"/"的项目名，如：/Tmall
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		var xqurl = localhostPaht+projectName+'/hd_query?houseid='+id;
		$("#inputurl").val(xqurl);
		$("#imgurl").attr('src','http://qr.liantu.com/api.php?&bg=ffffff&fg=00F5FF&logo=http://www.xiaodianwan.top:8080/rent/images/logo123.png&text='+xqurl);
		layer.open({
			type: 1,
		    shadeClose: true,
		    shade: false,
		    title: '房源位置',
		    offset: ['110px', '300px'],
		    maxmin: true, //开启最大化最小化按钮
		    area: ['450px', '450px'],
			content: $('#showurldiv'), //iframe的url，no代表不显示滚动条
			end: function(){ //此处用于演示
					$("#showurldiv").hide();
			 	 } 
			});
	}
	function liu(){
		layui.use('flow', function(){
		  var flow = layui.flow;
		  flow.load({
			    elem: '#houselistdiv'+divi //流加载容器
			    ,done: function(page, next){ //执行下一页的回调
			    	//console.log('page'+page)
			    	//console.log('next'+next)
			    	var strmap = JSON.stringify(map);
			    	//console.log(strmap)
			    	$.post("houselist_houseajaxbypage",{map:strmap,renttype:renttype,pagesize:5,pagenub:page},function(data){
			    		data = $.trim(data);
			    		next(data.substring(1), data.substring(0,1)==1);
			 		}); 
			    }
			  });
		}); 
	}
  

</script> 


  </body>
</html>
