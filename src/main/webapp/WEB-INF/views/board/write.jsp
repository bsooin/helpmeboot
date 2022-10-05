<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

<%@ include file="../include/header.jspf"%>

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
							<li class="active">글쓰기</li>
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
	<div class="container">
		<div class="row comm-write-row">
			<form method="post" enctype="multipart/form-data" action="write">
			
			<input type="hidden" name="cboardId" value="${list.cBoardId}">
			<input type="hidden" name="userId" value="${list.userId}">
			<input type="hidden" name="cregdate" value="${list.cRegdate}">
			<table class="table comm-write-table">
				<tr>
					<td><input type="text" class="form-control" placeholder="제목" name="cBoardTitle" max-length="100" id="comm-write-title"></td>
				</tr>
				<tr>
					<td><textarea class="form-control" placeholder="내용" name="cBoardCon" max-length="1000" style="height:350px;"></textarea></td>
				</tr>
				<tr>
					<td><input type="file" name="attachFile" style="font-size:1.0em;"></td>
				</tr>
			</table>
			<button type="button" class="edufair-component-button button-large pull-right" style="border:solid 1px #f1f1f1;"
			onclick="window.location.href='list'">목록으로</button>
			<button type="submit" class="edufair-component-button button-large pull-right" style="border:solid 1px #f1f1f1;">작성하기</button>
			</form>
		</div>
	</div>
</div>

<!-- 메인박스 끝 -->


<%@ include file="../include/footer.jspf"%>