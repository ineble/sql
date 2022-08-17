package com.spring.ex04;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.ex01.MemberVO;


@WebServlet("/mem4.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberServlet() {
        super();

    }

	public void init(ServletConfig config) throws ServletException {

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doHandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doHandle(request,response);
	}
	private void doHandle(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException,IOException
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		MemberDAO dao = new MemberDAO();
		MemberVO memberVO = new MemberVO(); 
		String action = request.getParameter("action");
		String nextpage = "";
		if(action == null || action.equals("listMembers")) {
			List memberList = dao.selectAllMemberList();
			request.setAttribute("memberList", memberList);
			nextpage = "test03/listMembers.jsp";
		}else if(action.equals("selectMemberById")) {
			String id = request.getParameter("value");
			memberVO = dao.selectMemberById(id);
			request.setAttribute("member", memberVO);
			nextpage = "test03/memberInfo.jsp";
		}else if(action.equals("selectMemberByPwd")) {
			int pwd = Integer.parseInt(request.getParameter("value"));
			List<MemberVO> memberList = dao.selectMemberByPwd(pwd);
			request.setAttribute("memberList", memberList);
			nextpage = "test03/listMembers.jsp";
		}else if(action.equals("insertMember")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			memberVO.setId(id);
			memberVO.setPwd(pwd);
			memberVO.setName(name);
			memberVO.setEmail(email);
			dao.insertMember(memberVO);
			nextpage="/mem4.do?action=listMembers";
		}else if(action.equals("insertMember2")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			Map<String, String> memberMap = new HashMap<String, String>();
			memberMap.put("id", id);
			memberMap.put("pwd", pwd);
			memberMap.put("name", name);
			memberMap.put("email", email);
			dao.insertMember2(memberMap);
			nextpage="/mem4.do?action=listMembers";
		}else if(action.equals("updateMember")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			memberVO.setId(id);
			memberVO.setPwd(pwd);
			memberVO.setName(name);
			memberVO.setEmail(email);
			dao.updateMember(memberVO);
			nextpage="/mem4.do?action=listMembers";
		}else if(action.equals("deleteMember")) {
			String id = request.getParameter("id");
			dao.deleteMember(id);
			nextpage="/mem4.do?action=listMembers";
		}else if(action.equals("searchMember")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			memberVO.setName(name);
			memberVO.setEmail(email);
			List<MemberVO> memberList = dao.searchMember(memberVO);
			request.setAttribute("memberList", memberList);
			nextpage="test03/listMembers.jsp";
		}else if(action.equals("foreachSelect")) {
			List<String> nameList = new ArrayList<String>();
			nameList.add("관리자1");
			nameList.add("강현");
			nameList.add("김유신");
			List<MemberVO> memberList = dao.foreachSelect(nameList);
			request.setAttribute("memberList", memberList);
			nextpage="test03/listMembers.jsp";
		}else if(action.equals("foreachInsert")) {
			List<MemberVO> memList = new ArrayList<MemberVO>();
			memList.add(new MemberVO("m1","1234","강현","m1@test,com"));
			memList.add(new MemberVO("m2","1234","송인재","m2@test,com"));
			memList.add(new MemberVO("m3","1234","김승현","m3@test,com"));
			int result = dao.foreachInsert(memList);
			nextpage="/mem4.do?action=listMembers";
		}else if(action.equals("selectLike")) {
			String name = "강현";
			List<MemberVO> memberList  = dao.selectLike(name);
			request.setAttribute("memberList", memberList);
			nextpage="test03/listMembers.jsp";
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(nextpage);
		dispatch.forward(request, response);
		
	}

}
