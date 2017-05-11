<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>편리가계부</title>
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="${pageContext.request.contextPath}/assets/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/creative.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assets/jquery/jquery-3.2.1.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jquery/jquery-ui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/div.css">
	<script src="${pageContext.request.contextPath}/assets/js/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/assets/flot/excanvas.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/assets/flot/jquery.flot.pie.js"></script>
    <script src="${pageContext.request.contextPath}/assets/flot/jquery.flot.resize.js"></script>
    <script src="${pageContext.request.contextPath}/assets/flot/jquery.flot.time.js"></script>
    <script src="${pageContext.request.contextPath}/assets/flot-tooltip/jquery.flot.tooltip.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/flot-data.js"></script>
	<script src="http://maps.google.com/maps/api/js?key=AIzaSyD4b_BFpjBL1PYY6pKL7vGrLWyB7n_qBa0"></script>
	<script src="${pageContext.request.contextPath}/assets/js/board.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/list.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/option.js"></script>
</head>
<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
            	<img class="hipo-logo" alt="로고" src="${pageContext.request.contextPath}/assets/images/hipo-logo.png">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Comportable Account-Book ${id}</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#profile">Profile</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#list">List</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#graph-user">Graph-User</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#graph-average">Graph-Average</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#option">Option</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/logout">logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1 id="homeHeading">안녕하세요. 편리가계부입니다.</h1>
                <hr>
                <p>저희 서비스는 가계부는 써야 되는데 일일히 다 쓰기는 바쁜 직장인들을 위해 문자로 오는 결제내역을 자동적으로 가계부에 써질 수 있게 되어 있습니다. 
                	또한 그래프를 통해 자신과 전체 회원의 통계를 보면서 좀 더 효율적으로 돈을 관리할 수 있습니다. 마지막으로 자신의 씀씀이 이야기를 통해 다른 사용자와 돈 관리에 대한 정보를 공유할 수 있습니다. 
               		 저희 서비스를 이용해주신 고객 여러분께 감사드립니다. 이제 버튼을 누르고 시작해보세요.</p>
                <a href="#profile" class="btn btn-primary btn-xl page-scroll">사용해보자</a>
            </div>
        </div>
    </header>

    <c:import url="/WEB-INF/views/profile.jsp"/>
    
    <c:import url="/WEB-INF/views/list.jsp"/>

    <c:import url="/WEB-INF/views/graph_user.jsp"/>
    
    <c:import url="/WEB-INF/views/graph_avg.jsp"/>
    
    <c:import url="/WEB-INF/views/option.jsp"/>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/scrollreveal/scrollreveal.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/js/creative.min.js"></script>
    
    <script>
    	currentid = "${currentuserid}";
    	path = "${pageContext.request.contextPath}";
    </script>
</body>
</html>