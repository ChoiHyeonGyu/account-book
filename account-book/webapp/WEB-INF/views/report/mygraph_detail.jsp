<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />
<c:import url="/WEB-INF/views/include/flot.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<script src="${pageContext.request.contextPath}/assets/js/report/flot-mal-detail.js"></script>

<div class="container">
	<div class="row mt">
		
		<!-- 왼쪽공통영역 -->
		<div class="col-lg-2">
			<c:import url="/WEB-INF/views/mypage/left_menu/profile.jsp" />
		</div>
		
		<!-- 메인컨텐츠영역 (그래프) -->
		<div class="col-lg-10">
			<ul class="nav nav-tabs">
                <li class="active"><a id="imt" href="#import" data-toggle="tab">수입</a></li>
                <li><a id="ext" href="#export" data-toggle="tab">지출</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane fade in active" id="import">
                	<div class="flot-chart">
                        <div class="flot-chart-content" id="flot-line-chart-mt1"></div>
                    </div><br/>
                    <div class="table-responsive">
	                    <table class="table table-striped table-bordered table-hover">
	                        <thead>
	                            <tr>
	                                <th class="fontsize">카테고리 \ 일</th>
	                                <c:forEach var="date" items="${date}" begin="0" end="10" step="1">
	                                	<th class="fontsize">${date.day2}</th>
	                                </c:forEach>
	                                <th class="fontsize">카테고리 합계</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="cateday1" items="${cateday}">
	                        		<c:set var="catelimit" value="${cateday1.ml}"></c:set>
	                        	</c:forEach>
                            	<c:forEach var="cateday1" items="${cateday}" begin="0" end="${catelimit}" step="1">
                      				<tr>
                      					<td class="fontsize">${cateday1.category}</td>
                      					<c:set var="catename" value="${cateday1.category}"></c:set>
                      					<c:forEach var="cateday1" items="${cateday}" begin="0" end="${((catelimit+1)*11)-1}" step="1">
                      						<c:if test="${cateday1.category == catename}">
	                      						<td class="fontsize">${cateday1.day2}</td>
	                      					</c:if>
                         				</c:forEach>
                         				<td class="fontsize"></td>
                         			</tr>
                        		</c:forEach>
                               	<tr>
	                                <td class="fontsize"><strong>일 합계</strong></td>
	                                <td class="fontsize">${cmsum.d1}</td>
	                                <td class="fontsize">${cmsum.d2}</td>
	                                <td class="fontsize">${cmsum.d3}</td>
	                                <td class="fontsize">${cmsum.d4}</td>
	                                <td class="fontsize">${cmsum.d5}</td>
	                                <td class="fontsize">${cmsum.d6}</td>
	                                <td class="fontsize">${cmsum.d7}</td>
	                                <td class="fontsize">${cmsum.d8}</td>
	                                <td class="fontsize">${cmsum.d9}</td>
	                                <td class="fontsize">${cmsum.d10}</td>
	                                <td class="fontsize">${cmsum.d11}</td>
	                                <td class="fontsize"></td>
                            	</tr>
	                        </tbody>
	                        <thead>
	                            <tr>
	                                <th class="fontsize">카테고리 \ 일</th>
	                                <c:forEach var="date" items="${date}" begin="11" end="21" step="1">
	                                	<th class="fontsize">${date.day2}</th>
	                                </c:forEach>
	                                <th class="fontsize">카테고리 합계</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="cateday1" items="${cateday}">
	                        		<c:set var="catelimit" value="${cateday1.ml}"></c:set>
	                        	</c:forEach>
                            	<c:forEach var="cateday1" items="${cateday}" begin="0" end="${catelimit}" step="1">
                      				<tr>
                      					<td class="fontsize">${cateday1.category}</td>
                      					<c:set var="catename" value="${cateday1.category}"></c:set>
                      					<c:forEach var="cateday1" items="${cateday}" begin="${((catelimit+1)*11)}" end="${((catelimit+1)*22)-1}" step="1">
                      						<c:if test="${cateday1.category == catename}">
	                      						<td class="fontsize">${cateday1.day2}</td>
	                      					</c:if>
                         				</c:forEach>
                         				<td class="fontsize"></td>
                         			</tr>
                        		</c:forEach>
                               	<tr>
	                                <td class="fontsize"><strong>일 합계</strong></td>
	                                <td class="fontsize">${cmsum.d12}</td>
	                                <td class="fontsize">${cmsum.d13}</td>
	                                <td class="fontsize">${cmsum.d14}</td>
	                                <td class="fontsize">${cmsum.d15}</td>
	                                <td class="fontsize">${cmsum.d16}</td>
	                                <td class="fontsize">${cmsum.d17}</td>
	                                <td class="fontsize">${cmsum.d18}</td>
	                                <td class="fontsize">${cmsum.d19}</td>
	                                <td class="fontsize">${cmsum.d20}</td>
	                                <td class="fontsize">${cmsum.d21}</td>
	                                <td class="fontsize">${cmsum.d22}</td>
	                                <td class="fontsize"></td>
                            	</tr>
	                        </tbody>
	                        <thead>
	                            <tr>
	                            	<th class="fontsize">카테고리 \ 일</th>
	                            	<c:forEach var="date" items="${date}" varStatus="status" begin="22" end="30" step="1">
	                                	<th class="fontsize">${date.day2}</th>
	                                	<c:if test="${status.last and (date.cnt == 29)}">
	                                		<th class="fontsize"></th>
	                                	</c:if>
	                                	<c:if test="${status.last and (date.cnt == 27)}">
	                                		<th class="fontsize"></th>
	                                		<th class="fontsize"></th>
	                                		<th class="fontsize"></th>
	                                	</c:if>
	                                </c:forEach>
	                                <th class="fontsize"></th>
	                                <th class="fontsize"></th>
	                                <th class="fontsize">카테고리 합계</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="cateday1" items="${cateday}">
	                        		<c:set var="catelimit" value="${cateday1.ml}"></c:set>
	                        	</c:forEach>
                            	<c:forEach var="cateday1" items="${cateday}" varStatus="status" begin="0" end="${catelimit}" step="1">
                      				<tr>
                      					<td class="fontsize">${cateday1.category}</td>
                      					<c:set var="catename" value="${cateday1.category}"></c:set>
                      					<c:if test="${cateday1.cnt == 30}">
	                                		<c:forEach var="cateday1" items="${cateday}" varStatus="status" begin="${((catelimit+1)*22)}" end="${((catelimit+1)*32)-1}" step="1">
	                      						<c:if test="${cateday1.category == catename}">
	                      							<c:if test="${!status.last}">
	                      								<td class="fontsize">${cateday1.day2}</td>
	                      							</c:if>
	                      							<c:if test="${status.last}">
	                      								<td class="fontsize"></td>
				                         				<td class="fontsize"></td>
	                      								<td class="fontsize">${cateday1.day2}</td>
	                      							</c:if>
		                      					</c:if>
	                         				</c:forEach>
		                                </c:if>
                      					<c:if test="${cateday1.cnt == 29}">
			                                <c:forEach var="cateday1" items="${cateday}" varStatus="status" begin="${((catelimit+1)*22)}" end="${((catelimit+1)*31)-1}" step="1">
	                      						<c:if test="${cateday1.category == catename}">
	                      							<c:if test="${!status.last}">
	                      								<td class="fontsize">${cateday1.day2}</td>
	                      							</c:if>
	                      							<c:if test="${status.last}">
	                      								<td class="fontsize"></td>
				                         				<td class="fontsize"></td>
				                         				<td class="fontsize"></td>
	                      								<td class="fontsize">${cateday1.day2}</td>
	                      							</c:if>
		                      					</c:if>
	                         				</c:forEach>
	                                	</c:if>
	                                	<c:if test="${cateday1.cnt == 27}">
	                                		<c:forEach var="cateday1" items="${cateday}" varStatus="status" begin="${((catelimit+1)*22)}" end="${((catelimit+1)*29)-1}" step="1">
	                      						<c:if test="${cateday1.category == catename}">
	                      							<c:if test="${!status.last}">
	                      								<td class="fontsize">${cateday1.day2}</td>
	                      							</c:if>
	                      							<c:if test="${status.last}">
	                      								<td class="fontsize"></td>
				                         				<td class="fontsize"></td>
				                         				<td class="fontsize"></td>
				                         				<td class="fontsize"></td>
				                         				<td class="fontsize"></td>
	                      								<td class="fontsize">${cateday1.day2}</td>
	                      							</c:if>
		                      					</c:if>
	                         				</c:forEach>
	                                	</c:if>
                         			</tr>
                        		</c:forEach>
                               	<tr>
	                                <td class="fontsize"><strong>일 합계</strong></td>
	                                <td class="fontsize">${cmsum.d23}</td>
	                                <td class="fontsize">${cmsum.d24}</td>
	                                <td class="fontsize">${cmsum.d25}</td>
	                                <td class="fontsize">${cmsum.d26}</td>
	                                <td class="fontsize">${cmsum.d27}</td>
	                                <td class="fontsize">${cmsum.d28}</td>
	                                <td class="fontsize">${cmsum.d29}</td>
	                                <td class="fontsize">${cmsum.d30}</td>
	                                <td class="fontsize">${cmsum.d31}</td>
	                                <td class="fontsize"></td>
	                                <td class="fontsize"></td>
	                                <td class="fontred fontsize">${cmsum.sumresult}</td>
                            	</tr>
	                        </tbody>
	                    </table>
                	</div>
                </div>
                <div class="tab-pane fade" id="export">
                	
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

<!-- 다음 그래프로 넘어감 -->
<form id="ex" method="post" action="${pageContext.request.contextPath}/${currentuserid}/mygraph2">
</form>

<!-- 해당 월 저장 -->
<input type="hidden" id="selectedmonth" value="${month}">