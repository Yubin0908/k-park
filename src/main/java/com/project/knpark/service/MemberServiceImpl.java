package com.project.knpark.service;

import java.util.List;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.MemberRepository;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private JavaMailSender mailSender;
	
	private int authNumber;
	
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
	public String findIDAccount(Member member) {
		String returnId = memberRepository.findIDAccount(member);
		return returnId;
	}
	
	@Override
	public String findPWAccount(final Member member, HttpSession httpSession) {
		String returnPw = memberRepository.findPWAccount(member);
			httpSession.setAttribute("id", member.getId());
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = 
						"<div style=\"width:500px; margin: 0 auto;\">\n " +
								"<h1>" + member.getName() + "님의 비밀번호는 " + member.getPw() + "입니다.</h1>\n" +
						"</div>";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					// 받을 메일
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getEmail()));
					// 보낼 메일
					mimeMessage.setFrom(new InternetAddress("k.n.park23@gmail.com"));
					// 메일 제목
					mimeMessage.setSubject(member.getName() + "님의 가입하신 아이디의 비밀번호입니다.");
					// 메일 본문
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
		
		return returnPw;
	}
	
	public void makeAuthNumber() {
		Random num = new Random();
		int checkNum = num.nextInt(888888) + 111111;
		System.out.println("authNumber : " + checkNum);
		authNumber = checkNum;
	}
	@Override
	public String authEmail(String email) {
		makeAuthNumber();
		String from = "k.n.park23@gmail.com";
		String to = email;
		String title = "[K-공원]회원가입 인증메일 입니다.";
		String content = "[K-공원]에 방문해주셔서 감사드립니다!" +
						 "<br>" +
						 "인증 번호는 " + authNumber + "입니다." + 
						 "인증번호를 인증번호 확인란에 입력하여 주세요.";
		mailSend(from, to, title, content);
		return Integer.toString(authNumber);
	}
	
	public void mailSend(final String from, final String to, final String title, final String content) {
		MimeMessagePreparator message = new MimeMessagePreparator() {			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
				mimeMessage.setFrom(new InternetAddress(from));
				mimeMessage.setSubject(title);
				mimeMessage.setText(content, "utf-8", "html");				
			}
		};
		mailSender.send(message);
		System.out.println(to + "에게 인증메일 전송완료");
	}

	@Override
	public List<Member> memberList(Member member, String pageNum) {
		Paging paging = new Paging(memberRepository.memberCount(), pageNum, 10, 10);
		member.setStartRow(paging.getStartRow());
		member.setEndRow(paging.getEndRow());
		return memberRepository.memberList(member);
	}
	
	@Override
	public int memberCount() {
		return memberRepository.memberCount();
	}
	
}








