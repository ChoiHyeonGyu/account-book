<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="graph-user" class="bg-brown">
	<div class="container">
		<div class="row">
			<div class="page-header" align="center">
				<h1>나의 소비동향</h1>
			</div>
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">일 단위</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="flot-chart">
										<div class="flot-chart-content" id="flot-pie-chart1"></div>
									</div>
								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
						</div>
					</div>
					<div class="item">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">월 단위</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="flot-chart">
										<div class="flot-chart-content" id="flot-pie-chart2"></div>
									</div>
								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
						</div>
					</div>
					<div class="item">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">연 단위</div>
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
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
</section>