<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/main_top.jsp"/>
<script src="${pageContext.request.contextPath}/assets/js/board.js"></script>
    <div class="container">
    	<div class="row mt">
	    	<div class="col-lg-3"><c:import url="/WEB-INF/views/profile.jsp"/></div>
	    	<div class="col-lg-9"><c:import url="/WEB-INF/views/board.jsp"/></div>
    	</div>
    </div>
<c:import url="/WEB-INF/views/main_bottom.jsp"/>