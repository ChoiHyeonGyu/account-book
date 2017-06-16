<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/login_main_top.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/frontpage/facebook.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/story/viewboard.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/customer/mainnotice.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap-social/bootstrap-social.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/left_menu/option.css">

<div class="container">
	<div class="row">

		<!-- 슬라이드 -->
		<div class="crs-mt col-md-8">
			<iframe width="770" height="339" src="https://www.youtube.com/embed/74RzHIpZuDY" frameborder="0" allowfullscreen></iframe>
		</div>

		<!-- 로그인 / 회원가입 -->
		<div class="col-md-4">
			<div class="login-panel panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">로그인 / 회원가입</h3>
				</div>
				<div class="panel-body">
					<form method="post"
						action="${pageContext.request.contextPath}/connmain">
						<fieldset>
							<div class="form-group loginmargintop">
								<input class="form-control" placeholder="E-mail / Phone" name="id" required>
							</div>
							<div class="form-group loginmarginbottom">
								<input class="form-control" placeholder="Password" name="password" type="password" required>
							</div>
							<c:if test="${result != error}">
								<p style="font-weight: bold; text-align: center; padding: 5px 0 5px 0; color: red">회원가입에 실패하셨습니다. 정보를 제대로 다시 입력해주세요.</p>
							</c:if>
							<c:if test="${res != ult}">
								<p style="font-weight: bold; text-align: center; padding: 5px 0 5px 0; color: red">로그인에 실패하셨습니다. 정보를 제대로 다시 입력해주세요.</p>
							</c:if>
							<button type="submit" class="btn btn-lg btn-info btnloc">로그인</button>
							<button id="join" type="button"	class="btn btn-lg btn-info btnloc">회원가입</button>
							<fb:login-button class="fackbook-login-button" scope="public_profile,email,user_birthday" size="xlarge" onlogin="checkLoginState()"></fb:login-button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<!-- /로그인 / 회원가입 -->
		
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">주로 사람들이 많이 찾는 통계</h3>
				</div>
				<div class="panel-body">
					<form method="post" action="${pageContext.request.contextPath}/graphex" class="col-md-6">
						<input type="hidden" name="select-import" value="100만원 이하">
						<input type="hidden" name="select-gender" value="남자">
						<input type="hidden" name="select-age" value="20">
						<input type="hidden" name="select-age1" value="23">
						<button type="submit" class="mainimage"><img src="${pageContext.request.contextPath}/assets/images/man1.jpg" width="140" height="123.5"></button>
					</form>
					<form method="post" action="${pageContext.request.contextPath}/graphex" class="col-md-6">
						<input type="hidden" name="select-import" value="100만원 이하">
						<input type="hidden" name="select-gender" value="여자">
						<input type="hidden" name="select-age" value="20">
						<input type="hidden" name="select-age1" value="23">
						<button type="submit" class="mainimage"><img src="${pageContext.request.contextPath}/assets/images/woman1.jpg" width="140" height="123.5"></button>
					</form>
					<form method="post" action="${pageContext.request.contextPath}/graphex" class="col-md-6">
						<input type="hidden" name="select-import" value="300만원 ~ 350만원 사이">
						<input type="hidden" name="select-gender" value="남자">
						<input type="hidden" name="select-age" value="30">
						<input type="hidden" name="select-age1" value="33">
						<button type="submit" class="mainimage"><img src="${pageContext.request.contextPath}/assets/images/man2.jpg" width="140" height="123.5"></button>
					</form>
					<form method="post" action="${pageContext.request.contextPath}/graphex" class="col-md-6">
						<input type="hidden" name="select-import" value="300만원 ~ 350만원 사이">
						<input type="hidden" name="select-gender" value="여자">
						<input type="hidden" name="select-age" value="30">
						<input type="hidden" name="select-age1" value="33">
						<button type="submit" class="mainimage"><img src="${pageContext.request.contextPath}/assets/images/woman2.jpg" width="140" height="123.5"></button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">결산월 탑5</h3>
				</div>
				<div class="panel-body">
					<table class="table">
				      <thead>
				        <tr>
				          <th>결산월</th>
				          <th>제목</th>
				          <th>추천</th>
				          <th>조회</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach var="list" items="${list}">
				      		<script>
					      		arrays.push("${list.boardId}");
				      		</script>
					        <tr>
					          <td>${list.month}</td>
					          <td>
					          	<c:choose>
						            <c:when test="${fn:length(list.title) > 16}">
						            	<label id="${list.boardId}">${fn:substring(list.title,0,15)}...</label>
						            </c:when>
					                <c:otherwise>
					                	<label id="${list.boardId}">${list.title}</label>
					                </c:otherwise>
					            </c:choose>
					          </td>
					          <td>${list.good}</td>
					          <td>${list.hit}</td>
					        </tr>
				     	</c:forEach>
				      </tbody>
				    </table>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">공지사항</h3>
				</div>
				<div class="panel-body">
					<table class="table">
				      <thead>
				        <tr>
				          <th>제목</th>
				          <th>조회</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach var="notice1" items="${notice}">
				      		<form id="${notice1.noticeId}form" method="post" action="${pageContext.request.contextPath}/noticeview">
				      			<input type="hidden" name="noticeId" value="${notice1.noticeId}">
				      		</form>
				      		<script>
				      			noticeIdarray.push("${notice1.noticeId}");
				      		</script>
					        <tr>
					          <td>
					          <c:choose>
					              <c:when test="${fn:length(notice1.noticeTitle) > 25}">
					            	  <label id="${notice1.noticeId}n">${fn:substring(notice1.noticeTitle,0,24)}...</label>
					              </c:when>
				                  <c:otherwise>
				                	  <label id="${notice1.noticeId}n">${notice1.noticeTitle}</label>
				                  </c:otherwise>
				              </c:choose>
					          </td>
					          <td>${notice1.noticeHit}</td>
					        </tr>
				     	</c:forEach>
				      </tbody>
				    </table>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- 페이스북 정보 -->
<form method="post" action="${pageContext.request.contextPath}/main" id="fbpost">
	<input type="hidden" id="fbhidden" name="id" value="">
</form>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp" />

<c:import url="/WEB-INF/views/story/import_main_popup.jsp"/>