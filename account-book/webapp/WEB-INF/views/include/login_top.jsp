<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 각페이지에서 공통으로 사용하는 css, js 링크영역 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/jquery/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/creative.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/sb-admin-2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/commonness.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/include/join.css">
<script src="${pageContext.request.contextPath}/assets/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/jquery/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/frontpage/login.js"></script>
<title>편리가계부</title>
</head>
<body>

<!-- 상단 네비게이션 바 -->
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid bg-black">
    	<div class="container">
	        <div class="navbar-header">
	        	<img class="hipo-logo" alt="로고" src="${pageContext.request.contextPath}/assets/images/hipo-logo.png">
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
	            </button>
	            <a class="navbar-brand page-scroll" href="${pageContext.request.contextPath}/">편리가계부</a>
	            <font size="6px" color="white">|</font>
	            <ul class="nav navbar-nav navbar-right">
	                <li>
	                    <a class="page-scroll" href="${pageContext.request.contextPath}/board">씀씀이 이야기</a>
	                </li>
	                <li>
	                    <a class="page-scroll" href="${pageContext.request.contextPath}/graph">통계</a>
	                </li>
	                <li>
	                    <a class="page-scroll" href="${pageContext.request.contextPath}/help">고객센터</a>
	                </li>
	            </ul>
	        </div>
	        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	        	<ul class="nav navbar-nav navbar-right">
	                <li>
                    	<a class="page-scroll" href="${pageContext.request.contextPath}/">로그인</a>
                	</li>
                	<li>
                    	<a class="page-scroll" href="" id="join2">회원가입</a>
                	</li>
	            </ul>
	        </div>
        </div>
    </div>
</nav>

<!-- 팝업영역  -->

<!-- 회원가입 -->
<div id="joinform" title="회원가입" style="display:none">
	<form id="joinpost" name="joinform" action="${pageContext.request.contextPath}/join" method="post">
		<h3><span class="label label-info">계정</span></h3>
		<input type="text" id="id" name="id" class="form-control2" placeholder="Email / Phone" required>
		<button type="button" id="confirm" class="btn btn-lg btn-info">중복확인</button>
		
		<h3><span class="label label-info">비밀번호</span></h3>
		<input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
		
		<h3><span class="label label-info">비밀번호 확인</span></h3>
		<input type="password" id="passwordConfirm" class="form-control" placeholder="Password Confirm" required>
		
		<h3><span class="label label-info">이름</span></h3>
		<input type="text" id="name" name="name" class="form-control" placeholder="Name" required>
		
		<h3><span class="label label-info">성별</span></h3>
		<input type="radio" name="gender" value="남자" checked="checked"/>
		<span class="up">Male</span>&nbsp;&nbsp; <input type="radio" name="gender" value="여자"/> 
		<span class="up">Female</span>

		<h3><span class="label label-info">생년월일</span></h3>
		<div class="dropdown theme-dropdown ">
			<select id="year" class="dropdown-menu" name="birthYear">
					<option value="Year">Year</option>
					<c:forEach begin="1970" end="2017" var="i">
						<option value="${i}">${i}</option>
					</c:forEach>
			</select>
			<select id="month" class="dropdown-menu" name="birthMonth">
					<option value="Month">Month</option>
					<c:forEach begin="1" end="12" var="i">
						<option value="${i}">${i}</option>
					</c:forEach>
			</select>
			<select id="day" class="dropdown-menu" name="birthDay">
					<option value="Day">Day</option>
					<c:forEach begin="1" end="31" var="i">
						<option value="${i}">${i}</option>
					</c:forEach>
			</select>
		</div>
		
		<h3><span class="label label-info">총액</span></h3>
		<input type="text" id="total" name="total" class="form-control" placeholder="Total Money" required><br/>
		
		<input type="submit" value="생성" class="btn btn-lg btn-info">
	</form>
</div>

<!-- /팝업영역 -->