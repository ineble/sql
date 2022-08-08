package sec02.ex02;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/*") //1차 mapping
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	MemberDAO memberDAO;
	
    public void init(ServletConfig config) throws ServletException {
    	memberDAO = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandel(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandel(request,response);
	}

	private void doHandel(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		if(action == null || action.equals("/listMembers.do")) {
		List<MemberVo> memberList = memberDAO.listMember();
		request.setAttribute("membersList", memberList);
		
		}else if(action.equals("/addMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberVo memberVo = new MemberVo(id, pwd, name, email);
			memberDAO.addMember(memberVo);
			nextPage = "/member/listMembers.jsp";

		}else if(action.equals("/memberForm.do")) {
			nextPage = "/test03/memberForm.jsp";
		}else if(action.equals("/modMemberForm.do")) {
			String id = request.getParameter("id");
			MemberVo memInfo = memberDAO.findMember(id);
			request.setAttribute("memInfo", memInfo);
			nextPage = "/test03/modMemberForm.jsp";
		}else if(action.equals("/modMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberVo memberVo = new MemberVo(id, pwd, name, email);
			memberDAO.modMember(memberVo);
			nextPage = "/member/listMembers.do";
		}else if(action.equals("/delMember.do")) {
			String id = request.getParameter("id");
			memberDAO.delMember(id);
			request.setAttribute("msg", "deleted");
			nextPage = "/member/listMembers.do";
		}else {
			List<MemberVo> memberList = memberDAO.listMember();
			request.setAttribute("memberList", memberList);
			nextPage = "/test03/listMembers.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
