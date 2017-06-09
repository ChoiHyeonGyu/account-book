<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 해더 //최상단 메뉴 -->
<c:choose>
	<c:when test="${currentuserid == ''}">
		<c:import url="/WEB-INF/views/include/login_top.jsp" />
	</c:when>
	<c:otherwise>
		<c:import url="/WEB-INF/views/include/main_top.jsp" />
	</c:otherwise>
</c:choose>
<c:import url="/WEB-INF/views/include/flot.jsp" />

<!-- 각페이지에서 사용하는 css, js 링크영역 -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/morrisjs/morris.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/report/graph.css">
<script	src="${pageContext.request.contextPath}/assets/raphael/raphael.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/morrisjs/morris.min.js"></script>
<c:choose>
	<c:when test="${currentuserid == ''}">
		<script src="${pageContext.request.contextPath}/assets/js/report/view-flot.js"></script>
	</c:when>
	<c:otherwise>
		<script src="${pageContext.request.contextPath}/assets/js/report/flot-data-graph.js"></script>
	</c:otherwise>
</c:choose>

    <div class="container">
    	<div class="row mt">
    	
    			<!-- 상단 선택 메뉴 -->
    			<div class="col-lg-12">
	    			<div class="dropdown theme-dropdown clearfix">
						<select id="graph-import" class="dropdown-menu marginleft">
							<option>월 수입(전체)</option>
							<option>100만원 이하</option>
							<c:forEach begin="100" end="950" step="50" var="i">
								<option>${i}만원 ~ ${i+50}만원 사이</option>
							</c:forEach>
							<c:forEach begin="1000" end="9000" step="500" var="i">
								<option>${i}만원 ~ ${i+500}만원 사이</option>
							</c:forEach>
							<option>9500만원 ~ 1억원 사이</option>
							<option>1억원 이상</option>
						</select>
						<select id="graph-gender" class="dropdown-menu marginleft20">
							<option>성별(전체)</option>
							<option>남자</option>
							<option>여자</option>
						</select>
						<select id="graph-age" class="dropdown-menu marginleft20">
							<option>나이(전체)</option>
							<c:forEach begin="20" end="48" var="i">
								<option>${i}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">지난 달 소비 트렌드</div>
						<div class="panel-body">
							<div class="flot-chart">
								<div class="flot-chart-content" id="flot-pie-chart1"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">이번 달 소비 트렌드</div>
						<div class="panel-body">
							<div class="flot-chart">
								<div class="flot-chart-content" id="flot-pie-chart2"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-12">
		            <div class="panel panel-default">
		                <div class="panel-heading">최근 1년간 소비 트렌드(평균)</div>
		                <div class="panel-body">
		                    <div class="flot-chart">
		                        <div class="flot-chart-content" id="flot-line-chart-yt"></div>
		                    </div>
		                </div>
		            </div>
	            </div>
	            
	            <div class="col-lg-12">
	            	<div class="panel panel-default">
		                <div class="panel-heading">
		                	지난 달 회원들의 평균 금액 한도와 평균적인 사용 금액(<font class="fontgreen">초록 : 안정</font>, 노랑 : 경고, <font class="fontred">빨강 : 위험</font>, 
		                	<font class="fontpurple">보라 : 금액이 한도와 같거나 넘음</font>)
		                </div>
		                <div class="panel-body">
		                    <div id="morris-bar-chart-all" class="hei2"></div>
		                </div>
		            </div>
	            </div>
	    	</div>
    	</div>
<c:import url="/WEB-INF/views/include/main_bottom.jsp"/>