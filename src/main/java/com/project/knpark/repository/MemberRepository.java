package com.project.knpark.repository;

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
	public Member findIDAccount(Member member);
}
