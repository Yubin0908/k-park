package com.project.knpark.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.ReviewService;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="board/reviewList", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewList(String pageNum, Review review, Model model) {
		model.addAttribute("reviewList", reviewService.reviewList(review, pageNum));
		model.addAttribute("paging", new Paging(reviewService.getReviewTotCnt(), pageNum, 10, 5));
		model.addAttribute("cnt", reviewService.getReviewTotCnt());
		
		return "board/reviewList";
	}
	
	@RequestMapping(value="board/reviewDetail", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewDetail(int rno, Model model, String after, Review review, String cpageNum) {
		model.addAttribute("review", reviewService.getReview(rno, after));
		model.addAttribute("reviewCmt", reviewService.getReviewCmt(review, cpageNum));
		model.addAttribute("paging", new Paging(reviewService.getReviewCmtCnt(review), cpageNum, 10, 10));
		return "board/reviewDetail";
	}
	
	@RequestMapping(value="board/reviewWrite", method=RequestMethod.GET)
	public String reviewWrite() {
		return "board/reviewWrite";
	}
	
	@RequestMapping(value="board/reviewWrite", method=RequestMethod.POST)
	public String reviewWrite(HttpServletRequest request, Review review, Model model) {
		System.out.println("전달받은 review: " + review);
		model.addAttribute("reviewWriteResult", reviewService.insertReview(review, request));
		return "forward:reviewList.do";
	}
	
	@RequestMapping(value="board/reviewModify", method=RequestMethod.GET)
	public String reviewModify(int rno, Model model, String after) {
		model.addAttribute("review", reviewService.getReview(rno, after));
		return "board/reviewModify";
	}
	
	@RequestMapping(value="board/reviewModify", method=RequestMethod.POST)
	public String reviewModify(HttpServletRequest request, Review review, Model model, String pageNum) {
		model.addAttribute("reviewModifyResult", reviewService.modifyReview(review, request));
		return "forward:reviewDetail.do";
	}
	@RequestMapping(value="board/reviewDelete", method=RequestMethod.GET)
	public String reviewDelete(int rno, Model model) {
		model.addAttribute("reviewDeleteResult", reviewService.deleteReview(rno));
		return "forward:reviewList.do";
	}
	
	// 댓글 관련 호출
	@RequestMapping(value="board/ReviewCmtInsert", method=RequestMethod.POST)
	public String reviewCmtInsert(Review review, HttpServletRequest request, Model model, String after) {
		model.addAttribute("cmtResult", reviewService.insertReviewCmt(review, request));
		return "forward:reviewDetail.do";
	}
	
	@RequestMapping(value="board/ReviewCmtModify", method=RequestMethod.POST)
	public String reviewCmtModify(Review review, HttpServletRequest request, Model model, String after) {
		model.addAttribute("cmtModifyResult", reviewService.modifyReviewCmt(review, request));
		return "forward:reviewDetail.do";
	}
	
	@RequestMapping(value="board/ReviewCmtMoreInsert", method=RequestMethod.POST)
	public String reviewCmtMoreInsert(Review review, HttpServletRequest request, Model model, String after) {
		model.addAttribute("cmtResult", reviewService.insertReviewMoreCmt(review, request));
		return "forward:reviewDetail.do";
	}
	
	@RequestMapping(value="board/ReviewCmtDelete", method=RequestMethod.GET)
	public String reviewCmtDelete(int cno, Model model) {
		model.addAttribute("cmtDeleteResult", reviewService.deleteReviewCmt(cno));
		return "forward:reviewDetail.do";
	}
	
}
