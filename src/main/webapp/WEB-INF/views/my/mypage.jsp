<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.col-md-25 {
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px
}

/* 테이블 css */
table.type1 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
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
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type1 td {
	width: 70px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
.col-xs-3 {padding-left:0px; padding-right:10px;}

</style>

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

<c:if test="${member == null}">
	<script>
		alert("로그인 후 이용해 주세요.");
		location.href = "/main/login";
	</script>
</c:if> 
	
	
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
	

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<div class="online-course-category-1x margin-bottom-large">
		<div class="container">
			<div class="row mypage-row">
				<div class="padding-top-middle" align="center">
					<!-- <div class="online-category"> -->
					<div class="online-course-2x">

						<div class="featured-category-container">
							<div class="col-md-3 col-sm-3 col-xs-3">
								<div class="single-featured-category">

									<div class="featured-category-img">
										<img
											src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon01.png"
											alt="" /> <br />
										<h4>
											<%--<a
												href="${pageContext.request.contextPath}/my/mydeal">거래
												내역</a>--%>
											<a class="mypage-cat-title"
												href="${pageContext.request.contextPath}/my/mydeal">거래 내역</a>
										</h4>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-3 col-xs-3">
								<div class="single-featured-category">

									<div class="featured-category-img">
										<img
											src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon02.png"
											alt="" /> <br />
										<h4>
											<a class="mypage-cat-title"
												href="${pageContext.request.contextPath}/my/myreview">My Review</a>
										</h4>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-3 col-xs-3">
								<div class="single-featured-category">

									<div class="featured-category-img">
										<img
											src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon03.png"
											alt="" /> <br />
										<h4>
											<a class="mypage-cat-title"
												href="${pageContext.request.contextPath}/my/latestservice">최근 본 서비스</a>
										</h4>
									</div>
								</div>
							</div>
							<%-- <div class="col-md-3">  실시간 채팅으로 대체?
								<div class="single-featured-category">

									<div class="featured-category-img">
										<img
											src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon04.png"
											alt="" /> <br />
										<h4>
											<a
												href="${pageContext.request.contextPath}/my/qnalist?userId=${member.userId}">Q&A</a>
										</h4>
									</div>
								</div>
							</div> --%>
							<div class="col-md-3 col-sm-3 col-xs-3">
								<div class="single-featured-category">

									<div class="featured-category-img">
										<img
											src="<%=request.getContextPath()%>/resources/pages/images/icon/my_icon05.png"
											alt="" /> <br />
										<h4>
											<a class="mypage-cat-title"
												href="${pageContext.request.contextPath}/my/likelist">찜
												목록</a>
										</h4>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="row mypage-row">
                <div class="mypage-box">
                    <!-- div 추가 -->
                    <div class="padding-top-middle">
                        <h2 class="edufair-main-title align-left" style="text-align: left">회원 정보</h2>
						<input type="hidden" name="userId" value="${member.userId}">
						<table class="type1 margin-bottom-small" align="center">
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
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${member.regDate}" /></td>
							</tr>

							<tr>
								<th>SMS 수신여부</th>
								<td>${member.sms}</td>
							</tr>

							<tr>
								<th>회원등급</th>
								<td>${member.userRank}</td>
							</tr>
							<tr>
								<th>비밀번호 변경</th>
								<td><button class="edufair-component-button button-medium" type="button"
										onclick="location.href='/main/changePwd?userId=${member.userId}'">비밀번호
										변경</button></td>
							</tr>
							<tr>
								<th>나의 적립금</th>
								<td>
									<button type="button"
										class="edufair-component-button button-medium" id="myBtn">적립금</button>
								</td>
							</tr>
							<%-- 								<tr>
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
								</tr> --%>
						</table>
						<table class="margin-top-middle">
							<tr>
								<td colspan="2" align="center">
									<button class="edufair-component-button button-large" type="button"
									onclick="location.href='${pageContext.request.contextPath}/main/modify'">회원
									정보 수정</button>
									<button class="edufair-component-button button-large" onclick="checkDel();"
									onclick="location.href='${pageContext.request.contextPath}/main/deleteId?userId=${member.userId}'">회원
									탈퇴</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<!-- Channel Plugin Scripts -->
			<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
	    "pluginKey": "f433ca63-9c29-4e0c-83cd-748cfde113bb", //please fill with your plugin key
	    "memberId": "${member.userId}", //fill with user id
	    "profile": {
	      "name": "${member.userName}", //fill with user name
	      "mobileNumber": "${member.phone}", //fill with user phone number
	      "CUSTOM_VALUE_1": "VALUE_1", //any other custom meta data
	      "CUSTOM_VALUE_2": "VALUE_2"
	    }
  });
</script>
			<!-- End Channel Plugin -->


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
							<div>
								<c:if test="${point.getAmount()>0}">
									<table class="type1" style="margin: 5px 20px 20px 5px">
										<tbody>
											<tr>
												<th>적립금액</th>
												<td data-th="적립금액">${point.getAmount()}</td>
											</tr>
											<tr>
												<th>유효기간</th>
												<td data-th="유효기간"><fmt:formatDate pattern="yyyy-MM-dd"
														value="${point.getValidDate()}" /></td>
											</tr>
										</tbody>
									</table>
								</c:if>
							</div>

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
	<!-- end Modal-->

	<script>
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#pointmodal").modal();
			});
		});
		
		function checkDel() {
			if (confirm("정말 삭제하시겠습니까?")) {
				location.replace('/main/deleteId?userId=${member.getUserId()}');
			}
		};
		
	</script>
	<script type="text/javascript">
	var getParameter = function (param) {
		var returnValue;
		var url = location.href;
		var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
		for (var i = 0; i < parameters.length; i++) {
			var varName = parameters[i].split('=')[0];
			if (varName.toUpperCase() == param.toUpperCase()) {
				returnValue = parameters[i].split('=')[1];
				return decodeURIComponent(returnValue);
			}
		}
	};
	$(document).ready(function () {
		console.log('val : ' + getParameter('userId'));
	}
	</script>


	

</section>
<!-- /.content -->
<!--  메인 박스 끝 -->







<%@ include file="../include/footer.jspf"%>