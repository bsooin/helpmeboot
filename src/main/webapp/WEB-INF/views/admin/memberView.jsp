<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/header.jspf"%>


<div class="content">
            <div class="animated fadeIn">

                <div class="row">
                <div class="col-md-8"  style="float: none; margin:0 auto;">
                    <div class="card">
                            <div class="card-header">
                                <strong>회원정보 상세보기</strong>
                            </div>
                        
                           
                            <div class="card-body card-block">
                                <form action="memberView" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" userId">ID</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${member.userId}</p> 
                                        </div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="userPw" class=" form-control-label">Password</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="password" name="password" value= "${member.userPw}"  readonly="readonly" class="form-control"></div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="userEmail" class=" form-control-label">Email</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="email-input" name="email-input"  value= "${member.userEmail}"  readonly="readonly" class="form-control"></div>
                                    </div>
                                    
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="userName" class=" form-control-label">name</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="neme" name="name-input"  value= "${member.userName}" readonly="readonly"  class="form-control"></div>
                                    </div>
                                    
                                        <div class="row form-group">
                                        <div class="col col-md-3"><label for="phone" class=" form-control-label">phone</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="phone-input" name="phone-input"  value= "${member.phone}" readonly="readonly"  class="form-control"></div>
                                    </div>
                                                                   
                                   <div class="row form-group">
                                        <div class="col col-md-3"><label class=" gender">gender</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="inline-radio1" name="inline-radios" value="${member.gender == w }"  readonly="readonly" class="form-check-input">여
                                                </label>
                                                &nbsp; 
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="inline-radios" value="${member.gender == m } " readonly="readonly" class="form-check-input">남
                                                </label>                                                
                                            </div>
                                            </div>
                                            </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="address" class=" form-control-label">Address</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="password" name="adress" value= "${member.address}"  readonly="readonly" class="form-control"></div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="regDate" class=" form-control-label">regdate</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="password" name="adress" value= "${member.regDate}"  pattern="yyyy- MM-dd"  readonly="readonly" class="form-control"></div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="sms" class=" form-control-label">Sms</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="password" name="adress" value= "${member.sms}"  readonly="readonly"  class="form-control"></div>
                                    </div>
                                    
                                          <div class="row form-group">
                                        <div class="col col-md-3"><label class=" accTerms">이용약관</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="radio">
                                                    <label for="radio1" class="form-check-label ">
                                                        <input type="radio" id="radio1" name="radios" value="${member.accTerms == y }" readonly="readonly"  class="form-check-input">예
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radio2" class="form-check-label ">
                                                        <input type="radio" id="radio2" name="radios" value="${member.accTerms == n}"  readonly="readonly"  class="form-check-input">아니요
                                                    </label>
                                                </div> 
                                                </div>
                                                </div>   
                                                </div>  
         
                                 <div class="row form-group">
                                        <div class="col col-md-3"><label for="userRank" class=" form-control-label">Rank</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="select" id="select" class="form-control">                                           
                                                <option value="${member.userRank == 0}">1</option>
                                                <option value="${member.userRank == 1}">2</option>
                                                <option value="${member.userRank == 2}">3</option>
                                                <option value="${member.userRank == 3}">4</option>
                                                <option value="${member.userRank == 4}">5</option>
                                                <option value="${member.userRank == 9}">운영자</option>
                                            </select>
                                        </div>
                                    </div>
         
         </form>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm" value="수정"  id="btnUpdate">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                
                                  <button type="submit" class="btn btn-primary btn-sm" value="리스트"  id="btnList">
                                    <i class="fa-list"></i> goList
                                </button>
                                
                                <button type="reset" class="btn btn-danger btn-sm" value="삭제"  id="btnDelete">
                                    <i class="fa fa-ban"></i> Delete
                                </button>
                            </div>
                        </div>
                          </div>
                           </div>
                            </div>
                             </div>
                              </div>
                        
                        
 <%@ include file="../admin/footer.jspf"%>