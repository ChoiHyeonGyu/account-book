<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/main_top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/morrisjs/morris.css">
<script src="${pageContext.request.contextPath}/assets/raphael/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/morrisjs/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/morris-data.js"></script>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyD4b_BFpjBL1PYY6pKL7vGrLWyB7n_qBa0"></script>
<script src="${pageContext.request.contextPath}/assets/js/list.js"></script>
    <div class="container">
    	<div class="row mt">
	    	<div class="col-lg-2"><c:import url="/WEB-INF/views/profile.jsp"/></div>
	    	<div class="col-lg-10">
	    		<c:import url="/WEB-INF/views/limit_graph.jsp"/>
	    		<c:import url="/WEB-INF/views/list.jsp"/>
	    	</div>
    	</div>
    </div>
<c:import url="/WEB-INF/views/main_bottom.jsp"/>