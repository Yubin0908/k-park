package com.project.knpark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.InfomationRepository;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Infomation;
@Service
public class InfomationServiceImpl implements InfomationService {
	@Autowired
	private InfomationRepository infomationRepository;
	@Override
	public List<Infomation> infoList(Infomation infomation, String pageNum) {
		Paging paging = new Paging(infomationRepository.getInfoTotCnt(infomation), pageNum, 10, 10);
		infomation.setStartRow(paging.getStartRow());
		infomation.setEndRow(paging.getEndRow());
		return infomationRepository.infoList(infomation);
	}

	@Override
	public int getInfoTotCnt(Infomation infomation) {
		return infomationRepository.getInfoTotCnt(infomation);
	}

	@Override
	public Infomation getInfo(int ino, String after) {
		return infomationRepository.getInfo(ino);
	}

	@Override
	public int infoInsert(Infomation infomation) {
		return infomationRepository.infoInsert(infomation);
	}

	@Override
	public int infoModify(Infomation infomation) {
		return infomationRepository.infoModify(infomation);
	}

	@Override
	public int infoDelete(int ino) {
		return infomationRepository.infoDelete(ino);
	}

}
