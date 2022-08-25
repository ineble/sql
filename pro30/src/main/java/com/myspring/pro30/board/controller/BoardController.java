package com.myspring.pro30.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.pro30.member.vo.MemberVO;

public interface BoardController {
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewArticleAndView (@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity removeArticle(@RequestParam("articeNO") int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
