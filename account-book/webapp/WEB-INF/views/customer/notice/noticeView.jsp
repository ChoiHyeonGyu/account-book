<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/notice/notice.css">

<div class="container">
	<div class="row mt">
		<div class="col-md-12">
			<h1 align="left" style="margin-top: 75px; margin-bottom: 25px;">공지
				사항</h1>
			<div class="panel panel-primary">
				<!-- Default panel contents -->
				<div class="panel-heading">${view.noticeview.noticeTitle }</div>
				<table class="table table-bordered">
				<colgroup>
				<col width="77%">
				<col width="16%">
				<col width="7%">
				</colgroup>
					<thead>
						<tr>
							<th><span>관리자</span></th>
							<th><span class="glyphicon glyphicon-time gray"
								aria-hidden="true">${view.noticeview.noticeDay }</span></th>
							<th><span class="glyphicon glyphicon-eye-open gray"
								aria-hidden="true">${view.noticeview.noticeHit }</span></th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td colspan="3">${view.noticeview.noticeContent }
								</td>
							</tr>
					</tbody>
				</table>
			</div>
			<form action="${pageContext.request.contextPath}/${currentuserid}/"
				method="post">
				<button type="button" class="fa fa-pencil notice notice4"
					style="margin-bottom: 20px; float: right;">글쓰기</button>
			</form>
		</div>
	</div>
</div>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp" />
