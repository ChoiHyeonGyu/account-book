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
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/facebook.js"></script>
<img alt="로고" src="${pageContext.request.contextPath}/assets/images/hipo-logo.png">
<button id="login" type="button" class="btn btn-lg btn-default">Login</button><br/>
<fb:login-button class="fackbook-login-button" scope="public_profile,email,user_birthday" size="xlarge" onlogin="checkLoginState()">FACEBOOK과 연동하여 Login</fb:login-button>
<form method="post" action="${pageContext.request.contextPath}/main" id="fbpost">
	<input type="hidden" id="fbhidden" name="fbhidden" value="">
</form>
<button type="button" class="btn btn-lg btn-default">XX와 연동하여 로그인</button><br/>
<button id="join" type="button" class="btn btn-lg btn-default">Join</button>
<div id="loginform" title="로그인" style="display:none">
	<form:form method="post">
    	<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
    	<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
    </form:form>
</div>
<div id="joinform" title="회원가입" style="display:none">
	<form id="joinpost" name="joinform" action="${pageContext.request.contextPath}/join" method="post">
		<h3><span class="label label-default">Account</span></h3>
		<input type="text" id="id" name="id" class="form-control" placeholder="Email / Phone" required><br/>
		<button type="button" id="confirm" name="userRegBtn" class="btn btn-join">Confirm</button>
		
		<h3><span class="label label-default">Password</span></h3>
		<input type="password" id="password" name="password" class="form-control" placeholder="Password" required><br/>
		
		<h3><span class="label label-default">Password Confirm</span></h3>
		<input type="password" id="passwordConfirm" class="form-control" placeholder="Password Confirm" required><br/>
		
		<h3><span class="label label-default">Name</span></h3>
		<input type="text" id="name" name="name" class="form-control" placeholder="Name" required><br/>
		
		<h3><span class="label label-default">Gender</span></h3>
		<input type="radio" name="gender" value="남자" checked="checked"/>
		<span class="up">Male</span>&nbsp;&nbsp; <input type="radio" name="gender" value="여자"/> 
		<span class="up">Female</span><br/><br/>

		<h3><span class="label label-default">Birth</span></h3>
		<div class="dropdown theme-dropdown clearfix">
		<select id="year" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" name="birthYear">
				<option role="presentation" value="Year"><a role="menuitem" tabindex="0" href="#">Year</a></option>
				<c:forEach begin="1970" end="2017" var="i">
				<option role="presentation" value="${i}"><a role="menuitem" tabindex="${i }" href="#">${i }</a></option>
				</c:forEach>
		</select>
		<select id="month" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" name="birthMonth">
				<option role="presentation" value="Month"><a role="menuitem" tabindex="0" href="#">Month</a></option>
				<c:forEach begin="1" end="12" var="i">
				<option role="presentation" value="${i}"><a role="menuitem" tabindex="${i }" href="#">${i }</a></option>
				</c:forEach>
		</select>
		<select id="day" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" name="birthDay">
				<option role="presentation" value="Day"><a role="menuitem" tabindex="0" href="#">Day</a></option>
				<c:forEach begin="1" end="31" var="i">
				<option role="presentation"  value="${i}"><a role="menuitem" tabindex="${i }" href="#">${i }</a></option>
				</c:forEach>
		</select>
		</div>
		<h3><span class="label label-default">Total Money</span></h3>
		<input type="text" id="total" name="total" class="form-control" placeholder="Total Money" required><br/><br/>
		<input type="hidden" name="age" value="0"><input type="hidden" name="photo" value="">
		
		<input type="submit" value="Create" class="btn btn-join">
	</form>
</div>
</body>
</html>