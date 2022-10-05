package org.helpme.domain;

public class MypageCriteria {

	private int page;	
	private int perPageNum;
	private String userId;
	
	public MypageCriteria(){
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page){
		
		if(page <= 0){
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum){
		
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}	
	
	//method for MyBatis SQL Mapper - 
	public int getPageStart() {
		
		return (this.page -1)* perPageNum;
	}
	
	//method for MyBatis SQL Mapper 
	public int getPerPageNum(){
		
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	// 안돼서 아이디 추가함.. 하.. 

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}


