<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp" />
<c:import url="/WEB-INF/views/include/flot.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
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
                        <div class="flot-chart-content2" id="flot-line-chart-mt2"></div>
                    </div><br/>
                    <div class="table-responsive">
	                    <table class="table table-striped table-bordered table-hover">
	                        <thead>
	                            <tr>
	                                <th class="fontsize">카테고리 \ 월</th>
	                                <th class="fontsize">${date.jan}</th>
	                                <th class="fontsize">${date.feb}</th>
	                                <th class="fontsize">${date.mar}</th>
	                                <th class="fontsize">${date.apr}</th>
	                                <th class="fontsize">${date.may}</th>
	                                <th class="fontsize">${date.jun}</th>
	                                <th class="fontsize">${date.jul}</th>
	                                <th class="fontsize">${date.aug}</th>
	                                <th class="fontsize">${date.sep}</th>
	                                <th class="fontsize">${date.oct}</th>
	                                <th class="fontsize">${date.nov}</th>
	                                <th class="fontsize">${date.dec}</th>
	                                <th class="fontsize">카테고리 합계</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="cate" items="${catemonth}">
                                	<tr>
		                                <td class="fontsize">${cate.category}</td>
		                                <td class="fontsize">${cate.jan}</td>
		                                <td class="fontsize">${cate.feb}</td>
		                                <td class="fontsize">${cate.mar}</td>
		                                <td class="fontsize">${cate.apr}</td>
		                                <td class="fontsize">${cate.may}</td>
		                                <td class="fontsize">${cate.jun}</td>
		                                <td class="fontsize">${cate.jul}</td>
		                                <td class="fontsize">${cate.aug}</td>
		                                <td class="fontsize">${cate.sep}</td>
		                                <td class="fontsize">${cate.oct}</td>
		                                <td class="fontsize">${cate.nov}</td>
		                                <td class="fontsize">${cate.dec}</td>
		                                <td class="fontsize">${cate.sumresult}</td>
	                            	</tr>
                                </c:forEach>
                               	<tr>
	                                <td class="fontsize"><strong>월 합계</strong></td>
	                                <td class="fontsize">${cmsum.jan}</td>
	                                <td class="fontsize">${cmsum.feb}</td>
	                                <td class="fontsize">${cmsum.mar}</td>
	                                <td class="fontsize">${cmsum.apr}</td>
	                                <td class="fontsize">${cmsum.may}</td>
	                                <td class="fontsize">${cmsum.jun}</td>
	                                <td class="fontsize">${cmsum.jul}</td>
	                                <td class="fontsize">${cmsum.aug}</td>
	                                <td class="fontsize">${cmsum.sep}</td>
	                                <td class="fontsize">${cmsum.oct}</td>
	                                <td class="fontsize">${cmsum.nov}</td>
	                                <td class="fontsize">${cmsum.dec}</td>
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