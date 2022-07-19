package sec01.ex03;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/first2")
public class FirstServlet2 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public void init() throws ServletException {
		System.out.println("init 메소드 호출");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script type= 'text/javascript'>");
		out.print("location.href='second';");
		out.print("</script>");
		}
	public void destroy() {
		System.out.println("destroy 메소드 호출");
	}


}
