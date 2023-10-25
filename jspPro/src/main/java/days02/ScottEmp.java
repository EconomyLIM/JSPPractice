package days02;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.EmpVO;


@WebServlet({"/ScottEmp"
	,"/scott/emp"
})
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScottEmp() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		Connection conn = null;

		String pDeptno = request.getParameter("deptno");
		if (pDeptno == null || pDeptno.equals("")) {
			pDeptno = "10";
		}

		int deptno = Integer.parseInt(pDeptno);
		String sql = " SELECT empno, ename, job, mgr, to_char(hiredate,'yyyy-MM-dd') hiredate, sal, comm, deptno" 
		+ " FROM emp " 
		+ " WHERE deptno = ? ";

		conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int empno;
		String ename;
		String job;
		int mgr;
		String hiredate;
		int sal;
		int comm;

		EmpVO vo = null;
		ArrayList<EmpVO> list = null;

		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<EmpVO>();
				do {
			empno = rs.getInt("empno");
			ename = rs.getString("ename");
			job = rs.getString("job");
			mgr = rs.getInt("mgr");
			hiredate = rs.getString("hiredate");
			sal = rs.getInt("sal");
			comm = rs.getInt("comm");

			vo = new EmpVO(empno, ename, job, mgr, hiredate , sal, comm, deptno);
			list.add(vo);

				} while (rs.next());
			} // if

		} catch (SQLException e) {
			e.printStackTrace();
			
		} //catch 
		
		
		request.setAttribute("list", list);
		String path ="/days02/ex13_emp.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	} //doget

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
