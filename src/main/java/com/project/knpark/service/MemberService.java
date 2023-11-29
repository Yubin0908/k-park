package com.project.knpark.service;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.project.knpark.vo.Member;
public interface MemberService {
	public int idConfirm(String id);
	public int insertMember(Member member, HttpSession httpSession);
	public String loginCheck(String id, String pw, HttpSession httpSession);
	public Member getMember(String id);
	public int modifyMember(Member member, HttpSession httpSession);
	public int deleteMember(String id);
	public String pwConfirm(String id);
	public String findIDAccount(Member member);
	public String findPWAccount(Member member);
	public String authEmail(String email);
	public List<Member> memberList(Member member, String pageNum);
	public int memberCount();
}
