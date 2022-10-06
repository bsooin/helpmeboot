package org.helpme.dto;

import java.util.Date;

public class ReviewDTO {

	private int rBoardId;
	private int sNo;
	private String rTitle;
	private String rContent;
	private Date rRegDate;
	private int rating;
	private int likeCheck;
	private String userId;
	// 서비스
	private String sName;
	private Integer categoryNo;
	private Integer price;
	private String sCon;
	private Integer likeIt;
	private Date sRegdate;
	private Integer viewCount;
	private Integer sCount;
	private String sAttach;
	
	
	public int getrBoardId() {
		return rBoardId;
	}
	public void setrBoardId(int rBoardId) {
		this.rBoardId = rBoardId;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public Date getrRegDate() {
		return rRegDate;
	}
	public void setrRegDate(Date rRegDate) {
		this.rRegDate = rRegDate;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public Integer getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getsCon() {
		return sCon;
	}
	public void setsCon(String sCon) {
		this.sCon = sCon;
	}
	public Integer getLikeIt() {
		return likeIt;
	}
	public void setLikeIt(Integer likeIt) {
		this.likeIt = likeIt;
	}
	public Date getsRegdate() {
		return sRegdate;
	}
	public void setsRegdate(Date sRegdate) {
		this.sRegdate = sRegdate;
	}
	public Integer getViewCount() {
		return viewCount;
	}
	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}
	public Integer getsCount() {
		return sCount;
	}
	public void setsCount(Integer sCount) {
		this.sCount = sCount;
	}

	public String getsAttach() {
		return sAttach;
	}
	public void setsAttach(String sAttach) {
		this.sAttach = sAttach;
	}
	
}
