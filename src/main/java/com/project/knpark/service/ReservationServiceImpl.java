package com.project.knpark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.ReservationRepository;
import com.project.knpark.vo.Reservation;
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;

	@Override
	public List<Reservation> getCampDate(int campno) {
		return reservationRepository.getCampDate(campno);
	}

	@Override
	public int getCampDateRem(Reservation reservation) {
		int result = reservationRepository.getCampDateRem(reservation);
		
		if(result == 0) {
			return 0;
		} else {
			return 1;
		}
		
	}

	@Override
	public Reservation getCampDetail(Reservation reservation) {
		return reservationRepository.getCampDetail(reservation);
	}

	@Override
	public int reservationCamp(Reservation reservation) {
		reservationRepository.remMinus(reservation);
		return reservationRepository.reservationCamp(reservation);
	}

	@Override
	public int remMinus(Reservation reservation) {
		return reservationRepository.remPlus(reservation);
	}

	@Override
	public Reservation getBookingInfo(String id) {
		return reservationRepository.getBookingInfo(id);
	}

	@Override
	public int cancleReservation(int bno, Reservation reservation) {
		reservationRepository.remPlus(reservation);
		return reservationRepository.cancleReservation(bno);
	}

	@Override
	public int remPlus(Reservation reservation) {
		return reservationRepository.remPlus(reservation);
	}

}
