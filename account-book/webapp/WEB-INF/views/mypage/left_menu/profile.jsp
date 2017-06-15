<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/left_menu/profile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/list/list.css">
<script src="${pageContext.request.contextPath}/assets/js/left_menu/profile.js"></script>
<!-- 프로필 -->
<div class="row">
	<h2 class="section-heading">
		<img class="img-thumbnail" alt="사진"
			src="${pageContext.request.contextPath}/image/${defaultinfo.profileall.photo}" width="200" height="200">
	</h2>
	<div class="col-lg-12 col-lg-offset-0 text-center">
		<p class="fontlist">${defaultinfo.username.name}</p>
		<p><font>잔액 :</font> <font color="green">${defaultinfo.profile1.total}</font>원</p>  

			<span id="tt" class="fa fa-user fa-2x sr-contact pa pointer"></span>&emsp;
			<a href="${pageContext.request.contextPath}/${currentuserid}/mystory" class="fa fa-align-justify fa-2x sr-contact pa pointer"></a>&emsp;		
			<a href="${pageContext.request.contextPath}/${currentuserid}/mygraph" class="fa fa-bar-chart-o fa-2x sr-contact pa"></a>&emsp;			
			<a href="${pageContext.request.contextPath}/${currentuserid}/option" class="fa fa-cog fa-2x sr-contact pa pointer"></a>

	</div>
</div>
<br />

<!-- 통계 -->
<form action="${pageContext.request.contextPath }/${currentuserid}/profilegraph" method="post">
<div class="panel panel-default row">
	<div class="panel-heading">투자 그래프(목표치 금액)</div>
	<div class="panel-body">
	
		<div class="flot-chart2">
				 <span> </span>&emsp;<span>${defaultinfo.profilegraph.photo}원</span>
		 <div class="progress">
        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:${defaultinfo.profilegraph.total}%"><span>${defaultinfo.profilegraph.total}%</span></div>
      </div>
     <%--  <span>1개월 전</span>
      <div class="progress">
        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${defaultinfo.profilegraph2.total}%"><span>${defaultinfo.profilegraph2.total}%</span></div>
      </div>
      <span>2개월 전</span>
      <div class="progress">
        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: ${defaultinfo.profilegraph3.total}%"><span>${defaultinfo.profilegraph3.total}%</span></div>
      </div>
      <span>3개월 전</span>
      <div class="progress">
        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${defaultinfo.profilegraph4.total}%"><span>${defaultinfo.profilegraph4.total}%</span></div>
      </div>
      <span>4개월 전</span>
      <div class="progress">
        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: ${defaultinfo.profilegraph5.total}%"><span>${defaultinfo.profilegraph5.total}%</span></div>
      </div>
       <span>5개월 전</span>
      <div class="progress">
        <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${defaultinfo.profilegraph6.total}%"><span>${defaultinfo.profilegraph6.total}%</span></div>
      </div>
     <span>${defaultinfo.profilegraph7.name}원 /</span>&emsp;<span>${defaultinfo.profilegraph7.photo}원</span>
      <div class="progress">
        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${defaultinfo.profilegraph7.total}%"><span>${defaultinfo.profilegraph7.total}%</span></div>
      </div> --%>
			<div class="flot-chart-content" id="flot-pie-chart2"></div>
		</div>
	</div>
</div>
</form>

<!-- 팝업영역 -->

<!-- 프로필 수정 팝업 -->
<div class="modal fade" id="editprofile" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form action="${pageContext.request.contextPath}/${currentuserid}/userinfo"
					method="post" enctype="multipart/form-data"> 
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">프로필 수정</h4>
			</div>
			<div class="modal-body">
			
					<input type="hidden" name="id" value="${currentuserid}" />
					<table class="admin-config">

						<tr>
							<td class="font2">이름  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><input id="nameModify" class="window1" type="text" size="40" name="name" value="" required></td> 
						</tr>
						<tr>
						<td class="font2">비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><input id="passwordModify" class="window1" type="password" size="" name="password" value="" ></td>
						
						</tr>
						<tr>

							<td class="font2">사진</td>
							<td>
								<img id="photoModify" src="${pageContext.request.contextPath}/image/${defaultinfo.profileall.photo}" width="200" height="150" STYLE="MARGIN-TOP:10PX;">
							</td>

						</tr>
						<tr>
							<td class="t">&nbsp;</td> 
							<td ><label for="hahaha" class="replace " >파일 업로드</label> 
							<input type="file" name="photo" value="" id="hahaha" class="upload WINDOW2 hidden" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td></td>
						</tr>
					</table>
			</div>
			
			<div class="modal-footer">
					<!-- <button data-dismiss="modal" type="button" class="close">취소</button> -->
					<button class="notice1" type="submit" >변경</button>
					
				</div>
			
		</div>
	</div>
	</form>
</div>