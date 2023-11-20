package com.project.knpark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Notice;

@Mapper
public interface NoticeRepository {
	public List<Notice> noticeList(Notice notice);
	public int getNoticeTotCnt(Notice notice);
	public Notice getNotice(int nno);
	public int noticeInsert(Notice notice);
	public int noticeModify(Notice notice);
	public int noticeDelete(int nno);
	public int noticeHitUp(int nno);
}
