package com.koreait.hotelfive.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.MemberDTO;

public class RegistorCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
	
		MemberDTO mDTO = new MemberDTO();
		mDTO.setmId(request.getParameter("mId"));
		mDTO.setmPw(request.getParameter("mPw"));
		mDTO.setmName(request.getParameter("mName"));
		mDTO.setmBirth(request.getParameter("mBirth"));
		mDTO.setmEmail(request.getParameter("mEmail"));
		mDTO.setmPhone(request.getParameter("mPhone"));
		mDTO.setmAddr1(request.getParameter("mAddr1"));
		mDTO.setmAddr2(request.getParameter("mAddr2"));
		mDTO.setmZipcode(Integer.parseInt(request.getParameter("mZipcode")));
 
		System.out.println(request.getParameter("mName")); 
		System.out.println(request.getParameter("mAddr1")); 
		System.out.println(request.getParameter("mAddr2"));		
		/*
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		String mName = request.getParameter("mName");
		String mEmail = request.getParameter("mEmail");
		String mPhone = request.getParameter("mPhone");
		String mAddr = request.getParameter("mAddr");
		*/
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		hDAO.registor(mDTO);
		System.out.println(mDTO.getmName());
		System.out.println(mDTO.getmBirth());
		System.out.println(mDTO.getmAddr1());
		System.out.println(mDTO.getmAddr2());
		System.out.println(mDTO.getmEmail());
		//request.setAttribute("mName", request.getParameter("mName"));
		
	}

}
