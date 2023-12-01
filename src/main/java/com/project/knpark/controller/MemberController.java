package com.project.knpark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.MemberService;
import com.project.knpark.vo.Member;

@Controller
@RequestMapping(value = "member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	@RequestMapping(value = "idConfirm", method = RequestMethod.GET)
	public String idConfirm(String id, Model model) {
		model.addAttribute("idConfirmResult", memberService.idConfirm(id));
		return "member/idConfirm";
	}
	@RequestMapping(value = "join", method = RequestMethod.POST)
	// @ModelAttribute("mDto") 필요 (member라는 이름으로 들어가면 세션의 member와 혼돈될 수 있음
	public String join(@ModelAttribute("mDto") Member member, Model model, HttpSession session) {
		model.addAttribute("joinResult", memberService.insertMember(member, session));
		return "member/login";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String id, String pw, String after, 
								HttpSession httpSession, Model model) {
		String loginResult = memberService.loginCheck(id, pw, httpSession);
		if(loginResult.equals("로그인 성공")) {
			return "redirect:../" + after;
		}else {
			model.addAttribute("loginResult", loginResult);
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			return "member/login";
		}
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:../main.do";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify() {
		return "member/modify";
	}
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("mDto") Member member, HttpSession httpSession,
							Model model) {
		model.addAttribute("modifyResult", memberService.modifyMember(member, httpSession));
		System.out.println("modify: " + member);
		return "forward:../main.do";
	}
	@RequestMapping(value = "withdrawal", method = RequestMethod.GET)
	public String delete(Model model, String id, HttpSession session) {
		model.addAttribute("withdrawal" , memberService.deleteMember(id));
		session.invalidate();
		return "main/main";
	}
	@RequestMapping(value="pwConfirm", method=RequestMethod.GET)
	public String pwConfirm() {
		return "member/pwConfirm";
	}
	@RequestMapping(value="pwConfirm", method=RequestMethod.POST)
	public String pwConfirm(String id, String pw, Model model) {
		String oldPw = memberService.pwConfirm(id);
		
		
		if(oldPw != null && oldPw.equals(pw)) {
			return "redirect:modify.do";
		} else {
			model.addAttribute("pwConfirmResult", "비밀번호가 올바르지 않습니다. 다시 입력해주세요.");
			return "member/pwConfirm";
		}
	}
	@RequestMapping(value = "accountId", method=RequestMethod.GET)
	public String account() {
		return "member/findIdAccount";
	}
	
	@RequestMapping(value = "accountId", method=RequestMethod.POST)
	public String account(Model model, @ModelAttribute("mDto") Member member) {
		String rtnId = (String)memberService.findIDAccount(member);
		if(rtnId == null || "".equals(rtnId)) {
			model.addAttribute("findId", "아이디를 찾을 수 없습니다.");
			return "member/findIdAccount";
		}else {
			model.addAttribute("findId", rtnId);
			return "member/login";
		}
	}
	
	@RequestMapping(value = "accountPw", method=RequestMethod.GET)
	public String accountPw() {
		return "member/findPwAccount";
	}
	
	@RequestMapping(value = "accountPw", method=RequestMethod.POST)
	public String accountPw(Model model, @ModelAttribute("mDto")Member member, HttpSession httpSession){
		String rtnPw = (String)memberService.findPWAccount(member, httpSession);
		if(rtnPw == null || "".equals(rtnPw)) {
			model.addAttribute("findPw", "비밀번호를 찾을 수 없습니다.");
			return "member/findPwAccount";
		}else {
			model.addAttribute("findPw", rtnPw);
			return "member/login";
		}
	}
	
	@RequestMapping(value = "emailConfirm", method=RequestMethod.POST)
	public String emailConfirm(String email, Model model) {
		System.out.println("controller에 들어온 email : " + email);
		model.addAttribute("authNumber", memberService.authEmail(email));
		return "member/authNumber";
	}
}


