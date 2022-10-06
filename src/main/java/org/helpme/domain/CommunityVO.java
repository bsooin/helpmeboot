package org.helpme.domain;

import lombok.Data;

import java.util.Date;

@Data
public class CommunityVO {
	private Integer cBoardId;
	private String cBoardTitle;
	private String cBoardCon;
	private String userId;
	private Date cRegdate;
	private String cFileName;
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
	public Date getcRegdate() {
		return cRegdate;
	}
	public void setcRegdate(Date cRegdate) {
		this.cRegdate = cRegdate;
	}
	public String getcFileName() {
		return cFileName;
	}
	public void setcFileName(String cFileName) {
		this.cFileName = cFileName;
	}
	@Override
	public String toString() {
		return "CommunityVO [cBoardId=" + cBoardId + ", cBoardTitle=" + cBoardTitle + ", cBoardCon=" + cBoardCon
				+ ", userId=" + userId + ", cRegdate=" + cRegdate + ", cFileName=" + cFileName + "]";
	}
	
}
