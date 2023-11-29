package com.project.knpark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.AdminService;
import com.project.knpark.service.MemberService;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Admin;
import com.project.knpark.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "admin/adminLogin", method=RequestMethod.GET)
	public String login() {
		return "admin/login";
	}
	@RequestMapping(value = "admin/adminLogin", method=RequestMethod.POST)
	public String login(Model model, String aid, String apw, HttpSession httpSession) {
		model.addAttribute("result",adminService.loginCheck(aid, apw, httpSession));
		return "redirect:../main.do";
	}
	@RequestMapping(value = "admin/aidConfirm", method=RequestMethod.GET)
	public String aidConfirm(Model model, String aid) {
		model.addAttribute("aidConfirm", adminService.aidConfirm(aid));
		return "admin/aidConfirm";
	}
	
	@RequestMapping(value = "admin/insertAdmin", method=RequestMethod.GET)
	public String insertAdmin() {
		return "admin/registAdmin";
	}
	@RequestMapping(value = "admin/insertAdmin", method=RequestMethod.POST)
	public String insertAdmin(Model model, Admin admin) {
		model.addAttribute("insertResult", adminService.insertAdmin(admin));
		return "admin/login";
	}
	@RequestMapping(value="admin/memberList", method=RequestMethod.GET)
	public String memberList(Model model, Member member, String pageNum) {
		model.addAttribute("memberList", memberService.memberList(member, pageNum));
		model.addAttribute("paging", new Paging(memberService.memberCount(), pageNum, 10, 10));
		model.addAttribute("cnt", memberService.memberCount());
		return "admin/memberList";
	}
}
