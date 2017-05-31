<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">

	<!-- 카테고리 -->
	<div id="categoryform" title="카테고리 추가" class=" text-center">
		<form method="post" name="카테고리 추가" id="categorypost"
			action="${pageContext.request.contextPath}/${currentuserid}/categoryAdd">
			<h3>
				<span class="label label-default">카데고리 추가</span>
			</h3>
			<br /> <input type="text" name="category" class="form-control1"
				value="" placeholder="Category" required> <input
				type="submit" value="ADD" class="btn btn-join">
		</form>
		<table class="table table-bordered">
			<tr>
				<th>카테고리</th>
				<th>포스트 수</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tbody>
				<c:forEach var="vo" items="${option}">
					<script>
						categoryarray.push("${vo.categoryId}");
					</script>
					<tr>
						<td>${vo.category}</td>
						<td>${vo.postCount}</td>
						<td>
							<span id="${vo.categoryId}" class="glyphicon glyphicon-cog pointer"></span>
						</td>
						<td><a class="glyphicon glyphicon-trash"
							href="${pageContext.request.contextPath}/${currentuserid}/categorydelete?categoryId=${vo.categoryId}">
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br />
		
	</div>

	<!-- 금액 한도 설정 -->
	<div class=" text-center">
		<form id="limitmodify" method="post" name="한도 설정"
			action="${pageContext.request.contextPath}/${currentuserid}/limitModify">
			<h3>
				<span class="label label-default">한도 설정</span>
			</h3>
			<br /> 금액한도:&nbsp;&nbsp; <select name="category">
				<option value="카테고리 설정">카테고리 설정</option>
				<c:forEach var="vo" items="${option}">
					<option value="${vo.category}">${vo.category}</option>
				</c:forEach>
			</select><br> <input type="text" id="limit" name="limit"
				class="form-control1" placeholder="Limit" required> <input
				type="submit" value="수정" class="btn btn-join">
		</form>
		<table class="table table-bordered">
			<tr>
				<th>카테고리</th>
				<th>금액</th>
			</tr>
			<tbody>
				<c:forEach var="vo" items="${option}">
					<tr>
						<td>${vo.category}</td>
						<td>${vo.limit}원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 가계부 초기화 -->
		<form id="reset" method="post" name="가계부 초기화"
			action="${pageContext.request.contextPath}/${currentuserid}/reset">
			<input type="text" name="resetPassword" class="form-control1"
				placeholder="Password" required> <input type="submit"
				value="가계부 초기화" class="btn btn-join">
		</form>
		<!-- /가계부 초기화 -->
	</div>
</div>

<!-- 팝업영역 -->

<!-- 카테고리 수정 팝업 -->


<div class="modal fade bs-example-modal-sm" id="modifyform"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<form id="modifypost"
		action="${pageContext.request.contextPath}/${currentuserid}/categoryModify1"
		method="post">
		<div class="modal-dialog modal-sm margintop2">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title center">설정</h4>
				</div>
				<div class="modal-body">
					<input id="categoryId" type="hidden" name="categoryId"> 
					<input
						id="categoryname" type="text" value="" name="category"
						class="form-control" placeholder="Category" required>
				</div>
				<div class="modal-footer">
					<button type="submit" class="notice1 notice4">수정</button>
				</div>
			</div>
		</div>
	</form>
</div>
<!-- /팝업영역 -->