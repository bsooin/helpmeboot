package org.helpme.domain;

import java.util.Date;

public class ReplyVO {
	private int replyNo;
	private int cBoardId;
	private String cReplyCon;
	private Date cReplyRegdate;
	private String userId;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getcBoardId() {
		return cBoardId;
	}
	public void setcBoardId(int cBoardId) {
		this.cBoardId = cBoardId;
	}
	public String getcReplyCon() {
		return cReplyCon;
	}
	public void setcReplyCon(String cReplyCon) {
		this.cReplyCon = cReplyCon;
	}
	public Date getcReplyRegdate() {
		return cReplyRegdate;
	}
	public void setcReplyRegdate(Date cReplyRegdate) {
		this.cReplyRegdate = cReplyRegdate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", cBoardId=" + cBoardId + ", cReplyCon=" + cReplyCon
				+ ", cReplyRegdate=" + cReplyRegdate + ", userId=" + userId + "]";
	}
	
}
