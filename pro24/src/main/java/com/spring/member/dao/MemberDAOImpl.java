package com.spring.member.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVO;

public class MemberDAOImpl implements MemberDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> memberList = null;
		memberList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return memberList;
	}
	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember",memberVO);
		System.out.println(memberVO);
		return result;
	}
	@Override
	public int deleteMember(String id) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.deleteMember",id);
		return result;
	}
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.update("mapper.member.updateMember",memberVO);
		System.out.println(memberVO);
		return result;
		
	}	
	@Override
	public MemberVO modMember(String id) throws DataAccessException {
		MemberVO memberVO = (MemberVO)sqlSession.selectOne("mapper.member.selectMemberById", id);
		return memberVO;	
	}
	
	
}
