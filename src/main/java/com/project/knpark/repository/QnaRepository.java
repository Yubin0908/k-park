package com.project.knpark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Qna;

@Mapper
public interface QnaRepository {
	public List<Qna> qnaList(Qna qna);
	public int getQnaTotCnt(Qna qna);
	public int qnaInsert(Qna qna);
	public Qna qnaDetail(int qno);
	public int qnaModify(Qna qna);
	public int qnaDelete(int qno);
	public int qnaPreReplyStep(Qna qna);
	public int qnaReplyInsert(Qna qna);
	public Qna qnaAdminReply(int qgroup);
}
