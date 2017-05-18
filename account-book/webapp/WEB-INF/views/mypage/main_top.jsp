<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/jquery/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/creative.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/div.css">
<script src="${pageContext.request.contextPath}/assets/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/jquery/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/creative.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sb-admin-2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/flot/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/assets/flot/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/assets/flot/jquery.flot.resize.js"></script>
<script src="${pageContext.request.contextPath}/assets/flot/jquery.flot.time.js"></script>
<script src="${pageContext.request.contextPath}/assets/flot-tooltip/jquery.flot.tooltip.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot-data.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/option.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/profile.js"></script>
<script>
	currentid = "${currentuserid}";
	path = "${pageContext.request.contextPath}";
</script>
<title>편리가계부</title>
</head>
<body id="page-top">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid bg-black">
        	<div class="container">
	            <div class="navbar-header">
	            	<img class="hipo-logo" alt="로고" src="${pageContext.request.contextPath}/assets/images/hipo-logo.png">
	                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
	                </button>
	                <a class="navbar-brand page-scroll" href="${pageContext.request.contextPath}/${currentuserid}/logon">편리가계부</a>
	                <font size="6px" color="white">|</font>
	                <ul class="nav navbar-nav navbar-right">
	                    <li>
	                        <a class="page-scroll" href="${pageContext.request.contextPath}/${currentuserid}/board">씀씀이 이야기</a>
	                    </li>
	                    <li>
	                        <a class="page-scroll" href="${pageContext.request.contextPath}/${currentuserid}/graph">통계</a>
	                    </li>
	                    <li>
	                        <a class="page-scroll" href="${pageContext.request.contextPath}/${currentuserid}/help">고객센터</a>
	                    </li>
	                </ul>
	            </div>
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                <ul class="nav navbar-nav navbar-right">
	                    <li>
	                        <a class="page-scroll" href="${pageContext.request.contextPath}/${currentuserid}/main">가계부</a>
	                    </li>
	                    <li>
	                        <a class="page-scroll" href="${pageContext.request.contextPath}/logout">로그아웃</a>
	                    </li>
	                </ul>
	            </div>
            </div>
        </div>
    </nav>