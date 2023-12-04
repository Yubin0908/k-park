package com.project.knpark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.knpark.service.AdminService;
import com.project.knpark.service.MemberService;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Admin;
import com.project.knpark.vo.Member;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "adminLogin", method=RequestMethod.GET)
	public String login() {
		return "admin/login";
	}
	@RequestMapping(value = "adminLogin", method=RequestMethod.POST)
	public String login(Model model, String aid, String apw, HttpSession session) {
		model.addAttribute("result",adminService.loginCheck(aid, apw, session));
		return "forward:../main.do";
	}
	@RequestMapping(value = "aidConfirm", method=RequestMethod.GET)
	public String aidConfirm(Model model, String aid) {
		model.addAttribute("aidConfirm", adminService.aidConfirm(aid));
		return "admin/aidConfirm";
	}
	
	@RequestMapping(value = "insertAdmin", method=RequestMethod.GET)
	public String insertAdmin() {
		return "admin/registAdmin";
	}
	@RequestMapping(value = "insertAdmin", method=RequestMethod.POST)
	public String insertAdmin(Model model, Admin admin, RedirectAttributes redirectAttributes) {
		model.addAttribute("insertResult", adminService.insertAdmin(admin));
		redirectAttributes.addFlashAttribute("adminInsertResult", "관리자 등록이 완료되었습니다.");
		return "redirect:adminLogin.do";
	}
	@RequestMapping(value="memberList", method=RequestMethod.GET)
	public String memberList(Model model, Member member, String pageNum) {
		model.addAttribute("memberList", memberService.memberList(member, pageNum));
		model.addAttribute("paging", new Paging(memberService.memberCount(), pageNum, 10, 10));
		model.addAttribute("cnt", memberService.memberCount());
		return "admin/memberList";
	}
}
