<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />
<c:import url="/WEB-INF/views/include/flot.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/report/graph.css">
<script src="${pageContext.request.contextPath}/assets/js/report/flot-mal2.js"></script>

<div class="container">
	<div class="row mt">
		
		<!-- 왼쪽공통영역 -->
		<div class="col-lg-2">
			<c:import url="/WEB-INF/views/mypage/left_menu/profile.jsp" />
		</div>
		
		<!-- 메인컨텐츠영역 (그래프) -->
		<div class="col-lg-10">
			<ul class="nav nav-tabs">
                <li><a id="imt" href="#import" data-toggle="tab">수입</a></li>
                <li class="active"><a href="#export" data-toggle="tab">지출</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane fade" id="import">
                	
                </div>
                <div class="tab-pane fade in active" id="export">
                	<div class="flot-chart">
                        <div class="flot-chart-content" id="flot-line-chart-mt2"></div>
                    </div><br/>
                    <div class="table-responsive">
	                    <table class="table table-striped table-bordered table-hover">
	                        <thead>
	                            <tr>
	                                <th class="fontsize">카테고리 \ 월</th>
	                                <c:forEach var="date" items="${date}">
	                                	<th class="fontsize"><a href="${pageContext.request.contextPath}/${currentuserid}/mydetail2?month=${date.month}" class="black">${date.month}</a></th>
	                                </c:forEach> 
	                                <th class="fontsize">카테고리 합계</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="catemonth1" items="${catemonth}">
	                        		<c:set var="catelimit" value="${catemonth1.ml}"></c:set>
	                        	</c:forEach>
	                        	<c:forEach var="catemonth1" items="${catemonth}" begin="0" end="${catelimit}" step="1">
                      				<tr>
                      					<td class="fontsize">${catemonth1.category}</td>
                      					<c:set var="catename" value="${catemonth1.category}"></c:set>
                      					<c:forEach var="catemonth1" items="${catemonth}">
                      						<c:if test="${catemonth1.category == catename}">
	                      						<td class="fontsize">${catemonth1.month}</td>
	                      					</c:if>
                         				</c:forEach>
                         			</tr>
                        		</c:forEach>
                            	
                               	<tr>
	                                <td class="fontsize"><strong>월 합계</strong></td>
	                                <c:forEach var="cmsum" items="${cmsum}" varStatus="status">
	                                	<c:if test="${!status.last}">
	                                		<td class="fontsize">${cmsum.month}</td>
	                                	</c:if>
	                                	<c:if test="${status.last}">
	                                		<td class="fontred fontsize">${cmsum.month}</td>
	                                	</c:if>
	                                </c:forEach>
                            	</tr>
	                        </tbody>
	                    </table>
                	</div>
                </div>
            </div>
		</div>
		<!-- /메인컨텐츠영역 (그래프) -->
	</div>
</div>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp" />

<!-- 이전 그래프로 넘어감 -->
<form id="im" method="post" action="${pageContext.request.contextPath}/${currentuserid}/mygraph">
</form>