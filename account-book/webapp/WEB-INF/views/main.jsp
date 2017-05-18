<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/main_top.jsp"/>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyD4b_BFpjBL1PYY6pKL7vGrLWyB7n_qBa0"></script>
<script src="${pageContext.request.contextPath}/assets/js/list.js"></script>
    <div class="container">
    	<div class="row mt">
	    	<div class="col-lg-3"><c:import url="/WEB-INF/views/profile.jsp"/></div>
	    	<div class="col-lg-9">
	    		<c:import url="/WEB-INF/views/limit_graph.jsp"/>
	    		<c:import url="/WEB-INF/views/list.jsp"/>
	    	</div>
    	</div>
    </div>
<c:import url="/WEB-INF/views/main_bottom.jsp"/>