package com.project.knpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.NoticeService;
import com.project.knpark.service.QnaService;
import com.project.knpark.service.SuggestService;
import com.project.knpark.vo.Notice;
import com.project.knpark.vo.Qna;
import com.project.knpark.vo.Suggest;

@Controller
@RequestMapping("main")
public class MainController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private SuggestService suggestService;
	
	@RequestMapping(value="main", method= {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model, Notice notice, Qna qna, Suggest suggest) {
		model.addAttribute("notice", noticeService.noticeList(notice, null));
		model.addAttribute("qna", qnaService.qnaList(null, qna));
		model.addAttribute("sug", suggestService.suggestList(suggest, null));
		return "main/main";
	}
	@RequestMapping(value="tab1", method=RequestMethod.GET)
	public String tab1() {
		return "main/tab1";
	}
	@RequestMapping(value="tab2", method=RequestMethod.GET)
	public String tab2() {
		return "main/tab2";
	}
	@RequestMapping(value="tab3", method=RequestMethod.GET)
	public String tab3() {
		return "main/tab3";
	}
	@RequestMapping(value="copyrightPolicy", method=RequestMethod.GET)
	public String copyrightPolicy() {
		return "content/copyrightPolicy";
	}
	@RequestMapping(value="map", method=RequestMethod.GET)
	public String map() {
		return "content/map";
	}
	
}
