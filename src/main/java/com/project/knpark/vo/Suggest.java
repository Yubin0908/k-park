package com.project.knpark.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Suggest {
	private int sno;
	private String id;
	private String aid;
	private String writer;
	private String stitle;
	private String stext;
	private Date srdate;
	private int shit;
	private int sgroup;
	private int sstep;
	private int sindent;
	private String sip;
	private int startRow;
	private int endRow;
	private String option;
	private String search;
	
}
