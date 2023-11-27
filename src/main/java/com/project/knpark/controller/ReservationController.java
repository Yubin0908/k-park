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
		model.addAttribute("myReservation", reservationService.getCampBookingDate(reservation));
		return "reservation/bookingDate";
	}
	@RequestMapping(value="reservationCamp", method=RequestMethod.GET) 
	public String booking(Model model, Reservation reservation, HttpSession session) {
		System.out.println("예약 정보 : " + reservation);
		model.addAttribute("bookingResult", reservationService.reservationCamp(reservation, session));
		System.out.println(reservation);
		return "reservation/bookingResult";
	}
	@RequestMapping(value="reservationList", method=RequestMethod.GET)
	public String reservationList(Model model, String id) {
		model.addAttribute("reservedList", reservationService.getBookingInfo(id));
		return "reservation/reservationList";
	}
	@RequestMapping(value="cancleReservation", method=RequestMethod.GET)
	public String cancleReservation(int bno, Model model, Reservation reservation) {
		model.addAttribute("reservationCancel", reservationService.cancleReservation(bno, reservation));
		return "forward:reservationList.do";
	}
	
}
