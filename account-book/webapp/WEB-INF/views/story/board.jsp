<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />

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
					      	<c:forEach var="board" items="${board.list}">
					      		<script>
						      		arrays.push("${board.boardId}");
					      		</script>
						        <tr>
						          <td>${board.month}</td>
						          <td><label id="backstory${board.boardId}" title="${board.boardId}">${board.title}</label></td>
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
									<li><a href="${pageContext.request.contextPath}/${currentuserid}/story?p=${board.prevPage}&search=${board.keyword}">◀</a></li>
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
											<li><a href="${pageContext.request.contextPath}/${currentuserid}/story?p=${page}&search=${board.keyword}">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:if test="${board.nextPage > 0}" >
									<li><a href="${pageContext.request.contextPath}/${currentuserid}/story?p=${board.nextPage}&search=${board.keyword}">▶</a></li>
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

<!-- 팝업영역 -->

<!-- 이야기 작성 -->
<div class="modal fade" id="boardform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">작성</h4>
			</div>
			<div class="modal-body">
				<form id="boardpost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/boardadd" enctype="multipart/form-data">
			   		<h3><span class="label label-primary">결산월</span></h3>
			   		<div class="dropdown theme-dropdown clearfix">
				   		<select class="dropdown-menu" name="month">
				   			<c:forEach begin="5" end="12" var="i">
				   				<c:choose>
			   						<c:when test="${i<10}"><option>2017.0${i}</option></c:when>
			   						<c:otherwise><option>2017.${i}</option></c:otherwise>
			   					</c:choose>
				   			</c:forEach>
							<c:forEach begin="1" end="12" var="i">
				   				<c:choose>
			   						<c:when test="${i<10}"><option>2018.0${i}</option></c:when>
			   						<c:otherwise><option>2018.${i}</option></c:otherwise>
			   					</c:choose>
				   			</c:forEach>
				   		</select>
			      	</div>
			      	<h3><span class="label label-primary">제목</span></h3>
			      	<input type="text" name="title" class="form-control" placeholder="Title" required>
			      	<h3><span class="label label-primary">내용</span></h3>
			      	<textarea rows="10" cols="64" name="content" class="form-control" placeholder="Content"></textarea>
			      	<h3><span class="label label-primary">이미지 첨부</span></h3><br/>
			      	<input type="file" name="file" multiple="multiple"><br/>
			      	<input type="submit" value="작성" class="addmarginleft">
      				<input type="reset" value="취소">
				</form>
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>

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
				<button id="good" type="button" class="btn btn-danger btn-circle btn-xl"><i class="fa fa-heart"></i></button>
				<button id="contentsedit" type="button" class="btn btn-warning btn-circle btn-xl"><i class="fa fa-pencil-square-o"></i></button>
				<button id="contentsdelete" type="button" class="btn btn-warning btn-circle btn-xl"><i class="fa fa-trash-o"></i></button>
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
				<form action="${pageContext.request.contextPath}/${currentuserid}/comment" method="post">
					<input type="hidden" id="commentboardId" name="boardId" value="">
					<input type="hidden" id="commentName" name="name" value="">
					<textarea rows="5" cols="63" name="content" class="form-control" required></textarea><br/><br/>
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
				<form action="${pageContext.request.contextPath}/${currentuserid}/reply" method="post">
					<input type="hidden" id="commentId" name="commentId" value="">
					<input type="hidden" id="comment1Name" name="name" value="">
					<textarea rows="5" cols="63" name="content" required></textarea><br/><br/>
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
		</div>
	</div>
</div>

<!-- 이야기 수정 -->
<div class="modal fade" id="contenteditform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">수정</h4>
			</div>
			<div class="modal-body">
				<form id="contenteditpost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/boardedit" enctype="multipart/form-data">
					<input type="hidden" id="editboardId" name="boardId" value="">
					<input type="hidden" id="editId" name="id" value="">
			   		<h3><span class="label label-primary">결산월</span></h3>
			   		<div class="dropdown theme-dropdown clearfix">
				   		<select class="dropdown-menu" id="editmonth" name="month">
				   			<option></option>
				   			<c:forEach begin="5" end="12" var="i">
				   				<c:choose>
			   						<c:when test="${i<10}"><option>2017.0${i}</option></c:when>
			   						<c:otherwise><option>2017.${i}</option></c:otherwise>
			   					</c:choose>
				   			</c:forEach>
							<c:forEach begin="1" end="12" var="i">
				   				<c:choose>
			   						<c:when test="${i<10}"><option>2018.0${i}</option></c:when>
			   						<c:otherwise><option>2018.${i}</option></c:otherwise>
			   					</c:choose>
				   			</c:forEach>
				   		</select>
			      	</div>
			      	<h3><span class="label label-primary">제목</span></h3>
			      	<input type="text" id="edittitle" name="title" class="form-control">
			      	<h3><span class="label label-primary">내용</span></h3>
			      	<textarea rows="10" cols="64" id="editcontent" name="content" class="form-control"></textarea>
			      	<h3><span class="label label-primary">이미지 첨부</span></h3><br/>
			      	<input type="file" name="file" multiple="multiple">
			   	</form>
			</div>
			<div class="modal-footer">
				<button id="contentschange" type="button" class="btn btn-warning btn-circle btn-xl"><i class="fa fa-pencil-square-o"></i></button>
			</div>
		</div>
	</div>
</div>

<!-- 이야기 삭제 -->
<div class="displaynone">
	<form id="contentremovepost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/boardremove">
		<input type="hidden" id="removeboardId" name="boardId" value="">
		<input type="hidden" id="removeId" name="id" value="">
	</form>
</div>

<!-- /팝업영역 -->