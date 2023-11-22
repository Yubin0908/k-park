package com.project.knpark.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private int rno;
	private String id;
	private String rtitle;
	private String rtext;
	private Date rrdate;
	private int rhit;
	private String rip;
	private int startRow;
	private int endRow;
	// 댓글부분
	private int cno;
	private String cname;
	private String cmemo;
	private int cgroup;
	private int cstep;
	private int cindent;
	private String cip;
	private Date crdate;
}
