package com.project.knpark.vo;

import lombok.Data;

@Data
public class Guidance {
	private int campno;
	private String campname;
	private String parkname;
	private String campaddress;
	private String camptel;
	
	private int shelterno;
	private String sheltername;
	private String shelteraddress;
	private String sheltertel;
	
	private int exploreno;
	private String explorename;
	private String exploreaddress;
	private String exploretel;
}
