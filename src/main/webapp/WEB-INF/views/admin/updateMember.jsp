<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/header.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-md-8" style="float: none; margin: 0 auto;">
		<div class="card">

			<div class="card-header">
				<br> <strong>회원정보 수정하기</strong>
			</div>

			<div class="card-body card-block">
				<form method="post" enctype="multipart/form-data"
					class="form-horizontal">


					<div class="row form-group">
						<div class="col col-md-3">
							<label for="userId" class=" form-control-label">ID</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" name="userId" readonly="readonly"
								value="${member.userId}" class="form-control">
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="userPw" class=" form-control-label">Password</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" name="userPw" value="${member.userPw}"
								class="form-control">
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="userEmail" class=" form-control-label">Email</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="email" id="email-input" name="userEmail"
								value="${member.userEmail}" class="form-control">
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="userName" class=" form-control-label">name</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="neme" name="userName"
								value="${member.userName}" class="form-control">
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="phone" class=" form-control-label">phone</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="phone-input" name="phone"
								value="${member.phone}" class="form-control">
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label class="gender">gender</label>
						</div>
						<div class="col col-md-9">
							<div class="form-check-inline form-check">
								<label for="inline-radio1" class="form-check-label "> <input
									type="radio" id="inline-radio1" name="gender" value="여"
									<c:if test="${member.gender eq '여'}">checked</c:if>>여
								</label> &nbsp; <label for="inline-radio2" class="form-check-label ">
									<input type="radio" id="inline-radio2" name="gender" value="남"
									<c:if test="${member.gender eq '남'}">checked</c:if>>남
								</label>
							</div>
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="address" class=" form-control-label">Address</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="password" name="address"
								value="${member.address}" class="form-control">
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="regDate" class=" form-control-label">regdate</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="password" name="redDate"
								value="${member.regDate}" pattern="yyyy- MM-dd"
								readonly="readonly" class="form-control">
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label class="accTerms">이용약관</label>
						</div>
						<div class="col col-md-9">
							<div class="form-check-inline form-check">
								<label for="inline-radio1" class="form-check-label "> <input
									type="radio" id="inline-radio1" name="accTerms" value="Y"
									<c:if test="${member.accTerms eq 'Y'}">checked</c:if>>Yes
								</label> &nbsp; <label for="inline-radio2" class="form-check-label ">
									<input type="radio" id="inline-radio2" name="accTerms"
									value="N" <c:if test="${member.accTerms eq 'N'}">checked</c:if>>
									No
								</label>
							</div>
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label class="sms">Sms</label>
						</div>
						<div class="col col-md-9">
							<div class="form-check-inline form-check">
								<label for="inline-radio1" class="form-check-label "> <input
									type="radio" id="inline-radio1" name="sms" value="Y"
									<c:if test="${member.sms eq 'Y'}">checked</c:if>>Yes
								</label> &nbsp; <label for="inline-radio2" class="form-check-label ">
									<input type="radio" id="inline-radio2" name="sms" value="N"
									<c:if test="${member.sms eq 'N'}">checked</c:if>> No
								</label>
							</div>
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="userRank" class=" form-control-label">Rank</label>
						</div>
						<div class="col-12 col-md-9">
							<select name="userRank" id="select" class="form-control">

								<option value="0"
									<c:if test="${member.userRank=='0' }">selected </c:if>>0</option>
								<option value="1"
									<c:if test="${member.userRank=='1' }">selected </c:if>>1</option>
								<option value="2"
									<c:if test="${member.userRank=='2' }">selected </c:if>>2</option>
								<option value="9"
									<c:if test="${member.userRank=='9'}">selected </c:if>>운영자</option>
							</select>
							<div class="card-footer">
								<button type="submit" class="ffa-check">Submit</button>
							<button type="button" class=" ffa-check"
									onclick="window.location.href='deleteMember?userId=${member.userId}'">Delete</button>													
								<button type="button" class=" ffa-check"
									onclick="window.location.href='/admin/memberList'">List</button>
							</div>
						</div>
					</div>
			</div>

			</form>		
		</div>

	</div>

</div>











<%@ include file="../admin/footer.jspf"%>