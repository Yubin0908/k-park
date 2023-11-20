package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.knpark.vo.Notice;

public interface NoticeService {
	public List<Notice> noticeList(Notice notice, String pageNum);
	public int getNoticeTotCnt(Notice notice);
	public Notice getNotice(int nno, String after);
	public int noticeInsert(Notice notice, HttpServletRequest request);
	public int noticeModify(Notice notice, HttpServletRequest request);
	public int noticeDelete(int nno);
	public int noticeHitUp(int nno);
}
