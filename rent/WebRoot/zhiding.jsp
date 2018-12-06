<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <c:forEach items="${ilist }" var="i">
	      <dl>
	       <dt><img src="${i.userid.headimage }" /></dt>
	       <c:if test="${i.status =='未读' }">
	       <dd>
	       (未读) <h3 class="glyphicon glyphicon-user" style="font-weight: bold;">&nbsp;${i.userid.username }&nbsp;<label  style="font-size: 10px;">联系电话： ${i.userid.phone }</label></h3>
	      
	       <div class="wuxing" style="margin-top: 5px;font-weight: bold;">您有房源符合此用户需求！</div> 
	       </dd>
	        <div class="xunzhang" style="width: 150px;margin-top: 30px;"><button type="button"  class="btn btn-success btn-xs" onclick="updateinfo(${i.iid })">标记已读</button>&nbsp;<button type="button" onclick="deleteinfo(${i.iid })" class="btn btn-danger btn-xs">删除</button></div>
	       <div class="clearfix"></div>
	       </c:if>
	        <c:if test="${i.status =='已读' }">
	       <dd>
	        <h3 class="glyphicon glyphicon-user" >&nbsp;${i.userid.username }&nbsp;<label  style="font-size: 10px;">联系电话： ${i.userid.phone }</label></h3>
	      
	       <div class="wuxing" style="margin-top: 5px;">您有房源符合此用户需求！</div> 
	       </dd>
	        <div class="xunzhang" style="width: 100px;margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  class="btn btn-danger btn-xs" onclick="deleteinfo(${i.iid })">删除</button></div>
	       <div class="clearfix"></div>
	       </c:if>
		</dl>
	        </c:forEach>