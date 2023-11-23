package com.project.knpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="reservation/bookingCampDate", method=RequestMethod.GET)
	public String bookingCampDate(int campno, Model model) {
		model.addAttribute("bookingDate", reservationService.getCampDate(campno));
		return "reservation/bookingCamp";
	}
}
