package days04.board;

import java.io.IOException;
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
import domain.PageDTO;


/**
 * Servlet implementation class List
 */
@WebServlet("/cstvsboard/list.htm")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public List() {
		super();
		// TODO Auto-generated constructor stub
	}


	//localhost/jspPro/cstvsboard/list.htm
	//?currentpage=3&searchCondition=1&searchWord=홍길동 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage =1; //현재페이지 번호 
		int numberPerPage =10; //한페이지에 출력할 게시글 수 
		int numberOfPageBlock =10; //
		int totalRecords =0; // 총 레코드 수 게시글 수
		int totalPages = 0; // 총페이지 수

		//검색 기능 구현 
		int searchCondition = 1;

		try {
			searchCondition =Integer.parseInt(request.getParameter("searchCondition"));
		} catch (Exception e) {
			e.printStackTrace();
		}//try- catch

		String searchWord = request.getParameter("searchWord");
		// 아무것도 없으면 null이다.
		if (searchWord == null) {
			searchWord = "";
		} //if


		try {
			currentPage =Integer.parseInt(request.getParameter("currentpage"));
		} catch (Exception e) {
			e.printStackTrace();
		} //try-catch

		ArrayList<BoardDTO> list = null;

		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		PageDTO pDto = null;

		try {
			if (searchWord.equals("")) {

				list = dao.select(currentPage, numberPerPage);
				totalRecords = dao.getTotalRecords();
				totalPages = dao.getTotalPages(numberPerPage);

			} else {

				list = dao.search(currentPage, numberPerPage, searchCondition, searchWord);
				totalPages = dao.getTotalPages(numberPerPage, searchCondition, searchWord);

			} //if else

			pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock,totalPages );

		} catch (SQLException e1) {
			System.out.println(">List.doGet Exception...");
			e1.printStackTrace();
		} //try-catch

		DBConn.close();


		request.setAttribute("list" , list);
		request.setAttribute("pDto" , pDto);
		/*
		 * request.setAttribute("searchWord", searchWord);
		 * request.setAttribute("searchCondition", searchCondition);
		 */

		String path= "/days04/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request,response);

		System.out.println(request.getRemoteAddr());


		//2. 포워딩. 

	} //doGet



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
