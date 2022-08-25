package com.myspring.pro29.ex03;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


//@RestController
//@RequestMapping("/boards")
public class BoardController {
	static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public ResponseEntity<List<ArticleVO>> listArticles() {
		logger.info("listArticles 메서드 호출");
		List<ArticleVO> list = new ArrayList<ArticleVO>();
		for(int i = 0; i < 10; i++) {
			ArticleVO vo = new ArticleVO();
			vo.setArticleNO(i);
			vo.setWriter("이순신"+i);
			vo.setTitle("안냥하세여"+i);
			vo.setContent("새 상품을 소개합니다."+i);
			list.add(vo);
		}
		return new ResponseEntity(list,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/{articleNO}", method = RequestMethod.GET)
	public ResponseEntity<List<ArticleVO>> findArticle(
			@PathVariable("articleNO") Integer articleNO) {
		logger.info("findArticle 메서드 호출");
		ArticleVO vo = new ArticleVO();
		vo.setArticleNO(articleNO);
		vo.setWriter("홍길동");
		vo.setTitle("안녕하세요");
		vo.setContent("홍길동 글입니다");
		return new ResponseEntity(vo,HttpStatus.OK);
		}
		
	}
