package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.knpark.util.Paging;
import com.project.knpark.vo.Suggest;

public interface SuggestService {
	public List<Suggest> suggestList(Suggest suggest, String pageNum);
	public int getSuggestTotCnt(Suggest suggest);
	public int suggestInsert(Suggest suggest, HttpServletRequest request);
	public Suggest getSuggest(int sno, String after);
	// 수정후 text.do?after=u
	public Suggest suggestModifyReplyView(int sno);
	public int suggestModify(Suggest suggest, HttpServletRequest request);
	public int suggestDelete(int sno);
	public int suggestReplyWrite(Suggest suggest, HttpServletRequest request);
	public int suggestPreReplyWriteStep(Suggest suggest);
}

















