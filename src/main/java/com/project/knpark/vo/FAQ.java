package com.project.knpark.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class FAQ {
	private int fno;
	private String aid;
	private String parkname;
	private String ftype;
	private String ftitle;
	private String ftext;
	private Date fRdate;
	private int startRow;
	private int endRow;
}
