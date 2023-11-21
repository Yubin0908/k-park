package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.ReviewRepository;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Review;
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewRepository reviewRepository;

	@Override
	public List<Review> reviewList(Review review, String pageNum) {
		Paging paging = new Paging(reviewRepository.getReviewTotCnt(), pageNum, 10, 5);
		review.setStartRow(paging.getStartRow());
		review.setEndRow(paging.getEndRow());
		return reviewRepository.reviewList(review);
	}

	@Override
	public int getReviewTotCnt() {
		return reviewRepository.getReviewTotCnt();
	}

	@Override
	public Review getReview(int rno, String after) {
		if(after == null) {
			reviewRepository.reviewHitUp(rno);
		}
		return reviewRepository.getReview(rno);
	}

	@Override
	public int insertReview(Review review, HttpServletRequest request) {
		review.setRip(request.getRemoteAddr());
		return reviewRepository.insertReview(review);
	}

	@Override
	public int modifyReview(Review review, HttpServletRequest request) {
		review.setRip(request.getRemoteAddr());
		return reviewRepository.modifyReview(review);
	}

	@Override
	public int deleteReview(int rno) {
		return reviewRepository.deleteReview(rno);
	}

	@Override
	public int reviewHitUp(int rno) {
		return reviewRepository.reviewHitUp(rno);
	}
	// 댓글 부분
	@Override
	public List<Review> getReviewCmt(Review review, String cpageNum) {
		Paging cpaging = new Paging(reviewRepository.getReviewCmtCnt(review), cpageNum, 10, 10);
		review.setStartRow(cpaging.getStartRow());
		review.setEndRow(cpaging.getEndRow());
		return reviewRepository.getReviewCmt(review);
	}
	
	@Override
	public int getReviewCmtCnt(Review review) {
		return reviewRepository.getReviewCmtCnt(review);
	}
}
