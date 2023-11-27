package com.project.knpark.service;

import java.util.List;

import com.project.knpark.vo.Guidance;

public interface GuidanceService {
	public List<Guidance> getCampList(String parkname);
	public Guidance getGuidance(int fno, String after);
}
