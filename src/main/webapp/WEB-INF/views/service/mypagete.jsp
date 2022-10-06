<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>


<!-- 여기서 부터 수정 -->

<!-- Start main slider -->
<section class="content">
	<div id="carousel-example-generic"
		class="carousel slide edufair-slide carousel-fade"
		data-ride="carousel">
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
								<li class="active">마이 페이지</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main slider -->

	<!--  메인 박스 -->
	<!-- Start edufair features -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<div class="online-course-category-1x  margin-bottom-large">
		<div class="container">
			<div class="row">
				<div class="padding-top-large" style="padding-top: 30px">
					<!-- <div class="online-category"> -->
					<div class="online-course-2x">

						<div class="col-md-3">
							<div class="single-featured-category">

								<div class="featured-category-img">
									<img
										src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon01.png"
										alt="" />
										<br/>
									<h4>
										<a
											href="${pageContext.request.contextPath}/my/mydeal?userId=${member.userId}">거래
											내역</a>
									</h4>
								</div>
							</div>
							</div>
							<div class="col-md-3">
								<div class="single-featured-category">

									<div class="featured-category-img">
										<img
											src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon02.png"
											alt="" />
											<br/>
										<h4>
											<a
												href="${pageContext.request.contextPath}/my/myreview?userId=${member.userId}">작성
												후기</a>
										</h4>
									</div>
								</div>
								</div>
								<div class="col-md-3">
								<div class="single-featured-category">
								
									<div class="featured-category-img">
										<img
											src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon03.png"
											alt="" />
											<br/>
										<h4>
											<a
												href="${pageContext.request.contextPath}/my/latestservice?userId=${member.userId}">최근
												본 서비스</a>
										</h4>
									</div>
								</div>
								</div>
								<div class="col-md-3">
								<div class="single-featured-category">
								
									<div class="featured-category-img">
										<img
											src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon04.png"
											alt="" />
											<br/>
										<h4>
											<a
												href="${pageContext.request.contextPath}/my/qnalist?userId=${member.userId}">1:1
												문의 내역</a>
										</h4>
									</div>
								</div>
								</div>
								<div class="col-md-3">
								<div class="single-featured-category">
								
									<div class="featured-category-img">
										<img
											src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon05.png"
											alt="" />
											<br/>
										<h4>
											<a
												href="${pageContext.request.contextPath}/my/likelist?userId=${member.userId}">찜
												목록</a>
										</h4>
									</div>
								</div>
							</div>

						</div>
					</div>
					</div>
					
					
				
					<div>
						<div>
							<!-- div 추가 -->
							<div class="padding-top-large" style="padding-top: 30px">
								<h2 class="edufair-main-title" style="text-align: left">회원
									정보</h2>
								<input type="hidden" name="userId" value="${member.userId}">
								<table class="type1">

									<tr>
										<th>회원ID</th>
										<td>${member.userId}</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${member.userEmail}</td>
									</tr>
									<tr>
										<th>닉네임</th>
										<td>${member.userName}</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td>${member.phone}</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>${member.gender}</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>${member.address}</td>
									</tr>
									<tr>
										<th>가입일자</th>
										<td>${member.regDate}</td>
									</tr>

									<tr>
										<th>SMS 수신여부</th>
										<td>${member.sms}</td>
									</tr>

									<tr>
										<th>회원등급</th>
										<td>${member.userRank}</td>
									</tr>
									<!-- 비밀번호 변경 버튼 추가 -->
									<!--  버튼 class="btn btn-transparent" style="color: #fff" 
						 ->class="edufair-component-button button-large" style="border:solid 1px #eaeaea;" 변경 -->
									<tr>
										<th>비밀번호 변경</th>
										<td><button class="edufair-component-button button-medium"
												style="border: solid 1px #eaeaea;" type="button"
												onclick="location.href='/main/changePwd?userId=${member.userId}'">비밀번호
												변경</button></td>
									</tr>
									<tr>
										<th>나의 적립금</th>
										<td>
											<%-- <button class="edufair-component-button button-large"
										style="border: solid 1px #eaeaea;" type="button"
										onclick="location.href='${pageContext.request.contextPath}/my/mypoint'">적립금
										확인</button> --%>
											<button type="button"
												class="edufair-component-button button-medium" id="myBtn">적립금</button>
										</td>
									</tr>
									<tr>
										<th>차단 확인</th>
										<td><button class="edufair-component-button button-medium"
												style="border: solid 1px #eaeaea;" type="button"
												onclick="location.href='/my/myblock?userId=${member.userId}'">차단한
												ID 확인</button></td>
									</tr>
									<tr>
										<th>신고 확인</th>
										<td><button class="edufair-component-button button-medium"
												style="border: solid 1px #eaeaea;" type="button"
												onclick="location.href='${pageContext.request.contextPath}/my/myreport?userId=${member.userId}'">신고한
												ID 확인</button></td>
									</tr>

								</table>
								<button class="edufair-component-button button-large"
									style="border: solid 1px #eaeaea;" type="button"
									onclick="location.href='${pageContext.request.contextPath}/main/modify?userId=${member.userId}'">회원
									정보 수정</button>
								<button class="edufair-component-button button-large"
									style="border: solid 1px #eaeaea;" type="button"
									onclick="location.href='${pageContext.request.contextPath}/main/deleteId?userId=${member.userId}'">회원
									탈퇴</button>
							</div>
						</div>
					</div>

				</div>
			</div>


			<!-- Modal-->

			<div class="modal fade" id="pointmodal" tabindex="-1" role="dialog">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">

						<div class="modal-body">
							<div class="edufair-subscription-1x">
								<div class="edufair-subscription-title-1x">
									<h3>My point</h3>
								</div>
								<div class="edufair-subscription-form-1x">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<c:if test="${empty point}">
										<p align="center">적립금이 없습니다.</p>
									</c:if>

									<c:if test="${point.getUserId().equals(member.getUserId())}">
										<table class="type1">
											<tr>
												<th>회원 ID</th>
												<td>${point.userId}</td>
											</tr>
											<tr>

												<th>적립금액</th>

												<td>${point.amount}</td>
											</tr>
											<tr>
												<th>유효기간</th>
												<td>${point.validDate}</td>
											</tr>

										</table>
									</c:if>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="edufair-component-button button-large"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<script>
				$(document).ready(function() {
					$("#myBtn").click(function() {
						$("#pointmodal").modal();
					});
				});
			</script>
</section>
<!-- /.content -->
<!--  메인 박스 끝 -->



<%@ include file="../include/footer.jspf"%>