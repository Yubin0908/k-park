package com.project.knpark.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class Infomation {
	private int ino;
	private String aid;
	private String iparkname;
	private String itype;
	private String ititle;
	private String itext;
	private Date irdate;
	private int startRow;
	private int endRow;
	private String option;
	private String search;
}
