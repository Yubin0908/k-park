package com.project.knpark.service;

import java.util.List;

import com.project.knpark.vo.Reservation;

public interface ReservationService {
	public List<Reservation> getCampDate(int campno);
	public int getCampDateRem(Reservation reservation);
	public Reservation getCampDetail(Reservation reservation);
	public int reservationCamp(Reservation reservation);
	public int remMinus(Reservation reservation);
	public Reservation getBookingInfo(String id);
	public int cancleReservation(int bno, Reservation reservation);
	public int remPlus(Reservation reservation);
}
