package com.project.knpark.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.project.knpark.vo.Faq;

public interface FaqService {
	public List<Faq> faqList(String pageNum, Faq faq);
	public int getFaqTotCnt(Faq faq);
	public Faq getFaq(int fno, String after);
	public int faqInsert(Faq faq);
	public int faqModify(Faq faq);
	public int faqDelete(int fno);

}
