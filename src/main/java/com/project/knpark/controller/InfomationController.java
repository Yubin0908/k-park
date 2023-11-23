package com.project.knpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.InfomationService;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Infomation;

@Controller
public class InfomationController {
	@Autowired
	private InfomationService infomationService;
	
	@RequestMapping(value = "board/infoList", method= {RequestMethod.GET, RequestMethod.POST})
	public String infoList(String pageNum, Infomation infomation, Model model) {
		model.addAttribute("infoList", infomationService.infoList(infomation, pageNum));
		model.addAttribute("paging", new Paging(infomationService.getInfoTotCnt(infomation), pageNum, 10, 10));
		model.addAttribute("cnt", infomationService.getInfoTotCnt(infomation));
		return "board/infoList";
	}
	
	@RequestMapping(value = "board/infoDetail", method= {RequestMethod.GET, RequestMethod.POST})
	public String infoDetail(int ino, Model model, String after) {
		model.addAttribute("infomation", infomationService.getInfo(ino, after));
		return "board/infoDetail";
	}
	@RequestMapping(value = "board/infoWrite", method=RequestMethod.GET)
	public String infoInsert() {
		return "board/infoWrite";
	}
	@RequestMapping(value = "board/infoWrite", method=RequestMethod.POST)
	public String infoInsert(Infomation infomation, Model model) {
		model.addAttribute("infoWriteResult", infomationService.infoInsert(infomation));
		return "forward:infoList.do";
	}
	@RequestMapping(value = "board/infoModify", method=RequestMethod.GET)
	public String infoModify(int ino, Model model, String after) {
		model.addAttribute("infomation", infomationService.getInfo(ino, after));
		return "board/infoModify";
	}
	@RequestMapping(value = "board/infoModify", method=RequestMethod.POST)
	public String infoModify(Infomation infomation, Model model, String pageNum) {
		model.addAttribute("modifyResult", infomationService.infoModify(infomation));
		return "forward:infoDetail.do";
	}
	@RequestMapping(value = "board/infoDelete", method=RequestMethod.GET)
	public String infoDelete(int ino, Model model) {
		model.addAttribute("deleteResult", infomationService.infoDelete(ino));
		return "forward:infoList.do";
	}
}
