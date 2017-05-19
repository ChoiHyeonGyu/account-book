<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/morrisjs/morris.css">
<script	src="${pageContext.request.contextPath}/assets/raphael/raphael.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/morrisjs/morris.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/report/morris-data.js"></script>
<script	src="http://maps.google.com/maps/api/js?key=AIzaSyD4b_BFpjBL1PYY6pKL7vGrLWyB7n_qBa0"></script>
<script src="${pageContext.request.contextPath}/assets/js/list.js"></script>

<div class="container">
	<div class="row mt">
	
		<!-- 왼쪽공통영역 -->
		<div class="col-lg-2">
			<c:import url="/WEB-INF/views/mypage/left_menu/profile.jsp" />
		</div>
		
		<!-- 메인컨텐츠영역 (그래프, 가계부리스트) -->
		<div class="col-lg-10">
		
			<!-- 그래프영역 -->
			<c:import url="/WEB-INF/views/report/limit_graph.jsp" />
			
			<h1 align="center"></h1>
			<div class="row">
				<div class="col-md-12">
				
					<!-- 가계부리스트영역 -->
					<form action="${pageContext.request.contextPath}/${currentuserid}/main"	method="post">
						<input type="search" name="searching" size="83"	placeholder="현금,금액,카테고리"> <input type="submit" value="검색">
						<button id="myBtn">추가하기</button>
					</form>
					<table class="table table-bordered">
						<thead>
							<tr bgcolor='white'>
								<th class="mine1">날짜</th>
								<th class="mine2">사용내역</th>
								<th class="mine3">금액</th>
								<th class="mine3">결제수단</th>
								<th class="mine3">지출/수입/투자</th>
								<th class="mine3">은행</th>
								<th class="mine3">카테고리</th>
								<th class="mine3">지도</th>
								<th class="mine3">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${ps.list}" varStatus="status">
								<script>
									listarray.push("${vo.listId}");
								</script>
								<tr>
									<td><input value="${vo.day}" class="mine"></td>
									<td><input value="${vo.name}" class="mine"></td>
									<td><label id="${vo.listId}">${vo.money}</label></td>
									<td><input value="${vo.paid}" class="mine"></td>
									<td><input value="${vo.operations}" class="mine"></td>
									<td><input value="${vo.bank}" class="mine"></td>
									<td><input value="${vo.category}" class="mine"></td>
									<td><strong id="maps${vo.listId}"
										class="fa fa-map-marker fa-2x sr-contact"></strong></td>
									<td><a
										href="${pageContext.request.contextPath}/${currentuserid}/listdelete?listId=${vo.listId}"><img
											src="${pageContext.request.contextPath}/assets/images/delete.jpg"></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- /가계부리스트영역 -->

					<!-- 페이징 -->
					<div class="pager">
						<ul>
							<c:if test="${ps.prevPage > 0}">
								<li><a
									href="${pageContext.request.contextPath}/${currentuserid}/main?pagination=${ps.prevPage}&searching=${ps.searching}">◀</a></li>
							</c:if>

							<c:forEach begin="${ps.beginPage}"
								end="${ps.beginPage + ps.listSize - 1}" var="page">
								<c:choose>
									<c:when test="${ps.endPage < page}">
										<li>${page}</li>
									</c:when>
									<c:when test="${ps.pagination == page}">
										<li class="selected">${page}</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath }/${currentuserid}/main?pagination=${page}&searching=${ps.searching}">${page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${ps.nextPage > 0}">
								<li><a
									href="${pageContext.request.contextPath }/${currentuserid}/main?pagination=${ps.nextPage}&searching=${ps.searching}">▶</a></li>
							</c:if>
						</ul>
					</div>
					<!-- /페이징 -->
				</div>
			</div>
		</div>
		<!-- /메인컨텐츠영역 (그래프, 가계부리스트) -->
	</div>
</div>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp" />

<!-- 팝업영역  -->

<!-- 추가하기팝업 -->
<div id="listadd" title="추가하기" style="display: none">
	<form id="commit" name="listadd"
		action="${pageContext.request.contextPath }/${currentuserid}/add"
		method="post">
		<input type='hidden' name="id" value="${currentuserid}">

		<h3>
			<span class="label label-default">지출/수입/투자</span>
		</h3>
		<div class="dropdown theme-dropdown clearfix">
			<select id="operations" class="dropdown-menu" name="operations">
				<option value="-">지출</option>
				<option value="+">수입</option>
				<option value="0">투자</option>
			</select>
		</div>
		<h3>
			<span class="label label-default">결제 수단</span>
		</h3>

		<div class="dropdown theme-dropdown clearfix">
			<select id="paid" class="dropdown-menu" name="paid">
				<option value="현금">현금</option>
				<option value="카드">카드</option>
			</select>
		</div>
		<h3>
			<span class="label label-default">카테고리</span>
		</h3>

		<div class="dropdown theme-dropdown clearfix">
			<select id="category" class="dropdown-menu" name="category">
				<option value="-">지출</option>
				<option value="+">수입</option>
				<option value="0">투자</option>
			</select>
		</div>
		<h3>
			<span class="label label-default">은행</span>
		</h3>
		<input type="text" name="bank" class="form-control" placeholder="bank"><br />

		<h3>
			<span class="label label-default">금액</span>
		</h3>

		<input type="text" name="money" id="money" class="form-control"
			placeholder="money" required><br />
		<h3>
			<span class="label label-default">구입물이름</span>
		</h3>

		<input type="text" name="name" class="form-control"><br />
		<!-- Indicates a successful or positive action -->
		<button type="submit" class="btn btn-success" value="확인">확인</button>
		<input type="reset" class="btn btn-success" value="취소">
	</form>
</div>
<!-- /추가하기팝업 -->

<!-- 수정하기팝업 -->
<div id="modify" title="수정하기" style="display: none">
	<form id="modify11"
		action="${pageContext.request.contextPath }/${currentuserid}/modify1"
		method="post">

		<input type='hidden' name="id" value="${currentuserid}" />
		<!-- 히든으로 1가지 이상의 값을 보낼수있다. -->
		<input type='hidden' id="listId" name="listId" value="" />

		<h3>
			<span class="label label-default">결제 수단</span>
		</h3>
		<input id="listpaid" type="text" class="form-control" name="paid"
			placeholder="card / cash" value="" required /><br />

		<h3>
			<span class="label label-default">은행</span>
		</h3>
		<input id="listbank" type="text" name="bank" class="form-control"
			placeholder="bank" value="" required /><br />

		<h3>
			<span class="label label-default">+/-</span>
		</h3>
		<input id="listoperations" type="text" name="operations"
			class="form-control" placeholder="저금/지출" value="" required /><br />

		<h3>
			<span class="label label-default">금액</span>
		</h3>
		<input id="listmoney" type="text" name="money" class="form-control"
			placeholder="money" value="" required /><br />

		<h3>
			<span class="label label-default">상호명</span>
		</h3>
		<input id="listname" type="text" name="name" class="form-control"
			placeholder="name" value="" required /><br />

		<h3>
			<span class="label label-default">카테고리</span>
		</h3>
		<input id="listcategory" type="text" name="category"
			class="form-control" placeholder="category" value="" required /><br />
	</form>
</div>
<!-- /수정하기팝업 -->

<!-- 맵팝업 -->
<div id="map_ma"></div>

<!-- /팝업영역 -->