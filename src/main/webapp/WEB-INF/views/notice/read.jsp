<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jspf"%>


<!-- Start main slider -->
<div id="carousel-example-generic"
	class="carousel slide edufair-slide carousel-fade" data-ride="carousel">
	<!-- Wrapper for slides -->
	<div class="carousel-inner edufair-inner single-inner" role="listbox">
		<div class="edufair-overlay">
			<img
				src="<%=request.getContextPath()%>/resources/pages/images/mybackground.png"
				class="edufair-slider-image edufair-single-image">
			<div class="carousel-caption edufair-caption edufair-single-caption">
				<div class="edufair-slider-middle">
					<div class="container edufair-slider-text">
						<h2 class="fadeInLeft"></h2>
						<ol class="breadcrumb edufair-single-breadcrumbs">
							<li><a href="#">Home</a></li>
							<li><a href="#">공지사항</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main slider -->
</div>


<!-- 원래 있던거 -->


<div class="edufair-blog-details-1x">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">


					<form role="form" action="modify" method="post">
						<input type='hidden' name='noticeId' value="${noticeVO.noticeId}">



						<div class="col-md-12 blog-details-title">
							<span> Category-${noticeVO.noticeCat} <i
								class="fa fa-clock-o"></i>
							</span> <span> By <a href="">${noticeVO.noticeId}</a>
							</span>
						</div>

						<div class="col-md-12">
							<h2 class="edufair-main-title">${noticeVO.noticeTitle}</h2>
						</div>
						<div class="col-md-12 blog-description">
							<p>${noticeVO.noticeCon}</p>
							<!--내용-->
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="blog-share-tag">
									<div class="col-md-6">
										<div class="blog-description-tab-share">
											<ul>
												<li></li>
											</ul>
										</div>
									</div>
									<div class="col-md-6">
										<div class="blog-description-tag">
											<ul>
												<li></li>
														<!-- 관리자 랭크 넣을 예정 -->	
												<li>

	                                <i class="edufair-component-button button-medium">
									<a href= "modify.noticeId?noticeId=${noticeVO.noticeId }">수정</a></i>
											<i class="edufair-component-button button-medium">
									<a href= "remove?noticeId=${noticeVO.noticeId }">삭제</a></i>
											<i class="edufair-component-button button-medium">
									<a href= "${path}/notice/list">목록</a></i>

											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../include/footer.jspf"%>