<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/frontpage/login_top.jsp"/>
<br/><br/><br/>
    <div class="container">
    	<div class="row">
			<div class="col-md-12">
				<h1 align="center">자신의 씀씀이 이야기</h1>
				<form action="${pageContext.request.contextPath}/${currentuserid}/main" method="post">
					<input type="search" name="search" size="130">
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
			    <div class="pager">
					<ul>
						<c:if test="${board.prevPage > 0}" >
							<li><a href="${pageContext.request.contextPath}/${currentuserid}/main?p=${board.prevPage}&search=${board.keyword}">◀</a></li>
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
									<li><a href="${pageContext.request.contextPath }/${currentuserid}/main?p=${page}&search=${board.keyword}">${page}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${board.nextPage > 0}" >
							<li><a href="${pageContext.request.contextPath }/${currentuserid}/main?p=${board.nextPage}&search=${board.keyword}">▶</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		
		<div id="contentform" title="상세 보기" style="display:none">
			<br/>
			<span id="contentmonth" class="label label-warning" style="font-size:25px"></span>
			<span id="contenttitle" class="label label-warning" style="font-size:25px"></span>
			<span id="contentname" class="label label-warning" style="font-size:25px"></span><br/><br/>
			<c:forEach var="i" begin="0" end="100">
				<img alt="사진" src="" id="contentphoto${i}">
			</c:forEach>
			<h5 id="contentcontent" style="white-space:pre-line"></h5><br/>
			<span id="contentday" class="label label-warning" style="font-size:25px"></span>
			<span id="contentgood" class="label label-warning" style="font-size:25px"></span>
			<span id="contenthit" class="label label-warning" style="font-size:25px"></span><br/><br/>
			<p class="line"></p>
			<button id="commentsviewer" type="button" class="btn btn-lg btn-outline btn-info">댓글 보기</button>
		</div>
		
		<div id="commentform" title="댓글" style="display:none">
			<c:forEach var="i" begin="0" end="1000">
				<pre id="commenteffect${i}" style="white-space:nowrap">
					<button id="commentdelete${i}" type="button" class="btn btn-lg btn-link" style="float:right">삭제</button>
					<button id="commentreply${i}" type="button" class="btn btn-lg btn-link" style="float:right">답글</button>
					<span id="commentname${i}"></span><span id="commentdate${i}"></span>
					<span id="commentcontent${i}" style="white-space:pre-line"></span>
				</pre>
			</c:forEach>
		</div>
		
		<div id="comment1form" title="답글" style="display:none">
			<c:forEach var="i" begin="0" end="1000">
				<pre id="comment1effect${i}" style="white-space:nowrap">
					<button id="comment1delete${i}" type="button" class="btn btn-lg btn-link" style="float:right">삭제</button>
					<span id="comment1name${i}"></span><span id="comment1date${i}"></span>
					<span id="comment1content${i}" style="white-space:pre-line"></span>
				</pre>
			</c:forEach>
		</div>
    </div>
<c:import url="/WEB-INF/views/mypage/main_bottom.jsp"/>