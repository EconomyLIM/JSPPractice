package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ▽톰캣이 실행되면 자동으로 올라감
//@WebServlet(
//		description = "두번째 만드는 서블릿 예제 - 어노테이션 기반"
//		, urlPatterns = { "/Hello", "/days02/hello.html" }
//		)
//유지보수는 xml이좋고 (자주 수정되야된다면)
// 코딩은 어노테이션이 더 쉽다 (수정이 잘 안될것 같으면)
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Hello() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.append("Hello");
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	} //doPost

}
