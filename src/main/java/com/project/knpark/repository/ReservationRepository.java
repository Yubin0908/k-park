package com.project.knpark.repository;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Reservation;

@Mapper
public interface ReservationRepository {
	public List<Reservation> getCampList(String parkname);
	public Date getCampDateRem(Reservation reservation);
	public Date getCampBookingDate(Reservation reservation);
	public int reservationCamp(Reservation reservation);
	public int remMinus(Reservation reservation);
	public List<Reservation> getBookingInfo(String id);
	public int cancleReservation(int bno);
	public int remPlus(Reservation reservation);
	public List<Reservation> getShelterList(String parkname);
	public Date getShelterDateRem(Reservation reservation);
	public int reservationShelter(Reservation reservation);
	public int remMinusShelter(Reservation reservation);
	public List<Reservation> getAdminReservation(String parkname);
	public List<Reservation> getReservedList(Reservation reservation);
	public int reservedRemControl(Reservation reservation);
	public int todayDateAdd(Reservation reservation);
	public int nextDateAdd(Reservation reservation);
	public int preDateAdd(Reservation reservaion);
	public int dateConfirm(Reservation reservation);
}
