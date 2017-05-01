<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<section id="list">
	<div class="row">
		<div class="col-lg-6 col-md-6 text-center syd">
			<div class="service-box">

<form action="${pageContext.request.contextPath}/${currentuserid}/pageSearching" method="post">
			<input type="search" name="search" size="63"> 
			<input type="submit" value="검색">
		</form>
		<table  class="table">
		<thead>
					<tr bgcolor='#33cc33'>
						<td>중복확인</td>
						<td>결제수단</td>
						<td>은행</td>
						<td>+/-</td>
						<td>금액</td>
						<td>구입물이름</td>
						<td>카테고리</td>
						<td>날짜</td>
						<td>삭제</td>
						<td><button id="myBtn">추가하기</button> </td>
						<td>맵 확인하기</td>
					</tr>
</thead>
<tbody>
	<c:forEach var="vo" items="${list}" varStatus="status">
						 <script>
							listarray.push("${vo.listId}");
	      				</script> 
						<tr>
							<td>${vo.listId}</td>
							<td>${vo.paid}</td>
							<td>${vo.bank}</td>
							<td>${vo.operations}</td>
							<td><button id="${vo.listId}">${vo.money}</button></td>
							
							<td>${vo.name}</td>
							<td>${vo.category}</td>
							<td>${vo.day}</td>
							<td><a
								href="${pageContext.request.contextPath}/${currentuserid}/listdelete?listId=${vo.listId}"><img
									src="${pageContext.request.contextPath}/assets/images/delete.jpg"></a></td>
								<td><button id="myBtn">추가하기</button> </td>	
							<td><a href="${pageContext.request.contextPath}">맵보기!!!!!</a></td>
						</tr>
						
					</c:forEach>
					</tbody>
					</table>
					</div>
					<div class="pager">
			<ul>
				<c:if test="${ps.prevPage > 0}" >
					<li><a href="${pageContext.request.contextPath}/${currentuserid}/pageSearching?pagination=${ps.prevPage}&searching=${ps.keyword}">◀</a></li>
				</c:if>
				
				<c:forEach begin="${ps.beginPage}" end="${ps.beginPage + ps.listSize - 1}" var="page">
					<c:choose>
						<c:when test="${ps.endPage < page}">
							<li>${page}</li>
						</c:when> 
						<c:when test="${ps.currentPage == page}">
							<li class="selected">${page}</li>
						</c:when>
						<c:otherwise> 
							<li><a href="${pageContext.request.contextPath }/${currentuserid}/pageSearching?pagination=${page}&searching=${ps.keyword}">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${ps.nextPage > 0}" >
					<li><a href="${pageContext.request.contextPath }/${currentuserid}/pageSearching?pagination=${ps.nextPage}&searching=${ps.keyword}">▶</a></li>
				</c:if>
			</ul>
		</div>
	<!-- Trigger/Open The Modal -->
	

 			<p>
			<div id="listadd" title="추가하기" style="display:none" >
				<form id="commit" name="listadd"  var="vo" items="${list}" varStatus="status" 
					action="${pageContext.request.contextPath }/${currentuserid}/add?locationX=o&locationY=o" method="post">
						 <input type='hidden' name="id" value="${currentuserid}"> 
					<h3>
						<span class="label label-default">결제 수단</span>
					</h3>
					<input type="text" class="form-control" name="paid"
						placeholder="card / cash" value="" required ><br />

					<h3>
						<span class="label label-default">은행</span>
					</h3>
					<input type="text" name="bank" class="form-control"
						placeholder="bank" value="" required><br />

					<h3>
						<span class="label label-default">+/-</span>
					</h3>
					<input type="text" name="operations" class="form-control"
						placeholder="저금/지출" value="" required><br />

					<h3>
						<span class="label label-default">금액</span>
					</h3>
					<input type="text" name="money" class="form-control"
						placeholder="money" value="" required><br />

					<h3>
						<span class="label label-default">구입물이름</span>
					</h3>
					<input type="text" name="name" class="form-control"
						placeholder="name" value="" required><br />

					<h3>
						<span class="label label-default">카테고리</span>
					</h3>
					<input type="text" name="category" class="form-control"
						placeholder="category" value="" required><br />

				</form> 
				</div>
			 </p>
			<p>
			<div id="modify" title="수정하기" style="display:none" >
				<form id="modify11"  action="${pageContext.request.contextPath }/${currentuserid}/modify1" method="post">
					
						 <input type='hidden' name="id" value="${currentuserid}"/><!-- 히든으로 1가지 이상의 값을 보낼수있다. -->
						 <input type='hidden' id="listId" name="listId" value=""/>
						 
					<h3>
						<span class="label label-default">결제 수단</span>
					</h3>
					<input id="listpaid" type="text" class="form-control" name="paid"
						placeholder="card / cash" value="" required><br />

					<h3>
						<span class="label label-default">은행</span>
					</h3>
					<input id="listbank" type="text" name="bank" class="form-control"
						placeholder="bank" value="" required><br />

					<h3>
						<span class="label label-default">+/-</span>
					</h3>
					<input id="listoperations" type="text" name="operations" class="form-control"
						placeholder="저금/지출" value="" required><br />

					<h3>
						<span class="label label-default">금액</span>
					</h3>
					<input id="listmoney" type="text" name="money" class="form-control"
						placeholder="money" value="" required><br />

					<h3>
						<span class="label label-default">상호명</span>
					</h3>
					<input id="listname" type="text" name="name" class="form-control"
						placeholder="name" value="" required><br />

					<h3>
						<span class="label label-default">카테고리</span>
					</h3>
					<input id="listcategory" type="text" name="category" class="form-control"
						placeholder="category" value="" required><br />
				</form> 
				</div>
			 </p>				
			
			
		</div>
		<c:import url="/WEB-INF/views/board.jsp"/>
	</div>
</section>