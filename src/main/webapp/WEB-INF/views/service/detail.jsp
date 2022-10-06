<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- Start main slider -->
<div id="carousel-example-generic"
	class="carousel slide edufair-slide carousel-fade" data-ride="carousel">
	<!-- Wrapper for slides -->
	<div class="carousel-inner edufair-inner single-inner" role="listbox">
		<div class="edufair-overlay">
			<img src="/resources/pages/images/service_readbg.png" alt="slide 1"
				class="edufair-slider-image edufair-single-image">
			<div class="carousel-caption edufair-caption edufair-single-caption">
				<div class="edufair-slider-middle">
					<div class="container edufair-slider-text">
							<h2 class="fadeInLeft">재능 거래 서비스</h2>
							<ol class="breadcrumb edufair-single-breadcrumbs">
								<li><a href="#">메인</a></li>
								<li><a href="#">헬퍼찾기</a></li>
							</ol>
						</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main slider -->
</div>

</div>



<div class="edufair-course-details-1x padding-top-large">
	<div class="container">
		<img alt="" src="displayFile?fileName=${service.getSAttach()}">
		<div class="row">
			<div class="col-md-9 sticky-body">
				<div class="row">
					<div class="col-md-12 course-details-title">
						<div class="col-md-4 course-teacher-details">
							<div class="media">
<!-- 								<div class="media-body"> -->
									<span class="service-detail-title">${service.getSName()}</span>
<!-- 								</div> -->
							</div>
						</div>
						<div class="col-md-8 course-details-price">
							<strong><span id="sPrice"><fmt:formatNumber value="${service.getPrice()}" pattern="###,###,###"/>
									</span>원</strong>
						</div>
					</div>
					<%-- 					<c:if test="${logIn.getUserId() != null} && service.getUserId() != logIn.getUserId() "> --%>
					<!-- <button id="purchase"
						style="width: 100%; height: 40px; border-color: #1EA69A; font-size: 16px; margin-bottom: 20px; font-family: 'GmarketSansMedium'; background: #fff;">서비스
						구매</button> -->
					<%-- 					</c:if> --%>
<!-- 					 && service.getUserId() != userId -->
<!-- 					 userId !=null -->
					<c:if test="${userId != null && service.userId != userId}">
					<div class="col-md-12">
						<button  id="check_module" type="button" class="btn-service-pay">
						결제하기</button>
					</div>
					</c:if>
					<div class="col-md-12 course-description">
						<ul class="nav nav-tabs nav-justified course-description-nav">
							<li class="active"><a href="#description" data-toggle="tab" class="service-detail-desc">
							<i class="fa fa-bookmark"></i>설명</a></li>
							<li class=""><a href="#review" data-toggle="tab">
							<i class="fa fa-comments"></i>리뷰</a></li>
						</ul>

						<div class="tab-content course-description-tab">
							<div class="tab-pane active fade in" id="description">
							<c:forEach var="attach" items="${serviceAttach}">
							<img alt="" src="displayAttach?fileName=${attach}">
							</c:forEach>
							
								<div class="row">
									<div class="col-md-12 course-description-tab-left sub-content">
										<p class="service-detail-con">${service.getSCon()}</p>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="review">
								<div class="review-tab">
									<p class="star margin-top-large"></p>
									<div class="review-tab-top">

										<div class="media rating"></div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="text-center padding-top-large">
												<nav class="course-pagination" aria-label="Page navigation">
													<ul class="pagination edufair-pagination">

													</ul>


												</nav>
											</div>
										</div>
									</div>

									<c:if test="${completeId}">
										<div class="btn-regist-wrap margin-bottom-middle">
										<button class="reviewBtn btn-review-regist"	data-toggle="modal" 
										data-target="#reviewModal">리뷰 등록</button>
										</div>
									</c:if>


								</div>
							</div>
						</div>
						<!--end of tab----->
					</div>


				</div>
			</div>

			<div class="col-md-3 sticky-sidebar">
				<div class="all-course">
					<h2>기타</h2>
					<ul>
						<li><i class="fa fa-eye"></i> 조회수 <span>
								${service.getViewCount()} </span></li>
						<li><i class="fa fa-thumbs-o-up like"></i> 좋아요<span id="likeVal">${service.getLikeIt()}
						</span></li>
						<li><i class="fa fa-credit-card"></i> 판매 횟수 <span id="sCountVal">
								${service.getSCount()} </span></li>
						<li style="padding-bottom:45px">
						<span class="likeService">
							<c:if test="${likeService}">
							<i class="fa fa-heart" id="likeService"></i>
							</c:if>
							<c:if test="${likeService == false}">
							<i class="fa fa-heart-o" id="likeService"></i>
							</c:if>
							찜하기
						</span>
								 
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</div>

<c:if test="${userId == service.getUserId()}">
	<p style="text-align: center">
		<button type="button"
			onclick="location.replace('modifyForm?sNo=${service.getSNo()}');"
			class="edufair-component-button button-large btn-service-modify">서비스 수정</button>
		&emsp;&emsp;&emsp;
		<button onclick="checkDel();"
			class="edufair-component-button button-large btn-service-delete">서비스 삭제</button>
	</p>
</c:if>

<div id="reviewModal" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content" style="color:black;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<input type="text" id="reviewId" name="reviewId"
						class="form-control" style="width:50px;" readonly>
				</h4>
			</div>
			<div class="modal-body" data-rno>
				<p>
					작성자:
					<input type="text" id="reviewWriter" name="reviewWriter"
						style="width:500px;color:black;" readonly>
						
				</p>
				<p>
					제목:&emsp;
						<input type="text" id="reviewTitle" name="reviewTitle" 
								placeholder="리뷰 제목을 적어주세요 (30자 이내)" style="width:500px;">
				</p>
				<p>
					리뷰:&emsp;
						<textarea id="reviewCon" name="reviewCon"
						placeholder="솔직한 리뷰 작성 부탁드립니다"  style="width:500px;height:200px;"></textarea>
				</p>
				<p>평점:&emsp;
						<input type="radio" id="reviewStar" name="reviewStar" value="1" checked="checked">1점
							&ensp;<input type="radio" id="reviewStar" name="reviewStar" value="2">2점
							&ensp;<input type="radio" id="reviewStar" name="reviewStar" value="3">3점
							&ensp;<input type="radio" id="reviewStar" name="reviewStar" value="4">4점
							&ensp;<input type="radio" id="reviewStar" name="reviewStar" value ="5">5점
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info reviewSave"
					id="reviewRegBtn">등록</button>
				<button type="button" class="btn btn-danger reviewModify"
					id="reviewModBtn">수정</button>
					<button type="button" class="btn btn-danger reviewDelete"
					id="reviewDelBtn">삭제</button>
				<button type="button" class="btn btn-default reviewClose"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

</div>
<script id="ratingTemplate" type="text/x-handlebars-template">
<div class="media" style="overflow:unset;">
<div class="media-left" style="width:25%; padding-right:30px;">

	<p class="starAvg" style="font-size:30px; text-align: center;">{{starAvg}}</p>
	<p  style="text-align: center;">
	<span class="starImg">
	</span>
	<p>
</div>

<div class="media-body">
<div class="review-progress-bar">
	<div class="single-progress-bar">
		<label>5 stars</label>
		<div class="progress">
			<div class="progress-bar" role="progressbar"
				aria-valuenow="100" aria-valuemin="0"
				aria-valuemax="100"
				style="width: {{fiveStar}}%;"></div>
		</div>

	</div>
	<div class="single-progress-bar">
		<label>4 stars</label>
		<div class="progress">
			<div class="progress-bar" role="progressbar"
				aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				style="width: {{fourStar}}%;"></div>
		</div>
	</div>
	<div class="single-progress-bar">
		<label>3 stars</label>
		<div class="progress">
			<div class="progress-bar" role="progressbar"
				aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				style="width: {{threeStar}}%;"></div>
		</div>
	</div>
	<div class="single-progress-bar">
		<label>2 stars</label>
		<div class="progress">
			<div class="progress-bar" role="progressbar"
				aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				style="width: {{twoStar}}%;"></div>
		</div>
	</div>
	<div class="single-progress-bar">
		<label>1 stars</label>
		<div class="progress">
			<div class="progress-bar" role="progressbar"
				aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				style="width: {{oneStar}};"></div>
		</div>
	</div>

</div>
</div>
</div>
</script>

<script id="reviewTemplate" type="text/x-handlebars-template">
{{#each .}}
<div class="instructors-tab" data-rno={{rboardId}}>

<div>제목: <span class="rTitle">{{rtitle}}</span></div>
<div>
평점: <b class="rRating">{{rating}}</b> 점
</div>
<div>내용: <span class="rCon" style="white-space: pre-line;">{{rcontent}}</span></div>
<h5>작성자: <span class="rUserId">{{userId}}</span></h5>

<p style="text-align: right">
<button id="modifyReview" class="btn-review-modify" data-toggle="modal" data-target="#reviewModal">리뷰 수정</button>
<button id="deleteReivew" class="btn-review-delete" data-toggle="modal" data-target="#reviewModal">리뷰 삭제</button>
</p>

</div>
{{/each}}

</script>



<script>
	var printStar = function(star, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(star);
		$(".media-left").remove();
		$(".media-body").remove();
		target.html(html);
	};
	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li class= fa fa-angle-left><a href='"
					+ (pageMaker.startPage - 1) + "'> << </a></li>";
		}
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}
		if (pageMaker.next) {
			str += "<li class=fa fa-angle-right><a href='"
					+ (pageMaker.endPage + 1) + "'> >> </a></li>";
		}
		target.html(str);
	};
	var printReview = function(review, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(review);
		$(".instructors-tab").remove();
		target.after(html);
		
		var star = $('.starAvg').html();
		if(parseInt(star)!=0){
			var starImg = "";
			for(var i=1;i<=parseInt(star);i++){
				starImg += "<i class='fa fa-star'></i>"
			}
			$('.starImg').html(starImg);
		}

	}

	var sNo = ${service.getSNo()};

	var reviewPage = 1;

	$(function() {
		$.getJSON("/review/${service.getSNo()}/1",function(data) {
					printStar(data.rating, $(".star"), $('#ratingTemplate'));
					printPaging(data.pageMaker, $(".pagination"));
					printReview(data.review, $(".review-tab-top"),
							$('#reviewTemplate'));
					console.log(data);

				});
	});

	function getPage(pageInfo) {

		$.getJSON(pageInfo,function(data) {

					printStar(data.rating, $(".star"), $('#ratingTemplate'));
					printPaging(data.pageMaker, $(".pagination"));
					printReview(data.review, $(".review-tab-top"),
							$('#reviewTemplate'));

					$("#reviewModal").modal('hide');
				});
	}
	
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		reviewPage = $(this).attr("href");
		
		getPage("/review/"+sNo+"/"+reviewPage);
		
	});
	

/* 	$("#purchase").on("click",function(){
		
		if (confirm("정말 구매하시겠습니까?")) {
			
			var price = $("#sCountVal").html();
			
			$.ajax({
				type:'post',
				url:'/service/'+sNo+'/'+price,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({sNo:sNo, price:price}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						parseInt(price);
						price++;
						$("#sCountVal").html(price);
						alert("구매 신청 되었습니다.");
					}else{
						alert("구매 신청된 회원입니다");
					}
			}});
		}
		
	}); */
	
	$(document).on('click','.instructors-tab',function(){    
		var review = $(this);
	
		$("#reviewId").val(review.attr("data-rno"));
		$("#reviewWriter").val(review.find('.rUserId').text());
		$("#reviewTitle").val(review.find('.rTitle').text());
		$("#reviewCon").val(review.find('.rCon').text());
		
		var star = review.find('.rRating').text();
		
		if(star=='1'){
			$("input:radio[name='reviewStar']:radio[value='1']").prop('checked', true);
		}
		else if(star=='2'){
			$("input:radio[name='reviewStar']:radio[value='2']").prop('checked', true);
		}
		else if(star=='3'){
		$("input:radio[name='reviewStar']:radio[value='3']").prop('checked', true);
		}
		else if(star=='4'){
		$("input:radio[name='reviewStar']:radio[value='4']").prop('checked', true);
		}
		else if(star=='5'){
		$("input:radio[name='reviewStar']:radio[value='5']").prop('checked', true);
		}
		

	});
	
	$(".reviewBtn").on("click",function(){
		
		$("#reviewId").val('');
		$("#reviewWriter").val("${userId}");
		$("#reviewTitle").val('');
		$("#reviewCon").val('');
		$("input:radio[name='reviewStar']:radio[value='1']").prop('checked', true);
		
		$(".modal-footer .btn").hide();
		$(".reviewSave , .reviewClose").show();

		document.getElementById("reviewTitle").readOnly = false;
		document.getElementById("reviewCon").readOnly = false;
		
		var radio=document.getElementsByName("reviewStar");
		 var len=radio.length;
		 for(var i=0;i<len;i++)
		 {
    		 radio[i].disabled=false;
		 }
		
	});
	
	$(document).on('click','#modifyReview',function(){    
		$(".modal-footer .btn").hide();
		$(".reviewModify, .reviewClose").show();

		document.getElementById("reviewTitle").readOnly = false;
		document.getElementById("reviewCon").readOnly = false;	
		
		var radio=document.getElementsByName("reviewStar");
 		 var len=radio.length;
 		 for(var i=0;i<len;i++)
 		 {
     		 radio[i].disabled=false;
 		 }
	});
	
	$(document).on('click','#deleteReivew',function(){    
		$(".modal-footer .btn").hide();
		$(".reviewDelete, .reviewClose").show();
		
		document.getElementById("reviewTitle").readOnly = true;
		document.getElementById("reviewCon").readOnly = true;
// 		$(':radio').click(function(){
// 		    return false;
// 		});
		var radio=document.getElementsByName("reviewStar");
  		 var len=radio.length;
  		 for(var i=0;i<len;i++)
  		 {
  			 if(radio[i].checked != true)
      		 radio[i].disabled=true;
  		 }
		
	});
		
	$("#reviewRegBtn").on("click",function(){
	
		var rTitle=$("#reviewTitle").val();
		var rContent= $('#reviewCon').val();
		var rating = $("#reviewStar:checked").val();

		$.ajax({
			type:'post',
			url:'/review/',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({sno:sNo, rtitle:rTitle, rcontent:rContent, rating:rating}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					reviewPage = 1;
					getPage("/review/"+sNo+"/"+reviewPage );
				}
		}});
		
	});
	
	$("#reviewDelBtn").on("click",function(){
		
		var reviewWriter = $('#reviewWriter').val();
		
		if(reviewWriter != "${userId}"){
			alert("본인의 리뷰가 아닙니다!");
			return;
		}
		
		var rNo = $("#reviewId").val();
		  
		  if (confirm("정말 삭제하시겠습니까?")) {
		 	 $.ajax({
				type:'delete',
				url:'/review/'+rNo,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/review/"+sNo+"/"+reviewPage );
					}
			}});
		  }
	});
	
	$("#reviewModBtn").on("click",function(){
		var reviewWriter = $('#reviewWriter').val();
		
		if(reviewWriter != "${userId}"){
			alert("본인의 리뷰가 아닙니다!");
			return;
		}
		
		var rBoardId = $("#reviewId").val();
		var review = {
				rboardId: rBoardId,
				rtitle:$("#reviewTitle").val(),
				rcontent:$("#reviewCon").val(),
				rating:$("#reviewStar:checked").val()
		}
		
		$.ajax({
			type:'put',
			url:'/review/'+rBoardId,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify(review), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					
					alert("수정 되었습니다.");
					$("#reviewModal").modal('hide');
					getPage("/review/"+sNo+"/"+reviewPage );
				}
		}});
	});
	
	$(".like").on("click",function(){
		
		var like = $("#likeVal").html();
		
		$.ajax({
			type:'put',
			url:'/service/'+sNo,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({sNo:sNo}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					parseInt(like);
					like++;
					$("#likeVal").html(like);
				}
		}});
	})
	
	function checkDel() {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.replace('remove?sNo=${service.getSNo()}');
		}
	};
	
	$(document).ready(function() {
		
		$("#check_module").click(function () {
			
			if (confirm("정말 구매하시겠습니까?")) {
				
				var price = $("#sCountVal").html();
				
				$.ajax({
					type:'post',
					url:'/service/'+sNo+'/'+price,
					headers: { 
					      "Content-Type": "application/json",
					      "X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data: JSON.stringify({sNo:sNo, price:price}),
					success:function(result){
						console.log("result: " + result);
						if(result == 'SUCCESS'){
							parseInt(price);
							price++;
							$("#sCountVal").html(price);
							alert("구매 신청 되었습니다. 결제를 진행해주세요");
							
							$.ajax({
								url:'/service/kakaopay',
								dataType:'json',
// 								data: JSON.stringify({sNo:sNo}),
								success:function(data){
// 								  alert(data.tid); //결제 고유 번호
								var box = data.next_redirect_pc_url;
								window.open(box); // 새창 열기
								},
									error:function(error){
									alert(error);
								}
							});
							
							
						}else{
							alert("구매 신청된 회원입니다");
						}
				}});

			};
		});
	});
	
	$(document).on('click','#likeService',function(){    
		var checkNum = 0;
		if($('#likeService').hasClass('fa-heart')){
			checkNum = 0;
		}else{
			checkNum = 1;
		}

		$.ajax({
			type:'put',
			url:'/service/likeService/'+sNo+'/'+checkNum,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					if(checkNum==0){
						$(".likeService").html('<i class="fa fa-heart-o"id="likeService"></i>찜하기');
					}else{
						$(".likeService").html('<i class="fa fa-heart"id="likeService"></i>찜하기');
					}
				}
				
		}});
	});
	
	
</script>



</body>



<%@ include file="../include/footer.jspf"%>