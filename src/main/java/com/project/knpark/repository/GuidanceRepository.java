package com.project.knpark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Guidance;

@Mapper
public interface GuidanceRepository {
	public List<Guidance> getCampList(String parkname);
	public Guidance getGuidance(int fno);
}
