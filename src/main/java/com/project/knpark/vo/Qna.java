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
	private String btitle;
	private String qtext;
	private Date qrdate;
	private int qstatus;
	private int qgroup;
	private String qip;
	private int startRow;
	private int endRow;
	private String option;
	private String search;
}
