package com.project.knpark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Suggest;

@Mapper
public interface SuggestRepository {
	public List<Suggest> suggestList(Suggest suggest);
	public int getSuggestTotCnt(Suggest suggest);
	public int suggestInsert(Suggest suggest);
	public int suggestHitUp(int sno);
	public Suggest getSuggest(int sno);
	public int suggestModify(Suggest suggest);
	public int suggestDelete(int sno);
	public int suggestPreReplayStep(Suggest suggest);
	public int suggestReplay(Suggest suggest);
	
}
