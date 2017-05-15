<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="bg-primary" id="profile">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading"><img src="${pageContext.request.contextPath}/assets/images/gonang.jpg"/></h2>
                <hr class="light">
                
                <p class="text-name" >${v1.name}</p>
                <p class="text-comments">잔액 :${v1.total}&nbsp; &nbsp; &nbsp; &nbsp;나이:${v1.age}</p>
                <a href="" class="page-scroll btn btn-default btn-xl sr-button" id="tt">Get Started!</a>
            </div>
        </div>
        
        <div id="editprofile" title="수정하기" style="display: none">
				<form id="editprofile1"
					action="${pageContext.request.contextPath }/${currentuserid}/editprofile"
					method="post">

					<input type='hidden' name="id" value="${currentuserid}" />
					<!-- 히든으로 1가지 이상의 값을 보낼수있다. -->
					<input type='hidden' id="" name="listId" value="" />

					<h3>
						<span class="label label-default">결제 수단</span>
					</h3>
					<input id="" type="text" class="form-control" name="paid"
						placeholder="card / cash" value="" required/><br/>

					<h3>
						<span class="label label-default">은행</span>
					</h3>
					<input id="" type="text" name="bank" class="form-control"
						placeholder="bank" value="" required/><br/>

					<h3>
						<span class="label label-default">+/-</span>
					</h3>
					<input id="" type="text" name="operations"
						class="form-control" placeholder="저금/지출" value="" required/><br/>

					<h3>
						<span class="label label-default">금액</span>
					</h3>
					<input id="" type="text" name="money" class="form-control"
						placeholder="money" value="" required/><br/>

					<h3>
						<span class="label label-default">상호명</span>
					</h3>
					<input id="" type="text" name="name" class="form-control"
						placeholder="name" value="" required/><br/>

					<h3>
						<span class="label label-default">카테고리</span>
					</h3>
					<input id="" type="text" name="category"
						class="form-control" placeholder="category" value="" required/><br/>
				 <h3><span class="label label-primary">이미지 첨부</span></h3><br/>
      				<input type="file" name="file">
				</form>
			</div>
       
    	
    </div>
</section>