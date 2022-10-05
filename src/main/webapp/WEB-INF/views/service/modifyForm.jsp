<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<body class="admission-apply-1x">


			<!-- Start main slider -->
			<div id="carousel-example-generic"
				class="carousel slide edufair-slide carousel-fade"
				data-ride="carousel">
				<!-- Wrapper for slides -->
				<div class="carousel-inner edufair-inner single-inner"
					role="listbox">
					<div class="edufair-overlay">
						<img src="/resources/pages/images/service_readbg.png" alt="slide 1"
							class="edufair-slider-image edufair-single-image">
						<div
							class="carousel-caption edufair-caption edufair-single-caption">
							<div class="edufair-slider-middle">
								<div class="container edufair-slider-text">
									<h2 class="fadeInLeft">서비스 수정</h2>
									<ol class="breadcrumb edufair-single-breadcrumbs">
										<li><a href="#">Home</a></li>
										<li><a href="#">서비스 수정</a></li>
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
		
			<h2 class="edufair-main-title">재능 수정</h2>
			
			<form method="post" enctype="multipart/form-data" action="modifyForm" onsubmit="return false" id="modifyService">
				<input type="hidden" name="sNo" value="${service.getSNo()}">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="boardInsert">
					<colgroup>
						<col width="160">
						<col width="*">
					</colgroup>
					<tbody class="service_form">
						<tr>
							<th>* 카테고리</th>
							<td><select name="categoryNo" style="width: 150px; height:30px; font-size: 13px; text-indent: 7px;" value="${service.getCategoryNo()}">
									
									<option value="1" <c:if test="${service.categoryNo eq 1}">selected</c:if>>디자인/그래픽</option>
									<option value="2" <c:if test="${service.categoryNo eq 2}">selected</c:if>>컴퓨터/개발</option>
									<option value="3" <c:if test="${service.categoryNo eq 3}">selected</c:if>>음악/영상</option>
									<option value="4" <c:if test="${service.categoryNo eq 4}">selected</c:if>>생활/노하우</option>
									<option value="5" <c:if test="${service.categoryNo eq 5}">selected</c:if>>번역/외국어</option>
									<option value="6" <c:if test="${service.categoryNo eq 6}">selected</c:if>>주문제작</option>
									
							</select> 
							
						</tr>
						<tr>
							<th>* 재능 제목</th>
							<td><input type="text" name="sName" style="width: 80%;"
								value="${service.getSName()}" maxlength="30"
								placeholder=""><div>(70자 이내)</div></td>
						</tr>
						<tr>
							<th>* 재능 가격</th>
							<td><input type="text" name="price"
								style="width: 80px; text-align: right;"value="${service.getPrice()}"
								maxlength="7" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">원</td>
						</tr>

						<tr>
						<th>* 현재 이미지</th>
						<td><img src="displayFile?fileName=${service.getSAttach()}" style="width:90%"></td>
						</tr>
						<tr>
							<th>* 수정할 메인 이미지 등록</th>
							<td><input type="file" name="attachFile"
								style="width: 20%;" value="${service.getSAttach()}">
								<p>* 메인 이미지는 나의 재능을 가장 잘 표현할 수
									있는 대표 이미지로 설정합니다.(이미지 파일만 가능합니다.)</p></td>
						</tr>
						
						<c:if test="${serviceAttach!=null}">
						<tr>
						<th>* 현재 상세 이미지</th>
						<td>
						<c:forEach var="attach" items="${serviceAttach}">
						<img src="displayAttach?fileName=${attach}" style="width:50%">
						</c:forEach>
						</td>
						</tr>
						</c:if>
						
						<tr>
							<th>* 수정할 상세 이미지 등록</th>
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
							style="width: 90%; height: 400px; white-space: pre-line;" required>${service.getSCon()}</textarea>
							</td>
						</tr>
					
					</tbody>
				</table>
				
			</form>
			<div style="text-align:center; margin-top:30px;">
					<button class="edufair-component-button button-large" onclick="document.getElementById('modifyService').submit();" type="submit" style="border:solid 1px #eaeaea;">재능 수정하기</button>
				</div>

		</div>




	<%@ include file="../include/footer.jspf" %>