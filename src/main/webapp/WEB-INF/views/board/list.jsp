<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags" %>
<%@ include file="../include/header.jspf"%>

<script type="text/javascript">
	$(function(){
		$(".dataRow-Comm").click(function(){
			var no = $(this).find(".commBoardId").text();
			location = "view?cBoardId=" + no;
		});
	});
</script>

<!-- Start main slider -->
<div id="carousel-example-generic" class="carousel slide edufair-slide carousel-fade margin-bottom-large" data-ride="carousel">
	<!-- Wrapper for slides -->
	<div class="carousel-inner edufair-inner single-inner" role="listbox">
		<div class="edufair-overlay">
			<img
					src="<%=request.getContextPath()%>/resources/pages/images/sample_bg02.jpg"
					alt="slide 1" class="edufair-slider-image edufair-single-image">
			<div class="carousel-caption edufair-caption edufair-single-caption">
				<div class="edufair-slider-middle">
					<div class="container edufair-slider-text">
						<h2 class="fadeInLeft">커뮤니티</h2>
						<ol class="breadcrumb edufair-single-breadcrumbs">
							<li><a href="#">Home</a></li>
							<li><a href="#">커뮤니티</a></li>
							<li class="active">커뮤니티 리스트</li>
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
			<table class="table table-Comm">
				<tr class="colRow-Comm">
					<th class="colNum-Comm">No</th>
					<th class="colTitle-Comm">제목</th>
					<th class="colUser-Comm">작성자</th>
					<th class="colDate-Comm">작성일</th>
				</tr>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${! empty list}">
					<c:forEach items="${list}" var="list">
						<tr class="dataRow-Comm">
							<td class="dataNum-Comm commBoardId"><c:out value="${list.cBoardId}" /></td>
							<td class="dataTitle-Comm"><c:out value="${list.cBoardTitle}" /></td>
							<td class="dataUser-Comm"><c:out value="${list.userId}" /></td>
							<td class="dataDate-Comm"><fmt:formatDate value="${list.cRegdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-6">
					<pageObject:pageNav pageObject="${pageObject}" listURI="list" />
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<button type="button" class="edufair-component-button button-large pull-right" style="border:none;"
					onclick="window.location.href='write'">글쓰기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 메인박스 끝 -->


<%@ include file="../include/footer.jspf"%>