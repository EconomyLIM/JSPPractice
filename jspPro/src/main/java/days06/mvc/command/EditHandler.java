package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistence.BoardDAOImpl;

public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		if (method.equals("GET")) {
			int pseq = Integer.parseInt(request.getParameter("seq"));
		      
		      Connection conn = DBConn.getConnection();
		      BoardDAOImpl dao = new BoardDAOImpl(conn);

		      BoardDTO dto = null;

		      try {
		         dto = dao.view(pseq);
		      } catch (SQLException e1) {
		         System.out.println(">Edit.doGet() Exception...");
		         e1.printStackTrace();
		      }

		      DBConn.close();

		      // 1.포워딩 전에 데이터 저장
		      request.setAttribute("dto", dto);
		      
		      // 2. 포워딩.
		      String path = "/days06/board/edit.jsp";
		      
		      return path;
			
		} else {
			request.setCharacterEncoding("UTF-8");

		      int pseq = Integer.parseInt(request.getParameter("seq"));
		      String pwd = request.getParameter("pwd");
		      String email = request.getParameter("email");
		      String title = request.getParameter("title");
		      String content = request.getParameter("content");
		      int tag = Integer.parseInt(request.getParameter("tag"));

		      BoardDTO dto = new BoardDTO(pseq, null, pwd, email, title, null, 0, tag, content);

		      Connection conn = DBConn.getConnection();
		      BoardDAOImpl dao = new BoardDAOImpl(conn);

		      int rowCount = 0;
		      try {
		         rowCount = dao.update(dto);
		      } catch (SQLException e1) {
		         System.out.println(">edit.dopost Exception...");
		         e1.printStackTrace();
		      }

		      DBConn.close();

		      // 포워딩 x
		      // 리다이렉트 o
		      String location = "/jspPro/board/view.do?seq="+pseq;
		      location += rowCount == 1 ? "&edit=success" : "&edits=fail";
		      response.sendRedirect(location);

		}
		return null;
	}

}
