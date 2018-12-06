<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${msg2 == 'true'}">
	
<span style="color: green"> 该邮箱可使用！</span>
</c:if>
<c:if test="${msg2 == 'false'}">
	<span style="color: red" >该邮箱还未注册！</span>
</c:if>