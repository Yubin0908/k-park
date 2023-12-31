package com.project.knpark.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		model.addAttribute("paging", new Paging(qnaService.getQnaTotCnt(qna), pageNum, 10, 10));
		model.addAttribute("qnaCnt", qnaService.getQnaTotCnt(qna));
		return "board/qnaList";
	}
	@RequestMapping(value = "qnaWrite", method=RequestMethod.GET)
	public String qnaWrite() {
		return "board/qnaWrite";
	}

	
	@RequestMapping(value = "qnaWrite", method=RequestMethod.POST) 
	public String qnaWrite(Qna qna, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes, String pageNum) {
		model.addAttribute("qnaWriteResult", qnaService.qnaInsert(qna, request, pageNum));
		redirectAttributes.addFlashAttribute("qnaWriteResult", "글이 등록되었습니다.");
		return "redirect:qnaList.do";
	}
	@RequestMapping(value = "qnaDetail", method= {RequestMethod.GET, RequestMethod.POST})
	public String qnaDetail(int qno, Model model, String after, int qgroup) {
		model.addAttribute("qna", qnaService.qnaDetail(qno, after));
		model.addAttribute("reply", qnaService.qnaAdminReply(qgroup));
		return "board/qnaDetail";
	}
	@RequestMapping(value = "qnaModify", method=RequestMethod.GET)
	public String qnaModify(int qno, Model model, String after) {
		model.addAttribute("qna", qnaService.qnaDetail(qno, after));
		return "board/qnaModify";
	}
	@RequestMapping(value = "qnaModify", method=RequestMethod.POST)
	public String qnaModify(HttpServletRequest request, Qna qna, Model model, String pageNum, RedirectAttributes rediAttributes) {
		int qno = qna.getQno();
		int qgroup = qna.getQgroup();
		model.addAttribute("modifyResult", qnaService.qnaModify(qna, request));
		rediAttributes.addFlashAttribute("modifyResult", "글이 수정되었습니다.");
		return "redirect:qnaDetail.do?qno="+qno+"&qgroup="+qgroup+"&pageNum="+pageNum;
	}
	@RequestMapping(value = "qnaDelete", method=RequestMethod.GET)
	public String qnaDelete(int qno, Model model) {
		model.addAttribute("deleteResult", qnaService.qnaDelete(qno));
		return "forward:qnaList.do";
	}
	@RequestMapping(value = "qnaReplyWrite", method=RequestMethod.GET)
	public String qnaReplyWrite(int qno, Model model) {
		model.addAttribute("qna", qnaService.qnaModifyReplyView(qno));
		return "board/qnaReplyWrite";
	}
	@RequestMapping(value = "qnaReplyWrite", method=RequestMethod.POST)
	public String qnaReply(Qna qna, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes, String pageNum) {
		int qno = qna.getQno();
		int qgroup = qna.getQgroup();
		model.addAttribute("qnaReplyResult", qnaService.qnaReplyInsert(qna, request, pageNum));
		redirectAttributes.addFlashAttribute("qnaReplyResult", "답변글이 등록되었습니다.");
		return "redirect:qnaDetail.do?qno="+qno+"&qgroup="+qgroup+"&pageNum="+pageNum;
	}
}
