package com.project.knpark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Review;

@Mapper
public interface ReviewRepository {
	public List<Review> reviewList(Review review);
	public int getReviewTotCnt();
	public Review getReview(int rno);
	public int insertReview(Review review);
	public int modifyReview(Review review);
	public int deleteReview(int rno);
	public int deleteReviewMoreCmt(int rno);
	public int reviewHitUp(int rno);
	// 댓글부분
	public List<Review> getReviewCmt(Review review);
	public int getReviewCmtCnt(Review review);
	public int insertReviewCmt(Review review);
	public int modifyReviewCmt(Review review);
	public int deleteReviewCmt(int cno);
	public int cstepUpdate(Review review);
	public int insertReviewMoreCmt(Review review);
}
