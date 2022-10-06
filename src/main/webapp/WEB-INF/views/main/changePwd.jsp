<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
input[type=button] {
	width: 360px;
	height: 40px;
	background: #22b9ac;
	color: #fff;
	border: none;
	font-size: 14px;
	font-family: 'Pretendard';
}
</style>

<script type="text/javascript">
	$(document).ready(
			function a() {

				$("#changePwd").on(
						"click",
						function() {
							if ($("#currentPw").val() == null
									|| $("#currentPw").val() == "") {
								alert("현재 비밀번호를 입력해주세요");
								$("#currentPw").focus();
								return false;
							}

							if ($("#newPw").val() == null
									|| $("#newPw").val() == "") {
								alert("새 비밀번호를 입력해주세요");
								$("#newPw").focus();
								return false;
							}
							if ($("#confirmPassword").val() == null
									|| $("#confirmPassword").val() == "") {
								alert("비밀번호 확인을 입력해주세요");
								$("#confirmPassword").focus();
								return false;
							}
							if ($("#newPw").val() != $("#confirmPassword")
									.val()) {
								alert("변경비밀번호가 일치하지 않습니다.");
								$("#mconfirmPassword").focus();
								return false;
							}

							$.ajax({
								url : "pwCheck",
								type : "POST",
								dataType : "json",
								data : $("#changePwdFrom").serialize(),
								success : function(data) {

									if (data == 0) {
										alert("현재 비밀번호가 틀렸습니다.");

									} else {
										if (confirm("변경하시겠습니까?")) {
											$("#changePwdFrom").submit();
										}

									}
								}
							})

						});

			})
</script>



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
						<h2 class="fadeInLeft">비밀번호 변경</h2>
						<ol class="breadcrumb edufair-single-breadcrumbs">
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:if test="${ member == null }">
	<script>
		alert("로그인 후 이용해 주세요.");
		location.href = "/main/login";
	</script>
</c:if>

<div class="edufair-subscription-1x" >

	<div class="edufair-subscription-form-1x">
		<form action="/main/changePwd" method="post" id="changePwdFrom"
			name="changePwdFrom">
			<div class="col-md-12">
				<div class="row mypage-row">
					<div class="form-group">
						<label for="currentPw">현재 비밀번호</label>
						<br> <input id="currentPw" class="login-input mx-auto = (margin-x : auto)"
							type="password" name="currentPw" placeholder="현재 비밀번호를 입력해주세요."
							required>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row mypage-row">
					<div class="form-group">
						<label for="newPw">새 비밀번호</label> <br>
						<input id="newPw" class="login-input mx-auto = (margin-x : auto)"
							type="password" name="newPw"
							title="Enter New Password" placeholder="새 비밀번호를 입력해주세요." required>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="row mypage-row">
					<div class="form-group">
						<label for="confirmPassword">새 비밀번호 확인</label> <br> <input type="password"
							class="login-input mx-auto = (margin-x : auto)" name="confirmPassword"
							id="confirmPassword" placeholder="비밀번호를 재입력해주세요. " required>
					</div>
				</div>
			</div>
			
			<div class="col-md-12">
				<div class="row mypage-row">
					<input type="hidden" id="userId" name="userId" value="${member.userId}"> <input type="button"
					onclick="a();" id="changePwd" name="changePwd" value="변경">
				</div>
			</div>
		</form>
	</div>
</div>


<%@ include file="../include/footer.jspf"%>