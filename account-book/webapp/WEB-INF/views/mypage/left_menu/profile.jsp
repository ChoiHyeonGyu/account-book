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

<!-- 나의 결산월 이야기 -->
<div class="modal fade" id="viewmystory" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">나의 결산월 이야기</h4>
			</div>
			<div class="modal-body">
				<form action="${pageContext.request.contextPath}/${currentuserid}/story" method="post">
					<input type="search" name="search" class="mysearchsize">
					<button type="submit" class="fa fa-search fa-2x sr-contact"></button>
					<button id="boardadd" type="button" class="fa fa-pencil fa-2x sr-contact"></button>
				</form>
			    <table class="table">
			      <thead>
			        <tr>
			          <th>결산월</th>
			          <th>제목</th>
			          <th>작성자</th>
			          <th>작성일</th>
			          <th>추천</th>
			          <th>조회</th>
			        </tr>
			      </thead>
			      <tbody>
			      	<c:forEach var="story" items="${story.list}">
			      		<script>
				      		arrays2.push("${story.boardId}");
			      		</script>
				        <tr>
				          <td>${story.month}</td>
				          <td><label id="backstory${story.boardId}" title="${story.boardId}">${story.title}</label></td>
				          <td>${story.name}</td>
				          <td>${story.day}</td>
				          <td>${story.good}</td>
				          <td>${story.hit}</td>
				        </tr>
			     	</c:forEach>
			      </tbody>
			    </table>
			    
			    <!-- 페이징처리 -->
			    <div class="pager">
					<ul>
						<c:if test="${story.prevPage > 0}" >
							<li><a href="${pageContext.request.contextPath}/${currentuserid}/story?p=${story.prevPage}&search=${story.keyword}">◀</a></li>
						</c:if>
						
						<c:forEach begin="${story.beginPage}" end="${story.beginPage + story.listSize - 1}" var="page">
							<c:choose>
								<c:when test="${story.endPage < page}">
									<li>${page}</li> 
								</c:when> 
								<c:when test="${story.currentPage == page}">
									<li class="selected">${page}</li>
								</c:when>
								<c:otherwise> 
									<li><a href="${pageContext.request.contextPath}/${currentuserid}/story?p=${page}&search=${story.keyword}">${page}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${story.nextPage > 0}" >
							<li><a href="${pageContext.request.contextPath}/${currentuserid}/story?p=${story.nextPage}&search=${story.keyword}">▶</a></li>
						</c:if>
					</ul>
				</div>
				<!-- /페이징처리 -->
			</div>
			<!-- /바디 끝 -->
		</div>
	</div>
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