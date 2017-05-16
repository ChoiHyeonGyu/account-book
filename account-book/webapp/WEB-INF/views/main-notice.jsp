<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/main_top.jsp"/>
    <div class="container">
    	<div class="row">
	    	<div class="col-lg-3"><c:import url="/WEB-INF/views/profile.jsp"/></div>
	    	<div class="col-lg-9"><c:import url="/WEB-INF/views/list.jsp"/></div>
    	</div>
    </div>
<c:import url="/WEB-INF/views/main_bottom.jsp"/>