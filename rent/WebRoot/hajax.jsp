<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <c:forEach items="${hlist }" var="i">
	      <dl>
	       <dt><img src="${i.imgurl }" /></dt>
	       <dd> 
	       <h3 class="glyphicon glyphicon-user" style="font-weight: bold;">&nbsp;${i.housename}
	    	
	      
	       <h5 class="wuxing" class="glyphicon glyphicon-home" style="margin-top: 5px;font-weight: bold;">地址： ${i.haddress }</h5> 
	       <h5 class="wuxing" class="glyphicon glyphicon-home" style="font-weight: bold;">房源状态： ${i.hstatus}</h5> 
	       </dd>

	       	<c:if test="${i.hstatus == '上架'}">
	        	<div class="xunzhang" style="width: 150px;margin-top: 30px;"><button type="button"  class="btn btn-danger btn-xs" onclick="down(${i.houseid })">下架</button>&nbsp;</div> 
	       </c:if>
	        <c:if test="${i.hstatus == '下架'}">
	        	<div class="xunzhang" style="width: 150px;margin-top: 30px;"><button type="button"  class="btn btn-success btn-xs" onclick="up(${i.houseid })">上架</button>&nbsp;</div> 
	       </c:if>
	       	<div class="clearfix"></div>
	      
	      </dl>
      
      
      </c:forEach>