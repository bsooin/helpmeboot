package org.helpme.domain;

import lombok.Data;

import java.util.Date;

@Data
public class PointVO {

	private String userId;
	private int amount;
	private Date validDate;

	
}
