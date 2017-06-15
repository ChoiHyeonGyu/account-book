<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/include/main_top.jsp" />
<script
	src="${pageContext.request.contextPath}/assets/js/left_menu/option.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/left_menu/option.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css">



<div class="container">

	<div class="row mt">

	<div class="col-lg-2">
	<c:import url="/WEB-INF/views/mypage/left_menu/profile.jsp"/>
	</div>

	
	
		<!-- 카테고리 -->
		<div class="col-lg-5" id="categoryform" title="카테고리 추가">

			<h3 align="left" style="margin-left: 15px; margin-bottom: 10px;">카테고리
				추가</h3>

			<table style="margin-bottom: 5px;"
				class="table table-bordered text-center">
				<tr class="navy">
					<th><span class="white">카테고리</span></th>
					<th><span class="white">포스트 수</span></th>
					<th><span class="white">수정</span></th>
					<th><span class="white">삭제</span></th>
				</tr>
				<tbody>
					<c:forEach var="vo" items="${option}">
						<script>
							categoryarray.push("${vo.categoryId}");
						</script>
						<tr>
							<td>${vo.category}</td>
							<td>${vo.postCount}</td>
							<td><span id="${vo.categoryId}"
								class="glyphicon glyphicon-cog pointer"></span></td>
							<td><a class="glyphicon glyphicon-trash"
								href="${pageContext.request.contextPath}/${currentuserid}/categorydelete?categoryId=${vo.categoryId}">
							</a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<button id="categoryAdd" type="button" class="option option4 right"
				>추가하기</button>
			<br />

		</div>

		<!-- 금액 한도 설정 -->
		<div class="col-lg-5 text-center">

			<h3 align="left" style="margin-left: 15px; margin-bottom: 10px;">한도
				설정</h3>


			<table class="table table-bordered text-center" style="margin-bottom: 5px;">
				<tr class="navy">
					<th><span class="white">카테고리</span></th>
					<th><span class="white">금액</span></th>
					<th><span class="white">수정</span></th>
				</tr>
				<tbody>
					<c:forEach var="vo" items="${option}">
						<script>
							categoryarray1.push("${vo.category}");
						</script>
						<tr>
							<td>${vo.category}</td>
							<td>${vo.limit}원</td>
							<td><span id="${vo.category}"
								class="glyphicon glyphicon-cog pointer"></span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 가계부 초기화 -->
			<form id="reset" method="post" name="가계부 초기화"
				action="${pageContext.request.contextPath}/${currentuserid}/reset">
				<input type="password" name="resetPassword"
					style="margin-top: 12px; margin-left: 160px;"
					class="margintop option3" placeholder="Password" required>
				<input type="submit" value="가계부 초기화" class="option1 option4 right"
					>
			</form>
			<!-- /가계부 초기화 -->
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/main_bottom.jsp"/>
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
					<h4 class="modal-title center">카테고리 수정</h4>
				</div>
				<div class="modal-body">
					<input id="categoryId" type="hidden" name="categoryId"> <input
						id="categoryname" type="text" value="" name="category"
						class="form-control" placeholder="Category" required>
				</div>
				<div>
	              <select class="select select1" id="operations" name="operations">
				  <option value="-" class="textline">지출</option>
    			  <option value="+" class="textline">수입</option>
				  <option value="0" class="textline">투자</option>
				</select>
								
				</div>
				<div class="modal-footer">

					<button type="submit" class="option2 option4">수정</button>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal fade bs-example-modal-sm" id="limitmodifyform"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<form id="modifypost"
		action="${pageContext.request.contextPath}/${currentuserid}/limitModify"
		method="post">
		<div class="modal-dialog modal-sm margintop2">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title center">한도 설정</h4>
				</div>
				<div class="modal-body">
					<input id="category" type="hidden" name="category" value="">
					<input id="limit" type="text" value="" name="limit"
						class="form-control" required>
				</div>
				<div class="modal-footer">
					<button type="submit" class="option2 option4">수정</button>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal fade bs-example-modal-sm" id="categorymodal"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<form id="modifypost"
		action="${pageContext.request.contextPath}/${currentuserid}/categoryAdd"
		method="post">
		<div class="modal-dialog modal-sm margintop2">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title center">카테고리 추가</h4>
				</div>
				<div class="modal-body">
					<input type="text" value="" name="category" class="form-control"
						placeholder="Category" required>
				</div>
				
				<div>
	              <select class="select select1" id="operations" name="operations">
				  <option value="-" class="textline">지출</option>
    			  <option value="+" class="textline">수입</option>
				  <option value="0" class="textline">투자</option>
				</select>
								
				</div>
				<div class="modal-footer">
					<button type="submit" class="option2 option4">추가</button>
				</div>
			</div>
		</div>
	</form>
</div>
<!-- /팝업영역 -->