<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
							<li class="active">Q&A</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main slider -->
</div>

<!-- 메인박스 -->

<!-- Start Notice Board -->

<div class="container">
	<div class="row">
		<!-- div 추가 -->
		<div class="padding-top-large" style="padding-top: 10px">
			<h2 class="edufair-main-title">Q&A</h2>
			<c:if test="${empty block}">
				문의한 내용이 없습니다.
			<a href="/my/mypage">[뒤로가기]</a>
	<!-- redirect를 해야할 것 같은데.. -->
			</c:if>
			
			<table class="type1">
				<tr>
					<!-- <th>번호</th> -->
					<th>제목</th>
					<th>내용</th>
					<th>문의일자</th>
					<th>답변</th>
					<th>답변일자</th>
					<th>회원id</th>
				</tr>
				<c:forEach items="${qna}">
					<tr>
						<%-- <td>${qnaPage.qnaNo}</td> --%>
						<td>${qna.qnaTitle}</td>
						<td>${qna.qnaCon}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${qna.qnaDate}" /></td>
						<td>${qna.qnaAnswerCon}</td>
						<td>${qna.qnaAnswerDate}</td>
						<td>${qna.userId}</td>
					</tr>

				</c:forEach>
			</table>
			<%-- <div class="box-footer">

				<div class="text-center">
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
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

			</div> --%>

			<!-- /.box-footer-->



			<!-- <c:if test="${qna.hasQna()}">
				<tr>
					<td colspan="4"><c:if test="${qnaPage.startPage > 5}">
							<a href="list.do?pageNo=${qnaPage.startPage - 5}">[이전]</a>
						</c:if> <c:forEach var="pNo" begin="${qnaPage.startPage}"
							end="${qnaPage.endPage}">
							<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
						</c:forEach> <c:if test="${qnaPage.endPage < qnaPage.totalPages}">
							<a href="list.do?pageNo=${qnaPage.startPage + 5}">[다음]</a>
						</c:if></td>
				</tr>
			</c:if>
			</table> -->
			
			
		</div>
	</div>
</div>

<!-- End Notice Board -->






<!-- 메인박스 끝 -->

<%@ include file="../include/footer.jspf"%>