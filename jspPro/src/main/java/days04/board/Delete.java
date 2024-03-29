package days04.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;


/**
 * Servlet implementation class List
 */
//@WebServlet("/cstvsboard/delete.htm")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			//2. 포워딩. 
			String path= "/days04/board/delete.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request,response);
		
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  request.setCharacterEncoding("UTF-8");

	      int pseq = Integer.parseInt(request.getParameter("seq"));
	      String pwd = request.getParameter("pwd");


	      Connection conn = DBConn.getConnection();
	      BoardDAOImpl dao = new BoardDAOImpl(conn);

	      int rowCount = 0;
	      String originalPwd ;
	      String location = null;
//	    	 실제 비밀번호 == pwd 비교
	      try {
	    	  originalPwd = dao.getOriginalPwd(pseq);
	    	 
	    	  if (originalPwd.equals(pwd)) {
	    		  rowCount = dao.delete(pseq);
	    		  location = "/jspPro/cstvsboard/list.htm?"+"delete=success";
			}else {
				/*
				// 비밀번호 입력 잘못!!
				// 1. 경고창(비밀번호 입력 잘못!!)
				request.setAttribute("error", "비밀번호가 틀립니다.");
				// 2. delete.jsp
				doGet(request,response);
				return;
				*/
				location = "/jspPro/cstvsboard/view.htm?seq="+pseq+"&delete=fail";
			}

	         
	      } catch (SQLException e1) {
	         System.out.println(">delete.dopost Exception...");
	         e1.printStackTrace();
	      }

	      DBConn.close();

	      // 포워딩 x
	      // 리다이렉트 o
	      response.sendRedirect(location);
	} //doPost

}
