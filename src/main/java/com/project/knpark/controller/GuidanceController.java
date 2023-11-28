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
	
	@RequestMapping(value = "campList", method=RequestMethod.GET)
	public String guidanceCamp() {
		return "guidance/guidanceCamp";
	}
	
	@RequestMapping(value = "shelterList", method=RequestMethod.GET)
	public String guidanceShelter() {
		return "guidance/guidanceShelter";
	}
	
	@RequestMapping(value = "exploreList", method=RequestMethod.GET)
	public String guidanceExplore() {
		return "guidance/guidanceExplore";
	}
	@RequestMapping(value = "guidance.do", method=RequestMethod.GET)
	public String guidanceDetail(String park, Model model) {
		model.addAttribute("park", park);
		return "guidance/guidanceDetail";
	}
}













