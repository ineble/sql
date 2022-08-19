package com.spring.ex02;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller("loginController")
public class LoginController {
	@RequestMapping(value = {"/test/loginForm.do","/test/loginForm2.do"}, method = {RequestMethod.GET})
	public ModelAndView loginForm(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginForm");
		return mav;
	}
	@RequestMapping(value = "/test/login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("result");
		String uesrId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		mav.addObject("userId",uesrId);
		mav.addObject("userName",userName);
		return mav;
	}
	@RequestMapping(value = "/test/login2.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login2(@RequestParam("userId") String userId,
							@RequestParam("userName") String userName, 
							HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("result");
		System.out.println("userId" + userId);
		System.out.println("userName" + userName);
		mav.addObject("userId",userId);
		mav.addObject("userName",userName);
		return mav;
	}
	@RequestMapping(value = "/test/login3.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login3(@RequestParam Map<String, String> info,
					HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		String uesrId = info.get("userId");
		String userName = info.get("userName");
		System.out.println("userId : " + uesrId);
		System.out.println("userName : " + userName);
		mav.addObject("info",info);
		mav.setViewName("result");
		return mav;
	}
	@RequestMapping(value = "/test/login4.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login4(@ModelAttribute("info") LoginVO loginVO,
					HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		System.out.println("userId : " + loginVO.getUserId());
		System.out.println("userName : " + loginVO.getUserName());
		mav.setViewName("result");
		return mav;
	}
	@RequestMapping(value = "/test/login5.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String login5(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		model.addAttribute("userId","hong");
		model.addAttribute("userName","홍길동");
		return "result";
	}

}
