package com.project.knpark.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.knpark.service.ReservationService;
import com.project.knpark.vo.Reservation;

@Controller
@RequestMapping("reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="bookingCamp", method=RequestMethod.GET)
	public String bookingCampDate() {
		return "reservation/bookingCamp";
	}
	
	@RequestMapping(value="bookingCampList", method=RequestMethod.GET)
	public String bookingCampList(Model model, String parkname) {
		model.addAttribute("campList", reservationService.getCampList(parkname));
		return "reservation/campList";
	}
	@RequestMapping(value="bookingDate", method=RequestMethod.GET)
	public String bookingDate(Model model, Reservation reservation) {
		model.addAttribute("DateConfirm", reservationService.getCampDateRem(reservation));
		return "reservation/bookingDate";
	}
	@RequestMapping(value="booking", method=RequestMethod.GET) 
	public String booking(Model model, Reservation reservation, HttpSession session) {
		System.out.println("예약 정보 : " + reservation);
		model.addAttribute("bookingResult", reservationService.reservationCamp(reservation, session));
		System.out.println(reservation);
		return "reservation/bookingResult";
	}
}
