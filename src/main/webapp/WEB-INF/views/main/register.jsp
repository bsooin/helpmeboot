<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../include/header.jspf"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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

button[type=button].btnCheck {
	width: 85px;
	height: 40px;
	background: #22b9ac;
	color: #fff;
	border: none;
	font-size: 14px;
	font-family: 'Pretendard';
}
</style>

<script type="text/javascript">
function id_check(){
    var json = {"userId" : $("#userId").val()}

    $.ajax({
        url:"idCheck",
        type:"post",
        dataType : "json",
        data : $("#userId").serialize(),
        cache:false,
        async:true,
        success:function (data){
            if(data == 1){
            	$("#idCheck").attr("value", "N");
                alert("중복된 아이디입니다.");
            }else if(data == 0){
            	$("#idCheck").attr("value", "Y");
                alert("사용가능한 아이디입니다.");
            }
        }
    })
}
 
	function rg_Submit() {
		
		var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if ($("#userId").val() == null || $("userId").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
	   if ($("#idCheck").val() != 'Y') {
			alert("아이디 중복 확인해주세요.");
			$("#idCheck").focus();
			return false;
		}   
		if ($("#userPw").val() == null || $("#userPw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#userPw").focus();
			return false;
		}
		if ($("#confirmPassword").val() == null
				|| $("#confirmPassword").val() == "") {
			alert("비밀번호를 재 입력해주세요.");
			$("#confirmPassword").focus();
			return false;
		}
		if ($("#userPw").val() != $("#confirmPassword").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#mconfirmPassword").focus();
			return false;
		}
		if ($("#userName").val() == null || $("#userName").val() == "") {
			alert("닉네임을 입력해주세요.");
			$("#userName").focus();
			return false;
		}
		if ($("#userEmail").val() == null || $("#userEmail").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#userEmail").focus();
			return false;
		}
		if(!email_rule.test($("#userEmail").val())){
			alert("이메일을 형식에 맞게 입력해주세요. ex) example@helpme.com");
			$("#userEmail").focus();
			return false;
			}
		if ($("#phone").val() == null || $("#phone").val() == "") {
			alert("핸드폰번호를 입력해주세요.");
			$("#phone").focus();
			return false;
		}
		if ($("#address").val() == null || $("#address").val() == "") {
			alert("주소를 입력해주세요.");
			$("#address").focus();
			return false;
		}
		if (confirm("회원가입하시겠습니까?")) {
			$("#create").submit();
			alret("회원가입에 성공하셨습니다.");
			return false;
		}
	}
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
						<h2 class="fadeInLeft">회원가입</h2>
						<ol class="breadcrumb edufair-single-breadcrumbs">
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 회원가입 -->

<div class="edufair-subscription-1x">

	<div class="edufair-subscription-form-1x">
		<form action="/main/register" method="POST" id="create" >

			<div class="col-md-12">
				<div class="row mypage-row">
					<div class="form-group">
						<label for="userId"> 아이디</label> 
						<br>
						 <input type="text" id="userId" style="width:265px;"
							class="login-input mx-auto = (margin-x : auto)" name="userId"
							placeholder="아이디를 입력해주세요." required>	&nbsp
						<button type="button" id="idCheck" 	onclick="id_check()" 
							value="N" class="btnCheck"  >중복확인</button> 
					</div>
				</div>
			</div>

			<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group">
					<label for="userPw">비밀번호</label> 
					<br>
					<input type="password"
						class="login-input mx-auto = (margin-x : auto)" id="userPw" name="userPw"
						placeholder="비밀번호를 입력해주세요." required>
				</div>
			</div>
			</div>

			<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group">
					<label for="confirmPassword">비밀번호 확인</label>
					<br>
					 <input type="password"
						class="login-input mx-auto = (margin-x : auto)" name="confirmPassword" id="confirmPassword"
						placeholder="비밀번호를 재 입력해주세요. " required>
				</div>
			</div>
			</div>

			<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group">
					<label for="userName">닉네임</label> <br> 
					<input type="text" id="userName"
						class="login-input mx-auto = (margin-x : auto)" name="userName" placeholder="닉네임을 입력해주세요."
						required>
				</div>
			</div>
			</div>

			<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group">
					<label for="userEmail">이메일</label> <br> <input type="email"
					pattern="^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$"
						id="userEmail" class="login-input mx-auto = (margin-x : auto)" name="userEmail"
						class="form-control" placeholder="example@helpme.com" required>
				</div>
			</div>
			</div>

			<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group">
					<label for="phone">휴대전화</label> <br> <input type="tel"
						class="login-input mx-auto = (margin-x : auto)" name="phone" id="phone"
						pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-1234-5678"
						required>
				</div>
			</div>
			</div>

			<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group" >
					<label for="address">주소</label> <br> <input type="text" id="address"
						class="login-input mx-auto = (margin-x : auto)"
						name="address" placeholder="주소를 입력해주세요." required>
				</div>
			</div>
			</div>

			<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group">
					<label for="gender">성별</label> 
					<label class="radio-inline">
						<input type="radio" name="gender" id="gender" value="남"  checked>남성
					</label> 
					<label class="radio-inline"> 
						<input type="radio"	id="gender" name="gender" value="여">여성
					</label>
				</div>
			</div>
			</div>

			<div class="col-md-12">
			<div class="row mypage-row">
				<div class="form-group">
					<label for="sms">SMS 수신 </label> <label class="radio-inline">
						<input type="radio" name="sms" id="sms" value="Y" checked>
						동의
					</label> <label class="radio-inline"> <input type="radio" id="sms"
						name="sms" value="N"> 비동의
					</label>
				</div>
			</div>
			</div>
			<input type="hidden" id="accTerms" name="accTerms" value="Y">

			<input type="hidden" id="userRank" name="userRank" value="1">

			<div class="col-md-12 terms-condition">
				<div class="row mypage-row">
					<h5 >가입 시, <a href="#" class=""> 이용약관 </a>에 동의합니다.</h5>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row mypage-row">
				<button type="submit" id="create" onclick="rg_Submit(); return false;">가입하기</button>
				</div>
			</div>
		</form>

		<div class="col-md-12 terms-condition">
			<div class="row mypage-row">
			<p>
				이미 회원이신가요? <a href="/main/login" class=""> 로그인 </a>
			</p>
			</div>
		</div>
	</div>
</div>


<%@ include file="../include/footer.jspf"%>
