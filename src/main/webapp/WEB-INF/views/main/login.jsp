<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
button[type=submit] {
	width: 360px;
	height: 40px;
	background: #22b9ac;
	color: #fff;
	border: none;
	font-size: 14px;
	font-family: 'Pretendard';
}

</style>

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
						<h2 class="fadeInLeft">로그인</h2>
						<ol class="breadcrumb edufair-single-breadcrumbs">
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="edufair-subscription-form-1x" style="width:100%; height:360px;">
	<form action="/main/login" method="POST">
		<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group">
					<label for="userId">아이디</label> <br> 
					<input type="text" class="login-input mx-auto = (margin-x : auto)" name="userId" id="userId" placeholder="아이디" required>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group">
					<label for="userPw">비밀번호</label> <br> 
					<input type="password" class="login-input mx-auto = (margin-x : auto)" name="userPw"  id = "userPw" placeholder="비밀번호" required>
				</div>
			</div>
			<div class="row mypage-row">
				<button type="submit" id="create" class="login-input">로그인</button>
			</div>
			<div class="row mypage-row">	
				<c:if test="${msg == false}">
					<p style="color:#ED0000; text-align: center;"> 아이디나 비밀번호가 일치하지 않습니다. </p>
				</c:if>
			</div>
		</div>
	</form>
	<br>
	<div class="col-md-12 terms-condition" >
		<div class="row mypage-row">
		<p>
			<a href="/main/register" class=""> 회원가입 </a> | 
			<a href="/main/findpw" class=""> 비밀번호 찾기 </a>
		</p>
		</div>
	</div>
</div>


<%@ include file="../include/footer.jspf"%>
