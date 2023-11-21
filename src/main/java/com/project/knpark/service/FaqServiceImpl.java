package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knpark.repository.FaqRepository;
import com.project.knpark.util.Paging;
import com.project.knpark.vo.Faq;
@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqRepository faqRepository;
	
	@Override
	public List<Faq> faqList(String pageNum, Faq faq) {
		Paging paging = new Paging(faqRepository.getFaqTotCnt(faq), pageNum, 10, 10);
		faq.setStartRow(paging.getStartRow());
		faq.setEndRow(paging.getEndRow());
		return faqRepository.faqList(faq);
	}

	@Override
	public int getFaqTotCnt(Faq faq) {
		return faqRepository.getFaqTotCnt(faq);
	}
	
	@Override
	public Faq getFaq(int fno, String after) {
		return faqRepository.getFaq(fno);
	}
	@Override
	public int faqInsert(Faq faq) {
		return faqRepository.faqInsert(faq);
	}

	@Override
	public int faqModify(Faq faq) {
		return faqRepository.faqModify(faq);
	}

	@Override
	public int faqDelete(int fno) {
		return faqRepository.faqDelete(fno);
	}

}
