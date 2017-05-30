<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />

<script
	src="${pageContext.request.contextPath}/assets/js/customer/qna.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/notice/notice.css">

<div class="container">
	<div class="row mt">
		<div class="col-md-12">
			<h1 align="left" style="margin-top: 75px; margin-bottom: 25px;">FAQ</h1>
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">${view.qnaview.qnaTitle }</div>
				<script>
					qnaIdarray.push("${view.qnaview.qnaId}");
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
								aria-hidden="true">${view.qnaview.qnaDay }</span></th>
							<th><span class="glyphicon glyphicon-eye-open gray"
								aria-hidden="true"> ${view.qnaview.qnaHit }</span></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">${view.qnaview.qnaContent }</td>
						</tr>
					</tbody>
				</table>

				<button id="qnaModify" type="button" class="notice2 notice4"
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
					<tr bgcolor='#002266'>
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
					<c:forEach var="notice" items="${notice.qnalist}">
						<script>
							userIdarray.push("${v1.id}");
						</script>
						<tr>
							<td>${notice.qnaDay}</td>
							<td><a style="color: black;"
								href="${pageContext.request.contextPath}/${currentuserid}/qnaview?qnaId=${notice.qnaId}">${notice.qnaTitle}</a>
							</td>
							<td>관리자</td>
							<td>${notice.qnaHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button id="qnaAdd" type="button"
				class="fa fa-pencil notice notice4"
				style="margin-bottom: 20px; float: right;">글쓰기</button>
		</div>
	</div>
</div>

<div class="modal fade" id="qnaAddform" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form id="qnapost" method="post"
		action="${pageContext.request.contextPath}/${currentuserid}/qnaadd">
		<div class="modal-dialog margintop2">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title center">FAQ</h4>
				</div>
				<div class="modal-body">
					<label for="recipient-name" class="control-label">제목:</label> <input
						type="text" class="form-control" name="qnaTitle"> <label
						for="message-text" class="control-label">내용:</label>
					<textarea class="form-control" name="qnaContent" rows="7"></textarea>
				</div>
				<div class="modal-footer">
					<button type="submit" class="notice1 notice4">글쓰기</button>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal fade" id="qnaModifyform" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form id="qnapost" method="post"
		action="${pageContext.request.contextPath}/${currentuserid}/qnamodify">
		<div class="modal-dialog margintop2">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title center">FAQ</h4>
				</div>
				<div class="modal-body">
					<label for="recipient-name" class="control-label">제목:</label> <input
						type="text" id="qnaTitle" class="form-control" name="qnaTitle"> <label
						for="message-text" class="control-label">내용:</label>
					<textarea id="qnaContent" class="form-control" name="qnaContent" rows="7"></textarea>
					<input type="hidden" id="qnaId" name="qnaId">
				</div>
				<div class="modal-footer">
					<button type="submit" class="notice1 notice4">수정</button>
					<span id="qnadeletebutton" class="noticespan notice4">삭제</span>
				</div>
			</div>
		</div>
	</form>
</div>

<div style="display:none">
	<form id="qnadeletepost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/qnadelete">
		<input type="hidden" id="qdeleteId" name="qnaId" value="">
	</form>
</div>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp" />
