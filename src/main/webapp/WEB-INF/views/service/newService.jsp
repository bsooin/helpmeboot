<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>


	<!-- Start main slider -->
	<div id="carousel-example-generic"
		class="carousel slide edufair-slide carousel-fade"
		data-ride="carousel">
		<!-- Wrapper for slides -->
		<div class="carousel-inner edufair-inner single-inner" role="listbox">
			<div class="edufair-overlay">
				<img src="/resources/pages/images/writebg.jpg"
					class="edufair-slider-image edufair-single-image">
				<div class="carousel-caption edufair-caption edufair-single-caption">
					<div class="edufair-slider-middle">
						<div class="container edufair-slider-text">
							<h2 class="fadeInLeft">헬퍼찾기</h2>
							<ol class="breadcrumb edufair-single-breadcrumbs">
								<li><a href="../main/index">Home</a></li>
                                <li><a href="/service/list">헬퍼찾기</a></li>
                                <li class="active">서비스 등록</a></li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End main slider -->
	</div>

	</div>


	<!-- Start edufair About University -->

	<div class="container">

		<h2 class="edufair-main-title" style="margin-top:40px;">재능 등록</h2>

		<form method="post" enctype="multipart/form-data"
			onsubmit="return false" action="newService" id="newService">

			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="boardInsert svc-table">
					<tr>
						<th>카테고리</th>
						<td><select name="categoryNo" class="svc-form-select">
								<option value="1">디자인/그래픽</option>
								<option value="2">컴퓨터/개발</option>
								<option value="3">음악/영상</option>
								<option value="4">생활/노하우</option>
								<option value="5">번역/외국어</option>
								<option value="6">주문제작</option>
						</select>
					</tr>
					<tr>
						<th>재능 제목</th>
						<td><input type="text" name="sName" value="" maxlength="30" placeholder="예) 나만의 재능" required
						class="svc-input-title"><span>&nbsp;(70자 이내)</span></td>
					</tr>
					<tr>
						<th>재능 가격</th>
						<td><input type="text" name="price" class="svc-input-price" value="" maxlength="7"
							onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required>&nbsp;원</td>
					</tr>


					<tr>
						<th>메인 이미지 등록</th>
						<td><input type="file" name="attachFile" class="svc-input-img" style="display:inline-block;">
							<span class="svc-img-desc">* 메인 이미지는 나의 재능을 가장 잘 표현할 수 있는 대표 이미지로 설정합니다. (이미지 파일만
								가능합니다.)</span></td>

					</tr>
					<tr>
						<th>상세 이미지 등록</th>
						<td><input type="file" name="detailFile" class="svc-input-img">
							<input type="file" name="detailFile" class="svc-input-img">
							<input type="file" name="detailFile" class="svc-input-img">
						</td>
					</tr>
					<tr>
						<th>재능 상세 내용</th>
						<td>
							<textarea id="sCon" name="sCon" class="svc-form-detail-con"
							placeholder="본인의 재능을 최대한 자세하게 설명합니다. 구매자가 읽고 어떤 재능인지 쉽게 파악할 수 있도록 작성해주세요." required></textarea>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="userId" value="${userId}"
							readonly></td>
					</tr>

			</table>


		</form>
		<div style="text-align: center; margin-top: 30px;">
			<button class="edufair-component-button button-large"
				onclick="document.getElementById('newService').submit();"
				type="submit" style="font-size:16px;">서비스 등록 신청</button>
		</div>
		</div>

		<%@ include file="../include/footer.jspf"%>