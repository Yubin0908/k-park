package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.SuggestRepository;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Suggest;
@Service
public class SuggestServiceImpl implements SuggestService {
	@Autowired
	private SuggestRepository suggestRepository;
	
	@Override
	public List<Suggest> suggestList(Suggest suggest, String pageNum) {
		Paging paging = new Paging(suggestRepository.getSuggestTotCnt(suggest), pageNum, 10,10);
		suggest.setStartRow(paging.getStartRow());
		suggest.setEndRow(paging.getEndRow());
		return suggestRepository.suggestList(suggest);
	}

	@Override
	public int getSuggestTotCnt(Suggest suggest) {
		return suggestRepository.getSuggestTotCnt(suggest);
	}

	@Override
	public int suggestInsert(Suggest suggest, HttpServletRequest request) {
		suggest.setSearch(request.getRemoteAddr());
		return suggestRepository.suggestInsert(suggest);
	}

	@Override
	public Suggest getSuggest(int sno, String after) {
		if(after == null) {
			suggestRepository.suggestHitUp(sno);
		}
		return suggestRepository.getSuggest(sno);
	}

	@Override
	public Suggest suggestModifyReplyView(int sno) {
		return suggestRepository.getSuggest(sno);
	}

	@Override
	public int suggestModify(Suggest suggest, HttpServletRequest request) {
		suggest.setSip(request.getRemoteAddr());
		return suggestRepository.suggestModify(suggest);
	}

	@Override
	public int suggestDelete(int sno) {
		return suggestRepository.suggestDelete(sno);
	}

	@Override
	public int suggestReply(Suggest suggest, HttpServletRequest request) {
		suggest.setSip(request.getRemoteAddr());
		suggestRepository.suggestPreReplayStep(suggest);
		return suggestRepository.suggestReplay(suggest);
	}
	@Override
	public int suggestPreReplayStep(Suggest suggest) {
		return suggestRepository.suggestPreReplayStep(suggest);
	}
	
}
