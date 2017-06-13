<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 팝업영역 -->

<!-- 이야기 작성 -->
<div class="modal fade" id="boardform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">작성</h4>
			</div>
			<div class="modal-body">
				<form id="boardpost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/boardadd" enctype="multipart/form-data">
			   		<h3><span class="label label-primary">결산월</span></h3>
			   		<div class="dropdown theme-dropdown clearfix">
				   		<select class="dropdown-menu" name="month">
				   			<c:forEach begin="5" end="12" var="i">
				   				<c:choose>
			   						<c:when test="${i<10}"><option>2017.0${i}</option></c:when>
			   						<c:otherwise><option>2017.${i}</option></c:otherwise>
			   					</c:choose>
				   			</c:forEach>
							<c:forEach begin="1" end="12" var="i">
				   				<c:choose>
			   						<c:when test="${i<10}"><option>2018.0${i}</option></c:when>
			   						<c:otherwise><option>2018.${i}</option></c:otherwise>
			   					</c:choose>
				   			</c:forEach>
				   		</select>&emsp;
				   		<label class="checkbox-inline"><input id="defaultcheck" name="defaultcheck" type="checkbox" value="">체크하실 경우 기본 그래프와 표가 제공됩니다.</label>
			      	</div>
			      	<h3><span class="label label-primary">제목</span></h3>
			      	<input type="text" name="title" class="form-control" placeholder="Title" required>
			      	<h3><span class="label label-primary">내용</span></h3>
			      	<textarea rows="10" cols="64" name="content" class="form-control" placeholder="Content"></textarea>
			      	<h3><span class="label label-primary">이미지 첨부</span></h3><br/>
			      	<input type="file" name="file" multiple="multiple"><br/>
			      	<input type="submit" value="작성" class="addmarginleft">
      				<input type="reset" value="취소">
				</form>
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>

<!-- 상세 보기 -->
<div class="modal fade" id="contentform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">상세 보기</h4>
			</div>
			<div class="modal-body">
				<table class="table">
			      <thead>
			        <tr>
			          <th id="contentmonth"></th>
			          <th id="contenttitle"></th>
			          <th id="contentname"></th>
			        </tr>
			      </thead>
			    </table>
			    <div id="showgp" class="displaynone">
				    <div class="flot-chart">
	                	<div class="flot-chart-content2" id="flot-line-chart-mt2"></div>
	                </div><br/>
	                <div class="table-responsive">
		                <table class="table table-striped table-bordered table-hover">
		                    <thead>
		                        <tr>
		                            <th class="fontsize">카테고리 \ 일</th>
		                            <th id="dated1" class="fontsize"></th>
		                            <th id="dated2" class="fontsize"></th>
		                            <th id="dated3" class="fontsize"></th>
		                            <th id="dated4" class="fontsize"></th>
		                            <th id="dated5" class="fontsize"></th>
		                            <th id="dated6" class="fontsize"></th>
		                            <th id="dated7" class="fontsize"></th>
		                            <th id="dated8" class="fontsize"></th>
		                            <th id="dated9" class="fontsize"></th>
		                            <th id="dated10" class="fontsize"></th>
		                            <th id="dated11" class="fontsize"></th>
		                            <th class="fontsize">카테고리 합계</th>
		                        </tr>
		                    </thead>
		                    <tbody id="cateday1">
		                        <tr>
		                            <td class="fontsize"><strong>일 합계</strong></td>
		                            <td id="cmsumd1" class="fontsize"></td>
		                            <td id="cmsumd2" class="fontsize"></td>
		                            <td id="cmsumd3" class="fontsize"></td>
		                            <td id="cmsumd4" class="fontsize"></td>
		                            <td id="cmsumd5" class="fontsize"></td>
		                            <td id="cmsumd6" class="fontsize"></td>
		                            <td id="cmsumd7" class="fontsize"></td>
		                            <td id="cmsumd8" class="fontsize"></td>
		                            <td id="cmsumd9" class="fontsize"></td>
		                            <td id="cmsumd10" class="fontsize"></td>
		                            <td id="cmsumd11" class="fontsize"></td>
		                            <td class="fontsize"></td>
		                       	</tr>
		                    </tbody>
		                    <thead>
		                        <tr>
		                            <th class="fontsize">카테고리 \ 일</th>
		                            <th id="dated12" class="fontsize"></th>
		                            <th id="dated13" class="fontsize"></th>
		                            <th id="dated14" class="fontsize"></th>
		                            <th id="dated15" class="fontsize"></th>
		                        	<th id="dated16" class="fontsize"></th>
		                            <th id="dated17" class="fontsize"></th>
		                            <th id="dated18" class="fontsize"></th>
		                            <th id="dated19" class="fontsize"></th>
		                            <th id="dated20" class="fontsize"></th>
		                            <th id="dated21" class="fontsize"></th>
		                            <th id="dated22" class="fontsize"></th>
		                            <th class="fontsize">카테고리 합계</th>
		                        </tr>
		                    </thead>
		                    <tbody id="cateday2">
		                        <tr>
		                            <td class="fontsize"><strong>일 합계</strong></td>
		                            <td id="cmsumd12" class="fontsize"></td>
		                            <td id="cmsumd13" class="fontsize"></td>
		                            <td id="cmsumd14" class="fontsize"></td>
		                            <td id="cmsumd15" class="fontsize"></td>
		                            <td id="cmsumd16" class="fontsize"></td>
		                            <td id="cmsumd17" class="fontsize"></td>
		                            <td id="cmsumd18" class="fontsize"></td>
		                            <td id="cmsumd19" class="fontsize"></td>
		                            <td id="cmsumd20" class="fontsize"></td>
		                            <td id="cmsumd21" class="fontsize"></td>
		                            <td id="cmsumd22" class="fontsize"></td>
		                            <td class="fontsize"></td>
		                       	</tr>
		                    </tbody>
		                    <thead>
		                        <tr>
		                        	<th class="fontsize">카테고리 \ 일</th>
		                            <th id="dated23" class="fontsize"></th>
		                            <th id="dated24" class="fontsize"></th>                       
		                        	<th id="dated25" class="fontsize"></th>
		                            <th id="dated26" class="fontsize"></th>
		                            <th id="dated27" class="fontsize"></th>
		                            <th id="dated28" class="fontsize"></th>
		                            <th id="dated29" class="fontsize"></th>
		                            <th id="dated30" class="fontsize"></th>
		                            <th id="dated31" class="fontsize"></th>
		                            <th class="fontsize"></th>
		                            <th class="fontsize"></th>
		                            <th class="fontsize">카테고리 합계</th>
		                        </tr>
		                    </thead>
		                    <tbody id="cateday3">
	                          	<tr>
		                            <td class="fontsize"><strong>일 합계</strong></td>
		                            <td id="cmsumd23" class="fontsize"></td>
		                            <td id="cmsumd24" class="fontsize"></td>
		                            <td id="cmsumd25" class="fontsize"></td>
		                            <td id="cmsumd26" class="fontsize"></td>
		                            <td id="cmsumd27" class="fontsize"></td>
		                            <td id="cmsumd28" class="fontsize"></td>
		                            <td id="cmsumd29" class="fontsize"></td>
		                            <td id="cmsumd30" class="fontsize"></td>
		                            <td id="cmsumd31" class="fontsize"></td>
		                            <td class="fontsize"></td>
		                            <td class="fontsize"></td>
		                            <td id="cmsumd32" class="fontred fontsize"></td>
		                       	</tr>
		                    </tbody>
		                </table>
	             	</div>
			    </div>
		        <c:forEach var="i" begin="0" end="100">
			  	  <img alt="사진" src="" id="contentphoto${i}" class="col-lg-12">
			    </c:forEach>
			    <h5 id="contentcontent" style="white-space:pre-line"></h5>
			 	<table class="table">
			      <tbody>
			      	<tr>
			      		<td id="contentday"></td>
			      		<td id="contentgood"></td>
			      		<td id="contenthit"></td>
			      	</tr>
			      </tbody>
			    </table>
			</div>
			<div class="modal-footer">
				<button id="commentsviewer" type="button" class="btn btn-info btn-circle btn-xl"><i class="fa fa-comments"></i></button>
				<button id="good" type="button" class="btn btn-danger btn-circle btn-xl"><i class="fa fa-heart"></i></button>
				<button id="contentsedit" type="button" class="btn btn-warning btn-circle btn-xl"><i class="fa fa-pencil-square-o"></i></button>
				<button id="contentsdelete" type="button" class="btn btn-warning btn-circle btn-xl"><i class="fa fa-trash-o"></i></button>
			</div>
		</div>
	</div>
</div>

<!-- 댓글 -->
<div class="modal fade" id="commentform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">댓글</h4>
			</div>
			<div class="modal-body">
				<form action="${pageContext.request.contextPath}/${currentuserid}/comment" method="post">
					<input type="hidden" id="commentboardId" name="boardId" value="">
					<input type="hidden" id="commentName" name="name" value="">
					<textarea rows="5" cols="63" name="content" class="form-control" required></textarea><br/><br/>
					<input type="submit" value="댓글 쓰기">
				</form>
				<p class="line"></p>
				<c:forEach var="i" begin="0" end="1000">
					<pre id="commenteffect${i}" style="white-space:nowrap">
						<button id="commentdelete${i}" type="button" class="btn btn-lg btn-link" style="float:right">삭제</button>
						<button id="commentreply${i}" type="button" class="btn btn-lg btn-link" style="float:right">답글</button>
						<span id="commentname${i}"></span><span id="commentdate${i}"></span>
						<span id="commentcontent${i}" style="white-space:pre-line"></span>
					</pre>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!-- 답글 -->
<div class="modal fade" id="comment1form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">답글</h4>
			</div>
			<div class="modal-body">
				<form action="${pageContext.request.contextPath}/${currentuserid}/reply" method="post">
					<input type="hidden" id="commentId" name="commentId" value="">
					<input type="hidden" id="comment1Name" name="name" value="">
					<textarea rows="5" cols="63" name="content" required></textarea><br/><br/>
					<input type="submit" value="답글 쓰기">
				</form>
				<p class="line"></p>
				<c:forEach var="i" begin="0" end="1000">
					<pre id="comment1effect${i}" style="white-space:nowrap">
						<button id="comment1delete${i}" type="button" class="btn btn-lg btn-link" style="float:right">삭제</button>
						<span id="comment1name${i}"></span><span id="comment1date${i}"></span>
						<span id="comment1content${i}" style="white-space:pre-line"></span>
					</pre>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!-- 이야기 수정 -->
<div class="modal fade" id="contenteditform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog margintop2">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center">수정</h4>
			</div>
			<div class="modal-body">
				<form id="contenteditpost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/boardedit" enctype="multipart/form-data">
					<input type="hidden" id="editboardId" name="boardId" value="">
					<input type="hidden" id="editId" name="id" value="">
			   		<h3><span class="label label-primary">결산월</span></h3>
			   		<div class="dropdown theme-dropdown clearfix">
				   		<select class="dropdown-menu" id="editmonth" name="month">
				   			<option></option>
				   			<c:forEach begin="5" end="12" var="i">
				   				<c:choose>
			   						<c:when test="${i<10}"><option>2017.0${i}</option></c:when>
			   						<c:otherwise><option>2017.${i}</option></c:otherwise>
			   					</c:choose>
				   			</c:forEach>
							<c:forEach begin="1" end="12" var="i">
				   				<c:choose>
			   						<c:when test="${i<10}"><option>2018.0${i}</option></c:when>
			   						<c:otherwise><option>2018.${i}</option></c:otherwise>
			   					</c:choose>
				   			</c:forEach>
				   		</select>
			      	</div>
			      	<h3><span class="label label-primary">제목</span></h3>
			      	<input type="text" id="edittitle" name="title" class="form-control">
			      	<h3><span class="label label-primary">내용</span></h3>
			      	<textarea rows="10" cols="64" id="editcontent" name="content" class="form-control"></textarea>
			      	<h3><span class="label label-primary">이미지 첨부</span></h3><br/>
			      	<input type="file" name="file" multiple="multiple">
			   	</form>
			</div>
			<div class="modal-footer">
				<button id="contentschange" type="button" class="btn btn-warning btn-circle btn-xl"><i class="fa fa-pencil-square-o"></i></button>
			</div>
		</div>
	</div>
</div>

<!-- 이야기 삭제 -->
<div class="displaynone">
	<form id="contentremovepost" method="post" action="${pageContext.request.contextPath}/${currentuserid}/boardremove">
		<input type="hidden" id="removeboardId" name="boardId" value="">
		<input type="hidden" id="removeId" name="id" value="">
	</form>
</div>

<!-- /팝업영역 -->