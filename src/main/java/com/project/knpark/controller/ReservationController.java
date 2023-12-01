package com.project.knpark.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.knpark.service.ReservationService;
import com.project.knpark.vo.Admin;
import com.project.knpark.vo.Reservation;

@Controller
@RequestMapping("reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="bookingCamp", method=RequestMethod.GET)
	public String bookingCamp() {
		return "reservation/bookingCamp";
	}
	@RequestMapping(value="bookingShelter", method=RequestMethod.GET)
	public String bookingShelter() {
		return "reservation/bookingShelter";
	}
	
	
	@RequestMapping(value="bookingCampList", method=RequestMethod.GET)
	public String bookingCampList(Model model, String parkname) {
		model.addAttribute("campList", reservationService.getCampList(parkname));
		return "reservation/campList";
	}
	@RequestMapping(value="bookingShelterList", method=RequestMethod.GET)
	public String bookingShelterList(Model model, String parkname) {
		model.addAttribute("shelterList", reservationService.getShelterList(parkname));
		return "reservation/shelterList";
	}
	
	@RequestMapping(value="bookingCampDate", method=RequestMethod.GET)
	public String bookingCampDate(Model model, Reservation reservation) {
		model.addAttribute("DateConfirm", reservationService.getCampDateRem(reservation));
		return "reservation/bookingDate";
	}
	@RequestMapping(value="bookingShelterDate", method=RequestMethod.GET)
	public String bookingShelterDate(Model model, Reservation reservation) {
		model.addAttribute("DateConfirm", reservationService.getShelterDateRem(reservation));
		return "reservation/bookingDate";
	}
	
	@RequestMapping(value="reservationCamp", method=RequestMethod.GET) 
	public String reservationCamp(Model model, Reservation reservation, HttpSession session) {
		model.addAttribute("bookingResult", reservationService.reservationCamp(reservation, session));
		return "reservation/bookingResult";
	}
	@RequestMapping(value="reservationShelter", method=RequestMethod.GET)
	public String reservationShelter(Model model, Reservation reservation, HttpSession session) {
		model.addAttribute("bookingResult", reservationService.reservationShelter(reservation, session));
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
	@RequestMapping(value="adminList", method=RequestMethod.GET)
	public String getAdminReservation(String parkname, Model model) {
		model.addAttribute("adminReservedList", reservationService.getAdminReservation(parkname));
		return "admin/reservedList";
	}
	@RequestMapping(value="adminService", method= {RequestMethod.GET, RequestMethod.POST})
	public String adminService(Reservation reservation, Model model) {
		model.addAttribute("reservedList", reservationService.getReservedList(reservation));
		return "admin/adminService";
	}
	@RequestMapping(value="adminRemControl", method=RequestMethod.POST)
	public String adminRemControl(Reservation reservation, Model model) {
	    System.out.println(reservation);
	    model.addAttribute("ControlResult", reservationService.reservedRemControl(reservation));
	    return "forward:adminService.do";
	}
	@RequestMapping(value="addDate", method=RequestMethod.GET)
	public String addDate(Model model, String parkname, String type, Reservation reservation) {
		if(type == null) {
			type = reservation.getType();
		} else {
			if(type.equals("camp")) {
				model.addAttribute("campList", reservationService.getCampList(parkname));
			} else if(type.equals("shelter")){
				model.addAttribute("shelterList", reservationService.getShelterList(parkname));
			}
		}
		return "admin/addDate";	
	}
	@RequestMapping(value="todayAdd", method=RequestMethod.GET)
	public String todatAdd(Model model, Reservation reservation) {
		System.out.println(reservation);
		model.addAttribute("addResult", reservationService.todayDateAdd(reservation));
		return "redirect:addDate.do";
	}
	@RequestMapping(value="nextdayAdd", method=RequestMethod.GET)
	public String nextdayAdd(Model model, Reservation reservation) {
		System.out.println(reservation);
		model.addAttribute("addResult", reservationService.nextDateAdd(reservation));
		return "redirect:addDate.do";
	}
	@RequestMapping(value="preDateAdd", method=RequestMethod.GET)
	public String preDateAdd(Model model, Reservation reservation) {
		System.out.println(reservation);
		model.addAttribute("addResult", reservationService.preDateAdd(reservation));
		return "redirect:addDate.do";
	}

}
