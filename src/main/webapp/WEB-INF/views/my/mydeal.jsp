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
							<li class="active">거래 내역</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main slider -->
</div>

<!-- 메인박스 -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 리스트 -->
<div class="online-course-category-1x  margin-bottom-large">
<div class="container">
	<div class="row margin-top-middle padding-side-small">
		<h2 class="edufair-main-title"  style="text-align: left">나의 거래 내역</h2>
		<c:if test="${empty deal}">
		<strong>거래 내역이 없습니다.</strong><br />
			<button class="edufair-component-button button-medium" type="button"
					onclick="goBack()">뒤로가기</button>
			</c:if>
			<script>
				function goBack() {
					window.history.go(-1);
				}
			</script>


	<c:forEach items="${deal}" var="dealVO">
				<div class="col-md-3">
					<div class="edufair-related-course">
						<div class="edufair-related-course-overlay">
								   <!--  나중에 첨부파일 완성되면 경로 다시 수정하기  -->
							<%-- <img
								src="<%=request.getContextPath()%>/resources/pages/images/main/best_img02.png"
								alt="Avatar" class="edufair-related-course-image"> --%>
								<img alt="" src="displayFile?fileName=${dealVO.getsAttach()}">
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
								<a href="/service/detail?sNo=${dealVO.getsNo()}" class="">
										<h4 class="media-heading">${dealVO.getsName()} </h4>  
										<span>${dealVO.getsCon()}</span> 
									</a>
								</div>
								</div>
							<a href="/service/detail?sNo=${dealVO.getsNo()}"  class="">
							<h3>${dealVO.getsCon()}</h3>
							<p><fmt:formatNumber value="${dealVO.getPrice()}" pattern="###,###,###"/>원</p>								
							</a>
							<div class="course-review">
							<p><fmt:formatDate pattern="yyyy-MM-dd "
							value="${dealVO.getdDate()}" /></p>

								<a href="#" class="">
								
									<%-- <c:forEach var="i" begin="1" end="${dealVO.getRating()}" step="1">
															<i class="fa fa-star"></i>
														</c:forEach>  --%>
								
								</a>
							</div>
							<div class="related-course-footer">
								<i class="fa fa-users"></i> <span><fmt:formatNumber value="${dealVO.getViewCount()}" pattern="###,###,###"/></span>
								<i class="fa fa-heart"></i> <span><fmt:formatNumber value="${dealVO.getLikeIt()}" pattern="###,###,###"/></span> 
								<strong><fmt:formatNumber value="${dealVO.getPrice()}" pattern="###,###,###"/>원</strong>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>


		<!-- 리스트 끝 -->

		<!-- 페이징 -->
		<!-- <div class="row"> -->
			<div class="col-md-12">
				<div class="text-center padding-top-large">
					<nav class="course-pagination" aria-label="Page navigation">
						 <ul class="pagination edufair-pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="mydeal${pageMaker.makeSearch1(pageMaker.startPage - 1) }&userId=${member.userId}" aria-label="Previous">&laquo;<i class="fa fa-angle-left"></i></a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">

							<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="mydeal${pageMaker.makeSearch1(idx)}&userId=${member.userId}">${idx}</a>

						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="mydeal${pageMaker.makeSearch1(pageMaker.endPage +1) }&userId=${member.userId}" aria-label="Next">&raquo;<i class="fa fa-angle-right"></a></li>
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


<!-- 메인박스 끝 -->

<%@ include file="../include/footer.jspf"%>