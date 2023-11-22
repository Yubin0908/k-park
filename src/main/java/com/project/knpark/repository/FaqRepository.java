package com.project.knpark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.knpark.vo.Faq;

@Mapper
public interface FaqRepository {
	public List<Faq> faqList(Faq faq);
	public int getFaqTotCnt(Faq faq);
	public Faq getFaq(int fno);
	public int faqInsert(Faq faq);
	public int faqModify(Faq faq);
	public int faqDelete(int fno);
}








