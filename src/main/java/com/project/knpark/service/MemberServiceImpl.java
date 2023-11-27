package com.project.knpark.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.MemberRepository;
import com.project.knpark.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public int idConfirm(String id) {
		System.out.println("전달받은 " + id);
		return memberRepository.idConfirm(id);
//		int result = memberRepository.idConfirm(id);
//		return result;
	}

	@Override
	public int insertMember(final Member member, HttpSession httpSession) {
		int result = memberRepository.insertMember(member);//memberRepository.insertMember(member); // DB에 저장 
		if(result == 1) { // DB에 회원가입 성공시에만 세션에 데이터 넣고 메일 보냄
			httpSession.setAttribute("id", member.getId());
			// 메일 전송
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = 
					"<div style=\"width:500px; margin: 0 auto;\">\n " +
							"<h1>" + member.getName() + "님의 회원가입을 축하 드립니다.</h1>\n" +
					"</div>";
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					// 받을 메일
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getEmail()));
					// 보낼 메일
					mimeMessage.setFrom(new InternetAddress("k.n.park23@gmail.com"));
					// 메일 제목
					mimeMessage.setSubject(member.getName() + "님 회원가입 감사합니다");
					// 메일 본문
					mimeMessage.setText(content, "utf-8", "html");
				}
			}; // message 객체 생성
			mailSender.send(message); // 메일 전송
		}
		return result;
	}

	@Override
	public String loginCheck(String id, String pw, HttpSession httpSession) {
		String result = "로그인 성공";
		Member member = memberRepository.getMember(id);
		if(member == null) {
			result = "유효하지 않은 아이디입니다";
		}else if(! member.getPw().equals(pw)) {
			result = "비밀번호가 맞지 않습니다";
		}else {
			httpSession.setAttribute("member", member); 
		}
		return result;
	}

	@Override
	public Member getMember(String id) {
		return memberRepository.getMember(id);
	}

	@Override
	public int modifyMember(Member member, HttpSession httpSession) {
		httpSession.setAttribute("member", member);
		return 1;//memberRepository.modifyMember(member);
	}
	@Override
	public int deleteMember(String id) {
		return memberRepository.deleteMember(id);
	}
	@Override
	public String pwConfirm(String id) {
	    String oldPw = memberRepository.pwConfirm(id);
	    return (oldPw != null) ? "1" : "0";
	}
	
	@Override
	public Member findIDAccount(Member member) {
		return memberRepository.findIDAccount(member);
	}
}








