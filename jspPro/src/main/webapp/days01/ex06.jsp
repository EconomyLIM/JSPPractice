<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
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
				System.out.println(vo);
				
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} //finally
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
</head>
<body>
	<header class="sticky">
		<h1 class="main">
			<a href="#">LGJ Home</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span> jsp days00
	</h3>
	<div>
		<xmp class="code"> </xmp>
		<select name="deptno" id="deptno">
			<option selected disabled>선택하세요.</option>
			
			<!-- 		
			<option value="10">ACCOUNTING</option>
			<option value="20">RESEARCH</option>
			<option value="30">SALES</option>
			<option value="40">OPERATIONS</option>		
			-->
			<%
			Iterator<DeptVO> it =  list.iterator();
			while (it.hasNext()) {
				DeptVO vo =it.next();
			%>
			<option value="<%= vo.getDeptno()%>"><%=vo.getDname() %></option> 
			<% 
			} // while
			%>
			
		</select>
	</div>

</body>
<script>
$("#deptno").change(function(event) {
	let deptno = $(this).val(); // 10,20,30,40
	location.href = `ex06_emp.jsp?deptno=\${deptno}`;
});
/* $("#deptno").change(function(evevt) {
	let deptno = $(this).val(); // 10, 20, 30, 40
	location.href = `ex06_emp.jsp?deptno=${deptno}`;
}) */
</script>
</html>