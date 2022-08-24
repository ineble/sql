package com.myspring.pro27.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			String viewName = getViewName(request);
			request.setAttribute("viewName", viewName);
		}catch(Exception e) {
			e.printStackTrace();
		}
	return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
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
			System.out.println("contextPath : " + contextPath);
			System.out.println("being : " + begin);
		}
		int end;
		if(uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		}else if(uri.indexOf("?")!= -1) {
			end = uri.indexOf("?");
		}else {
			end=uri.length();
		}
		System.out.println("end : " + end);
		System.out.println("uri : " + uri);
		String fileName = uri.substring(begin,end);
		System.out.println("fileName1 : " +fileName);
		if(fileName.indexOf(".")!= -1) {
			fileName = fileName.substring(0,fileName.lastIndexOf("."));
		}
		if(fileName.lastIndexOf("/")!= -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/",1),fileName.length());
			System.out.println(fileName.length());
			System.out.println("fileName2 : " +fileName);
		}
		return fileName;
	}
	
		
	
}
