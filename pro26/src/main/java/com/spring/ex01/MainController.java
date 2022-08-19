package com.spring.ex01;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("mainController")
@RequestMapping("/test") //첫번때 단계의 Uril /test이면 mainController 빈을 요청
public class MainController {
	@RequestMapping(value = "/main1.do",method=RequestMethod.GET)
	public ModelAndView main1(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","main1"); //addobject("변수명","값")
		mav.setViewName("main");
		return mav;
	}
	@RequestMapping(value = "/main2.do",method=RequestMethod.GET )
	public ModelAndView main2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","main2"); //addobject("변수명","값")
		mav.setViewName("main");
		return mav;
	}
	
}
