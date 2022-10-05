<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jspf"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!--   <script type="text/javascript">
	function mIdChk() {
		$.ajax({
			url : "/main/idChk",
			type : "post",
			data : {
				"userId" : $("#userId").val()
			},
			success : function(data) {
				if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("아이디가 존재하지 않습니다.");
					document.location.href="";
				} else {
					 alert("임시 비밀번호가 발송되었습니다.");
			         document.location.href="/";
				}
			}
		})
	}
</script> -->



			<div id="carousel-example-generic" class="carousel slide edufair-slide carousel-fade" data-ride="carousel"> 
				<!-- Wrapper for slides -->		   
				<div class="carousel-inner edufair-inner single-inner" role="listbox">									
						<div class="edufair-overlay">
							<img src="<%=request.getContextPath()%>/resources/pages/images/mybackground.png" alt="slide 1" class="edufair-slider-image edufair-single-image">

							<div class="carousel-caption edufair-caption edufair-single-caption">
								<div class="edufair-slider-middle">
									<div class="container edufair-slider-text">
										<h2 class="fadeInLeft">비밀번호 찾기</h2>	
										<ol class="breadcrumb edufair-single-breadcrumbs">								 
										</ol>										
									</div>
								</div>
							</div>				  
						</div>
				</div>
			</div>
			
			 <div class="edufair-subscription-1x">
							
				<div class="edufair-subscription-form-1x">	

			<form action="/main/searchingPwd" method="post" >

						<div class="col-md-12">
							<div class="form-group">
								<label for="userId" >아이디</label> 
								<input id="userId" class="form-control" type="text"
											name="userId"  placeholder="아이디를 입력해주세요."  required>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="userEmail" >이메일</label> 
										<input  id="userEmail" class="form-control" type="email" 
										name="userEmail" title="Enter email" placeholder="회원가입시 입력한 이메일을 입력해주세요."  required>
									</div>
								</div>

								<button type="submit"  id="idChk" value="N"
								class="edufair-btn-larg btn-primary"> 전송 </button>
								
								<!--   onclick="mIdChk();" -->
							</form>
			
			</div>
			</div>
			
			
<%@ include file="../include/footer.jspf" %>			