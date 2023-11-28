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
	
	private int exploreno;
	private String explorename;
	private String exploreaddress;
	private String exploretel;
	
	private int shelterno;
	private String sheltername;
	private String shelteraddress;
	private String sheltertel;
	
	private int resno;
	private Date resdate;
	private int rem;
	
	private int bno;
	private String id;
	private int status;
	private Date bdate;
	
	private String camp_parkname;
	private String shelter_parkname;
	private String explore_parkname;

}
