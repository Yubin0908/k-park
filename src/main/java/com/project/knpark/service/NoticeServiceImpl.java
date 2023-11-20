package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.NoticeRepository;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeRepository noticeRepository;

	@Override
	public List<Notice> noticeList(Notice notice, String pageNum) {
	    Paging paging = new Paging(noticeRepository.getNoticeTotCnt(notice), pageNum, 10, 10);
	    notice.setStartRow(paging.getStartRow());
	    notice.setEndRow(paging.getEndRow());
	    return noticeRepository.noticeList(notice);
	}

	@Override
	public int getNoticeTotCnt(Notice notice) {
		return noticeRepository.getNoticeTotCnt(notice);
	}

	@Override
	public Notice getNotice(int nno, String after) {
		if(after == null) {
			noticeRepository.noticeHitUp(nno);
		}
		return noticeRepository.getNotice(nno);
	}

	@Override
	public int noticeInsert(Notice notice, HttpServletRequest request) {
		notice.setNip(request.getRemoteAddr());
		return noticeRepository.noticeInsert(notice);
	}

	@Override
	public int noticeModify(Notice notice, HttpServletRequest request) {
		notice.setNip(request.getRemoteAddr());
		return noticeRepository.noticeModify(notice);
	}

	@Override
	public int noticeDelete(int nno) {
		return noticeRepository.noticeDelete(nno);
	}
	
	@Override
	public int noticeHitUp(int nno) {
		return noticeRepository.noticeHitUp(nno);
	}

}
