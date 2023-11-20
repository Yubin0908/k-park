package com.project.knpark.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.QnaService;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Qna;

@Controller
@RequestMapping(value = "board")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	@RequestMapping(value = "qnaList", method= {RequestMethod.GET, RequestMethod.POST})
	public String qnaList(String pageNum, Model model, Qna qna) {
		model.addAttribute("qnaList", qnaService.qnaList(pageNum, qna));
		model.addAttribute("paging", new Paging(qnaService.getQnaTotCnt(qna), pageNum));
		return "board/qnaList";
	}
	@RequestMapping(value = "qnaInsert", method=RequestMethod.GET)
	public String qnaInsert() {
		return "board/qnaInsert";
	}
	@RequestMapping(value = "qnaInsert", method=RequestMethod.POST)
	public String qnaInsert(Qna qna, HttpServletRequest request, Model model) {
		model.addAttribute("insertResult", qnaService.qnaInsert(qna, request));
		return "forward:qnaList.do";
	}
	@RequestMapping(value = "qnaDetail", method= {RequestMethod.GET, RequestMethod.POST})
	public String qnaDetail(int qno, Model model) {
		model.addAttribute("qna", qnaService.qnaDetail(qno));
		return "board/qnaDetail";
	}
	@RequestMapping(value = "qnaModify", method=RequestMethod.GET)
	public String qnaModify(int qno, Model model) {
		model.addAttribute("qna", qnaService.qnaDetail(qno));
		return "board/qnaModify";
	}
	@RequestMapping(value = "qnaModify", method=RequestMethod.POST)
	public String qnaModify(HttpServletRequest request, @ModelAttribute("qDto") Qna qna, Model model, String pageNum) {
		model.addAttribute("modifyResult", qnaService.qnaModify(qna, request));
		return "forward:qnaList.do";
	}
	@RequestMapping(value = "qnaDelete", method=RequestMethod.GET)
	public String qnaDelete(int qno, Model model) {
		model.addAttribute("deleteResult", qnaService.qnaDelete(qno));
		return "forward:qnaList.do";
	}
}
