<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Connection conn = null;

String pDeptno = request.getParameter("deptno");
if (pDeptno == null || pDeptno.equals("")) {
	pDeptno = "10";
}

int deptno = Integer.parseInt(pDeptno);
String sql = " SELECT empno, ename, job, mgr, to_char(hiredate,'yyyy-MM-dd') hiredate, sal, comm, deptno" + " FROM emp "
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

	vo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
	list.add(vo);

		} while (rs.next());
	} // if

} catch (SQLException e) {
	e.printStackTrace();
}
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

		<select id="option">
			<option disabled>선택하세요</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option value="40">40</option>
		</select>

		<xmp class="code"> </xmp>
		<h2>emp list</h2>
		<table>
			<thead>
				<tr>
					<td>체크박스</td>
					<td>empno</td>
					<td>ename</td>
					<td>job</td>
					<td>mgr</td>
					<td>hiredate</td>
					<td>sal</td>
					<td>comm</td>
					<td>deptno</td>
				</tr>
			</thead>
			<tbody>

				<%
				if (list == null) {
				%>
				<tr>
					<td colspan="8">사원이 존재하지 않습니다.</td>
				</tr>
				<%
				} else {
				Iterator<EmpVO> it = list.iterator();
				while (it.hasNext()) {
					vo = it.next();
				%>
				<tr>
					<td><input type="checkbox" /></td>
					<td><%=vo.getEmpno()%></td>
					<td><%=vo.getEname()%></td>
					<td><%=vo.getJob()%></td>
					<td><%=vo.getMgr()%></td>
					<td><%=vo.getHiredate()%></td>
					<td><%=vo.getSal()%></td>
					<td><%=vo.getComm()%></td>
					<td><%=vo.getDeptno()%></td>
				</tr>
				<%
				} //while
				} //else
				%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9">
					<button id="btn1">확인</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
<script>
	$("#option").change(function() {
		let deptno = $(this).val();
		location.href = `ex06_emp.jsp?deptno=\${deptno}`;
	})
	$("#btn1").click(function() {
		alert("값을 전송합니다.");
		let selectedEmps = [];
        $("input[type=checkbox]:checked").each(function() {
            selectedEmps.push($(this).closest("tr").find("td:eq(1)").text());
        });
        
        let url = 'result.jsp?selectedEmps=' + selectedEmps.join(',');

        window.location.href = url;
	})
</script>
</html>