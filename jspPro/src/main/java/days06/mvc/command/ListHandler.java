package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days06.mvc.domain.BoardDTO;
import days06.mvc.domain.PageDTO;
import days06.mvc.persistence.BoardDAOImpl;


public class ListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListHandler.process");
		
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

		Connection conn = ConnectionProvider.getConnection();
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

		conn.close();


		request.setAttribute("list" , list);
		request.setAttribute("pDto" , pDto);
		/*
		 * request.setAttribute("searchWord", searchWord);
		 * request.setAttribute("searchCondition", searchCondition);
		 */
		System.out.println("listhandler.doget");

		System.out.println(request.getRemoteAddr());
		return "/days06/board/list.jsp";
	} // process

} //class
