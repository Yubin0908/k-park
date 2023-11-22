package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.knpark.vo.Review;

public interface ReviewService {
	public List<Review> reviewList(Review review, String cpageNum);
	public int getReviewTotCnt();
	public Review getReview(int rno, String after);
	public int insertReview(Review review, HttpServletRequest request);
	public int modifyReview(Review review, HttpServletRequest request);
	public int deleteReview(int rno);
	public int deleteReviewMoreCmt(int rno);
	public int reviewHitUp(int rno);
	// 댓글 부분
	public List<Review> getReviewCmt(Review review, String pageNum);
	public int getReviewCmtCnt(Review review);
	public int insertReviewCmt(Review review, HttpServletRequest request);
	public int modifyReviewCmt(Review review, HttpServletRequest request);
	public int deleteReviewCmt(int cno);
	public int cstepUpdate(Review review);
	public int insertReviewMoreCmt(Review review, HttpServletRequest request);
}
