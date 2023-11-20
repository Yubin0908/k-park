package com.project.knpark.service;
import javax.servlet.http.HttpSession;
import com.project.knpark.vo.Member;
public interface MemberService {
	public int idConfirm(String id);
	public int insertMember(Member member, HttpSession httpSession);
	public String loginCheck(String id, String pw, HttpSession httpSession);
	public Member getMember(String id);
	public int modifyMember(Member member, HttpSession httpSession);
	public int deleteMember(String id);
	public int pwConfirm(String id);
}
