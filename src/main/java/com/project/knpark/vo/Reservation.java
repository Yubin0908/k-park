package com.project.knpark.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {
	private int campno;
	private String campname;
	private String parkname;
	private String campaddress;
	private String camptel;
	
	private int resno;
	private Date resdate;
	private int rem;
	
	private int bno;
	private String id;
	private int status;
	private Date bdate;
}
