package com.myspring.pro30.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.member.vo.MemberVO;

public interface BoardService {
	public int addNewArticle(Map articleMap) throws Exception;

	public ArticleVO viewArticle(int articleNO) throws Exception;

	public void modArticle(Map articleMap) throws Exception;

	public void removeArticle(int articleNO) throws Exception;

	public List listMembers() throws Exception;



	//public List<MemberVO> searchMember(MemberVO memberVO) throws DataAccessException;

	

}
