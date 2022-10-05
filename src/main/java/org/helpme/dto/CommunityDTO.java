package org.helpme.dto;

import java.util.Date;

public class CommunityDTO {
	private String userId;
	private Integer cBoardId;
	private String cBoardTitle;
	private String cBoardCon;
	private String cFileName;
	private Date cRegdate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getcBoardId() {
		return cBoardId;
	}
	public void setcBoardId(Integer cBoardId) {
		this.cBoardId = cBoardId;
	}
	public String getcBoardTitle() {
		return cBoardTitle;
	}
	public void setcBoardTitle(String cBoardTitle) {
		this.cBoardTitle = cBoardTitle;
	}
	public String getcBoardCon() {
		return cBoardCon;
	}
	public void setcBoardCon(String cBoardCon) {
		this.cBoardCon = cBoardCon;
	}
	public String getcFileName() {
		return cFileName;
	}
	public void setcFileName(String cFileName) {
		this.cFileName = cFileName;
	}
	public Date getcRegdate() {
		return cRegdate;
	}
	public void setcRegdate(Date cRegdate) {
		this.cRegdate = cRegdate;
	}
	@Override
	public String toString() {
		return "CommuityVO [userId=" + userId + ", cBoardId=" + cBoardId + ", cBoardTitle=" + cBoardTitle + ", cBoardCon=" + cBoardCon
							+ ", cFileName=" + cFileName + ", cRegdate=" + cRegdate + "]";
	}
}
