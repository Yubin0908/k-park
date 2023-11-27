package com.project.knpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.GuidanceService;
import com.project.knpark.service.ReservationService;

@Controller
@RequestMapping("guidance")
public class GuidanceController {
	
	@Autowired
	private GuidanceService guidanceService;
	
	@RequestMapping(value = "guidanceCamp", method=RequestMethod.GET)
	public String guidanceCamp() {
		return "guidance/guidanceCamp";
	}
	
	@RequestMapping(value = "guidanceCampList", method=RequestMethod.GET)
	public String guidanceCampList(Model model, String parkname) {
		model.addAttribute("campList", guidanceService.getCampList(parkname));
		return "guidance/campList";
	}
	@RequestMapping(value = "guidance.do", method=RequestMethod.GET)
	public String guidanceDetail(String park, Model model) {
		model.addAttribute("park", park);
		return "guidance/guidanceDetail";
	}
}













