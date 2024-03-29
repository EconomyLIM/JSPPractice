package days06;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import days05.MemberInfo;


//@WebServlet({"/SessionTest","/days06/session.htm"})
public class SessionTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SessionTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿에서 세션을 사용하는 방법
		// 1) 세션이 존재하면 세션 객체를 반환하고 
			// 세션이 존재하지 않으면 새로운 객체를 생성해서 반환
		HttpSession session1 = request.getSession();
//		ㄴ == HttpSession session2 = request.getSession(true);
		if (session1 == null) {
			//이거는 안되는 코딩
		} //if
		// 2) 세션이 존재하면 세션 객체를 반환하고 
		// 세션이 존재하지 않으면 null을 반환
		HttpSession session3 = request.getSession(false);
		if (session3 == null) {
			//이거는 되는 코딩
		} //if
		
		MemberInfo m = new MemberInfo();
		m.setId("admin");
		m.setPasswd("1234");
		m.setName("관리자");
		m.setEmail("admin@a223");
		m.setRegisterDate(new Date());
		
		session1.setAttribute("auth", m);
		MemberInfo m2 = (MemberInfo) session1.getAttribute("auth");
	} //doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		

	} // doPost

}
