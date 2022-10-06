package org.helpme.domain;

public class SearchCriteria extends Criteria {

	private String searchType;
	private Integer categoryNo;
	private String keyword;
	private String orderType;

	public Integer getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getSearchType() {
		return searchType;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", categoryNo=" + categoryNo + ", keyword=" + keyword
				+ ", orderType=" + orderType + "]";
	}
	
	
}


