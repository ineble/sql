//package com.spring.ex01;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletConfig;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//@WebServlet("/mem.do")
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
//		List memberList = dao.selectAllMemberList();
//		request.setAttribute("memberList", memberList);
//		RequestDispatcher dispatch = request.getRequestDispatcher("test01/listMembers.jsp");
//		dispatch.forward(request, response);
//	}
//
//}
