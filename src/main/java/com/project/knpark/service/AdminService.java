package com.project.knpark.service;

import javax.servlet.http.HttpSession;

import com.project.knpark.vo.Admin;

public interface AdminService {
	public Admin getAdmin(String aid);
	public String loginCheck(String aid, String apw, HttpSession httpSession);
	public int insertAdmin(Admin admin);
	public int modifyAdmin(Admin admin);
	public int aidConfirm(String aid);
}
