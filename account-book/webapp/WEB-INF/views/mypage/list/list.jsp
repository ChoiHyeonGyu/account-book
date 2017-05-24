<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />
<c:import url="/WEB-INF/views/include/flot.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/morrisjs/morris.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/css/list/list.css">
<script	src="${pageContext.request.contextPath}/assets/raphael/raphael.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/morrisjs/morris.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/report/morris-data.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/list/list.js"></script>
<script	src="http://maps.google.com/maps/api/js?key=AIzaSyD4b_BFpjBL1PYY6pKL7vGrLWyB7n_qBa0"></script>

<div class="container">
	<div class="row mt">

		<!-- 왼쪽공통영역 -->
		<div class="col-lg-2">
			<c:import url="/WEB-INF/views/mypage/left_menu/profile.jsp" />
		</div>

		<!-- 메인컨텐츠영역 (그래프, 가계부리스트) -->
		<div class="col-lg-10">

			<!-- 그래프영역 -->
			<div>여기는 navigator 입니다.</div>
			<c:import url="/WEB-INF/views/report/limit_graph.jsp" />

			<h1 align="center"></h1>
			<div class="row">
				<div class="col-md-12">

					<!-- 가계부리스트영역 -->
					<h2 class="fontlist">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  월 수입  &nbsp;<font color="green">
						${v3}</font>원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월 지출&nbsp;<font color="red">
						 ${v2}</font>원</h2>
					<form action="${pageContext.request.contextPath}/${currentuserid}/list" method="post">
						<input type="search" name="searching" size="121"
							placeholder="현금,금액,카테고리"> <input class="btn btn-default"
							type="submit" value="검색">

					</form>

<%-- 
					<form
						action="${pageContext.request.contextPath }/${currentuserid}/add"
						method="post">
						<table class="table-bordered border-collapse" style="background: #ececec">

							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="10%" />
								<col width="10%" />
								<col width="13%" />
								<col width="10%" />
								<col width="10%" />
								<col width="5%" />
								<col width="5%" />

							</colgroup>

							<thead>
								<tr>
									<th class="mine1 tablecolor tableoption"
										style="background: #ececec" WIDTH="50">날짜</th>
									<th class="mine2 tablecolor" style="background: #ececec">사용내역</th>
									<th class="mine3 tablecolor" style="background: #ececec">금액</th>
									<th class="mine3 tablecolor" style="background: #ececec">결제수단</th>
									<th class="mine3 tablecolor" style="background: #ececec">지출/수입/투자</th>
									<th class="mine3 tablecolor" style="background: #ececec">은행</th>
									<th class="mine3 tablecolor" style="background: #ececec">카테고리</th>
									<th class="mine3 tablecolor" style="background: #ececec">지도</th>
									<th class="mine3 tablecolor" style="background: #ececec">삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="datepicker" name="day"
										class="tableinput" placeholder="날짜 입력하기"></td>
									<td><input value="" class="mine tablecoler"
										style="background: #ececec" placeholder="사용내역" name="name"></td>
									<td><input value="" class="mine tablecolor "
										style="background: #ececec" placeholder="금액" name="money"></td>
									<td><select id="paid" name="paid" class="tableinput">
											<option value="현금">현금</option>
											<option value="카드">카드</option>
									</select></td>
									<td><select id="operations" class="tableinput"
										name="operations">

											<option value="-">지출</option>
											<option value="+">수입</option>
											<option value="0">투자</option>
									</select></td>
									<td><input value="" class="mine tablecolor"
										style="background: #ececec" placeholder="은행" name="bank"></td>
									<!-- <td><input value="" class="mine tablecolor"
										style="background: #ececec" placeholder="카테고리" name="category"></td>
									 -->
									<td><select id="category" class="tableinput" name="category">
										<c:forEach var="bb" items="${option}">
											<option value="${bb.category}">${bb.category}</option>
										</c:forEach>
									</select></td>
									<td><input value="" class="mine tablecolor"
										style="background: #ececec" placeholder="지도"></td>
									<td><input type="submit" value="저장"
										class="btn btn-default" /></td>
								</tr>
								<!-- <button id="myBtn">추가</button> -->
						</table>

					</form>
 --%>
					<table class="table-bordered border-collapse"
						style="background: #ececec">
						<colgroup>
							<col width="15%" />
							<col width="20%" />
							<col width="13%" />
							<col width="10%" />
							<col width="13%" />
							<col width="10%" />
							<col width="15%" />
							<col width="3%" />
							<col width="5%" />

						</colgroup>
							<thead>
								<tr>
									<th class="mine1 tablecolor tableoption"
										style="background: #ececec" WIDTH="50">날짜</th>
									<th class="mine2 tablecolor" style="background: #ececec">사용내역</th>
									<th class="mine3 tablecolor" style="background: #ececec">금액</th>
									<th class="mine3 tablecolor" style="background: #ececec">결제수단</th>
									<th class="mine3 tablecolor" style="background: #ececec">지출/수입/투자</th>
									<th class="mine3 tablecolor" style="background: #ececec">은행</th>
									<th class="mine3 tablecolor" style="background: #ececec">카테고리</th>
									<th class="mine3 tablecolor" style="background: #ececec">지도</th>
									<th class="mine3 tablecolor" style="background: #ececec">삭제</th>
								</tr>
							</thead>
						
							<form action="${pageContext.request.contextPath }/${currentuserid}/add"	method="post">
								<tr>
									<td><input type="text" id="datepicker" name="day"
										class="tableinput" placeholder="날짜 입력하기"></td>
									<td><input value="" class="mine tablecoler"
										style="background: #ececec" placeholder="사용내역" name="name"></td>
									<td><input value="" class="mine tablecolor "
										style="background: #ececec" placeholder="금액" name="money"></td>
									<td><select id="paid" name="paid" class="tableinput">
											<option value="현금">현금</option>
											<option value="카드">카드</option>
									</select></td>
									<td><select id="operations" class="tableinput"
										name="operations">

											<option value="-" class="textline">지출</option>
											<option value="+" class="textline">수입</option>
											<option value="0" class="textline">투자</option>
									</select></td>
									<td><input value="" class="mine tablecolor"
										style="background: #ececec" placeholder="은행" name="bank"></td>
									<!-- <td><input value="" class="mine tablecolor"
										style="background: #ececec" placeholder="카테고리" name="category"></td>
									 -->
									<td><select id="category" class="tableinput" name="category">
										<c:forEach var="bb" items="${option}">
											<option value="${bb.category}">${bb.category}</option>
										</c:forEach>
									</select></td>
									<td><input value="" class="mine tablecolor"
										style="background: #ececec" placeholder="지도"></td>
									<td><input type="submit" value="저장"
										class="btn btn-default  btn-sm " /> </td>
						
								</tr>
								</form>	
						
						
						<c:forEach var="vo" items="${ps.list}" varStatus="status">
							<script>
								listarray.push("${vo.listId}");
							</script>
							<tr>
								<td><input value="${vo.day}" class="mine tablecoler"
									style="background: #ececec"></td>
								<td><input value="${vo.name}" class="mine tablecoler"
									style="background: #ececec"></td>
								<td><label id="${vo.listId}" style="background: #ececec">${vo.money}원</label></td>
								<td><input value="${vo.paid}" class="mine tablecoler"
									style="background: #ececec"></td>
								<td>
									<c:choose>
										<c:when test="${vo.operations == '+'}">
											<input value="수입" class="mine tablecoler" style="background: #ececec">
										</c:when>
										<c:when test="${vo.operations == '-'}">
											<input value="지출" class="mine tablecoler" style="background: #ececec">
										</c:when>
										<c:otherwise>
											<input value="투자" class="mine tablecoler" style="background: #ececec">
										</c:otherwise>
									</c:choose>
								</td>
								<td><input value="${vo.bank}" class="mine tablecoler"
									style="background: #ececec"></td>
								<td><input value="${vo.category}" class="mine tablecoler"
									style="background: #ececec"></td>
								<td><strong id="maps${vo.listId}"
									class="fa fa-map-marker fa-2x sr-contact col-lg-offset-4 tablecoler"
									style="background: #ececec"></strong></td>
								<td><a
									href="${pageContext.request.contextPath}/${currentuserid}/listdelete?listId=${vo.listId}"
									class="col-lg-offset-5 tablecoler glyphicon glyphicon-trash"><%-- <img
										src="${pageContext.request.contextPath}/assets/images/delete.jpg"> --%></a></td>
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
									href="${pageContext.request.contextPath}/${currentuserid}/list?pagination=${ps.prevPage}&searching=${ps.searching}">◀</a></li>
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
											href="${pageContext.request.contextPath }/${currentuserid}/list?pagination=${page}&searching=${ps.searching}">${page}</a></li>
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
				<c:forEach var="bb" items="${option}">
					<option value="${bb.category}">${bb.category}</option>
				</c:forEach>
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