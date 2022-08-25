package com.myspring.pro30.board.dao;

import java.util.List;
import java.util.Map;


import com.myspring.pro30.board.vo.ArticleVO;

public interface BoardDAO {

	public int insertNewArticle(Map articleMap) throws Exception;

	public ArticleVO selectArticle(int articleNO) throws Exception;

	public void updateArticle(Map articleMap) throws Exception;

	public void deleteArticle(int articleNO) throws Exception;

	public List selectAllMemberList() throws Exception;

	

	
}
