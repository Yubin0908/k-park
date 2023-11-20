package com.project.knpark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("main")
public class MainController {
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	@RequestMapping(value="tab1", method=RequestMethod.GET)
	public String tab1() {
		return "main/tab1";
	}
	@RequestMapping(value="tab2", method=RequestMethod.GET)
	public String tab2() {
		return "main/tab2";
	}
	@RequestMapping(value="tab3", method=RequestMethod.GET)
	public String tab3() {
		return "main/tab3";
	}
	
}
