package com.project.knpark.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Faq {
	private int fno;
	private String aid;
	private String parkname;
	private String ftitle;
	private String ftext;
	private Date frdate;
	private int startRow;
	private int endRow;
	private String option;
	private String search;
}
