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
		<div class="row row-Comm comm-write-row">
			<form method="post" enctype="multipart/form-data"  action="modify">
				<input type="hidden" name="cBoardId" value="${list.cBoardId}">
				<table class="table  comm-write-table">
					<tr>
						<td>
							<input type="text" class="form-control" name="cBoardTitle" value="${list.cBoardTitle}" max-length="100" id="comm-write-title">
							<c:if test="${errors.cBoardTitle}">제목을 입력하세요.</c:if>
						</td>
					</tr>
					<tr>
						<td>
							<textarea class="form-control" name="cBoardCon" max-length="1000" value="${list.cBoardCon}" style="height:350px;">${list.cBoardCon}</textarea>
						</td>
					</tr>
					<tr>
						<td><input type="file" name="attachFile" style="font-size:1.0em;"></td>
					</tr>
				</table>
			<button type="button" class="edufair-component-button button-large pull-right" style="border:solid 1px #f1f1f1;"
			onclick="window.location.href='list'">목록으로</button>
			<button type="submit" class="edufair-component-button button-large pull-right" style="border:solid 1px #f1f1f1;">수정하기</button>
			</form>
		</div>
	</div>
</div>

<!-- 메인박스 끝 -->


<%@ include file="../include/footer.jspf"%>