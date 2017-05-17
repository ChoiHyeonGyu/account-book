<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/creative.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/jquery/jquery-ui.css">
<script src="${pageContext.request.contextPath}/assets/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/jquery/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/login.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/viewboard.js"></script>
<title>편리가계부</title>
</head>
<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/facebook.js"></script>
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
        	<img class="hipo-logo" alt="로고" src="${pageContext.request.contextPath}/assets/images/hipo-logo.png">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="${pageContext.request.contextPath}/login">Comportable Account-Book</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="page-scroll" href="${pageContext.request.contextPath}/notice">공지사항</a>
                </li>
                <li>
                    <a class="page-scroll" href="${pageContext.request.contextPath}/board">자신의 씀씀이 이야기</a>
                </li>
                <li>
                    <a class="page-scroll" href="${pageContext.request.contextPath}/graph">통계</a>
                </li>
                <li>
                    <a class="page-scroll" href="${pageContext.request.contextPath}/help">고객센터</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>