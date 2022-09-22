package com.koreait.hotelfive.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.MemberDTO;

	public class MyUpdateCommand implements Command {
	
		@Override
		public void execute(SqlSession sqlSession, Model model) {
	
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
		
			MemberDTO mDTO = new MemberDTO();
			mDTO.setmPw(request.getParameter("mPw"));
			mDTO.setmName(request.getParameter("mName"));
			mDTO.setmBirth(request.getParameter("mBirth"));
			mDTO.setmEmail(request.getParameter("mEmail"));
			mDTO.setmPhone(request.getParameter("mPhone"));
			mDTO.setmZipcode(Integer.parseInt(request.getParameter("mZipcode")));
			mDTO.setmAddr1(request.getParameter("mAddr1"));
			mDTO.setmAddr2(request.getParameter("mAddr2"));
			mDTO.setmId(request.getParameter("mId"));
			
			HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
			hDAO.memberUpdate(mDTO);
			
			HttpSession session = request.getSession();
			session.removeAttribute("loginDTO");
			session.setAttribute("loginDTO", mDTO);
		}
	
	}

	
	
	