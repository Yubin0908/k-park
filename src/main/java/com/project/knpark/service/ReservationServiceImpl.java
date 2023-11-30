package com.project.knpark.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.ReservationRepository;
import com.project.knpark.vo.Member;
import com.project.knpark.vo.Reservation;
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;

	@Override
	public List<Reservation> getCampList(String parkname) {
		return reservationRepository.getCampList(parkname);
	}
	
	@Override
	public int getCampDateRem(Reservation reservation) {
		Date resdate = reservationRepository.getCampDateRem(reservation);
		int result = 0;
		if(resdate != null) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
		
	}
	
	@Override
	public int getCampBookingDate(Reservation reservation) {
		int result = reservationRepository.getCampBookingDate(reservation);
		
		return result;
	}

	@Override
	public int reservationCamp(Reservation reservation, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
	    reservation.setId(id);
		reservationRepository.remMinus(reservation);
		System.out.println("service 예약정보 : " + reservation);
		return reservationRepository.reservationCamp(reservation);
	}

	@Override
	public int remMinus(Reservation reservation) {
		return reservationRepository.remMinus(reservation);
	}

	@Override
	public List<Reservation> getBookingInfo(String id) {
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
	
	@Override
	public List<Reservation> getShelterList(String parkname) {
		return reservationRepository.getShelterList(parkname);
	}
	
	@Override
	public int getShelterDateRem(Reservation reservation) {
		Date resdate = reservationRepository.getShelterDateRem(reservation);
		int result = 0;
		if(resdate != null) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
	@Override
	public int reservationShelter(Reservation reservation, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
	    reservation.setId(id);
		reservationRepository.remMinusShelter(reservation);
		System.out.println("service 예약정보 : " + reservation);
		return reservationRepository.reservationShelter(reservation);
	}
	
	@Override
	public int remMinusShelter(Reservation reservation) {
		return reservationRepository.remMinusShelter(reservation);
	}
	
	@Override
	public List<Reservation> getAdminReservation(String parkname) {
		return reservationRepository.getAdminReservation(parkname);
	}
	
	@Override
	public List<Reservation> getReservedList(Reservation reservation) {
		return reservationRepository.getReservedList(reservation);
	}
	
	@Override
	public int reservedRemControl(Reservation reservation) {
		return reservationRepository.reservedRemControl(reservation);
	}
	@Override
	public int todayDateAdd(Reservation reservation) {
		int confirm = reservationRepository.dateConfirm(reservation);
		if(confirm == 0) {
			return reservationRepository.todayDateAdd(reservation);
		} else { 
			return 2;
		}	
	}
	
	@Override
	public int nextDateAdd(Reservation reservation) {
	    int confirm = reservationRepository.dateConfirm(reservation);
	    System.out.println("confirm : " + confirm);

	    if (confirm == 0) {
	        return reservationRepository.nextDateAdd(reservation);
	    } else {
	        return 2;
	    }
	}
	
	@Override
	public int preDateAdd(Reservation reservaion) {
		int confirm = reservationRepository.dateConfirm(reservaion);
		if(confirm == 0) {
			return reservationRepository.preDateAdd(reservaion);
		} else {
			return 2;
		}
		
	}
	
	@Override
	public int dateConfirm(Reservation reservation) {
		return reservationRepository.dateConfirm(reservation);
	}
}
