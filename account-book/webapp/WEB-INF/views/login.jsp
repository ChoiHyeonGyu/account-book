<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jquery/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/login.js"></script>
<title>편리가계부</title>
</head>
<body>
<img alt="로고" src="${pageContext.request.contextPath}/assets/images/hipo-logo.png">
<button id="login" type="button" class="btn btn-lg btn-default">로그인</button><br/>
<button type="button" class="btn btn-lg btn-default">XX와 연동하여 로그인</button><br/>
<button type="button" class="btn btn-lg btn-default">XX와 연동하여 로그인</button><br/>
<button id="join" type="button" class="btn btn-lg btn-default">회원가입</button>
<div id="loginform" title="로그인" style="display:none">
	<form:form method="post">
    	<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus><br/>
    	<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
    </form:form>
</div>
<div id="joinform" title="회원가입" style="display:none">
	<form:form method="post">
		<h3><span class="label label-default">Account</span></h3>
		<input type="account" id="inputAccount" class="form-control" placeholder="Email / Phone"><br/>
		<button type="button" name="userRegBtn" class="btn btn-lg btn-join">Confirm</button>
		<h3><span class="label label-default">Password</span></h3>
		<input type="password" id="inputPassword" class="form-control" placeholder="Password" required><br/> 
		<h3><span class="label label-default">Password Confirm</span></h3>
		<input type="passwordConfirm" id="inputPasswordConfirm" class="form-control" placeholder="Password Confirm" required><br/>
		<h3><span class="label label-default">Name</span></h3>
		<input type="name" id="inputName" class="form-control" placeholder="Name" required><br/> 
		<h3><span class="label label-default">Birth</span></h3>
		<div class="dropdown theme-dropdown clearfix">
		<select class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				<option role="presentation"><a role="menuitem" tabindex="1" href="#">Year</a></option>
				<option role="presentation"><a role="menuitem" tabindex="1" href="#">1970</a></option>
		</select>
		<select class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				<option role="presentation"><a role="menuitem" tabindex="1" href="#">Month</a></option>
				<option role="presentation"><a role="menuitem" tabindex="1" href="#">1</a></option>
		</select>
		<select class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				<option role="presentation"><a role="menuitem" tabindex="1" href="#">Day</a></option>
				<option role="presentation"><a role="menuitem" tabindex="1" href="#">1</a></option>
		</select>
		</div>
	</form:form>
</div>
</body>
</html>