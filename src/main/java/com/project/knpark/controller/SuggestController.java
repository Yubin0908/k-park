package com.project.knpark.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.SuggestService;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Faq;
import com.project.knpark.vo.Suggest;

@Controller
public class SuggestController {

	@Autowired
	private SuggestService suggestService;
	
	@RequestMapping(value = "board/sugList", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Suggest suggest, Model model) {
		model.addAttribute("suggestList", suggestService.suggestList(suggest, pageNum));
		model.addAttribute("paging", new Paging(suggestService.getSuggestTotCnt(suggest),pageNum, 10,10));
		model.addAttribute("cnt", suggestService.getSuggestTotCnt(suggest));
		return "board/sugList";
	}
	@RequestMapping(value = "board/sugDetail", method= {RequestMethod.GET, RequestMethod.POST})
	public String sugDetail(int sno, Model model, String after) {
		model.addAttribute("suggest", suggestService.getSuggest(sno, after));
		return "board/sugDetail";
	}
	@RequestMapping(value = "board/suggestWrite", method=RequestMethod.GET)
	public String suggsetInsert() {
		return "board/suggestWrite";
	}
	@RequestMapping(value = "board/suggestWrite", method=RequestMethod.POST)
	public String suggestInsert(HttpServletRequest request, Model model, Suggest suggest) {
		System.out.println("전달받은 suggest:" + suggest);
		model.addAttribute("suggestWriteResult", suggestService.suggestInsert(suggest, request));
		return "forward:sugList.do";
	}
	@RequestMapping(value = "board/suggestModify", method=RequestMethod.GET)
	public String suggestModify(int sno, Model model, String after) {
		model.addAttribute("suggest", suggestService.getSuggest(sno, after));
		return "board/suggestModify";
	}
	@RequestMapping(value = "board/suggestModify", method=RequestMethod.POST)
	public String suggestModify(HttpServletRequest request, Suggest suggest, 
									Model model, String pageNum) {
		System.out.println(suggest);
		model.addAttribute("modifyResult", suggestService.suggestModify(suggest, request));
		return "forward:sugDetail.do";
	}
	@RequestMapping(value = "board/suggestDelete", method=RequestMethod.GET)
	public String suggestDelete(int sno, Model model) {
		model.addAttribute("suggestDeleteResult", suggestService.suggestDelete(sno));
		return "forward:sugList.do";
	}
	@RequestMapping(value = "board/suggestReplyWrite", method=RequestMethod.GET)
	public String suggestReplyView(int sno, Model model) {
		model.addAttribute("suggest", suggestService.suggestModifyReplyView(sno));
		return "board/suggestReplyWrite";
	}
	@RequestMapping(value = "board/suggestReplyWrite", method=RequestMethod.POST)
	public String suggestReply(Suggest suggest, Model model, HttpServletRequest request ) {
		model.addAttribute("suggestReplyResult", suggestService.suggestReplyWrite(suggest, request));
		return "forward:sugList.do";
	}
	@RequestMapping(value = "board/suggestReplyModify", method=RequestMethod.GET)
	public String suggestReplyModify(int sno, Model model, String after) {
		model.addAttribute("suggest", suggestService.getSuggest(sno, after));
		return "board/suggestReplyModify";
	}
	@RequestMapping(value = "board/suggestReplyModify", method=RequestMethod.POST)
	public String suggestReplyModify(HttpServletRequest request, Suggest suggest, 
									Model model, String pageNum) {
		System.out.println(suggest);
		model.addAttribute("suggestReplyModifyResult", suggestService.suggestModify(suggest, request));
		return "forward:sugDetail.do";
	}
}













