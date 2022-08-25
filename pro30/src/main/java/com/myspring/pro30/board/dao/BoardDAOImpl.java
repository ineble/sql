package com.myspring.pro30.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.member.vo.MemberVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertNewArticle(Map articleMap) throws Exception {
		int result = sqlSession.insert("mapper.member.insertArticle", articleMap);
		return result;
	}

	@Override
	public ArticleVO selectArticle(int articleNO) throws Exception {
		ArticleVO result = sqlSession.selectOne("mapper.member.selectMemberById", articleNO);
		return result;
	}

	@Override
	public void updateArticle(Map articleMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteArticle(int articleNO) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List selectAllMemberList() throws Exception {
		List<ArticleVO> articleList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		return articleList;
	}

}
