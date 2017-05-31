<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="${pageContext.request.contextPath}/assets/js/left_menu/profile.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/left_menu/profile.css">

<!-- 프로필 -->
<div class="row">
	<h2 class="section-heading">
		<img class="img-thumbnail" alt="사진"
			src="${pageContext.request.contextPath}/assets/images/cp3.jpg"
			width="200" height="200">
	</h2>
	<div class="col-lg-12 col-lg-offset-0 text-center">
		<p>${v1.name}</p>
		<p>잔액 : ${v1.total}</p>
		<a href="" class="fa fa-user fa-2x sr-contact pa" id="tt"></a>&emsp; <a
			href="" class="fa fa-align-justify fa-2x sr-contact pa"></a>&emsp; <a
			href="${pageContext.request.contextPath}/${currentuserid}/mygraph"
			class="fa fa-bar-chart-o fa-2x sr-contact pa"></a>&emsp; <span
			id="showoptions" class="fa fa-cog fa-2x sr-contact pa pointer"></span>

	</div>
</div>
<br />

<!-- 통계 -->
<div class="panel panel-default row">
	<div class="panel-heading">지난 달 소비 동향</div>
	<div class="panel-body">
		<div class="flot-chart2">
			<div class="flot-chart-content" id="flot-pie-chart2"></div>
		</div>
	</div>
</div>

<!-- 팝업영역 -->

<!-- 프로필 수정 팝업 -->
<div id="editprofile" title="수정하기" style="display: none">
	<form id="editprofile1"
		action="${pageContext.request.contextPath }/${currentuserid}/editprofile"
		method="post">

		<input type='hidden' name="id" value="${currentuserid}" />
		<!-- 히든으로 1가지 이상의 값을 보낼수있다. -->
		<input type='hidden' id="" name="listId" value="" />

		<h3>
			<span class="label label-default">결제 수단</span>
		</h3>
		<input id="" type="text" class="form-control" name="paid"
			placeholder="card / cash" value="" required /><br />

		<h3>
			<span class="label label-default">은행</span>
		</h3>
		<input id="" type="text" name="bank" class="form-control"
			placeholder="bank" value="" required /><br />

		<h3>
			<span class="label label-default">저금/지출</span>
		</h3>
		<input id="" type="text" name="operations" class="form-control"
			placeholder="저금/지출" value="" required /><br />

		<h3>
			<span class="label label-default">금액</span>
		</h3>
		<input id="" type="text" name="money" class="form-control"
			placeholder="money" value="" required /><br />

		<h3>
			<span class="label label-default">상호명</span>
		</h3>
		<input id="" type="text" name="name" class="form-control"
			placeholder="name" value="" required /><br />

		<h3>
			<span class="label label-default">카테고리</span>
		</h3>
		<input id="" type="text" name="category" class="form-control"
			placeholder="category" value="" required /><br />
		<h3>
			<span class="label label-primary">이미지 첨부</span>
		</h3>
		<br /> <input type="file" name="file">
	</form>
</div>

<!-- 설정 팝업 -->

<div class="modal fade" id="viewoptions" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title center">설정</h4>
				</div>
				<div class="modal-body">
					<c:import url="/WEB-INF/views/mypage/left_menu/option.jsp" />
				</div>
			</div>
		</div>
</div>


<!-- /팝업영역 -->