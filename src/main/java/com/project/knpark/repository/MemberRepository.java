package com.project.knpark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.knpark.vo.Member;

@Mapper
public interface MemberRepository {
	public int idConfirm(String id);
	public int insertMember(Member member);
	public Member getMember(String id);
	public int modifyMember(Member member);
	public int deleteMember(String id);
	public String pwConfirm(@Param("id") String id);
	public String findIDAccount(Member member);
	public String findPWAccount(Member member);
	public List<Member> memberList(Member member);
	public int memberCount();
}
