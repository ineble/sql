package com.myspring.pro27.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.pro27.member.vo.MemberVO;

public interface MemberDAO {

	List selectAllMemberList() throws DataAccessException;

	int insertMember(MemberVO memberVO) throws DataAccessException;

	int deleteMember(String id) throws DataAccessException;

	public MemberVO selectMem(String id) throws DataAccessException;

	int updateMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	//public List<MemberVO> searchMember(MemberVO memberVO) throws DataAccessException;

	
}
