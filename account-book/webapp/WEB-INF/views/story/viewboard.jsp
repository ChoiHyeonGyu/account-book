<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/login_top.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/story/story.css">
<script src="${pageContext.request.contextPath}/assets/js/story/viewboard.js"></script>

    <div class="container">
    	<div class="row mt">
					<div class="col-md-12">
						
						<!-- 결산월 이야기 -->
						<h1 align="center">결산월 이야기</h1>
						<form action="${pageContext.request.contextPath}/story" method="post">
							<input type="search" name="search" class="searchsize">
							<button type="submit" class="fa fa-search fa-2x sr-contact"></button>
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
					      	<c:forEach var="board" items="${board.list}">
					      		<script>
						      		arrays.push("${board.boardId}");
					      		</script>
						        <tr>
						          <td>${board.month}</td>
						          <td><label id="${board.boardId}">${board.title}</label></td>
						          <td>${board.name}</td>
						          <td>${board.day}</td>
						          <td>${board.good}</td>
						          <td>${board.hit}</td>
						        </tr>
					     	</c:forEach>
					      </tbody>
					    </table>
					    
					    <!-- 페이징처리 -->
					    <div class="pager">
							<ul>
								<c:if test="${board.prevPage > 0}" >
									<li><a href="${pageContext.request.contextPath}/story?p=${board.prevPage}&search=${board.keyword}">◀</a></li>
								</c:if>
								
								<c:forEach begin="${board.beginPage}" end="${board.beginPage + board.listSize - 1}" var="page">
									<c:choose>
										<c:when test="${board.endPage < page}">
											<li>${page}</li> 
										</c:when> 
										<c:when test="${board.currentPage == page}">
											<li class="selected">${page}</li>
										</c:when>
										<c:otherwise> 
											<li><a href="${pageContext.request.contextPath}/story?p=${page}&search=${board.keyword}">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:if test="${board.nextPage > 0}" >
									<li><a href="${pageContext.request.contextPath}/story?p=${board.nextPage}&search=${board.keyword}">▶</a></li>
								</c:if>
							</ul>
						</div>
						<!-- /페이징처리 -->
					</div>
					<!-- /게시판 -->
				</div>
	    	</div>
<c:import url="/WEB-INF/views/include/main_bottom.jsp"/>

<!-- 팝업영역 -->

<!-- 상세 보기 -->
<div class="modal fade" id="contentform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">상세 보기</h4>
			</div>
			<div class="modal-body">
				<table class="table">
			      <thead>
			        <tr>
			          <th id="contentmonth"></th>
			          <th id="contenttitle"></th>
			          <th id="contentname"></th>
			        </tr>
			      </thead>
			     </table>
			      <c:forEach var="i" begin="0" end="100">
				  	<img alt="사진" src="" id="contentphoto${i}" class="col-lg-12">
				  </c:forEach>
				  <h5 id="contentcontent" style="white-space:pre-line"></h5>
			 	<table class="table">
			      <tbody>
			      	<tr>
			      		<td id="contentday"></td>
			      		<td id="contentgood"></td>
			      		<td id="contenthit"></td>
			      	</tr>
			      </tbody>
			    </table>
			</div>
			<div class="modal-footer">
				<button id="commentsviewer" type="button" class="btn btn-info btn-circle btn-xl"><i class="fa fa-comments"></i></button>
			</div>
		</div>
	</div>
</div>

<!-- 댓글 -->
<div class="modal fade" id="commentform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">댓글</h4>
			</div>
			<div class="modal-body">
				<p class="line"></p>
				<c:forEach var="i" begin="0" end="1000">
					<pre id="commenteffect${i}" style="white-space:nowrap">
						<button id="commentreply${i}" type="button" class="btn btn-lg btn-link" style="float:right">답글</button>
						<span id="commentname${i}"></span><span id="commentdate${i}"></span>
						<span id="commentcontent${i}" style="white-space:pre-line"></span>
					</pre>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!-- 답글 -->
<div class="modal fade" id="comment1form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">답글</h4>
			</div>
			<div class="modal-body">
				<p class="line"></p>
				<c:forEach var="i" begin="0" end="1000">
					<pre id="comment1effect${i}" style="white-space:nowrap">
						<span id="comment1name${i}"></span><span id="comment1date${i}"></span>
						<span id="comment1content${i}" style="white-space:pre-line"></span>
					</pre>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!-- /팝업영역 -->