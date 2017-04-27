<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<section id="list">
	<div class="row">
		<div class="col-lg-6 col-md-6 text-center syd">
			<div class="service-box">
				<!DOCTYPE html>
				<html>
<head>
 <style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
} 
</style> 
</head>
<body>
	<!-- Trigger/Open The Modal -->
	<button id="myBtn">추가하기</button> 

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
			
	

			 <table border='1' class="syd2">
					<tr bgcolor='red'>
						<td>중복확인</td>
						<td>결제수단</td>
						<td>은행</td>
						<td>+/-</td>
						<td>금액</td>
						<td>구입물이름</td>
						<td>카테고리</td>
						<td>날짜</td>
						<td>삭제</td>
						<td>맵 확인하기</td>


					</tr>
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
									
							<td><a href="${pageContext.request.contextPath}">맵보기!!!!!</a></td>
						</tr>
					</c:forEach>
			<p>
			<div id="modify" title="수정하기" style="display:none" >
				<form id="modify11" name="listadd"  var="vo" items="${list}" varStatus="status" 
					action="${pageContext.request.contextPath }/${currentuserid}/modify1?listId=170" method="post">
					
						 <input type='hidden' name="id" value="${currentuserid}"/>
						 <input type='hidden' name="listId1" value="${vo.listId}"/>
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
						<span class="label label-default">물건이름</span>
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
			 


				</table>
</body>

				</html>

 
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/board.jsp"/>
	</div>
</section>