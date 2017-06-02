<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/left_menu/profile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/story/story.css">
<script src="${pageContext.request.contextPath}/assets/js/left_menu/profile.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/story/board.js"></script>

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

			<span id="tt" class="fa fa-user fa-2x sr-contact pa pointer"></span>&emsp;
			
			<span id="mystory" class="fa fa-align-justify fa-2x sr-contact pa pointer"></span>&emsp;
			
			<a href="${pageContext.request.contextPath}/${currentuserid}/mygraph"
			class="fa fa-bar-chart-o fa-2x sr-contact pa"></a>&emsp;
			
			<span id="showoptions" class="fa fa-cog fa-2x sr-contact pa pointer"></span>

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
<div class="modal fade" id="editprofile" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">프로필 수정</h4>
			</div>
			<div class="modal-body">
				<p>프로필수정꾸미기</p>
			</div>
			<div class="modal-footer">
					<button type="submit" class="">버튼</button>
				</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/story/import_popup.jsp"/>

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