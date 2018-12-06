<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:property value="next"/>
<s:iterator value="lihouse" var="house">
	<dl>
	 <dt><a href="hd_query?houseid=${house.houseid }"><img class="imglist" src="${house.imgurl }" style="width: 286px;height: 188px;"  /></a></dt>
	 <dd>
	  <h3>
	  <a href="hd_query?houseid=${house.houseid }">${house.housename }</a>&nbsp;&nbsp;
	  <svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)" onclick="showurl('${house.houseid}')">
         <use xlink:href="#icon-cl-share"></use>
      </svg>
	  </h3>
	  <div class="pro-wei">
	   <!-- <img src="images/weizhi.png" width="12" height="16" /> -->
	   <svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)">
          <use xlink:href="#icon-zuobiao"></use>
       </svg>
        <strong class="red">${house.regionid.regionname }</strong>
	  </div>
	  <div class="pro-fang">
		   <svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)" onclick="showmap('${house.haddress}')">
	           <use xlink:href="#icon-ditu1"></use>
	       </svg>
	       <a href="javascript:;" onclick="showmap('${house.haddress}')" >
		  &nbsp;${house.haddress}</a>
	  </div>
	  <div class="pro-fang">
	  	&nbsp;&nbsp;
	  	<s:if test="#house.typeid.room!=0">
	  		${house.typeid.room }&nbsp;&nbsp;<svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)"><use xlink:href="#icon-jiajiabaojie-tubiao-"></use></svg>
	  	</s:if>
	  	<s:if test="#house.typeid.hall!=0">
	  		${house.typeid.hall }&nbsp;&nbsp;<svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)"><use xlink:href="#icon-huiyishi"></use></svg>
	  	</s:if>
	  	<s:if test="#house.typeid.toilet!=0">
	  		${house.typeid.toilet }&nbsp;&nbsp;<svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)"><use xlink:href="#icon-weiyu3"></use></svg>
	  	</s:if>
	  	</div>
	  <div class="pro-fang">
  	     &nbsp;&nbsp;${house.area }平&nbsp;&nbsp;
  	     <svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)"><use xlink:href="#icon-zhinanzhen"></use></svg>
  	     &nbsp;${house.orientation.ctext }
  	     &nbsp;
  	     <svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)"><use xlink:href="#icon-loucengxinxi"></use></svg>
  	     &nbsp;${house.floor }层
	  </div>
	  <div class="pro-fang">
	  	<svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)"><use xlink:href="#icon-ren"></use></svg>
	  	${house.mediumid.userid.username } &nbsp;&nbsp;&nbsp; 
	  	<svg class="icon" aria-hidden="true" onmouseover="svgbig(this)" onmouseout="svgsmall(this)"><use xlink:href="#icon-rili"></use></svg>
	  	${house.releaseTime }
	  </div>
	 </dd>
	
	 <div class="price">
	 	¥ <s:if test="renttype.cid==1"><strong>${house.rentmoney }</strong><span class="font12">元/月</span></s:if>
	 	<s:if test="renttype.cid!=1"><strong>${house.rentmoney/10000 }</strong><span class="font12">万</span></s:if>
	 </div>
	 <div class="clears"></div>
	</dl>
	
</s:iterator>