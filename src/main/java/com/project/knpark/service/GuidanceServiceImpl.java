package com.project.knpark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.GuidanceRepository;
import com.project.knpark.vo.Guidance;
@Service
public class GuidanceServiceImpl implements GuidanceService {
	
	@Autowired
	private GuidanceRepository guidanceRepository;
	@Override
	public List<Guidance> getCampList(String parkname) {
		return guidanceRepository.getCampList(parkname);
	}
	
	@Override
	public Guidance getGuidance(int fno, String after) {
		return guidanceRepository.getGuidance(fno);
	}

}
