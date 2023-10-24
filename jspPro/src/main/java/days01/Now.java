package days01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Now extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	    Date now = new Date();
		String pattern = "yyyy-MM-dd hh:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String strNow = sdf.format(now);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter outer = response.getWriter();
		
		outer.write("<!DOCTYPE html>");
		outer.write("<html>");
		outer.write("<head>");
		outer.write("<meta charset=\"UTF-8\"> ");
		outer.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
		outer.write("<title>Insert title here</title>");
		outer.write("<link rel=\"shortcut icon\" href=\"http://localhost/jspPro/images/SiSt.ico\">");
		outer.write("<link rel=\"stylesheet\" href=\"/jspPro/resources/cdn-main/example.css\">");
		outer.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js\"></script>");
		outer.write("<script src=\"/jspPro/resources/cdn-main/example.js\"></script>");
		outer.write("</head>");
		outer.write("<body>");
		outer.write("<header class=\"sticky\">");
		outer.write("<h1 class=\"main\">");
		outer.write("<a href=\"#\">LGJ Home</a>");
		outer.write("</h1>");
		outer.write("<ul>");
		outer.write("<li><a href=\"#\">로그인</a></li>");
		outer.write("<li><a href=\"#\">회원가입</a></li>");
		outer.write(" </ul>");
		outer.write(" </header>");
		outer.write("<div>");
		outer.write("<xmp class=\"code\">");
		outer.write("</xmp>");
		outer.write("<h3>ex02.jsp - 표현식 <%= strNow %></h3>");
		outer.write("<h3>현재날짜 시간 : " +strNow+ "</h3>");
		outer.write("</div>");
		outer.write("</body>");
		outer.write("</html>");

		
	} // service
	
} //class
