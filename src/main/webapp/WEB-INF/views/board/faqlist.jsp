<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags" %>
<%@ include file="../include/header.jspf"%>

<style>
	.row-Comm{margin:0px auto;}
	.pagination{margin:0px;}
	.table-Comm {margin:20px auto; text-align:center; border:1px solid #ddd;}
	.colRow-Comm th{background:#eee; text-align:center; font-family:'Pretendard'; color:#fff; background:#1EA69A;}
	.dataRow-Comm td{font-family:'Pretendard'; color:#262626;}
	.dataRow-Comm:hover{background:#ddd; cursor:pointer;}
	.colNum-Comm{width:80px;}
	.colRow-Comm th.colTitle-Comm{min-width:300px; text-align:left;}
	.colUser-Comm{max-width:200px; width:120px;}
	.colDate-Comm{max-width:200px; width:120px;}
	.dataNum-Comm{width:80px;}
	.dataTitle-Comm{min-width:300px; text-align:left;}
	.dataUser-Comm{max-width:200px; width:120px;}
	.dataDate-Comm{max-width:200px; width:120px;}
</style>
<script type="text/javascript">
	$(function(){
		$(".dataRow-Comm").click(function(){
			var no = $(this).find(".commBoardId").text();
			location = "view?cBoardId=" + no;
		});
	});
</script>

<!-- Start main slider -->
<div id="carousel-example-generic" class="carousel slide edufair-slide carousel-fade margin-bottom-large" data-ride="carousel">
	<!-- Wrapper for slides -->
	<div class="carousel-inner edufair-inner single-inner" role="listbox">
		<div class="edufair-overlay">
			<img
					src="<%=request.getContextPath()%>/resources/pages/images/mybackground.png"
					alt="slide 1" class="edufair-slider-image edufair-single-image">
			<div class="carousel-caption edufair-caption edufair-single-caption">
				<div class="edufair-slider-middle">
					<div class="container edufair-slider-text">
						<h2 class="fadeInLeft">자주 묻는 질문</h2>
						<ol class="breadcrumb edufair-single-breadcrumbs">
							<li><a href="#">Home</a></li>
							<li><a href="#">Board</a></li>
							<li class="active">FAQ</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End main slider -->

<!-- 메인박스 -->
<div class="online-course-category-1x margin-bottom-large">
	<div class="container container-Comm">
		<div class="row row-Comm">
			<div class="col-md-12 mypage-row">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				  <div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
					  <h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="">
						  [Help Me!] 헬퍼 등록은 어떻게 할 수 있나요?
						</a>
					  </h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne" aria-expanded="true" style="">
					  <div class="panel-body">
						Help Me! 에서는 누구나 헬퍼가 될 수 있으며 별도의 가입 절차를 요구하지 않습니다.
					  </div>
					</div>
				  </div>
				  <div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
					  <h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						  [Help Me!] 결제는 어떻게 이뤄지나요?
						</a>
					  </h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" aria-expanded="false" style="height: 0px;">
					  <div class="panel-body">
						Help Me! 결제는 안전한 거래를 위해 홈페이지 내 거래 시스템을 이용하여 이뤄집니다.
					  </div>
					</div>
				  </div>
				  <div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
					  <h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						  [Help Me!] 서비스 수정은 어떻게 하나요?
						</a>
					  </h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree" aria-expanded="false" style="height: 0px;">
					  <div class="panel-body">
						Help Me! 서비스 수정은 로그인 후 마이페이지 - 서비스 수정 카테고리에서 진행하실 수 있습니다.
					  </div>
					</div>
				  </div>
				  <div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingFour">
					  <h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
						  [Help Me!] 서비스 삭제는 어떻게 하나요?
						</a>
					  </h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour" aria-expanded="false" style="height: 0px;">
					  <div class="panel-body">
						Help Me! 서비스 삭제는 로그인 후 마이페이지 - 서비스 삭제 카테고리에서 진행하실 수 있습니다.
					  </div>
					</div>
				  </div>
				  <div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingFive">
					  <h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
						  [Help Me!] 헬퍼와 연락이 닿질 않아요. 어떻게 하죠?
						</a>
					  </h4>
					</div>
					<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive" aria-expanded="false" style="height: 0px;">
					  <div class="panel-body">
						헬퍼와 연락이 되지 않을 경우 Help Me! 고객센터로 연락 주시면 빠르게 처리 도와드리겠습니다.
					  </div>
					</div>
				  </div>
				  <div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingSix">
					  <h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
						  [Help Me!] 서비스에 대한 평가가 헬퍼에게 영향을 미치나요?
						</a>
					  </h4>
					</div>
					<div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix" aria-expanded="false" style="height: 0px;">
					  <div class="panel-body">
						Help Me! 는 개인의 거래로 이뤄지는만큼 서비스 리뷰가 매우 중요한 지표가 됩니다.<br/>
						솔직하고 정확한 리뷰를 통해 다른 회원들이 양질의 서비스를 판매하고 구매할 수 있도록 도와주세요.
					  </div>
					</div>
				  </div>
				  <div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingSeven">
					  <h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
						  [Help Me!] 회원 탈퇴는 어떻게 하나요?
						</a>
					  </h4>
					</div>
					<div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven" aria-expanded="false" style="height: 0px;">
					  <div class="panel-body">
						Help Me! 회원 탈퇴는 마이페이지 - 회원 탈퇴 에서 진행하실 수 있습니다.
					  </div>
					</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 메인박스 끝 -->


<%@ include file="../include/footer.jspf"%>