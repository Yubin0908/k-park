package com.project.knpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.SuggestService;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Suggest;

@Controller
public class SuggestController {

	@Autowired
	private SuggestService suggestService;
	
	@RequestMapping(value = "board/sugList", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Suggest suggest, Model model) {
		System.out.println(suggest);
		model.addAttribute("suggestList", suggestService.suggestList(suggest, pageNum));
		model.addAttribute("paging", new Paging(suggestService.getSuggestTotCnt(suggest),pageNum, 10,10));
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
}













