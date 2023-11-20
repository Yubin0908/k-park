package com.project.knpark.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
	private int nno;
	private String aid;
	private String parkname;
	private String ntitle;
	private String ntext;
	private Date ndate;
	private int nhit;
	private int ntop;
	private String nip;
	private int startRow;
	private int endRow;
	private String option;
	private String search;
}
