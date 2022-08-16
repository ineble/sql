package com.spring.ex02;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@WebServlet("/test.do")
public class UserController extends MultiActionController {

//    public ModelAndView login(HttpServletRequest request, HttpServletResponse response)
//    throws Exception{
//    	String userID = "";
//    	String passWD = "";
//    	ModelAndView mav = new ModelAndView();
//    	request.setCharacterEncoding("utf-8");
//    	userID = request.getParameter("userID");
//    	passWD = request.getParameter("passWD");
//    	mav.addObject("userID", userID);
//    	mav.addObject("passWD", passWD);
//    	mav.setViewName("result");
//    	// result로 이름을 붙여주는 이유는 : view의 명칭을 바꿀때 다른 뷰를 쓸 수 있게하기위해서다
//    	return mav;
//    }
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userID = "";
		String passWD = "";
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		userID = request.getParameter("userID");
		passWD = request.getParameter("passWD");
		String viewName = getViewName(request);
		mav.addObject("userID", userID);
		mav.addObject("passWD", passWD);
		mav.setViewName(viewName);
		System.out.println("viewName :" + viewName);
		// result로 이름을 붙여주는 이유는 : view의 명칭을 바꿀때 다른 뷰를 쓸 수 있게하기위해서다
		return mav;
	}

	public ModelAndView memberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		mav.addObject("id",id);
		mav.addObject("pwd",pwd);
		mav.addObject("name",name);
		mav.addObject("email",email);
		mav.setViewName("memberInfo");
		return mav;
	}
	private String getViewName(HttpServletRequest request) throws Exception{
		String contextPath = request.getContextPath();
		String uri = (String)request.getAttribute("javax.servlet.forward.request_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		int begin = 0;
		if(!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		int end;
		if(uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		}else if(uri.indexOf("?")!= -1) {
			end = uri.indexOf("?");
		}else {
			end=uri.length();
		}
		String fileName = uri.substring(begin,end);
		if(fileName.indexOf(".")!= -1) {
			fileName = fileName.substring(0,fileName.lastIndexOf("."));
		}
		if(fileName.lastIndexOf("/")!= -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/"),fileName.length());
		}
		return fileName;
	}
}
