package sec01.ex01;


import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/input2")
public class InputServlet2 extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public void init() throws ServletException {
		System.out.println("init 메서드 호출");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
	throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		Enumeration enu = req.getParameterNames();
		// 열거타입으로 Names를 받아서 enu에 넣어라
		// 파라미터의 이름 집합을 Enumerration 객체로 반환하는 메소드
		// 지금은 정해진 매개변수가 없으므로 전체를 가져온다.
		while(enu.hasMoreElements()) {
			//더 엘리먼트가 있냐?-> 있으면 true 없으면 false반환
			String name = (String) enu.nextElement();
			// String으로 형변환 하고 enu에 다음 엘리멘트의 name에 넣어라 
			String[] values = req.getParameterValues(name);
			// name의 Values를 String[] values로 넣는다.
			for(String value: values) {
				System.out.println("name= " + name + ",value= " + value);
			}
		}

	}
	@Override
	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}
	
	
	
	
}

