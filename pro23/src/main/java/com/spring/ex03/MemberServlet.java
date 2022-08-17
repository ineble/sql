//package com.spring.ex03;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletConfig;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//@WebServlet("/mem3.do")
//public class MemberServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    public MemberServlet() {
//        super();
//
//    }
//
//	public void init(ServletConfig config) throws ServletException {
//
//	}
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		 doHandle(request,response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		 doHandle(request,response);
//	}
//	private void doHandle(HttpServletRequest request, HttpServletResponse response) 
//	throws ServletException,IOException
//	{
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=utf-8");
//		MemberDAO dao = new MemberDAO();
//		MemberVO memberVO = new MemberVO(); 
//		String action = request.getParameter("action");
//		String nextpage = "";
//		if(action == null || action.equals("listMembers")) {
//			List memberList = dao.selectAllMemberList();
//			request.setAttribute("memberList", memberList);
//			nextpage = "test02/listMembers.jsp";
//		}else if(action.equals("selectMemberById")) {
//			String id = request.getParameter("value");
//			memberVO = dao.selectMemberById(id);
//			request.setAttribute("member", memberVO);
//			nextpage = "test02/memberInfo.jsp";
//		}else if(action.equals("selectMemberByPwd")) {
//			int pwd = Integer.parseInt(request.getParameter("value"));
//			List<MemberVO> memberList = dao.selectMemberByPwd(pwd);
//			request.setAttribute("memberList", memberList);
//			nextpage = "test02/listMembers.jsp";
//		}
//		RequestDispatcher dispatch = request.getRequestDispatcher(nextpage);
//		dispatch.forward(request, response);
//		
//	}
//
//}
