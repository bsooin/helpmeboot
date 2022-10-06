<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<body class="admission-apply-1x">


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
							<h2 class="fadeInLeft"></h2>
							<ol class="breadcrumb edufair-single-breadcrumbs">
								<li><a href="#">Home</a></li>
								<li><a href="#">update service</a></li>
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

		<h2 class="edufair-main-title">재능 등록</h2>

		<form method="post" enctype="multipart/form-data"
			onsubmit="return false" action="newService" id="newService">

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="boardInsert">
				<colgroup>
					<col width="160">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>* 카테고리</th>
						<td><select name="categoryNo" style="width: 150px;">
								<option value="1">디자인/그래픽</option>
								<option value="2">컴퓨터/개발</option>
								<option value="3">음악/영상</option>
								<option value="4">생활/노하우</option>
								<option value="5">번역/외국어</option>
								<option value="6">주문제작</option>
						</select>
					</tr>
					<tr>
						<th>* 재능 제목</th>
						<td><input type="text" name="sName" style="width: 80%;"
							value="" maxlength="30" placeholder="예) 나만의 재능" required><div>(70자
								이내)</div></td>
					</tr>
					<tr>
						<th>* 재능가격</th>
						<td><input type="text" name="price"
							style="width: 80px; text-align: right;" value="" maxlength="7"
							onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required>원</td>
					</tr>


					<tr>
						<th>* 메인이미지 등록</th>
						<td><input type="file" name="attachFile" style="width: 50%;">
							<p>* 메인 이미지는 나의 재능을 가장 잘 표현할 수 있는 대표 이미지로 설정합니다.(이미지 파일만
								가능합니다.)</p></td>
					</tr>
					<tr>
						<th>* 상세이미지 등록</th>
						<td><input type="file" name="detailFile" style="width: 50%;">
							<input type="file" name="detailFile" style="width: 50%;">
							<input type="file" name="detailFile" style="width: 50%;">
						</td>
					</tr>
					<tr>
						<th>* 재능상세내용</th>
						<td>
							<textarea id="sCon" name="sCon" 
							placeholder="본인의 재능을 최대한 자세하게 설명합니다. 구매자가 읽고 어떤 재능인지 쉽게 파악할 수 있도록 작성해주세요."  
							style="width: 90%; height: 400px;" required></textarea>
						</td>
					</tr>
					<tr>
						<th>* 작성자</th>
						<td><input type="text" name="userId" value="${userId}"
							readonly></td>
					</tr>

				</tbody>
			</table>


		</form>
		<div style="text-align: center; margin-top: 30px;">
			<button class="edufair-component-button button-large"
				onclick="document.getElementById('newService').submit();"
				type="submit" style="border: solid 1px #eaeaea;">재능 등록 신청</button>
		</div>

		<%@ include file="../include/footer.jspf"%>