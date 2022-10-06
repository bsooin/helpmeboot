<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>

<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Preloader -->
	<div id="fakeloader"></div>

	<!-- Start main slider -->
	<div id="carousel-example-generic"
		class="carousel slide edufair-slide carousel-fade"
		data-ride="carousel">
		<!-- Wrapper for slides -->
		<div class="carousel-inner edufair-inner single-inner" role="listbox">
			<div class="edufair-overlay">
				<img src="/resources/pages/images/servicebackground.png"
					alt="slide 1" class="edufair-slider-image edufair-single-image">
				<div class="carousel-caption edufair-caption edufair-single-caption">
					<div class="edufair-slider-middle">
						<div class="container edufair-slider-text">
							<h2 class="fadeInLeft">헬퍼찾기</h2>
							<ol class="breadcrumb edufair-single-breadcrumbs">
								<li><a href="#">Home</a></li>
								<li><a href="#">헬퍼찾기</a></li>
								<li><a href="#">헬퍼 리스트</a></li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End main slider -->
	</div>

	</div>

	<div class="online-course-category-1x  margin-top-small margin-bottom-middle">
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



	</div>
<div class="container wow fadeIn">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="padding-top-large padding-top-extra-small">
					<div class="col-md-3 shop-category service-search">
						<div class="search-position">
						<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
						<button id="keySearch">검색</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		

	<!-- Start shop -->
	<div class="container wow fadeIn">
		<!-- Start Container -->
		<div class="row">
			<div class="col-md-12">

				<div class="row">
					<div class="padding-top-large padding-top-middle">
						<div class="col-md-3 shop-category service-filter">
							<form>
								<div class="form-group">
									<select class="form-control" name="orderType" id="orderType">
										<option value="lastest"
											<c:if test="${pageMaker.cri.orderType eq 'lastest'}">selected</c:if>>최신순</option>
										<option value="sCount"
											<c:if test="${pageMaker.cri.orderType eq 'sCount'}">selected</c:if>>판매순</option>
										<option value="viewCount"
											<c:if test="${pageMaker.cri.orderType eq 'viewCount'}">selected</c:if>>조회순</option>
										<option value="price"
											<c:if test="${pageMaker.cri.orderType eq 'price'}">selected</c:if>>가격순</option>
										<option value="likeIt"
											<c:if test="${pageMaker.cri.orderType eq 'likeIt'}">selected</c:if>>좋아요순</option>
									</select>

								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="row padding-top-middle">
					<c:forEach var="service" items="${list}">
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="edufair-shop-container">
								<a class="uploadedService"
									href="detail?sNo=${service.getSNo()}">
								
							<img src="displayFile?fileName=${service.getSAttach()}" class="edufair-shop-image">
							</a>
							</div>
							<div class="edufair-shop-item-text">
								<a href="detail?sNo=${service.getSNo()}">${service.getSName()}</a>
								<p><fmt:formatNumber value="${service.getPrice()}" pattern="###,###,###"/>&nbsp;원</p>

							</div>
						</div>
						</c:forEach>
				</div>


				<div class="row">
					<div class="col-md-12">
						<div class="text-center padding-top-large">
							<nav class="course-pagination" aria-label="Page navigation">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">

									
									<a href="list${pageMaker.makeSearch(idx)}" 
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}" />>${idx}</a>

								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</nav>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End Shop -->
	<c:if test="${userId != null}">
		<div class="container">
			<div class="row">
				<div class="col-md-12" style="text-align: center;">
					<div class="edufair-component-button button-large margin-top-small">
						<a id="btn-service-regist" href="newService">서비스 등록</a>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<script>
		// 처리 완료
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
			location.replace(self.location);
		}
		

 			// 정렬 카테고리 검색
		function serviceListOrder(catNo){
		 	self.location = "list?" + "&categoryNo=" + catNo;
		};
		
		$("#keySearch").on("click",function(){
			self.location.href = "list"
				+ '${pageMaker.makeQuery(1)}'
				+ "&categoryNo=${pageMaker.cri.categoryNo}"
				+ "&orderType=" + $("select option:selected").val()
				+ "&keyword=" + $('#keyword').val();
		});
		
		$("#orderType").change(function(){
			self.location.href = "list"
				+ '${pageMaker.makeQuery(1)}'
				+ "&categoryNo=${pageMaker.cri.categoryNo}"
				+ "&orderType=" + $("select option:selected").val()
				+ "&keyword=" + $('#keyword').val();
		});
		


	</script>


	<%@ include file="../include/footer.jspf"%>