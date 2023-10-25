package days02;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptVO;

/**
 * Servlet implementation class ScottDept
 */
@WebServlet({"/ScottDept"
	,"/scott/dept"
})
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public ScottDept() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = DBConn.getConnection();

		//3. 작업자(statement) + CRUD + 조회
		PreparedStatement pstmt = null;
		String sql = "SELECT deptno, dname, loc FROM dept";
		int deptno =0;
		String dname = null;
		String loc = null;
		ResultSet rs = null;

		ArrayList<DeptVO> list = null;
		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			DeptVO vo = null;

			if (rs.next()) {
				list = new ArrayList<DeptVO>();
				do {
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");

					vo = new DeptVO(deptno, dname, loc);

					list.add(vo);
				} while (rs.next());
			}// if

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rs.close();
				DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} //finally
		//포워딩
		
		request.setAttribute("list", list); // request객체에 담아서 보낸다
//		String path ="ex13_dept.jsp";
		//메시지 파일 [/scott/ex13_dept.jsp]을(를) 찾을 수 없습니다.
		//http://localhost/jspPro/scott/dept 를찾았다
//		String path ="/days02/ex13_dept.jsp";
		String path ="/days02/ex13_dept_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	} //doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
