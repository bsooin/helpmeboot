<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="online-course-new-container">
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel" data-interval="false">
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="item_bg" id="visual-slide-01"></div>
				<div class="carousel-caption">
					<span class="typing"></span>
				</div>
			</div>
			<div class="item">
				<div class="item_bg" id="visual-slide-02"></div>
				<div class="carousel-caption">
					<span class="typing"></span>
				</div>
			</div>
			<div class="item">
				<div class="item_bg" id="visual-slide-03"></div>
				<div class="carousel-caption">
					<span class="typing"></span>
				</div>
			</div>
			<div class="item">
				<div class="item_bg" id="visual-slide-04"></div>
				<div class="carousel-caption">
					<span class="typing"></span>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <img class="main-arrow"
			src="<%=request.getContextPath()%>/resources/pages/images/main/left-arrow.png">
			<span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <img class="main-arrow"
			src="<%=request.getContextPath()%>/resources/pages/images/main/right-arrow.png">
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>


<!-- Start main slider -->
<!-- Start edufair features -->
<div class="online-course-category-1x  margin-bottom-large">
	<div class="container">
		<div class="row">
			<div class="online-category">
					<input type="hidden" name="categoryNo" id="categoryNo"
						value="${categoryNo}">
					<div class="col-md-2 col-sm-4 col-xs-6 margin-bottom-small">
						<div
							class="single-kindergarten-features single-kindergarten-features-1x">
							<img src="/resources/pages/images/icon/cat_icon01.png" alt="" />
							<h4>
								<a href="javascript:serviceListOrder(1)">디자인/그래픽</a>
							</h4>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 margin-bottom-small">
						<div
							class="single-kindergarten-features single-kindergarten-features-2x">
							<img src="/resources/pages/images/icon/cat_icon02.png" alt="" />
							<h4>
								<a href="javascript:serviceListOrder(2)">컴퓨터/개발</a>
							</h4>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 margin-bottom-small">
						<div
							class="single-kindergarten-features single-kindergarten-features-3x">
							<img src="/resources/pages/images/icon/cat_icon03.png" alt="" />
							<h4>
								<a href="javascript:serviceListOrder(3)">음악/영상</a>
							</h4>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 margin-bottom-small">
						<div
							class="single-kindergarten-features single-kindergarten-features-4x">
							<img src="/resources/pages/images/icon/cat_icon04.png" alt="" />
							<h4>
								<a href="javascript:serviceListOrder(4)">생활/노하우</a>
							</h4>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 margin-bottom-small">
						<div
							class="single-kindergarten-features single-kindergarten-features-5x">
							<img src="/resources/pages/images/icon/cat_icon05.png" alt="" />
							<h4>
								<a href="javascript:serviceListOrder(5)">번역/외국어</a>
							</h4>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 margin-bottom-small">
						<div
							class="single-kindergarten-features single-kindergarten-features-6x">
							<img src="/resources/pages/images/icon/cat_icon06.png" alt="" />
							<h4>
								<a href="javascript:serviceListOrder(6)">주문제작</a>
							</h4>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>
<!-- End edufair slider features -->




<!-- Start edufair related course -->
<div class="edufair-related-course-1x">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2 class="edufair-main-title">Best Helper</h2>

				<!-- Controls -->
				<a class="left carousel-control  edufair-course-controll-1x"
					href="#course-carousel" role="button" data-slide="prev"><i
					class="fa fa-angle-left"></i></a> <a
					class="right carousel-control edufair-course-controll-1x"
					href="#course-carousel" role="button" data-slide="next"><i
					class="fa fa-angle-right"></i></a>

			</div>
		</div>

		<div id="course-carousel" class="carousel slide carousel-fade"
			data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-12">
								<div class="edufair-related-course">
									<div class="edufair-related-course-overlay">
										<%-- <img
											src="<%=request.getContextPath()%>/resources/pages/images/main/best_img01.png"
											alt="Avatar" class="edufair-related-course-image"> --%>
									<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${best[0].getsAttach()}">
											
										<div class="edufair-related-course-middle"></div>
									</div>

									<div class="related-course-content">
										<div class="media">
											<div class="media-left">
											<!-- 나중에 서비스 연결하고 이미지 수정하기 -->
												<img
													src="<%=request.getContextPath()%>/resources/pages/images/teacher.jpg"
													alt="Avatar">
											</div>
											<div class="media-body">
												<a href="/service/detail?sNo=${best[0].getsNo()}" class="">
													<h4 class="media-heading">${best[0].getUserId()}</h4> <span>${best[0].getCategoryNo()}
														영화</span>
												</a>
											</div>
										</div>
										<a href="/service/detail?sNo=${best[0].getsNo()}" class="">
											<h3>${best[0].getsCon()}</h3>
										</a>
										<p><i
									class="fa fa-calendar"></i> 
											<fmt:formatDate pattern="yyyy-MM-dd "
												value="${best[0].getrRegDate()}" />
										</p>
										<div class="course-review">
											<a href="#" class="">
											 <c:forEach var="i" begin="1" end="${best[0].getRating()}" step="1">
													<i class="fa fa-star"></i>
												</c:forEach>
											</a>
										</div>
										<div class="related-course-footer">
											<i class="fa fa-users"></i> <span><fmt:formatNumber
													value="${best[0].getViewCount()}" pattern="###,###,###" /></span> <i
												class="fa fa-heart"></i> <span><fmt:formatNumber
													value="${best[0].getLikeIt()}" pattern="###,###,###" /></span> <strong><fmt:formatNumber
													value="${best[0].getPrice()}" pattern="###,###,###" />원</strong>
										</div>
									</div>
								</div>
							</div>


						  <div class="col-md-3 col-sm-6 col-xs-12">
							<div class="edufair-related-course">
								<div class="edufair-related-course-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/best_img02.png"
										alt="Avatar" class="edufair-related-course-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${best[1].getsAttach()}">
										
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
											<a href="#" class="">
												<h4 class="media-heading">${best[1].getUserId()}</h4> <span>${best[1].getCategoryNo()}미술</span>
											</a>
										</div>
									</div>
									<a href="#" class="">
										<h3>${best[1].getsCon()}</h3>
									</a>
									<p><i
									class="fa fa-calendar"></i> 
											<fmt:formatDate pattern="yyyy-MM-dd "
												value="${best[1].getrRegDate()}" />
										</p>
									<div class="course-review">
											<a href="#" class=""> <c:forEach var="i" begin="1"
													end="${best[1].getRating()}" step="1">
													<i class="fa fa-star"></i>
												</c:forEach>
											</a>
										</div>
									<div class="related-course-footer">
											<i class="fa fa-users"></i> <span><fmt:formatNumber
													value="${best[1].getViewCount()}" pattern="###,###,###" /></span> <i
												class="fa fa-heart"></i> <span><fmt:formatNumber
													value="${best[1].getLikeIt()}" pattern="###,###,###" /></span> <strong><fmt:formatNumber
													value="${best[1].getPrice()}" pattern="###,###,###" />원</strong>
										</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="edufair-related-course">
								<div class="edufair-related-course-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/best_img03.png"
										alt="Avatar" class="edufair-related-course-image"> --%>
										
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${best[2].getsAttach()}">
										
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
											<a href="#" class="">
												<h4 class="media-heading">${best[2].getUserId()}</h4> <span>${best[2].getCategoryNo()}스포츠</span>
											</a>
										</div>
									</div>
									<a href="#" class="">
										<h3>${best[2].getsCon()}</h3>
									</a>
									<p><i
									class="fa fa-calendar"></i> 
											<fmt:formatDate pattern="yyyy-MM-dd "
												value="${best[2].getrRegDate()}" />
										</p>
									<div class="course-review">
											<a href="#" class=""> <c:forEach var="i" begin="1"
													end="${best[2].getRating()}" step="1">
													<i class="fa fa-star"></i>
												</c:forEach>
											</a>
										</div>
									<div class="related-course-footer">
											<i class="fa fa-users"></i> <span><fmt:formatNumber
													value="${best[2].getViewCount()}" pattern="###,###,###" /></span> <i
												class="fa fa-heart"></i> <span><fmt:formatNumber
													value="${best[2].getLikeIt()}" pattern="###,###,###" /></span> <strong><fmt:formatNumber
													value="${best[2].getPrice()}" pattern="###,###,###" />원</strong>
										</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="edufair-related-course">
								<div class="edufair-related-course-overlay">
									<%-- img
										src="<%=request.getContextPath()%>/resources/pages/images/main/best_img04.png"
										alt="Avatar" class="edufair-related-course-image"> --%>
										
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${best[3].getsAttach()}">
										
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
											<a href="#" class="">
												<h4 class="media-heading">${best[3].getUserId()}</h4> <span>${best[3].getCategoryNo()}음악</span>
											</a>
										</div>
									</div>
									<a href="#" class="">
										<h3>${best[3].getsCon()}</h3>
									</a>
									<p><i
									class="fa fa-calendar"></i> 
											<fmt:formatDate pattern="yyyy-MM-dd "
												value="${best[3].getrRegDate()}" />
										</p>
									<div class="course-review">
											<a href="#" class=""> <c:forEach var="i" begin="1"
													end="${best[3].getRating()}" step="1">
													<i class="fa fa-star"></i>
												</c:forEach>
											</a>
										</div>
									<div class="related-course-footer">
											<i class="fa fa-users"></i> <span><fmt:formatNumber
													value="${best[3].getViewCount()}" pattern="###,###,###" /></span> <i
												class="fa fa-heart"></i> <span><fmt:formatNumber
													value="${best[3].getLikeIt()}" pattern="###,###,###" /></span> <strong><fmt:formatNumber
													value="${best[3].getPrice()}" pattern="###,###,###" />원</strong>
										</div>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="item">
					<div class="row">
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="edufair-related-course">
								<div class="edufair-related-course-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/best_img05.png"
										alt="Avatar" class="edufair-related-course-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${best[4].getsAttach()}">
										
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
											<a href="#" class="">
												<h4 class="media-heading">${best[4].getUserId()}</h4> <span>${best[4].getCategoryNo()}음식</span>
											</a>
										</div>
									</div>
									<a href="#" class="">
										<h3>${best[4].getsCon()}</h3>
									</a>
									<p><i
									class="fa fa-calendar"></i> 
											<fmt:formatDate pattern="yyyy-MM-dd "
												value="${best[4].getrRegDate()}" />
										</p>
									<div class="course-review">
											<a href="#" class=""> <c:forEach var="i" begin="1"
													end="${best[4].getRating()}" step="1">
													<i class="fa fa-star"></i>
												</c:forEach>
											</a>
										</div>
									<div class="related-course-footer">
											<i class="fa fa-users"></i> <span><fmt:formatNumber
													value="${best[4].getViewCount()}" pattern="###,###,###" /></span> <i
												class="fa fa-heart"></i> <span><fmt:formatNumber
													value="${best[4].getLikeIt()}" pattern="###,###,###" /></span> <strong><fmt:formatNumber
													value="${best[4].getPrice()}" pattern="###,###,###" />원</strong>
										</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="edufair-related-course">
								<div class="edufair-related-course-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/best_img06.png"
										alt="Avatar" class="edufair-related-course-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${best[5].getsAttach()}">
										
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
											<a href="#" class="">
												<h4 class="media-heading">${best[5].getUserId()}</h4> <span>${best[5].getCategoryNo()}수공예</span>
											</a>
										</div>
									</div>
									<a href="#" class="">
										<h3>${best[5].getsCon()}</h3>
									</a>
									<p><i
									class="fa fa-calendar"></i> 
											<fmt:formatDate pattern="yyyy-MM-dd "
												value="${best[5].getrRegDate()}" />
										</p>
									<div class="course-review">
											<a href="#" class=""> <c:forEach var="i" begin="1"
													end="${best[5].getRating()}" step="1">
													<i class="fa fa-star"></i>
												</c:forEach>
											</a>
										</div>
									<div class="related-course-footer">
											<i class="fa fa-users"></i> <span><fmt:formatNumber
													value="${best[5].getViewCount()}" pattern="###,###,###" /></span> <i
												class="fa fa-heart"></i> <span><fmt:formatNumber
													value="${best[5].getLikeIt()}" pattern="###,###,###" /></span> <strong><fmt:formatNumber
													value="${best[5].getPrice()}" pattern="###,###,###" />원</strong>
										</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="edufair-related-course">
								<div class="edufair-related-course-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/best_img07.png"
										alt="Avatar" class="edufair-related-course-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${best[6].getsAttach()}">
											
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
											<a href="#" class="">
												<h4 class="media-heading">${best[6].getUserId()}</h4> <span>${best[6].getCategoryNo()}미술</span>
											</a>
										</div>
									</div>
									<a href="#" class="">
										<h3>${best[6].getsCon()}</h3>
									</a>
									<p><i
									class="fa fa-calendar"></i> 
											<fmt:formatDate pattern="yyyy-MM-dd "
												value="${best[6].getrRegDate()}" />
										</p>
									<div class="course-review">
											<a href="#" class=""> <c:forEach var="i" begin="1"
													end="${best[6].getRating()}" step="1">
													<i class="fa fa-star"></i>
												</c:forEach>
											</a>
										</div>
									<div class="related-course-footer">
											<i class="fa fa-users"></i> <span><fmt:formatNumber
													value="${best[6].getViewCount()}" pattern="###,###,###" /></span> <i
												class="fa fa-heart"></i> <span><fmt:formatNumber
													value="${best[6].getLikeIt()}" pattern="###,###,###" /></span> <strong><fmt:formatNumber
													value="${best[6].getPrice()}" pattern="###,###,###" />원</strong>
										</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="edufair-related-course">
								<div class="edufair-related-course-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/best_img08.png"
										alt="Avatar" class="edufair-related-course-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${best[7].getsAttach()}">
										
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
											<a href="#" class="">
												<h4 class="media-heading">${best[7].getUserId()}</h4> <span>${best[7].getCategoryNo()}스포츠</span>
											</a>
										</div>
									</div>
									<a href="#" class="">
										<h3>${best[7].getsCon()}</h3>
									</a>
									<p>
									<i
									class="fa fa-calendar"></i> <fmt:formatDate pattern="yyyy-MM-dd "
												value="${best[7].getrRegDate()}" />
									<%-- <p>
											<fmt:formatDate pattern="yyyy-MM-dd "
												value="${best[7].getrRegDate()}" />
										</p> --%></p>
									<div class="course-review">
											<a href="#" class=""> <c:forEach var="i" begin="1"
													end="${best[7].getRating()}" step="1">
													<i class="fa fa-star"></i>
												</c:forEach>
											</a>
										</div>
									<div class="related-course-footer">
											<i class="fa fa-users"></i> <span><fmt:formatNumber
													value="${best[7].getViewCount()}" pattern="###,###,###" /></span> <i
												class="fa fa-heart"></i> <span><fmt:formatNumber
													value="${best[7].getLikeIt()}" pattern="###,###,###" /></span> <strong><fmt:formatNumber
													value="${best[7].getPrice()}" pattern="###,###,###" />원</strong>
										</div>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>
	</div>
</div>
<!-- End edufair related course-->

<!-- Start edufair teacher -->
<div class="edufair-shop-1x padding-top-large margin-bottom-large">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2 class="edufair-main-title">New Helper</h2>
				<!-- Controls -->
				<a class="left carousel-control  edufair-controll-1x"
					href="#shop-carousel" role="button" data-slide="prev"><i
					class="fa fa-angle-left"></i></a> <a
					class="right carousel-control edufair-controll-1x"
					href="#shop-carousel" role="button" data-slide="next"><i
					class="fa fa-angle-right"></i></a>
			</div>
		</div>

		<div id="shop-carousel" class="carousel slide carousel-fade"
			data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<div class="row">
						
						
						<div class="col-md-3 col-sm-6 col-xs-6">
								<div class="edufair-single-shop">
									<div class="edufair-shop-overlay">
										<%-- <img
											src="<%=request.getContextPath()%>/resources/pages/images/main/new_img01.png"
											alt="Avatar" class="edufair-shop-image"> --%>
											<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${newhelper[0].getSAttach()}">
											
										<div class="edufair-shop-middle"></div>
									</div>

									<div class="shop-content">
										<a href="/service/detail?sNo=${newhelper[0].getSNo()}">
											<h5>${newhelper[0].getSName()}</h5>
											<h6>${newhelper[0].getSCon()}</h6>
										</a>
									</div>
								</div>
							</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="edufair-single-shop">
								<div class="edufair-shop-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/new_img02.png"
										alt="Avatar" class="edufair-shop-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${newhelper[1].getSAttach()}">
										
									<div class="edufair-shop-middle"></div>
								</div>

								<div class="shop-content">
										<a href="/service/detail?sNo=${newhelper[1].getSNo()}">
											<h5>${newhelper[1].getSName()}</h5>
											<h6>${newhelper[1].getSCon()}</h6>
										</a>
									</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="edufair-single-shop">
								<div class="edufair-shop-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/new_img03.png"
										alt="Avatar" class="edufair-shop-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${newhelper[2].getSAttach()}">
										
									<div class="edufair-shop-middle"></div>
								</div>

								<div class="shop-content">
										<a href="/service/detail?sNo=${newhelper[2].getSNo()}">
											<h5>${newhelper[2].getSName()}</h5>
											<h6>${newhelper[2].getSCon()}</h6>
										</a>
									</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="edufair-single-shop">
								<div class="edufair-shop-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/new_img04.png"
										alt="Avatar" class="edufair-shop-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${newhelper[3].getSAttach()}">
										
									<div class="edufair-shop-middle"></div>
								</div>

								<div class="shop-content">
										<a href="/service/detail?sNo=${newhelper[3].getSNo()}">
											<h5>${newhelper[3].getSName()}</h5>
											<h6>${newhelper[3].getSCon()}</h6>
										</a>
									</div>
							</div>
						</div>
						
						
					</div>
				</div>
				<div class="item">
					<div class="row">
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="edufair-single-shop">
								<div class="edufair-shop-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/new_img05.png"
										alt="Avatar" class="edufair-shop-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${newhelper[4].getSAttach()}">
										
									<div class="edufair-shop-middle"></div>
								</div>

								<div class="shop-content">
										<a href="/service/detail?sNo=${newhelper[4].getSNo()}">
											<h5>${newhelper[4].getSName()}</h5>
											<h6>${newhelper[4].getSCon()}</h6>
										</a>
									</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="edufair-single-shop">
								<div class="edufair-shop-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/new_img06.png"
										alt="Avatar" class="edufair-shop-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${newhelper[5].getSAttach()}">
										
									<div class="edufair-shop-middle"></div>
								</div>

								<div class="shop-content">
										<a href="/service/detail?sNo=${newhelper[5].getSNo()}">
											<h5>${newhelper[5].getSName()}</h5>
											<h6>${newhelper[5].getSCon()}</h6>
										</a>
									</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="edufair-single-shop">
								<div class="edufair-shop-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/new_img07.png"
										alt="Avatar" class="edufair-shop-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${newhelper[6].getSAttach()}">
										
									<div class="edufair-shop-middle"></div>
								</div>

								<div class="shop-content">
										<a href="/service/detail?sNo=${newhelper[6].getSNo()}">
											<h5>${newhelper[6].getSName()}</h5>
											<h6>${newhelper[6].getSCon()}</h6>
										</a>
									</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="edufair-single-shop">
								<div class="edufair-shop-overlay">
									<%-- <img
										src="<%=request.getContextPath()%>/resources/pages/images/main/new_img08.png"
										alt="Avatar" class="edufair-shop-image"> --%>
										<!-- 이미지 수정하기 -->
											<img alt="" src="displayFile?fileName=${newhelper[7].getSAttach()}">
										
									<div class="edufair-shop-middle"></div>
								</div>

								<div class="shop-content">
										<a href="/service/detail?sNo=${newhelper[7].getSNo()}">
											<h5>${newhelper[7].getSName()}</h5>
											<h6>${newhelper[7].getSCon()}</h6>
										</a>
									</div>
							</div>
						</div>
					</div>


					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- End edufair teacher-->

	<!-- Start CTA -->
	<div class="container">
		<div class="edufair-cta-1x margin-bottom-large">
			<div class="container">
				<div class="col-md-8">
					<div class="cta-left">
						<h4>Help Me!</h4>
						<h3>이용방법</h3>
					</div>
				</div>
				<div class="col-md-4">
					<div class="cta-right">
						<a href="/service/list" class="edufair-btn-larg  kid-contact-cta">헬퍼
							찾으러가기!</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End CTA -->


	<!-- Start edufair blog -->
	<div class="edufair-blog-1x">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="edufair-main-title">읽어보기</h2>
					<!-- 커뮤니티랑 연결?? -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="edufair-single-blog">
						<div class="edufair-blog-overlay">
							<img
								src="<%=request.getContextPath()%>/resources/pages/images/main/blog_img01.png"
								alt="Avatar" class="edufair-blog-image">
							<div class="edufair-blog-middle">
								<div class="blog-share">
									<ul>
										<li><a href="#"> <i class="fa fa-facebook"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-twitter"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-google"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-linkedin"></i>
										</a></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="blog-content">
							<a href="#" class="">
								<h3>감자칩의 비밀</h3>
							</a>

							<p>겁나 바삭하다.</p>

							<div class="blog-footer">
								<i class="fa fa-comment"></i> <span>255</span> <i
									class="fa fa-heart"></i> <span>50</span> <strong><i
									class="fa fa-calendar"></i> 21 Jun 2017</strong>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="edufair-single-blog">
						<div class="edufair-blog-overlay">
							<img
								src="<%=request.getContextPath()%>/resources/pages/images/main/blog_img02.png"
								alt="Avatar" class="edufair-blog-image">
							<div class="edufair-blog-middle">
								<div class="blog-share">
									<ul>
										<li><a href="#"> <i class="fa fa-facebook"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-twitter"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-google"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-linkedin"></i>
										</a></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="blog-content">
							<a href="#" class="">
								<h3>사진 잘 찍는 법</h3>
							</a>

							<p>저도 모릅니다.</p>

							<div class="blog-footer">
								<i class="fa fa-comment"></i> <span>255</span> <i
									class="fa fa-heart"></i> <span>50</span> <strong><i
									class="fa fa-calendar"></i> 21 Jun 2017</strong>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="edufair-single-blog">
						<div class="edufair-blog-overlay">
							<img
								src="<%=request.getContextPath()%>/resources/pages/images/main/blog_img03.png"
								alt="Avatar" class="edufair-blog-image">
							<div class="edufair-blog-middle">
								<div class="blog-share">
									<ul>
										<li><a href="#"> <i class="fa fa-facebook"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-twitter"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-google"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-linkedin"></i>
										</a></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="blog-content">
							<a href="#" class="">
								<h3>시바견인줄 알았는데</h3>
							</a>

							<p>도지코인이었을때.</p>

							<div class="blog-footer">
								<i class="fa fa-comment"></i> <span>255</span> <i
									class="fa fa-heart"></i> <span>50</span> <strong><i
									class="fa fa-calendar"></i> 21 Jun 2017</strong>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	<!-- End blog -->

	<!-- Start Review list -->
	<div class="edufair-blog-1x margin-bottom-large">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-5 margin-bottom-middle">
						<h2 class="font-gsans-bold color-black">
							943,432 명이<br>헬프미와 함께합니다.
						</h2>
						<div class="font-pretendard color-black"
							style="margin-bottom: 30px;">
							'helpme'는 누구나 가지고 있는 소소한 취미를 공유하여<br> 모두가 얕고 넓고 다양한 취미를 통해
							보다 풍부하고 <br> 다채로운 삶을 누릴 수 있도록 돕는 취미 거래 플랫폼입니다.
						</div>
						<div>
							<button class="edufair-component-button button-medium"
								style="border: solid 1px #f1f1f1;">리뷰 더보기</button>
							<button class="edufair-component-button button-medium"
								style="border: solid 1px #f1f1f1;">Help me 소개 바로가기</button>
						</div>
					</div>
					<div class="col-md-7">
						<div class="swiper mySwiper">
							<div class="swiper-wrapper">

								<c:forEach var="review" items="${review}">
									<div class="swiper-slide">
										<div class="review_box">
											<p class="review_title">${review.getrTitle()}</p>
											<p class="review_writer">${review.getUserId()}</p>
											<p class="review_content">${review.getrContent()}</p>
										</div>
									</div>
								</c:forEach>

								<!--  
							<div class="swiper-slide">
								<div class="review_box">
									<p class="review_title">헬프미 후기2</p>
									<p class="review_writer">작성자 2</p>
									<p class="review_content">간단명료한 설명이라 너무 듣기 좋아요.. ㅎㅎ</p>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="review_box">
									<p class="review_title">헬프미 후기3</p>
									<p class="review_writer">작성자 3</p>
									<p class="review_content">반려견을 처음 키워서 걱정했는데 덕분에 많이 배워갑니다
										ㅠㅠㅠㅠ</p>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="review_box">
									<p class="review_title">헬프미 후기4</p>
									<p class="review_writer">작성자 4</p>
									<p class="review_content">자취할 때 유용한 요리법을 배웠어요!!</p>
								</div>
							</div>
							-->

							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Review list -->



	<%@ include file="../include/footer.jspf"%>