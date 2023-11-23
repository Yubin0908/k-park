package com.project.knpark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.AdminService;
import com.project.knpark.vo.Admin;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@RequestMapping(value = "admin/login", method=RequestMethod.GET)
	public String login() {
		return "admin/login";
	}
	@RequestMapping(value = "admin/login", method=RequestMethod.POST)
	public String login(Model model, String aid, String apw, HttpSession httpSession) {
		String loginResult = adminService.loginCheck(aid, apw, httpSession);
		return "main/main";
	}
}
