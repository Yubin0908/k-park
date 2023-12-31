package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.QnaRepository;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Qna;
@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaRepository qnaRepository; 
	@Override
	public List<Qna> qnaList(String pageNum, Qna qna) {
		Paging paging = new Paging(qnaRepository.getQnaTotCnt(qna), pageNum);
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaRepository.qnaList(qna);
	}

	@Override
	public int getQnaTotCnt(Qna qna) {
		return qnaRepository.getQnaTotCnt(qna);
	}

	@Override
	public int qnaInsert(Qna qna, HttpServletRequest request, String pageNum) {
		qna.setQip(request.getRemoteAddr());
		return qnaRepository.qnaInsert(qna);
	}

	@Override
	public Qna qnaDetail(int qno, String after) {
		return qnaRepository.qnaDetail(qno);
	}

	@Override
	public int qnaModify(Qna qna, HttpServletRequest request) {
		qna.setQip(request.getRemoteAddr());
		return qnaRepository.qnaModify(qna);
	}

	@Override
	public int qnaDelete(int qno) {
		return qnaRepository.qnaDelete(qno);
	}
	
	@Override
	public Qna qnaModifyReplyView(int qno) {
		return qnaRepository.qnaDetail(qno);
	}
		
	@Override
	public int qnaPreReplyStep(Qna qna) {
		return qnaRepository.qnaPreReplyStep(qna);
	}
	
	@Override
	public int qnaReplyInsert(Qna qna, HttpServletRequest request, String pageNum) {
		qna.setQip(request.getRemoteAddr());
		qnaRepository.qnaPreReplyStep(qna);
		int qno = qna.getQno();
		qnaRepository.qnaStatusUpdate(qno);
		return qnaRepository.qnaReplyInsert(qna);
	}
	
	@Override
	public Qna qnaAdminReply(int qgroup) {
		return qnaRepository.qnaAdminReply(qgroup);
	}
	
	@Override
	public int qnaStatusUpdate(int qno) {
		return qnaRepository.qnaStatusUpdate(qno);
	}
}
