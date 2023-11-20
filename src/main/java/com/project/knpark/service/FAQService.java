package com.project.knpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.knpark.util.Paging;
import com.project.knpark.vo.FAQ;

public interface FAQService {
	public List<FAQ> faqList(Paging paging);
	public int getFaqTotCnt();
	public int faqInsert(MultipartHttpServletRequest mRequest, HttpServletRequest request);
	public int faqInsert(MultipartHttpServletRequest mRequest, FAQ faq, HttpServletRequest request);
	public FAQ faqText(String aid, String after);
		// 수정후 text.do?after=u

}
