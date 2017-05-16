<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/main_top.jsp"/>
    <div class="container">
    	<div class="row">
    		<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">어제 소비 동향</div>
					<div class="panel-body">
						<div class="flot-chart">
							<div class="flot-chart-content" id="flot-pie-chart1"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">올해 소비 동향</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="flot-chart">
							<div class="flot-chart-content" id="flot-pie-chart3"></div>
						</div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			
            <div class="panel panel-default">
                <div class="panel-heading">
                    Default - ${currentuserid}님과 같은 성별,나이의 평균 소비 동향
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="flot-chart">
                        <div class="flot-chart-content" id="flot-pie-chart4"></div>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <div class="dropdown theme-dropdown clearfix">
				<select id="graph-gender" class="dropdown-menu" style="margin-left:400px">
					<option>성별</option>
					<option>남자</option>
					<option>여자</option>
				</select>
				<select id="graph-age" class="dropdown-menu" style="margin-left:20px">
					<option>나이</option>
					<c:forEach begin="20" end="48" var="i">
						<option>${i}</option>
					</c:forEach>
				</select>
			</div>
    	</div>
    </div>
<c:import url="/WEB-INF/views/main_bottom.jsp"/>