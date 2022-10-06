<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jspf"%>

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
							<li class="active">차단/신고</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main slider -->
</div>


				
<!-- 메인박스 -->


<div class="online-course-category-1x  margin-bottom-large">
	<div class="container">
		<div class="row">
			<h2 class="edufair-main-title" style="text-align: left">나의 차단 list</h2>

			<h3>차단</h3>
			
			<c:if test="${empty block}">
			차단한 id가 없습니다..<br/>
					<a href="/my/mypage">[뒤로가기]</a>
					<!-- redirect를 해야할 것 같은데.. -->
			</c:if>
			
			<c:forEach items="${block}" var="block" >
				<table  class="type1">
					<tr>
						<th>차단한 ID</th>
						<td>${block.getBlockId()}</td>
					</tr>
					<tr>
						<th>차단 사유</th>
						<td>${block.getBlockCon()}</td>
					</tr>
					<tr>
						<th>차단 일자</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd "
							value="${block.getBlockDate()}" /></td>
					</tr>

				</table>
			</c:forEach>
			
<!-- 페이징 -->
		<!-- <div class="row"> -->
			<div class="col-md-12">
				<div class="text-center padding-top-large">
					<nav class="course-pagination" aria-label="Page navigation">
						 <ul class="pagination edufair-pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="myblock${pageMaker.makeSearch1(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;<i class="fa fa-angle-left"></i></a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">

							<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="myblock${pageMaker.makeSearch1(idx)}">${idx}</a>

						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="myblock${pageMaker.makeSearch1(pageMaker.endPage +1) }" aria-label="Next">&raquo;<i class="fa fa-angle-right"></i></a></li>
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