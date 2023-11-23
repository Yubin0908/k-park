package com.project.knpark.service;

import java.util.List;

import com.project.knpark.vo.Infomation;

public interface InfomationService {
	public List<Infomation> infoList(Infomation infomation, String pageNum);
	public int getInfoTotCnt(Infomation infomation);
	public Infomation getInfo(int ino, String after);
	public int infoInsert(Infomation infomation);
	public int infoModify(Infomation infomation);
	public int infoDelete(int ino);
}
