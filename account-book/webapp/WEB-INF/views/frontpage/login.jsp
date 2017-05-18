<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/frontpage/login_top.jsp"/>
<div class="container"> 
	<div class="row">
		<div id="carousel-example-generic" class="carousel slide col-md-8 col-md-offset-0 mt" data-ride="carousel">
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
                	<h3 class="panel-title">로그인 / 회원가입</h3>
                </div>
				<div class="panel-body">
					<form method="post" action="${pageContext.request.contextPath}/connmain">
				    	<fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="E-mail / Phone" name="id" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password" type="password" required>
                            </div>
                            <button type="submit" class="btn btn-lg btn-success btn-block">로그인</button><br/>
							<c:if test="${result != error}">
								<p style="font-weight:bold; text-align:center; padding:5px 0 5px 0; color:red">회원가입에 실패하셨습니다. 정보를 제대로 다시 입력해주세요.</p>
							</c:if>
							<c:if test="${res != ult}">
								<p style="font-weight:bold; text-align:center; padding:5px 0 5px 0; color:red">로그인에 실패하셨습니다. 정보를 제대로 다시 입력해주세요.</p>
							</c:if>
                            <fb:login-button class="fackbook-login-button" scope="public_profile,email,user_birthday" size="xlarge" onlogin="checkLoginState()">
                            	FACEBOOK 으로 로그인
                            </fb:login-button><br/><br/>
                            <button id="join" type="button" class="btn btn-lg btn-info btn-block">회원가입</button>
                        </fieldset>
				    </form>
				</div>
			</div>
		</div>
	</div>
</div>
<form method="post" action="${pageContext.request.contextPath}/main" id="fbpost">
	<input type="hidden" id="fbhidden" name="id" value="">
</form>
<c:import url="/WEB-INF/views/mypage/main_bottom.jsp"/>