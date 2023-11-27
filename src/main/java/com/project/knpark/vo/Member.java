package com.project.knpark.vo;
import java.sql.Date;

import lombok.Data;
@Data
public class Member {
	public String id;
	public String pw;
	public String name;
	public String address;
	public String phone;
	public String email;
	public String gender;
	public Date   birth;
	public Date   mRdate;
}
