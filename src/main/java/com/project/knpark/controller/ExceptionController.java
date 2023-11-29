package com.project.knpark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("error")
public class ExceptionController {
	
	@RequestMapping(value="404", method=RequestMethod.GET)
	public String e404() {
		return "error/404";
	}
	
	@RequestMapping(value="500", method=RequestMethod.GET)
	public String e500() {
		return "error/500";
	}
}
