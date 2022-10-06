package org.helpme.domain;

import lombok.Data;

import java.util.Date;

@Data
public class DealVO {

	private int dNo;
	private int sNo;
	private String dPrice;
	private Date dDate;
	private String userId;
	
}
