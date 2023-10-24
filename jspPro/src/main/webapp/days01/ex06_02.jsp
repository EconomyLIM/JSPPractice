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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
  <script>
  $( function() {
    $( "input" ).checkboxradio();
    $( "fieldset" ).controlgroup();
  } );
  </script>
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
		<div class="widget">
			<h1>Checkbox and radio button widgets</h1>

			<h2>Radio Group</h2>
			<fieldset>
				<legend>Select a Location: </legend>
				<!-- 
				<label for="radio-1">New York</label> 
				<input type="radio" name="radio-1" id="radio-1"> 
				<label for="radio-2">Paris</label>
				<input type="radio" name="radio-1" id="radio-2"> 
				<label for="radio-3">London</label> 
				<input type="radio" name="radio-1"id="radio-3"> -->
				
				<%
				Iterator<DeptVO> it =  list.iterator();
				while (it.hasNext()) {
					DeptVO vo =it.next();
				%>
				<label for="<%=vo.getDeptno() %>"><%= vo.getDname() %></label> 
				<input type="radio" name="deptno" id="<%=vo.getDeptno() %>"> 
				<% 
				} //while
				%>
				
			</fieldset>

		</div>
	</div>

</body>
</html>