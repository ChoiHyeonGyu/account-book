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

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>
			<div id="listadd" title="추가하기" style="display:">
				<form name="listadd" var="vo" items="${list}" varStatus="status
					action="${pageContext.request.contextPath }/{id}/add?id=${vo.id}" method="post">
					<h3>
						<span class="label label-default">결제 수단</span>
					</h3>
					<input type="text" class="form-control" name="paid"
						placeholder="card / cash" value=""><br />

					<h3>
						<span class="label label-default">은행</span>
					</h3>
					<input type="text" name="bank" class="form-control"
						placeholder="bank" value=""><br />

					<h3>
						<span class="label label-default">+/-</span>
					</h3>
					<input type="text" name="operations" class="form-control"
						placeholder="+/-" value=""><br />

					<h3>
						<span class="label label-default">금액</span>
					</h3>
					<input type="text" name="money" class="form-control"
						placeholder="money" value=""><br />

					<h3>
						<span class="label label-default">상호명</span>
					</h3>
					<input type="text" name="name" class="form-control"
						placeholder="name" value=""><br />

					<h3>
						<span class="label label-default">카테고리</span>
					</h3>
					<input type="text" name="category" class="form-control"
						placeholder="category" value=""><br />

					<h3>
						<span class="label label-default">날짜</span>
					</h3>
					<input type="text" name="day" class="form-control"
						placeholder="day" value=""><br /> <input type="submit"
						id="submitbt" name="submitbt" class="btn btn-join" value="확인">
					<input type="reset" id="resetbt" name="userRegBtn"
						class="btn btn-join" value="취소">
				</form>
				<p>
			</div>
		</div>

	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

</body>
				</html>
				<table border='1' class="syd2">
					<tr bgcolor='red'>
						<td>중복확인</td>
						<td>결제수단</td>
						<td>은행</td>
						<td>+/-</td>
						<td>금액</td>
						<td>상호명</td>
						<td>카테고리</td>
						<td>날짜</td>
						<td>삭제</td>
						<td>맵 확인하기</td>


					</tr>

					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>
							<td>${vo.listId}</td>
							<td>${vo.paid}</td>
							<td>${vo.bank}</td>
							<td>${vo.operations}</td>
							<td>${vo.money}</td>
							<td>${vo.name}</td>
							<td>${vo.category}</td>
							<td>${vo.day}</td>
							<td><a
								href="${pageContext.request.contextPath}/{id}/listdelete?id=${vo.id}&listId=${vo.listId}"><img
									src="${pageContext.request.contextPath}/assets/images/delete.jpg"></a></td>
							<td><a href="${pageContext.request.contextPath}">ㄱㄱ</a></td>
						</tr>
					</c:forEach>


				</table>
			</div>
		</div>
		<div class="col-lg-6 col-md-6 text-center syd1">
			<div class="service-box">
				<table border='1' class="syd2">
					<tr bgcolor='#33ffff'>
						<td>결제수단</td>
						<td>금액</td>
						<td>상호명</td>
						<td>카테고리</td>
						<td>날짜</td>
					</tr>
					<tr>
						<td>card</td>
						<td>20000</td>
						<td>고깃집</td>
						<td>생활비</td>
						<td>날짜</td>
					</tr>
					<tr>
						<td>card</td>
						<td>20000</td>
						<td>고깃집</td>
						<td>생활비</td>
						<td>날짜</td>
					</tr>
				</table>
			</div>
		</div>
	</div>


</section>