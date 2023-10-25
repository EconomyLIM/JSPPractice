package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/days02/info.htm")
public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Info() {
        super();
        // TODO Auto-generated constructor stub
    }

	// get요청
    // info.htm?name=?&age=?
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		PrintWriter out = response.getWriter();
		out.append("Get방식 요청<br>");
		out.append("이름 " + name+ "<br>");
		out.append("나이 " + age+ "<br>");
	}

	//post 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//브라우저 -> 	post 요청
		// 홍길동
		// 20
		//		->ISO-8859-1 인코딩.			UTF-8인코딩
		//          	get 요청이면
		//		->UTF-8인코딩
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		PrintWriter out = response.getWriter();
		out.append("Post방식 요청<br>");
		out.append("이름 " + name+ "<br>");
		out.append("나이 " + age+ "<br>");
	}

}
