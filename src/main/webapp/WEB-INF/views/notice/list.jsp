<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				alt="slide 1" class="edufair-slider-image edufair-single-image">
			<div class="carousel-caption edufair-caption edufair-single-caption">
				<div class="edufair-slider-middle">
					<div class="container edufair-slider-text">
						<h2 class="fadeInLeft">공지사항</h2>
						<ol class="breadcrumb edufair-single-breadcrumbs">
							<li><a href="#">Home</a></li>
							<li><a href="#">고객센터</a></li>
							<li class="active">공지사항</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End main slider -->

<!-- Start Notice Board -->
<%-- <div class="university-1x">
	<div class="edufair-events-1x">
		<div class='box-body'>
			<select name="searchType">
				<option value="n"
					<c:out value="${pageMaker.cri.searchType eq 'n 'selected':''}"/>>
					공지사항</option>
				<option value="e"
					<c:out value="${pageMaker.cri.searchType eq 'e'?'selected':''}"/>>
					이벤트</option>
			</select> <input type="text" name='keyword' id="keywordInput"
				value='${pageMaker.cri.keyword }'>
			<button id='searchBtn'>Search</button>
		</div>
	</div>
</div> --%>

<div class="university-1x">
	<div class="edufair-events-1x">
		<div class="container">
			<div class="row">
				<c:forEach items="${list}" var="noticeVO">
				<div class="event-container-1x">
					<div class="col-md-8">
						<div class="single-events-1x">
							<div class="media">
								<div class="media-left media-middle">
									<b>${noticeVO.noticeId}</b>

								</div>
								
								<div class="media-body">
									<h4 class="media-heading">${noticeVO.noticeTitle}</h4>
									<div class="event-schedule">
										<i class="fa fa-file-o"></i> ${noticeVO.noticeCat}
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="single-events-image-1x">
							<div class="btn-notice-right">
								<a class="edufair-btn-larg notice-read-more"
								href= "${path}/notice/read?noticeId=${noticeVO.noticeId}">read more</a>

							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>


			<div class="row">
				 <div class="col-md-12"> 
				
					<!-- 관리자만 보이기 추후에 넣기-->    
				 	<button class="edufair-component-button button-large margin-bottom-middle" type="button"
								onclick="location.href='/notice/register'">글쓰기</button>
	
	
					<div class="text-middle padding-bottom-middle">
						<ul class="pagination edufair-pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								<i class="fa fa-angle-left"></i>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>									
						</ul>		
					</div>
       			</div>			
			</div>  
		</div>			
	</div>
</div>


<%@ include file="../include/footer.jspf"%>