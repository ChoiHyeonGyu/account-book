<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:choose>
	<c:when test="${currentuserid != null}">
		<c:import url="/WEB-INF/views/include/main_top.jsp" />
	</c:when>
	<c:otherwise>
		<c:import url="/WEB-INF/views/include/login_top.jsp" />
	</c:otherwise>
</c:choose>

<script
	src="${pageContext.request.contextPath}/assets/js/customer/notice.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/notice/notice.css">

<div class="container">
	<div class="row mt">
		<div class="col-md-12">
			<h1 align="left" style="margin-top: 75px; margin-bottom: 25px;">공지
				사항</h1>
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">${view.noticeview.noticeTitle }</div>
				<script>
					noticeIdarray.push("${view.noticeview.noticeId}");
				</script>
				<table class="table table-bordered">
					<colgroup>
						<col width="3%">
						<col width="76%">
						<col width="16%">
						<col width="5%">
					</colgroup>
					<thead>
						<tr>
							<th><span class="glyphicon glyphicon-user gray"
								aria-hidden="true"></span></th>
							<th><span>관리자</span></th>
							<th><span class="glyphicon glyphicon-time gray"
								aria-hidden="true">${view.noticeview.noticeDay }</span></th>
							<th><span class="glyphicon glyphicon-eye-open gray"
								aria-hidden="true"> ${view.noticeview.noticeHit }</span></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">${view.noticeview.noticeContent }</td>
						</tr>
					</tbody>
				</table>

				<button id="noticeModify" type="button" class="notice2 notice4"
					style="margin-bottom: 20px; float: right;">수정/삭제</button>

			</div>
			<table class="table margintop">
				<colgroup>
					<col width="25%">
					<col width="45%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="bg-black">
						<th><span class="glyphicon glyphicon-time white"
							aria-hidden="true"></span></th>
						<th></th>
						<th><span class="glyphicon glyphicon-user white"
							aria-hidden="true"></span></th>
						<th><span class="glyphicon glyphicon-eye-open white"
							aria-hidden="true"></span></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${notice.noticelist}">
						<script>
							userIdarray.push("${v1.id}");
						</script>
						<tr>
							<td>${notice.noticeDay}</td>
							<td><a style="color: black;"
								href="${pageContext.request.contextPath}/${currentuserid}/noticeview?noticeId=${notice.noticeId}">${notice.noticeTitle}</a>
							</td>
							<td>관리자</td>
							<td>${notice.noticeHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button id="noticeAdd" type="button"
				class="fa fa-pencil notice notice4 bg-black"
				style="margin-bottom: 20px; float: right;">글쓰기</button>
		</div>
	</div>
</div>

<div class="modal fade" id="noticeAddform" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form id="noticepost" method="post"
		action="${pageContext.request.contextPath}/${currentuserid}/noticeadd">
		<div class="modal-dialog margintop2">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title center">공지 사항</h4>
				</div>
				<div class="modal-body">
					<label for="recipient-name" class="control-label">제목:</label> <input
						type="text" class="form-control" name="noticeTitle"> <label
						for="message-text" class="control-label">내용:</label>
					<textarea class="form-control" name="noticeContent" rows="7"></textarea>
				</div>
				<div class="modal-footer">
					<button type="submit" class="notice1 notice4">글쓰기</button>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal fade" id="noticeModifyform" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form id="noticepost" method="post"
		action="${pageContext.request.contextPath}/${currentuserid}/noticemodify">
		<div class="modal-dialog margintop2">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title center">공지 사항</h4>
				</div>
				<div class="modal-body">
					<label for="recipient-name" class="control-label">제목:</label> <input
						type="text" id="noticeTitle" class="form-control" name="noticeTitle"> <label
						for="message-text" class="control-label">내용:</label>
					<textarea id="noticeContent" class="form-control" name="noticeContent" rows="7"></textarea>
					<input type="hidden" id="noticeId" name="noticeId">
				</div>
				<div class="modal-footer">
					<button type="submit" class="notice1 notice4">수정</button>
					<span id="noticedeletebutton" class="noticespan notice4">삭제</span>
				</div>
			</div>
		</div>
	</form>
</div>

<div style="display:none">
	<form id="noticedeletepost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/noticedelete">
		<input type="hidden" id="deleteId" name="noticeId" value="">
	</form>
</div>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp" />
