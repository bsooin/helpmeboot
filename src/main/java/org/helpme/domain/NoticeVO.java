package org.helpme.domain;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeVO {
	private Integer noticeId;
	private String noticeTitle;
	private String noticeCon;
	private String noticeCat;
	private Date noticeRegdate;

	}
