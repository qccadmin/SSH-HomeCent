<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${msg == 'true'}">
	
<span style="color: green">房源库存在该户型！</span>
</c:if>
<c:if test="${msg == 'false'}">
	<span style="color: red" >房源库不存在该户型！</span>
</c:if>