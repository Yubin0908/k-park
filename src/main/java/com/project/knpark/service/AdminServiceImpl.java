package com.project.knpark.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.AdminRepository;
import com.project.knpark.vo.Admin;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminRepository adminRepository;
	
	@Override
	public Admin getAdmin(String aid) {
		return adminRepository.getAdmin(aid);
	}
	@Override
	public String loginCheck(String aid, String apw, HttpSession httpSession) {
		String result = "로그인 성공";
		Admin admin = adminRepository.getAdmin(aid);
		if(admin == null) {
			result = "유효하지 않은 아이디입니다";
		}else if(! admin.getApw().equals(apw)) {
			result = "비밀번호가 맞지 않습니다";
		}else {
			httpSession.setAttribute("admin", admin); 
		}
		return result;
	}
	
	@Override
	public int aidConfirm(String aid) {
		return adminRepository.aidConfirm(aid);
	}
	
	@Override
	public int insertAdmin(Admin admin) {
		return adminRepository.insertAdmin(admin);
	}
	@Override
	public int modifyAdmin(Admin admin) {
		return adminRepository.modifyAdmin(admin);
	}

}
