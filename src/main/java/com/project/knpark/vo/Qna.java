package com.project.knpark.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Qna {
	private int qno;
	private String id;
	private String aid;
	private String parkname;
	private String qtype;
	private String qtitle;
	private String qtext;
	private Date qrdate;
	private String qyn;
	private int qstatus;
	private int qgroup;
	private int qstep;
	private int qindent;
	private String qip;
	private int startRow;
	private int endRow;
	private String option;
	private String search;
}
