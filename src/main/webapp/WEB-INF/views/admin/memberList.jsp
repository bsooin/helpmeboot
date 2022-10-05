<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<title>회원관리 홈</title>
<%@ include file="../admin/header.jspf"%>

<div class="content">

	<div class="col-md-11"  style="float: none; margin:0 auto;">
		<div class="animated fadeIn">
			<div class="row">

				<div class="col-md-8"  style="float: none; margin:0 auto;">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Data Table</strong>
						</div>

						<!--					<label>Show <select name="bootstrap-data-table_length"
											aria-controls="bootstrap-data-table"
											class="form-control form-control-sm">
												<option value="10">10</option>
												<option value="20">20</option>
												<option value="50">50</option>
												<option value="-1">All</option></select></label>
									</div>
								</div>
								
									<div id="bootstrap-data-table_filter" class="dataTables_filter">
										<label>Search:<input type="search"
											class="form-control form-control-sm" placeholder=""
											aria-controls="bootstrap-data-table"></label>
									</div>
								</div>
							</div>    -->

						<br>

						<div class="row">
							<div class="col-12">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered dataTable no-footer"
									role="grid" aria-describedby="bootstrap-data-table_info">


									<thead>

										<tr role="row">
											<th class="sorting_asc" tabindex="0"
												aria-controls="bootstrap-data-table" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Name: activate to sort column descending"
												style="width: 100px;">Id</th>
											<th class="sorting" tabindex="0"
												aria-controls="bootstrap-data-table" rowspan="1" colspan="1"
												aria-label="Position: activate to sort column ascending"
												style="width: 100px;">Name</th>
											<th class="sorting" tabindex="0"
												aria-controls="bootstrap-data-table" rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 200px;">phone</th>
											<th class="sorting" tabindex="0"
												aria-controls="bootstrap-data-table" rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 238px;">email</th>
											<th class="sorting" tabindex="0"
												aria-controls="bootstrap-data-table" rowspan="1" colspan="1"
												aria-label="Salary: activate to sort column ascending"
												style="width: 86px;">Rank</th>
										</tr>

									</thead>
									<tbody>
										<c:forEach items="${list}" var="list">
											<tr>
												<!-- 회원상세조회 -->
												<td><a
													href="${path}updateMember?userId=${list.userId}">${list.userId}</a></td>
												<td>${list.userName}</td>
												<td>${list.phone}</td>
												<td>${list.userEmail}</td>
												<td>${list.userRank}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- .animated -->


<%@ include file="../admin/footer.jspf"%>