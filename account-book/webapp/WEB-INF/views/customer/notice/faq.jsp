<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:choose>
	<c:when test="${currentuserid != null}">
		<c:import url="/WEB-INF/views/include/main_top.jsp" />
	</c:when>
	<c:otherwise>
		<c:import url="/WEB-INF/views/include/login_top.jsp" />
	</c:otherwise>
</c:choose>

<script
	src="${pageContext.request.contextPath}/assets/js/customer/qna.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/notice/notice.css">

<div class="container">
	<div class="row mt">
		<div class="col-md-12">
			<h1 align="left" style="margin-top: 75px; margin-bottom: 25px;">FAQ</h1>
			<table class="table">
				<colgroup>
					<col width="25%">
					<col width="45%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="bg-black">
						<th><span class="glyphicon glyphicon-time white"
							aria-hidden="true"></span></th>
						<th></th>
						<th><span class="glyphicon glyphicon-user white"
							aria-hidden="true"></span></th>
						<th><span class="glyphicon glyphicon-eye-open white"
							aria-hidden="true"></span></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${notice.qnalist}">
						<script>
							userIdarray.push("${v1.id}");
						</script>
						<tr>
							<td>${notice.qnaDay}</td>
							<td><a style="color: black;"
								href="${pageContext.request.contextPath}/${currentuserid}/qnaview?qnaId=${notice.qnaId}">${notice.qnaTitle}</a>
							</td>
							<td>관리자</td>
							<td>${notice.qnaHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 페이징처리 -->
		    <div class="pager">
				<ul>
					<c:if test="${notice.prevPage2 > 0}" >
						<c:choose>
							<c:when test="${currentuserid != null}">
								<li><a href="${pageContext.request.contextPath}/${currentuserid}/faq?p=${notice.prevPage2}">◀</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/faq?p=${notice.prevPage2}">◀</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
					
					<c:forEach begin="${notice.beginPage2}" end="${notice.beginPage2 + notice.listSize - 1}" var="page">
						<c:choose>
							<c:when test="${notice.endPage2 < page}">
								<li>${page}</li> 
							</c:when> 
							<c:when test="${notice.currentPage == page}">
								<li class="selected">${page}</li>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${currentuserid != null}">
										<li><a href="${pageContext.request.contextPath}/${currentuserid}/faq?p=${page}">${page}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/faq?p=${page}">${page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${notice.nextPage2 > 0}" >
						<c:choose>
							<c:when test="${currentuserid != null}">
								<li><a href="${pageContext.request.contextPath}/${currentuserid}/faq?p=${notice.nextPage2}">▶</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/faq?p=${notice.nextPage2}">▶</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</ul>
			</div>
			<!-- /페이징처리 -->
			
			<form
				action="${pageContext.request.contextPath}/${currentuserid}/qnaAdd"
				method="post">
				<button id="qnaAdd" type="button"
					class="fa fa-pencil notice notice4 bg-black"
					style="margin-bottom: 20px; float: right;">글쓰기</button>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="qnaAddform" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form id="qnapost" method="post"
		action="${pageContext.request.contextPath}/${currentuserid}/qnaadd">
		<div class="modal-dialog margintop2">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title center">FAQ</h4>
				</div>
				<div class="modal-body">
					<label for="recipient-name" class="control-label">제목:</label> <input
						type="text" class="form-control" name="qnaTitle"> <label
						for="message-text" class="control-label">내용:</label>
					<textarea class="form-control" name="qnaContent" rows="7"></textarea>
				</div>
				<div class="modal-footer">
					<button type="submit" class="notice1 notice4">글쓰기</button>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp" />
