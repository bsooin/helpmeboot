<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<!-- Start main slider -->
<div id="carousel-example-generic"
	class="carousel slide edufair-slide carousel-fade" data-ride="carousel">
	<!-- Wrapper for slides -->
	<div class="carousel-inner edufair-inner single-inner" role="listbox">
		<div class="edufair-overlay">
			<img
				src="<%=request.getContextPath()%>/resources/pages/images/mybackground.png"
				alt="slide 1" class="edufair-slider-image edufair-single-image">
			<div class="carousel-caption edufair-caption edufair-single-caption">
				<div class="edufair-slider-middle">
					<div class="container edufair-slider-text">
						<h2 class="fadeInLeft">My page</h2>
						<ol class="breadcrumb edufair-single-breadcrumbs">
							<li><a href="#">Home</a></li>
							<li><a href="#">My page</a></li>
							<li class="active">회원 탈퇴</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main slider -->
</div>
<!-- 메인박스 -->


<!-- Main content -->
<section class="content">
	<div class="online-course-category-1x  margin-bottom-large">
		<div class="container">
			<div class="row">
				<!-- Default box -->
				<div class="padding-top-large" style="padding-top: 30px">
					<div class="online-course-2x">
						<h3 class="box-title">회원 탈퇴</h3>
					</div>
					<div class="box-body">

						<!-- 삭제 메세지 -->
						<form action="/main/deleteId" method="post">
							<input type="hidden" name="userId" value="${member.getUserId()}">
							<%-- 		<p> 
							회원ID: ${delReq.userId}
							</p>
							 --%>
							<%-- <input type="hidden" name="messageId" value="${param.messageId}">
					메시지를 삭제하시려면 암호를 입력하세요:<br> 암호: <input type="password"
						name="password"> <br>  --%>
							<br />정말 탈퇴하시겠습니까? <br />
							<button type="button"
								class="edufair-component-button button-medium" type="submit">탈퇴하기</button>
							<button class="edufair-component-button button-medium"
								type="button" onclick="goBack()">뒤로가기</button>

							<script>
								function goBack() {
									window.history.go(-1);
								}
							</script>
						</form>
						<!-- 삭제 끝-->

					</div>
					<!-- /.box-body -->

				</div>
				<!-- /.box -->
			</div>
		</div>
	</div>

</section>
<!-- /.content -->





<!-- 메인박스 끝 -->

<%@ include file="../include/footer.jspf"%>