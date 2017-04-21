<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<section id="list">
  <div class="row">
		<div class="col-lg-6 col-md-6 text-center syd">
			<div class="service-box">
				<table border='1' class="syd2">
					<tr bgcolor='#33ffff'>
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
							<td><a href="${pageContext.request.contextPath}/{id}/listdelete?id=${vo.id}&listId=${vo.listId}"><img src="${pageContext.request.contextPath}/assets/images/delete.jpg"></a></td>
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