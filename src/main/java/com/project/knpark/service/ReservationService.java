package com.project.knpark.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.knpark.vo.Reservation;

public interface ReservationService {
	public List<Reservation> getCampList(String parkname);
	public int getCampDateRem(Reservation reservation);
	public int getCampBookingDate(Reservation reservation, HttpSession session);
	public int reservationCamp(Reservation reservation, HttpSession session);
	public int remMinus(Reservation reservation);
	public List<Reservation> getBookingInfo(String id);
	public int cancleReservation(int bno, Reservation reservation);
	public int remPlus(Reservation reservation);
	public List<Reservation> getShelterList(String parkname);
	public int getShelterDateRem(Reservation reservation);
	public int reservationShelter(Reservation reservation, HttpSession session);
	public int remMinusShelter(Reservation reservation);
	public List<Reservation> getAdminReservation(String parkname);
	public List<Reservation> getReservedList(Reservation reservation);
	public int reservedRemControl(Reservation reservation);
	public int todayDateAdd(Reservation reservation);
	public int nextDateAdd(Reservation reservation);
	public int preDateAdd(Reservation reservaion);
	public int dateConfirm(Reservation reservation);
}
