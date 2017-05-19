<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />

<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/css/notice/notice.css">

<div class="container">
	<div class="row mt">
		<div class="col-md-12">
			<h1 align="left" style="margin-top:75px; margin-bottom: 25px;">공지 사항</h1>
			<table class="table">
				<thead>
					<tr bgcolor='#002266'>
						<th><span class="glyphicon glyphicon-time white" aria-hidden="true"></span></th>
						<th></th>
						<th><span class="glyphicon glyphicon-user white" aria-hidden="true"></span></th>
						<th><span class="glyphicon glyphicon-eye-open white" aria-hidden="true"></span></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>2017-5-19 11:15:20</td>
							<td>무지무지무지..............</td>
							<td>cp3</td>
							<td >100</td>
						</tr>
						<tr>
							<td>2017-5-19 11:15:20</td>
							<td>무지무지무지..............</td>
							<td>cp3</td>
							<td >100</td>
						</tr>
						<tr>
							<td>2017-5-19 11:15:20</td>
							<td>무지무지무지..............</td>
							<td>cp3</td>
							<td >100</td>
						</tr>
						<tr>
							<td>2017-5-19 11:15:20</td>
							<td>무지무지무지..............</td>
							<td>cp3</td>
							<td >100</td>
						</tr>
						<tr>
							<td>2017-5-19 11:15:20</td>
							<td>무지무지무지..............</td>
							<td>cp3</td>
							<td >100</td>
						</tr>
						<tr>
							<td>2017-5-19 11:15:20</td>
							<td>무지무지무지..............</td>
							<td>cp3</td>
							<td >100</td>
						</tr>
						
				</tbody>
			</table>
			<form
				action="${pageContext.request.contextPath}/${currentuserid}/"
				method="post">
				<button type="button"
					class="fa fa-pencil notice notice4"
					style="margin-bottom: 20px; float:right;">글쓰기</button>
			</form>
		</div>
	</div>
</div>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp" />
