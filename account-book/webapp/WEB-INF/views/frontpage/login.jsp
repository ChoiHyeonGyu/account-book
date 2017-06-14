<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:choose>
	<c:when test="${currentuserid != null}">
		<c:import url="/WEB-INF/views/include/logon_main_top.jsp" />
	</c:when>
	<c:otherwise>
		<c:import url="/WEB-INF/views/include/login_main_top.jsp" />
	</c:otherwise>
</c:choose>

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/frontpage/facebook.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/left_menu/option.css">

<div class="container">
	<div class="row">

		<!-- 슬라이드 -->
		<div class="crs-mt col-md-8">
			<iframe width="770" height="338" src="https://www.youtube.com/embed/74RzHIpZuDY" frameborder="0" allowfullscreen></iframe>
		</div>

		<!-- 로그인 / 회원가입 -->
		<div class="col-md-4">
			<div class="login-panel panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">로그인 / 회원가입</h3>
				</div>
				<div class="panel-body">
					<form method="post"
						action="${pageContext.request.contextPath}/connmain">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="E-mail / Phone" name="id" required>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="password" type="password" required>
							</div>
							<button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
							<br />
							<c:if test="${result != error}">
								<p style="font-weight: bold; text-align: center; padding: 5px 0 5px 0; color: red">회원가입에 실패하셨습니다. 정보를 제대로 다시 입력해주세요.</p>
							</c:if>
							<c:if test="${res != ult}">
								<p style="font-weight: bold; text-align: center; padding: 5px 0 5px 0; color: red">로그인에 실패하셨습니다. 정보를 제대로 다시 입력해주세요.</p>
							</c:if>
							<fb:login-button class="fackbook-login-button" scope="public_profile,email,user_birthday" size="xlarge" onlogin="checkLoginState()">
                            	FACEBOOK 으로 로그인
                            </fb:login-button>
							<br />
							<br />
							<button id="join" type="button"
								class="btn btn-lg btn-info btn-block">회원가입</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<!-- /로그인 / 회원가입 -->
		
		<div class="col-md-6">
			<p class="fontred">/* 원하시는 통계를 설정해주세요. */</p>
			<div class="dropdown theme-dropdown clearfix">
				<select id="graph-import" class="dropdown-menu col-md-6">
					<option>월 수입(전체)</option>
					<option>100만원 이하</option>
					<c:forEach begin="100" end="950" step="50" var="i">
						<option>${i}만원 ~ ${i+50}만원 사이</option>
					</c:forEach>
					<c:forEach begin="1000" end="9000" step="500" var="i">
						<option>${i}만원 ~ ${i+500}만원 사이</option>
					</c:forEach>
					<option>9500만원 ~ 1억원 사이</option>
					<option>1억원 이상</option>
				</select>
				<select id="graph-gender" class="dropdown-menu col-md-6">
					<option>성별(전체)</option>
					<option>남자</option>
					<option>여자</option>
				</select>
				<select id="graph-age" class="dropdown-menu col-md-6">
					<option>시작 나이(전체)</option>
					<c:forEach begin="20" end="48" var="i">
						<option>${i}</option>
					</c:forEach>
				</select>
				<select id="graph-age1" class="dropdown-menu col-md-6">
					<option>끝 나이(전체)</option>
					<c:forEach begin="20" end="48" var="i">
						<option>${i}</option>
					</c:forEach>
				</select>
			</div>
			<button style="float:right">통계 보기</button>
		</div>
		<div class="col-md-6">
			<a href="${pageContext.request.contextPath}/${currentuserid}/story"><img src="${pageContext.request.contextPath}/assets/images/front.PNG" width="550" height="350"></a>
		</div>
	</div>
</div>



<!-- 페이스북 정보 -->
<form method="post" action="${pageContext.request.contextPath}/main" id="fbpost">
	<input type="hidden" id="fbhidden" name="id" value="">
</form>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp" />