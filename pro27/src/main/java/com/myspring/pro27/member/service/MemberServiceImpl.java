package com.myspring.pro27.member.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.pro27.member.dao.MemberDAO;
import com.myspring.pro27.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List listMembers() throws DataAccessException {
		List memberList = null;
		memberList = memberDAO.selectAllMemberList();
		
		return memberList;
	}

	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.insertMember(memberVO);
	}

	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}

	@Override
	public MemberVO modMember(String id) throws DataAccessException {
		return memberDAO.selectMem(id);
	}

	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.updateMember(memberVO);
	}

	@Override
	public MemberVO login(MemberVO membervo) throws DataAccessException {
		return memberDAO.loginById(membervo);
	}
	
//	@Override
//	public List<MemberVO> searchMember(MemberVO memberVO) throws DataAccessException {
//		List memberList = null;
//		memberList = memberDAO.searchMember(memberVO);
//		return memberList;
//	}
	
	
}
