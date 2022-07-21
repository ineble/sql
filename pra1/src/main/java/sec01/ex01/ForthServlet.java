package sec01.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forth")
public class ForthServlet extends HttpServlet {
	public void init() throws ServletException
	{
		System.out.println("init 메소드 호출");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException,IOException{
		System.out.println("doGet 메소드 호출");
		
	}
	public void destroy() {
		System.out.println("destroy 메소드 호출");
	}
	


}
