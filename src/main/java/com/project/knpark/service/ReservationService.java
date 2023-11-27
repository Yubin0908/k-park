package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.knpark.vo.Reservation;

public interface ReservationService {
	public List<Reservation> getCampList(String parkname);
	public int getCampDateRem(Reservation reservation);
	public int getCampBookingDate(Reservation reservation);
	public int reservationCamp(Reservation reservation, HttpSession session);
	public int remMinus(Reservation reservation);
	public List<Reservation> getBookingInfo(String id);
	public int cancleReservation(int bno, Reservation reservation);
	public int remPlus(Reservation reservation);
}
