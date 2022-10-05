<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

<%@ include file="../include/header.jspf"%>

<!-- Start main slider -->
<div id="carousel-example-generic"
	class="carousel slide edufair-slide carousel-fade margin-bottom-large"
	data-ride="carousel">
	<!-- Wrapper for slides -->
	<div class="carousel-inner edufair-inner single-inner" role="listbox">
		<div class="edufair-overlay">
			<img
				src="<%=request.getContextPath()%>/resources/pages/images/sample_bg01.jpg"
				alt="slide 1" class="edufair-slider-image edufair-single-image">
			<div class="carousel-caption edufair-caption edufair-single-caption">
				<div class="edufair-slider-middle">
					<div class="container edufair-slider-text">
						<h2 class="fadeInLeft">Community</h2>
						<ol class="breadcrumb edufair-single-breadcrumbs">
							<li><a href="#">Home</a></li>
							<li><a href="#">Board</a></li>
							<li class="active">Community</li>
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
			게시글이 삭제되었습니다. <br> ${ctxPath = pageContext.request.contextPath ; ''}
			<a href="${ctxPath}/notice/list.do">[게시글목록보기]</a>
		</div>
	</div>
</div>

<!-- 메인박스 끝 -->


<%@ include file="../include/footer.jspf"%>