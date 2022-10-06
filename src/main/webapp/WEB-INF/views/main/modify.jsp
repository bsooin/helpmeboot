<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>

/* 테이블 css */
table.type1 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	margin: 1px 100px 5px 0px;
}

table.type1 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.type1 tbody th {
	width: 65px;
	padding: 10px;
	font-weight: 600;
	text-align:center;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type1 td {
	width: 80px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>


<!-- 여기서 부터 수정 -->
<!-- Start main slider -->
<section class="content">
<!-- 	<div id="carousel-example-generic"
		class="carousel slide edufair-slide carousel-fade"
		data-ride="carousel"> -->
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
	<!-- End main slider -->
</div>

<c:if test="${empty vo}">
	<script>
	alert("로그인 후 이용해 주세요.");
	location.href="/main/login";
			</script>

</c:if>

<!--==================================
=            User Profile            =
===================================-->

<!--  <div class="edufair-course-details-1x padding-top-large">
	<div class="container">
		<div class="row"> -->
			<div class="col-md-10 offset-md-1 col-lg-3 offset-lg-0">


			</div>
			<div class="container">
				<div class="row mypage-row">
                <div class="mypage-box">
						<!-- div 추가 -->
						<div class="padding-top-extra-small">
							<h2 class="edufair-main-title">회원 정보 수정</h2>
							<p style="padding-left:5px">help me! 정보를 수정하실 수 있습니다.</p>
						</div>

						<div class="row mypage-row">
						<form action="modify" method="post" name="frm">
							<input type="hidden" name="userId" value="${vo.userId}">
							<input type="hidden" name="gender" value="${vo.gender}">
							<input type="hidden" name="userRank" value="${vo.userRank}">
							<table class="type1">
								<tr>
									<th width="20px">아이디</th>
									<td width="100px">${vo.userId}</td>
								</tr>

								<tr>
									<th width="20px">이메일</th>
									<td width="100px"><input type="text" name="userEmail"
										pattern="^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$"
										size="30" value="${vo.userEmail}" required /></td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td><input type="text" name="userName" size="30"
										value="${vo.userName}" /></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" name="phone" size="30"
										pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${vo.phone}" /></td>
								</tr>

								<tr>
									<th>성별</th>

									<td>${vo.gender}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" name="address" size="30"
										value="${vo.address}" /></td>
								</tr>
								<tr>
									<th>가입일자</th>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${vo.regDate}" /></td>
								</tr>
								<tr>
									<th>회원등급</th>
									<td>${vo.userRank}</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="form-group" style="padding-left:10px">
											<label for="sms">SMS 수신 </label><br /> <label
												class="radio-inline"> <input type="radio" name="sms"
												value="Y" <c:if test="${vo.sms eq 'Y'}">checked</c:if>>
												동의
											</label> <label class="radio-inline"> <input type="radio"
												name="sms" value="N"
												<c:if test="${vo.sms eq 'N'}">checked</c:if>> 비동의
											</label>


										</div>
									</td>

								</tr>

							</table>

						<br /> <br />

						<div class="padding-top-extra-small" style="padding-left:20px">
						<h2 class="edufair-main-title" >helper 계좌 정보</h2>
						<p >판매 금액은 helper님이 등록하신 계좌로 2영업일 이내에 입금 됩니다.</p>
						</div>
						
							<table class="type1">
								<tr>
									<th>은행</th>
									
									<td>
									<input type="text" name="mybankName" id="mybankName"
										value="${accountVO.getBankName()}" size="30" disabled> <select
										class="form-control" name="bankName" id="bankName"
										onchange="bankName_change()">
											<option>선택</option>
											<option value="기업은행">기업은행</option>
											<option value="우리은행">우리은행</option>
											<option value="하나은행">하나은행</option>
											<option value="국민은행">국민은행</option>
											<option value="신한은행">신한은행</option>
											<option value="NH농협은행">NH농협은행</option>
											<option value="지역농축협">지역농축협</option>
											<option value="케이뱅크">케이뱅크</option>
											<option value="카카오뱅크">카카오뱅크</option>
											<option value="토스뱅크">토스뱅크</option>
											<option value="제주은행">제주은행</option>
											<option value="광주은행">광주은행</option>
											<option value="DGB대구은행">DGB대구은행</option>
											<option value="BNK부산은행">BNK부산은행</option>
											<option value="SC제일은행">SC제일은행</option>
											<option value="한국시티은행">한국시티은행</option>
											<option value="수협은행">수협은행</option>
									</select></td>


								</tr>

								<tr>
									<th>계좌 번호</th>
									<td><input type="text" name="accountNo"
										value="${accountVO.getAccountNo()}"
										placeholder="-를 제외하고 숫자만 입력해주세요." size="30" /></td>


								</tr>
							</table>
							
							<br />

							<table>
								<tr>
									<td colspan="2" align="center"><button
											class="edufair-component-button button-large"  type="submit">저장하기</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="edufair-component-button button-large"
											type="reset">다시쓰기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="edufair-component-button button-large"
											type="button" onclick="goBack()">뒤로가기</button></td>
								</tr>

							</table>
						</form>
						</div>


					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</div>

<script>
	function goBack() {
		window.history.go(-1);
	}
	

</script>

<script type="text/javascript">
		function bankName_change()() {
			 var target = document.getElementById("bankName");
			
			if (target.options[target.selectedIndex].text  == "선택"){ // 선택
				document.update.mybankName.disabled = true;
				document.update.mybankName.value = "";
			}else { // 그외
				document.update.mybankName.disabled = false;
				document.update.mybankName.value = target.options[target.selectedIndex].value;
				alert('선택된 옵션 value 값=' + document.update.bankName.value);
			}
		}
		

	</script>





<script>
/* $(document).ready(function(){  
	var sms =  ${vo.sms};
		
	if(sms=='Y'){
		$("input:radio[name='sms']:radio[value='Y']").prop('checked', true);
	}
	else if(sms=='N'){
		$("input:radio[name='sms']:radio[value='N']").prop('checked', true);
	}
	

}); 

function radioChange(event){
    var selected = document.querySelector('input[name="sms"]:checked').value

}*/


</script>


<%@ include file="../include/footer.jspf"%>