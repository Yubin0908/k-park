package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.knpark.vo.Qna;

public interface QnaService {
	public List<Qna> qnaList(String pageNum, Qna qna);
	public int getQnaTotCnt(Qna qna);
	public int qnaInsert(Qna qna, HttpServletRequest request);
	public Qna qnaDetail(int qno, String after);
	public int qnaModify(Qna qna, HttpServletRequest request);
	public int qnaDelete(int qno);
	// 답변
	public Qna qnaModifyReplyView(int qno);
	public int qnaPreReplyStep(Qna qna);
	public int qnaReplyInsert(Qna qna, HttpServletRequest request);
	public Qna qnaAdminReply(int qgroup);
}
