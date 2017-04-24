<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-md-6">
		<h1 align="center">자신의 씀씀이 이야기</h1>
		<form action="${pageContext.request.contextPath}/" method="post">
			<input type="search" name="search" size="90">
			<input type="submit" value="검색하기">
			<button id="boardadd" type="button">작성하기</button>
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
	        <tr>
	          <td>1</td>
	          <td>Mark</td>
	          <td>Otto</td>
	          <td>@mdo</td>
	          <td>Otto</td>
	          <td>@mdo</td>
	        </tr>
	      </tbody>
	    </table>
	</div>
</div>

<div id="boardform" title="작성하기" style="display:none">
	<form id="loginpost" method="post" action="${pageContext.request.contextPath}/connmain">
   		<input type="text" id="inputEmail" name="id" class="form-control" placeholder="Email address" required>
   		<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
   	</form>
</div>