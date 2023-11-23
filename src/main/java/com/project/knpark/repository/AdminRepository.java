package com.project.knpark.repository;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Admin;

@Mapper
public interface AdminRepository {
	public Admin getAdmin(String aid);
}
