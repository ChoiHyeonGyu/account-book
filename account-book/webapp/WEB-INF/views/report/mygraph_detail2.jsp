<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />
<c:import url="/WEB-INF/views/include/flot.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<script src="${pageContext.request.contextPath}/assets/js/report/flot-mal-detail2.js"></script>

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
                        <div class="flot-chart-content2" id="flot-line-chart-mt2"></div>
                    </div><br/>
                    <div class="table-responsive">
	                    <table class="table table-striped table-bordered table-hover">
	                        <thead>
	                            <tr>
	                                <th class="fontsize">카테고리 \ 일</th>
	                                <th class="fontsize">${date.d1}</th>
	                                <th class="fontsize">${date.d2}</th>
	                                <th class="fontsize">${date.d3}</th>
	                                <th class="fontsize">${date.d4}</th>
	                                <th class="fontsize">${date.d5}</th>
	                                <th class="fontsize">${date.d6}</th>
	                                <th class="fontsize">${date.d7}</th>
	                                <th class="fontsize">${date.d8}</th>
	                                <th class="fontsize">${date.d9}</th>
	                                <th class="fontsize">${date.d10}</th>
	                                <th class="fontsize">${date.d11}</th>
	                                <th class="fontsize">카테고리 합계</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="cate" items="${cateday}">
                                	<tr>
		                                <td class="fontsize">${cate.category}</td>
		                                <td class="fontsize">${cate.d1}</td>
		                                <td class="fontsize">${cate.d2}</td>
		                                <td class="fontsize">${cate.d3}</td>
		                                <td class="fontsize">${cate.d4}</td>
		                                <td class="fontsize">${cate.d5}</td>
		                                <td class="fontsize">${cate.d6}</td>
		                                <td class="fontsize">${cate.d7}</td>
		                                <td class="fontsize">${cate.d8}</td>
		                                <td class="fontsize">${cate.d9}</td>
		                                <td class="fontsize">${cate.d10}</td>
		                                <td class="fontsize">${cate.d11}</td>
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
	                                <th class="fontsize">${date.d12}</th>
	                                <th class="fontsize">${date.d13}</th>
	                                <th class="fontsize">${date.d14}</th>
	                                <th class="fontsize">${date.d15}</th>
	                            	<th class="fontsize">${date.d16}</th>
	                                <th class="fontsize">${date.d17}</th>
	                                <th class="fontsize">${date.d18}</th>
	                                <th class="fontsize">${date.d19}</th>
	                                <th class="fontsize">${date.d20}</th>
	                                <th class="fontsize">${date.d21}</th>
	                                <th class="fontsize">${date.d22}</th>
	                                <th class="fontsize">카테고리 합계</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="cate" items="${cateday}">
                                	<tr>
		                                <td class="fontsize">${cate.category}</td>
		                                <td class="fontsize">${cate.d12}</td>
		                                <td class="fontsize">${cate.d13}</td>
		                                <td class="fontsize">${cate.d14}</td>
		                                <td class="fontsize">${cate.d15}</td>
		                                <td class="fontsize">${cate.d16}</td>
		                                <td class="fontsize">${cate.d17}</td>
		                                <td class="fontsize">${cate.d18}</td>
		                                <td class="fontsize">${cate.d19}</td>
		                                <td class="fontsize">${cate.d20}</td>
		                                <td class="fontsize">${cate.d21}</td>
		                                <td class="fontsize">${cate.d22}</td>
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
	                                <th class="fontsize">${date.d23}</th>
	                                <th class="fontsize">${date.d24}</th>                       
	                            	<th class="fontsize">${date.d25}</th>
	                                <th class="fontsize">${date.d26}</th>
	                                <th class="fontsize">${date.d27}</th>
	                                <th class="fontsize">${date.d28}</th>
	                                <th class="fontsize">${date.d29}</th>
	                                <th class="fontsize">${date.d30}</th>
	                                <th class="fontsize">${date.d31}</th>
	                                <th class="fontsize"></th>
	                                <th class="fontsize"></th>
	                                <th class="fontsize">카테고리 합계</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="cate" items="${cateday}">
                                	<tr>
		                                <td class="fontsize">${cate.category}</td>
		                                <td class="fontsize">${cate.d23}</td>
		                                <td class="fontsize">${cate.d24}</td>
		                                <td class="fontsize">${cate.d25}</td>
		                                <td class="fontsize">${cate.d26}</td>
		                                <td class="fontsize">${cate.d27}</td>
		                                <td class="fontsize">${cate.d28}</td>
		                                <td class="fontsize">${cate.d29}</td>
		                                <td class="fontsize">${cate.d30}</td>
		                                <td class="fontsize">${cate.d31}</td>
		                                <td class="fontsize"></td>
		                                <td class="fontsize"></td>
		                                <td class="fontsize">${cate.sumresult}</td>
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

<input type="hidden" id="selectedmonth" value="${month}">