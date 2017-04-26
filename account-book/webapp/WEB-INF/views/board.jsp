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
	<button id="commentsviewer" type="button" class="btn btn-lg btn-default form-control">댓글 보기</button><br/>
</div>

<div id="commentform" title="댓글 보기" style="display:none">
	<form action="${pageContext.request.contextPath}/${currentuserid}/comment" method="post">
		<input type="hidden" id="commentboardId" name="boardId" value="">
		<input type="hidden" id="commentName" name="name" value="">
		<textarea rows="5" cols="63" name="content"></textarea><br/><br/>
		<input type="submit" value="댓글 쓰기">
	</form>
	<p class="line"></p>
	<c:forEach var="i" begin="0" end="1000">
		<pre id="commenteffect${i}" style="white-space:nowrap">
			<button id="commentdelete${i}" type="button" class="btn btn-lg btn-link" style="float:right">삭제</button>
			<button id="commentreply${i}" type="button" class="btn btn-lg btn-link" style="float:right">답글</button>
			<span id="commentname${i}"></span><span id="commentdate${i}"></span>
			<span id="commentcontent${i}" style="white-space:pre-line"></span>
		</pre>
	</c:forEach>
</div>

<div id="comment1form" title="답글 보기" style="display:none">
	<form action="${pageContext.request.contextPath}/${currentuserid}/reply" method="post">
		<input type="hidden" id="commentId" name="commentId" value="">
		<input type="hidden" id="comment1Name" name="name" value="">
		<textarea rows="5" cols="63" name="content"></textarea><br/><br/>
		<input type="submit" value="답글 쓰기">
	</form>
	<p class="line"></p>
	<c:forEach var="i" begin="0" end="1000">
		<pre id="comment1effect${i}" style="white-space:nowrap">
			<button id="comment1delete${i}" type="button" class="btn btn-lg btn-link" style="float:right">삭제</button>
			<span id="comment1name${i}"></span><span id="comment1date${i}"></span>
			<span id="comment1content${i}" style="white-space:pre-line"></span>
		</pre>
	</c:forEach>
</div>

<div id="contenteditform" title="수정하기" style="display:none">
	<form id="contenteditpost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/boardedit" enctype="multipart/form-data">
		<input type="hidden" id="editboardId" name="boardId" value="">
		<input type="hidden" id="editId" name="id" value="">
   		<h3><span class="label label-primary">결산월</span></h3>
   		<div class="dropdown theme-dropdown clearfix">
	   		<select class="dropdown-menu" id="editmonth" name="month">
	   			<option></option>
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
      	<input type="text" id="edittitle" name="title" class="form-control">
      	<h3><span class="label label-primary">내용</span></h3>
      	<textarea rows="10" cols="64" id="editcontent" name="content"></textarea>
      	<h3><span class="label label-primary">이미지 첨부</span></h3><br/>
      	<input type="file" name="file" multiple="multiple">
   	</form>
</div>

<div style="display:none">
	<form id="contentremovepost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/boardremove">
		<input type="hidden" id="removeboardId" name="boardId" value="">
		<input type="hidden" id="removeId" name="id" value="">
	</form>
</div>