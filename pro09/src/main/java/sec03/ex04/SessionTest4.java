package sec03.ex04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sess4")
public class SessionTest4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
	public void destroy() {

	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String user_id = request.getParameter("user_id");
		String user_pwString = request.getParameter("user_pw");
		
		if(session.isNew()) {
			if(user_id != null) {
				session.setAttribute("user_id", user_id);
				out.println("<a href='login2.html'>다시 로그인하세요!!</a>");
				session.invalidate();
			}else {
				user_id = (String) session.getAttribute("user_id");
				if(user_id != null && user_id.length() !=0) {
					out.print("안녕하세요" + user_id + "님!!!");
				}else {
					out.println("<a href='login2.html'>다시 로그인하세요!!</a>");
					session.invalidate();
				}
			}
		}
	}

}
