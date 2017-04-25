<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-md-6">
		<h1 align="center">자신의 씀씀이 이야기</h1>
		<form action="${pageContext.request.contextPath}/${currentuserid}/main" method="post">
			<input type="search" name="search" size="90">
			<input type="submit" value="검색하기">
			<button id="boardadd" type="button">작성하기</button>
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
	      	<c:forEach var="board" items="${board}">
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
	</div>
</div>

<div id="boardform" title="작성하기" style="display:none">
	<form id="boardpost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/boardadd" enctype="multipart/form-data">
   		<h3><span class="label label-primary">결산월</span></h3>
   		<div class="dropdown theme-dropdown clearfix">
	   		<select class="dropdown-menu" name="month">
	   			<c:forEach begin="2017" end="2018" var="i">
	   				<c:forEach begin="1" end="12" var="j" >
	   					<c:choose>
	   						<c:when test="${j<10}"><option>${i}.0${j}</option></c:when>
	   						<c:otherwise><option>${i}.${j}</option></c:otherwise>
	   					</c:choose>
	   				</c:forEach>
	   			</c:forEach>
	   		</select>
      	</div>
      	<h3><span class="label label-primary">제목</span></h3>
      	<input type="text" name="title" class="form-control" placeholder="Title" required>
      	<h3><span class="label label-primary">내용</span></h3>
      	<textarea rows="10" cols="64" name="content"></textarea>
      	<h3><span class="label label-primary">이미지 첨부</span></h3><br/>
      	<input type="file" name="file" multiple="multiple">
   	</form>
</div>

<div id="contentform" title="자세히 보기" style="display:none">
	<h3><span class="label label-warning"></span></h3>
</div>