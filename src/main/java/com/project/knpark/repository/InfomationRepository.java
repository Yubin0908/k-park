package com.project.knpark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Infomation;

@Mapper
public interface InfomationRepository {
	public List<Infomation> infoList(Infomation infomation);
	public int getInfoTotCnt(Infomation infomation);
	public Infomation getInfo(int ino);
	public int infoInsert(Infomation infomation);
	public int infoModify(Infomation infomation);
	public int infoDelete(int ino);
}
