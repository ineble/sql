package com.myspring.pro30.member.controller;


import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.myspring.pro30.member.service.MemberService;
import com.myspring.pro30.member.vo.MemberVO;

//@Controller("memberController11")
public class MemberControllerImpl implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	

	/*
	 * @RequestMapping(value = {"/","/main.do"}, method = RequestMethod.GET) private
	 * ModelAndView main(HttpServletRequest request, HttpServletResponse
	 * response)throws Exception{ String viewName =
	 * (String)request.getAttribute("viewName"); ModelAndView mav = new
	 * ModelAndView(); mav.setViewName(viewName); return mav; }
	 */
	
	@Override
	@RequestMapping(value = "/member/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		String viewName = (String)request.getAttribute("viewName");
//		logger.info("info 레벨 : viewName = " + viewName);
//		logger.debug("debug 레벨 : viewName = " + viewName);
		List memberList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("memberList",memberList);
		return mav;
	}
	@Override
	@RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	@Override
	@RequestMapping(value =  "/member/modMember.do", method = RequestMethod.GET)
	public ModelAndView modMember( @RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		System.out.println(viewName);
		MemberVO memberVO = memberService.modMember(id);
		request.setAttribute("member", memberVO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	
	//, @RequestParam("id") String id
	@Override
	@RequestMapping(value =  "/member/updateMember.do", method = RequestMethod.GET)
	public ModelAndView updateMember(@ModelAttribute("member") MemberVO memberVO , HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName = getViewName(request);
		request.setCharacterEncoding("utf-8");
//		System.out.println(viewName);
		System.out.println();
		System.out.println(memberVO.getName());
		System.out.println(memberVO.getPwd());
		System.out.println(memberVO.getEmail());
		
		int result = 0;
		result = memberService.updateMember(memberVO);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;		
	}
	@Override
	@RequestMapping(value = "/member/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;

	}
	

	@RequestMapping(value = {"/member/loginForm.do", "/member/memberForm.do"} , method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
		
	}
	
	
	@Override
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO membervo, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			memberVO = memberService.login(membervo);
			if(memberVO != null) {
				HttpSession session = request.getSession();
				session.setAttribute("member", memberVO);
				session.setAttribute("isLogOn", true);
				mav.setViewName("redirect:/member/listMembers.do");
			}else {
				rAttr.addFlashAttribute("result","loginFailed");
				mav.setViewName("redirect:/member/loginForm.do");
			}
		return mav;
	}
	@Override
	@RequestMapping(value="/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/listMembers.do");
		return mav;
	}
	
	@RequestMapping(value = "/member/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}
	
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/member/searchMember.do", method =
	 * RequestMethod.POST) public ModelAndView
	 * searchMember(@ModelAttribute("member") MemberVO member, HttpServletRequest
	 * request, HttpServletResponse response) throws Exception {
	 * request.setCharacterEncoding("utf-8"); int result = 0; List memberList =
	 * memberService.searchMember(member); String viewName = getViewName(request);
	 * ModelAndView mav = new ModelAndView(viewName);
	 * mav.addObject("memberList",memberList); return mav; }
	 */

	
	
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
