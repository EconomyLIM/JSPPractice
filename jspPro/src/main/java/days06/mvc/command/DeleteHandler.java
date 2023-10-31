package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days06.mvc.persistence.BoardDAOImpl;


public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		String method = request.getMethod();
		
		if (method.equals("GET")) {
			//2. 포워딩. 
			return "/days06/board/delete.jsp";
			
		} else { //POST
			request.setCharacterEncoding("UTF-8");

		      int pseq = Integer.parseInt(request.getParameter("seq"));
		      String pwd = request.getParameter("pwd");


		      Connection conn = DBConn.getConnection();
		      BoardDAOImpl dao = new BoardDAOImpl(conn);

		      int rowCount = 0;
		      String originalPwd ;
		      String location = null;
//		    	 실제 비밀번호 == pwd 비교
		      try {
		    	  originalPwd = dao.getOriginalPwd(pseq);
		    	 
		    	  if (originalPwd.equals(pwd)) {
		    		  rowCount = dao.delete(pseq);
		    		  location = "/jspPro/board/list.do?"+"delete=success";
				}else {
					/*
					// 비밀번호 입력 잘못!!
					// 1. 경고창(비밀번호 입력 잘못!!)
					request.setAttribute("error", "비밀번호가 틀립니다.");
					// 2. delete.jsp
					doGet(request,response);
					return;
					*/
					location = "/jspPro/board/view.do?seq="+pseq+"&delete=fail";
				}

		         
		      } catch (SQLException e1) {
		         System.out.println(">delete.dopost Exception...");
		         e1.printStackTrace();
		      }

		      DBConn.close();

		      // 포워딩 x
		      // 리다이렉트 o
		      response.sendRedirect(location);
		} //if
		
		return null;
	} // process

}
