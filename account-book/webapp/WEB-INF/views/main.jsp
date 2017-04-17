<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>편리가계부</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/div.css">
</head>
<body>
<div class="div-left">
	<c:import url="/WEB-INF/views/profile.jsp"/>
</div>
<div class="div-center">
	<div class="div-top-left"><c:import url="/WEB-INF/views/graph_user.jsp"/></div>
	<div class="div-bottom-left"><c:import url="/WEB-INF/views/list.jsp"/></div>
</div>
<div class="div-right">
	<div class="div-top-right"><c:import url="/WEB-INF/views/graph_avg.jsp"/></div>
	<div class="div-bottom-right"><c:import url="/WEB-INF/views/board.jsp"/></div>
</div>
</body>
</html>