package com.project.knpark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Reservation;

@Mapper
public interface ReservationRepository {
	public List<Reservation> getCampDate(int campno);
	public int getCampDateRem(Reservation reservation);
	public Reservation getCampDetail(Reservation reservation);
	public int reservationCamp(Reservation reservation);
	public int remMinus(Reservation reservation);
	public Reservation getBookingInfo(String id);
	public int cancleReservation(int bno);
	public int remPlus(Reservation reservation);
}
