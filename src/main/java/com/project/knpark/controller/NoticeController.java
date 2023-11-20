package com.project.knpark.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.NoticeService;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="board/noticeList", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticeList(String pageNum, Notice notice, Model model) {
		model.addAttribute("noticeList", noticeService.noticeList(notice, pageNum));
		model.addAttribute("paging", new Paging(noticeService.getNoticeTotCnt(notice), pageNum, 10, 10));
		model.addAttribute("cnt", noticeService.getNoticeTotCnt(notice));
		return "board/noticeList";
	}
	
	@RequestMapping(value="board/noticeDetail", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticeDetail(int nno, Model model, String after) {
		model.addAttribute("notice", noticeService.getNotice(nno, after));
		return "board/noticeDetail";
	}
	
	@RequestMapping(value="board/noticeWrite", method=RequestMethod.GET)
	public String noticeInsert() {
		return "board/noticeWrite";
	}
	
	@RequestMapping(value="board/noticeWrite", method=RequestMethod.POST)
	public String noticeInsert(HttpServletRequest request, Notice notice, Model model) {
		model.addAttribute("noticeWriteResult", noticeService.noticeInsert(notice, request));
		return "forward:noticeList.do";
	}
	
	@RequestMapping(value="board/noticeModify", method=RequestMethod.GET)
	public String noticeModify(int nno, Model model, String after) {
		model.addAttribute("notice", noticeService.getNotice(nno, after));
		return "board/noticeModify";
	}
	
	@RequestMapping(value="board/noticeModify", method=RequestMethod.POST)
	public String noticeModify(HttpServletRequest request, Notice notice, Model model, String pageNum) {
		model.addAttribute("modifyResult", noticeService.noticeModify(notice, request));
		return "forward:noticeDetail.do";
	}
	
	@RequestMapping(value="board/noticeDelete", method=RequestMethod.GET)
	public String noticeDelete(int nno, Model model) {
		model.addAttribute("deleteResult", noticeService.noticeDelete(nno));
		return "forward:noticeList.do";
	}
	
}
