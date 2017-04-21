<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<center>
	<section id="option">

		<div class="row" style="background-color: #EAEAEA;">

			<div class="col-lg-6 col-lg-6 text-center op">
				<form method="post" name="카테고리 추가">

					<h3>
						<span class="label label-default">카데고리 추가</span>
					</h3>
					<br /> <input type="text" name="money" placeholder="카테고리 추가">
					<input type="button" value="추가">


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
								<td><input type="button" value="수정"></td>
								<td><input type="button" value="삭제"></td>
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
					<br> 비밀번호: &nbsp;<input type="text" name="password"
						placeholder="비밀번호 재입력"> <input type="button" value="수정"><br>
					<input type="button" value="가계부 초기화">




				</form>
			</div>

			<div class="col-lg-6 col-lg-6 text-center op">
				<form method="post" name="한도 설정">
					<h3>
						<span class="label label-default">한도 설정</span>
					</h3>
					<br /> 금액한도:&nbsp;&nbsp; <select name="limit">
						<option value="카테고리 설정">카테고리 설정</option>
						<option value="식비">식비</option>
						<option value="생활비">생활비</option>
						<option value="문화생활">문화생활</option>
					</select><br> <input type="text" name="money" placeholder="금액">
					<input type="button" value="수정">

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


	</section>
</center>