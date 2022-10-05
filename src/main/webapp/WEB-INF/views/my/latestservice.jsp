<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!-- 여기서 부터 수정 -->
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
							<li class="active">최근 본 서비스</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main slider -->
</div>

<!-- 메인박스 -->

<c:if test="${ member == null }">
	<script>
		alert("로그인 후 이용해 주세요.");
		location.href = "/main/login";
	</script>
</c:if>

<div class="container">
	<div class="row margin-top-middle padding-side-small">
	<h2 class="edufair-main-title">최근 본 서비스</h2>
	<div class="padding-top-large" style="padding-top: 10px">
		<!-- div 추가 -->

	</div>
	<c:if test="${empty list}">
		<strong>최근 본 서비스가 없습니다.</strong>
		<br />
		<button class="edufair-component-button button-medium" type="button"
			onclick="goBack()">뒤로가기</button>
	</c:if>
	<script>
		function goBack() {
			window.history.go(-1);
		}
	</script>
	<div class="row padding-top-middle">

		<%-- 		<%@ page import="java.util.ArrayList" %>
		
		<%			ArrayList<String> list = (ArrayList) session.getAttribute("productlist");			
					for (int i = 0; i < list.size(); i++) {				
					out.println(list.get(i) + "<br>");			
					}		%> --%>
		
		<c:forEach var="service" items="${list}">
				<div class="col-md-3">
					<div class="edufair-related-course">
						<div class="edufair-related-course-overlay">
								 <img alt="" src="displayFile?fileName=${service.getSAttach()}">
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
								<a href="/service/detail?sNo=${service.getSNo()}" class="">
										<h4 class="media-heading">${service.getSName()} </h4>  
										<span>${service.getSCon()}</span> 
									</a>
								</div>
								</div>
							<a href="/service/detail?sNo=${service.getSNo()}"  class="">
							<h3>${dealVO.getsCon()}</h3>
							<p><fmt:formatNumber value="${service.getPrice()}" pattern="###,###,###"/>원</p>								
							</a>
							<div class="course-review">
							<p><fmt:formatDate pattern="yyyy-MM-dd "
							value="${service.getSRegdate()}" /></p>

								<a href="#" class="">
								
									<%-- <c:forEach var="i" begin="1" end="${dealVO.getRating()}" step="1">
															<i class="fa fa-star"></i>
														</c:forEach>  --%>
								
								</a>
							</div>
							<div class="related-course-footer">
								<i class="fa fa-users"></i> <span><fmt:formatNumber value="${service.getViewCount()}" pattern="###,###,###"/></span>
								<i class="fa fa-heart"></i> <span><fmt:formatNumber value="${service.getLikeIt()}" pattern="###,###,###"/></span> 
								<strong><fmt:formatNumber value="${service.getPrice()}" pattern="###,###,###"/>원</strong>
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
								href="latestservice${pageMaker.makeSearch1(pageMaker.startPage - 1) }&userId=${member.userId}"
								aria-label="Previous">&laquo;<i class="fa fa-angle-left"></i></a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">

							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a
								href="latestservice${pageMaker.makeSearch1(idx)}&userId=${member.userId}">${idx}</a>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="latestservice${pageMaker.makeSearch1(pageMaker.endPage +1) }&userId=${member.userId}"
								aria-label="Next">&raquo;<i class="fa fa-angle-right"></i></a></li>
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





<!-- 메인박스 끝 -->

<%@ include file="../include/footer.jspf"%>