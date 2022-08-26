package com.myspring.pro30.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.member.vo.MemberVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int articleNO = selectNewArticleNO();
		System.out.println("articleNO : "  + articleNO);
		articleMap.put("articleNO", articleNO);
		sqlSession.insert("mapper.board.insertNewArticle", articleMap);
		return articleNO;
	}

	private int selectNewArticleNO() {
		return sqlSession.selectOne("mapper.board.selectNewArticleNO"); 
	}

	@Override
	public ArticleVO selectArticle(int articleNO) throws DataAccessException {
		ArticleVO result = sqlSession.selectOne("mapper.board.selectArticle", articleNO);
		return result;
	}

	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle",articleMap);
	}

		
	@Override
	public void deleteArticle(int articleNO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteArticle",articleNO);
	}

	@Override
	public List selectAllArticleList() throws DataAccessException {
		List<ArticleVO> articleList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		return articleList;
	}

	@Override
	public List selectImageFileNO(int articleNO) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
	}
	
	

}
