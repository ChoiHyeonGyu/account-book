<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<center>
	<section id="option">

		<div class="row" style="background-color: #EAEAEA;">

			<div id="categoryform" title="카테고리 추가"
				class="col-lg-6 col-lg-6 text-center op">
				<form method="post" name="카테고리 추가" id="categorypost"
					action="${pageContext.request.contextPath}/${currentuserid}/categoryAdd">

					<h3>
						<span class="label label-default">카데고리 추가</span>
					</h3>
					<br /> 
					<input type="text" id="category" name="category"
						class="form-control1" value="" placeholder="Category" required> 
					<input type="submit" value="ADD" class="btn btn-join">

				</form>
				<table class="table table-bordered">
					<tr>
						<th>카테고리</th>
						<th>포스트 수</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
					<tbody>

						<c:forEach var="vo" items="${option}" >
							<script>
								categoryarray.push("${vo.categoryId}");
							</script>
							<tr>
								<td>${vo.category}</td>
								<td>${vo.categoryId}</td>
								<td> <button type="button" id="${vo.categoryId}"
										name="categorymodify" class="btn btn-join">수정</button></td>
							<td><a href="${pageContext.request.contextPath}/${currentuserid}/categorydelete?categoryId=${vo.categoryId}" >
							<img src="${pageContext.request.contextPath}/assets/images/delete.jpg"></a></td>
							
							</tr>
								
						</c:forEach>


					</tbody>
				</table>
				<br>
				<form>
					<input type="text" id="password" name="password"
						class="form-control1" placeholder="Password" required>
					<button type="button" id="reset" name="reset" class="btn btn-join">가계부
						초기화</button>
				</form>
			</div>

			<div class="col-lg-6 col-lg-6 text-center op">
				<form method="post" name="한도 설정">
					<h3>
						<span class="label label-default">한도 설정</span>
					</h3>
					<br /> 금액한도:&nbsp;&nbsp; <select name="limit">
						<option value="카테고리 설정">카테고리 설정</option>
						<c:forEach var="vo" items="${option}" >
						<option value="${vo.category}">${vo.category}</option>
						</c:forEach>
					</select><br> <input type="text" id="limit" name="limit"
						class="form-control1" placeholder="Limit" required>
					<button type="button" id="modify1" name="modify1"
						class="btn btn-join">수정</button>

					<table class="table table-bordered">
						<tr>
							<th>카테고리</th>
							<th>금액</th>
						</tr>

						<tbody>
						<c:forEach var="vo" items="${option}" >
							<tr>
								<td>${vo.category}</td>
								<td>2000</td>
							</tr>
							
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>

		<div id="modifyform" title="수정" style="display: none">
			<form id="modifypost" method="post"
				action="${pageContext.request.contextPath}/${currentuserid}/categoryModify">
				<input type="text" value="" name="category"
					class="form-control" placeholder="Category" required><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="MODIFY" class="btn btn-join">
			</form>
		</div>
	</section>
</center>