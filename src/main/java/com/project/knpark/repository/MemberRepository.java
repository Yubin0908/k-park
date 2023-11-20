package com.project.knpark.repository;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Member;

@Mapper
public interface MemberRepository {
	public int idConfirm(String id);
	public int insertMember(Member member);
	public Member getDetailMember(String id);
	public int modifyMember(Member member);
}
