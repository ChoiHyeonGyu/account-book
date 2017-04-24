<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<center>
	<section id="option">

		<div class="row" style="background-color: #EAEAEA;">

			<div id="categoryform" title="카테고리 추가" class="col-lg-6 col-lg-6 text-center op" >
				<form method="post" name="카테고리 추가" id="categorypost" action="${pageContext.request.contextPath}/option">

					<h3>
						<span class="label label-default">카데고리 추가</span>
					</h3>
					<br /> <input type="text" id="category" name="category" class="form-control1" placeholder="Category" required>
					<input type="submit" value="ADD" class="btn btn-join">


					<table class="table table-bordered">
						<tr>
							<th>카테고리</th>
							<th>포스트 수</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
						<tbody>
							<tr>
								<td>외식</td>
								<td>6</td>
								<td><button type="button" id="modify" name="modify" class="btn btn-join">수정</button></td>
								<td><button type="button" id="delete" name="delete" class="btn btn-join">삭제</button></td>
							</tr>
							<tr>
								<td>생활비</td>
								<td>3</td>
								<td><input type="button" value="수정"></td>
								<td><input type="button" value="삭제"></td>
							</tr>
							<tr>
								<td>문화생활</td>
								<td>8</td>
								<td><input type="button" value="수정"></td>
								<td><input type="button" value="삭제"></td>
							</tr>
						</tbody>
					</table>
					<br> 	
				</form>
				<form>
				<input type="text" id="password" name="password" class="form-control1" placeholder="Password" required> 
					<button type="button" id="reset" name="reset" class="btn btn-join">가계부 초기화</button>
				</form>
			</div>

			<div class="col-lg-6 col-lg-6 text-center op">
				<form method="post" name="한도 설정">
					<h3>
						<span class="label label-default">한도 설정</span>
					</h3>
					<br /> 금액한도:&nbsp;&nbsp; <select name="limit" >
						<option value="카테고리 설정">카테고리 설정</option>
						<option value="식비">식비</option>
						<option value="생활비">생활비</option>
						<option value="문화생활">문화생활</option>
					</select><br> 
					<input type="text" id="limit" name="limit" class="form-control1" placeholder="Limit" required>
					<button type="button" id="modify1" name="modify1" class="btn btn-join">수정</button>

					<table class="table table-bordered">
						<tr>
							<th>카테고리</th>
							<th>금액</th>
						</tr>

						<tbody>
							<tr>
								<td>식비</td>
								<td>2000</td>
							</tr>
							<tr>
								<td>생활비</td>
								<td>40000</td>
							</tr>
							<tr>
								<td>문화생활</td>
								<td>1230000</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>

		<div id="modifyform" title="수정" style="display: none">
			<form id="modifypost" method="post"
				action="${pageContext.request.contextPath}/main">
				<input type="text" id="inputcategory" name="category" class="form-control"
					placeholder="Category" required> 
			</form>
		</div>
	</section>
</center>