<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
							<li class="active">찜 목록</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End main slider -->


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="margin-top-middle"></div>

<!-- Start edufair course -->
<div class="online-course-category-1x  margin-bottom-large">
	<div class="container">
		<div class="row margin-top-middle padding-side-small">
			<h2 class="edufair-main-title" style="text-align: left">나의 찜
				list</h2>

			<c:if test="${empty like}">
				<strong>찜한 서비스가 없습니다.</strong>
				<br />
				<button class="edufair-component-button button-medium" type="button"
					onclick="goBack()">뒤로가기</button>
			</c:if>
			<script>
				function goBack() {
					window.history.go(-1);
				}
			</script>

			<c:forEach items="${like}" var="like">
				<div class="col-md-3">
					<div class="edufair-related-course">
						<div class="edufair-related-course-overlay">
						<img src="displayFile?fileName=${like.getsAttach()}" class="edufair-shop-image">
							<div class="edufair-related-course-middle"></div>
						</div>

						<div class="related-course-content">
							<div class="media">
								<div class="media-left">
									<img
										src="<%=request.getContextPath()%>/resources/pages/images/teacher.jpg"
										alt="Avatar">
								</div>
								<div class="media-body">
									<a href="/service/detail?sNo=${like.getsNo()} " class="">
										<h4 class="media-heading">${like.getsName()}</h4> <span>${like.getsNo()}</span>
									</a>
								</div>
							</div>
							<a href="/service/detail?sNo=${like.getsNo()}" class="">
								<h3>${like.getsCon()}</h3>
								<p>
									<fmt:formatDate pattern="yyyy-MM-dd "
										value="${like.getLikeDate()}" />
								</p>
							</a>
							<div class="course-review">
								<a href="#" class=""> <%-- 
									<c:forEach var="i" begin="1" end="${review.getRating()}" step="1">
															<i class="fa fa-star"></i>
														</c:forEach>  --%>

								</a>
							</div>
							<div class="related-course-footer">
								<i class="fa fa-users"></i> <span><fmt:formatNumber
										value="${like.getViewCount()}" pattern="###,###,###" /></span> <i
									class="fa fa-heart"></i> <span><fmt:formatNumber
										value="${like.getLikeIt()}" pattern="###,###,###" /></span> <strong><fmt:formatNumber
										value="${like.getPrice()}" pattern="###,###,###" />원</strong>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>


			<!-- 페이징 -->
			<!-- <div class="row"> -->
			<div class="col-md-12">
				<div class="text-center padding-top-large">
					<nav class="course-pagination" aria-label="Page navigation">
						<ul class="pagination edufair-pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="likelist${pageMaker.makeSearch1(pageMaker.startPage - 1) }&userId=${member.userId}"
									aria-label="Previous">&laquo;<i class="fa fa-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">

								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="likelist${pageMaker.makeSearch1(idx)}&userId=${member.userId}">${idx}</a>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="likelist${pageMaker.makeSearch1(pageMaker.endPage +1) }&userId=${member.userId}"
									aria-label="Next">&raquo;<i class="fa fa-angle-right"></a></li>
							</c:if>
						</ul>

					</nav>
				</div>
			</div>
			<!-- 	</div> -->
			<!-- 페이징 끝 -->




		</div>
	</div>
</div>


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

<%@ include file="../include/footer.jspf"%>