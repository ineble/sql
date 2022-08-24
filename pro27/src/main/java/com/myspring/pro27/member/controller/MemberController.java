package com.myspring.pro27.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.pro27.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addMember(@ModelAttribute("info") 
	MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView removeMember(@ModelAttribute("id")
	String id,HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView modMember(String id, HttpServletRequest request, HttpServletResponse response) throws Exception;


//	public ModelAndView updateMember(MemberVO member, String id, HttpServletRequest request, HttpServletResponse response)
//			throws Exception;

	public ModelAndView updateMember(MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	public ModelAndView login(@ModelAttribute("member") MemberVO membervo,
								RedirectAttributes rAttr,
								HttpServletRequest request,
								HttpServletResponse response)throws Exception;
	
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)throws Exception;

	/*
	 * public ModelAndView searchMember(MemberVO member, HttpServletRequest request,
	 * HttpServletResponse response) throws Exception;
	 */
	
	
}
