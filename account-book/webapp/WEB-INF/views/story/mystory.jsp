<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />
<c:import url="/WEB-INF/views/include/flot.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/story/story.css">
<script src="${pageContext.request.contextPath}/assets/js/story/board.js"></script>

    <div class="container">
    	<div class="row mt">
	    	<div class="col-lg-2"><c:import url="/WEB-INF/views/mypage/left_menu/profile.jsp"/></div>
	    	<div class="col-lg-10">
	    	
	    		<!-- 게시판 -->
	    		<div class="row">
					<div class="col-md-12">
						
						<!-- 결산월 이야기 -->
						<h1 align="center">결산월 이야기</h1>
						<form action="${pageContext.request.contextPath}/${currentuserid}/story" method="post">
							<input type="search" name="search" class="searchsize">
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
						          <td id="selectedmonth${board.boardId}">${board.month}</td>
						          <td><label id="mystory${story.boardId}" title="${story.boardId}">${story.title}</label></td>
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
				</div>
				<!-- /게시판 -->
	    	</div>
    	</div>
    </div>
<c:import url="/WEB-INF/views/include/main_bottom.jsp"/>
<c:import url="/WEB-INF/views/story/import_popup.jsp"/>