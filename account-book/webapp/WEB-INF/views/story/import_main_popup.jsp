<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 팝업영역 -->

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
				<p class="line"></p>
				<c:forEach var="i" begin="0" end="1000">
					<pre id="commenteffect${i}" style="white-space:nowrap">
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
				<p class="line"></p>
				<c:forEach var="i" begin="0" end="1000">
					<pre id="comment1effect${i}" style="white-space:nowrap">
						<span id="comment1name${i}"></span><span id="comment1date${i}"></span>
						<span id="comment1content${i}" style="white-space:pre-line"></span>
					</pre>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!-- /팝업영역 -->