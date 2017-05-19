<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 해더 //최상단 메뉴 -->
<c:import url="/WEB-INF/views/include/main_top.jsp"/>
<div class="container"> 
	<div class="row">
		
		<!-- 슬라이드 -->
		<div id="carousel-example-generic" class="carousel slide col-md-8 col-md-offset-0 crs-mt" data-ride="carousel">
	      <ol class="carousel-indicators">
	        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	      </ol>
	      <div class="carousel-inner" role="listbox">
	        <div class="item active">
	          <div class="col-lg-12">
	          	<div class="panel panel-default">
						<div class="panel-heading">흠냐 이건 뭐냐?</div>
						<div class="panel-body">
							<img src="${pageContext.request.contextPath}/image/gonang.jpg">
						</div>
					</div>
				</div>
	        </div>
	        <div class="item">
	          <div class="col-lg-12">
	          	<div class="panel panel-default">
						<div class="panel-heading">흠냐 이건 뭐냐?</div>
						<div class="panel-body">
							<img src="${pageContext.request.contextPath}/image/gonang.jpg">
						</div>
					</div>
				</div>
	        </div>
	        <div class="item">
	          <div class="col-lg-12">
	          	<div class="panel panel-default">
						<div class="panel-heading">흠냐 이건 뭐냐?</div>
						<div class="panel-body">
							<img src="${pageContext.request.contextPath}/image/gonang.jpg">
						</div>
					</div>
				</div>
	        </div>
	      </div>
	      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	        <span class="sr-only">Previous</span>
	      </a>
	      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	        <span class="sr-only">Next</span>
	      </a>
	    </div>
	    <!-- /슬라이드 -->
	    
	    <!-- 프로필 -->
		<div class="col-md-4">
        	<div class="login-panel panel panel-default">
            	<div class="panel-heading">
                	<h3 class="panel-title">프로필</h3>
                </div>
				<div class="panel-body">
					<div class="row">
					    <div class="col-lg-12 col-lg-offset-0 text-center">
					    	<h2 class="section-heading"><img class="img-thumbnail" alt="사진" src="${pageContext.request.contextPath}/image/gonang.jpg" width="170" height="170"></h2>
					        <p>${v1.name}</p>
					        <p>잔액:${v1.total}</p>
					    </div>
					</div>
				</div>
			</div>
		</div>
		<!-- /프로필 -->
	</div>
</div>

<!-- 푸터영역 -->
<c:import url="/WEB-INF/views/include/main_bottom.jsp"/>