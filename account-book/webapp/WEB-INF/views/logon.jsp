<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/main_top.jsp"/>
<div class="container"> 
	<div class="row">
		<div id="carousel-example-generic" class="carousel slide col-md-8 col-md-offset-0" data-ride="carousel">
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
		<div class="col-md-4">
        	<div class="login-panel panel panel-default">
            	<div class="panel-heading">
                	<h3 class="panel-title">프로필</h3>
                </div>
				<div class="panel-body">
					<div class="row bg-primary">
					    <div class="col-lg-8 col-lg-offset-2 text-center">
					        <h2 class="section-heading"><img class="img-thumbnail" alt="사진" src="${pageContext.request.contextPath}/image/gonang.jpg" width="310" height="310"></h2>
					        <hr class="light">
					        <p class="text-name">${v1.name}</p>
					        <p class="text-comments">잔액:${v1.total}<br/>나이:${v1.age}</p>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/main_bottom.jsp"/>