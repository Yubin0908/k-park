package com.project.knpark.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.FaqService;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Faq;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqService;
	
	@RequestMapping(value = "board/faqList", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqList(String pageNum, Faq faq, Model model) {
		model.addAttribute("faqList", faqService.faqList(pageNum, faq));
		model.addAttribute("paging", new Paging(faqService.getFaqTotCnt(faq), pageNum, 10, 10));
		model.addAttribute("cnt", faqService.getFaqTotCnt(faq));
		return "board/faqList";
	}
	@RequestMapping(value = "board/faqDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqDetail(int fno, Model model, String after) {
		model.addAttribute("faq", faqService.getFaq(fno, after));
		return "board/faqDetail";
	}
	@RequestMapping(value = "board/faqWrite", method=RequestMethod.GET)
	public String faqInsert() {
		return "board/faqWrite";
	}
	@RequestMapping(value = "board/faqWrite", method=RequestMethod.POST)
	public String faqInsert(Faq faq, Model model) {
		model.addAttribute("faqWriteResult", faqService.faqInsert(faq));
		return "forward:faqList.do";
	}
	@RequestMapping(value = "board/faqModify", method=RequestMethod.GET)
	public String faqModify(int fno, Model model, String after) {
		model.addAttribute("faq", faqService.getFaq(fno, after));
		return "board/faqModify";
	}
	@RequestMapping(value = "board/faqModify", method=RequestMethod.POST)
	public String faqModify(Faq faq, Model model, String pageNum) {
		model.addAttribute("modifyResult", faqService.faqModify(faq));
		return "forward:faqDetail.do";
	}
	@RequestMapping(value = "board/faqDelete", method=RequestMethod.GET)
	public String faqDelete(int fno, Model model) {
		model.addAttribute("faqDeleteResult", faqService.faqDelete(fno));
		return "forward:faqList.do";
	}
}









