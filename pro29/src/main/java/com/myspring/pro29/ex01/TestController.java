package com.myspring.pro29.ex01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("/test/*")
public class TestController {
	static Logger logger = LoggerFactory.getLogger(TestController.class);
	@RequestMapping("/member")
	public MemberVO member() {
		MemberVO vo = new MemberVO();
		vo.setId("hong");
		vo.setPwd("1234");
		vo.setName("홍길동");
		vo.setEmail("hong@test.com");
		return vo;
	}
	
	
	@RequestMapping("/memberList")
	public List<MemberVO> listMembers() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		for(int i = 0; i < 10; i ++) {
			MemberVO vo = new MemberVO();
			vo.setId("hong" + i);
			vo.setPwd("123" + i);
			vo.setName("홍길동" + i);
			vo.setEmail("hong" + i + "@test.con");
			list.add(vo);
			
		}
		return list;
	}
	
	@RequestMapping("/memberList2")
	public ResponseEntity<List>  listMembers2() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		for(int i = 0; i < 10; i ++) {
			MemberVO vo = new MemberVO();
			vo.setId("lee" + i);
			vo.setPwd("123" + i);
			vo.setName("이순신" + i);
			vo.setEmail("lee" + i + "@test.con");
			list.add(vo);
		}
		return new ResponseEntity(list,HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	@RequestMapping("/memberMap")
	public Map<Integer, MemberVO> membersMap() {
		Map<Integer, MemberVO> map = new HashMap<Integer, MemberVO>();
		for(int i = 0; i < 10; i ++) {
			MemberVO vo = new MemberVO();
			vo.setId("hong" + i);
			vo.setPwd("123" + i);
			vo.setName("홍길동" + i);
			vo.setEmail("hong" + i + "@test.con");
			map.put(i, vo);
			
		}
		return map;
	}
		
	@RequestMapping(value = "/notice/{num}", method = RequestMethod.GET)
	public int notice(@PathVariable("num") int num) throws Exception{
		return num;
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.POST)
	public void modify(@RequestBody MemberVO vo) throws Exception{
		logger.info(vo.toString());
	}
	
	@RequestMapping(value = "/res3")
	public ResponseEntity res3() {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		String message = "<script>";
		message += " alert('새 회원을 등록합니다.');";
		message += " location.href='/pro29/test/memberList2';";
		message += " </script>";
		return new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
	}
	
	
}
