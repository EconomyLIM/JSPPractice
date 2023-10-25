<%@page import="domain.EmpVO"%>
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
	ResultSet rs = null;
	
	String sql = "SELECT deptno, dname, loc FROM dept";
	
	int deptno =0;
	String dname = null;
	String loc = null;
	
	ArrayList<DeptVO> dlist = null;
	try {

		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		DeptVO dvo = null;

		if (rs.next()) {
			dlist = new ArrayList<DeptVO>();
			do {
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");

				dvo = new DeptVO(deptno, dname, loc);
				
				dlist.add(dvo);
			} while (rs.next());
		}// if
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		try {
			pstmt.close();
			rs.close();
			/* DBConn.close(); */
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} //finally
%>
<%

String pDeptno = request.getParameter("deptno");
if (pDeptno == null || pDeptno.equals("")) {
	pDeptno = "10";
}

deptno = Integer.parseInt(pDeptno);
sql = " SELECT empno, ename, job, mgr, to_char(hiredate,'yyyy-MM-dd') hiredate, sal, comm, deptno" 
+ " FROM emp " 
+ " WHERE deptno = ? ";

int empno;
String ename;
String job;
int mgr;
String hiredate;
int sal;
int comm;

EmpVO evo = null;
ArrayList<EmpVO> elist = null;

try {
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, deptno);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		elist = new ArrayList<EmpVO>();
		do {
	empno = rs.getInt("empno");
	ename = rs.getString("ename");
	job = rs.getString("job");
	mgr = rs.getInt("mgr");
	hiredate = rs.getString("hiredate");
	sal = rs.getInt("sal");
	comm = rs.getInt("comm");

	evo = new EmpVO(empno, ename, job, mgr, hiredate , sal, comm, deptno);
	elist.add(evo);

		} while (rs.next());
	} // if

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
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
    <link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    <h3><span class="material-symbols-outlined">view_list</span> jsp days02</h3>
    <div>
        <select name="deptno" id="deptno">		
			<%
			Iterator<DeptVO> it =  dlist.iterator();
			while (it.hasNext()) {
				DeptVO vo =it.next();
			%>
			<option value="<%= vo.getDeptno()%>" data-loc="<%= vo.getLoc()%>"><%=vo.getDname() %></option>
			<%-- <option value="<%= deptVo.getDeptno() %>" <%= (paramDeptno == deptVo.getDeptno() ? "selected='selected'" : "") %> ><%= deptVo.getDname() %></option> --%> 
			<% 
			} // while
			%>
		</select>
		<br>
		<br>
		<h2>emp list</h2>
		<table>
			<thead>
				<tr>
					<td><input type="checkbox" id="ckbAll"/></td>
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
				if (elist == null) {
				%>
				<tr>
					<td colspan="8">사원이 존재하지 않습니다.</td>
				</tr>
				<%
				} else {
				Iterator<EmpVO> eit = elist.iterator();
				while (eit.hasNext()) {
					evo = eit.next();
				%>
				<tr>
					<td><input type="checkbox" data-empno = "<%= evo.getEmpno()%>"/></td>
					<td><%=evo.getEmpno()%></td>
					<td><%=evo.getEname()%></td>
					<td><%=evo.getJob()%></td>
					<td><%=evo.getMgr()%></td>
					<td><%=evo.getHiredate()%></td>
					<td><%=evo.getSal()%></td>
					<td><%=evo.getComm()%></td>
					<td><%=evo.getDeptno()%></td>
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
$(function() {
<%-- 상태관리 	
let deptno = <%= request.getParameter("deptno") %>;
	$("#deptno").val(deptno).prop("selected",true); --%>
	
	/* $("#deptno").val('${param.deptno}'); */
	
	/* let deptno = '${param.deptno}';
	if(!deptno) deptno= 10; */
	$("#deptno").val(<%= pDeptno %>);
	
	$("#deptno").change(function(event) {
		deptno = $(this).val();
		let url = `ex01.jsp?deptno=\${deptno}`;
		
		location.href = url;
		
	})
	
});

</script>
<script>
// 모두 선택 체크박스
$("#ckbAll").on("click", function(event) {
	$("table tbody tr").find("td:first-child :checkbox")
						.prop("checked", $(this).prop("checked"));
});

// 각 사원 체크박스를 체크할때 모두 선택 체크 처리
/* 	$(":checkbox.all").click(function(event) {
         $(":checkbox:not(.all)").prop("checked", $(this).prop("checked"));

      })
      $(":checkbox:not(.all)").click(function(event) {
         let count = $(":checkbox:not(.all)").length;
         let checkedCount = $(":checkbox:not(.all):checked").length;
         $(":checkbox.all").prop("checked", count == checkedCount);
      }); */
      
	$("table tbody tr")
    .find("td:first-child :checkbox").on("click", function (){
       let ck = $("tbody :checkbox").length == $("tbody :checkbox:checked").length;
       $("#ckbAll").prop("checked", ck );
    });
</script>
<script>
<%-- $("tfoot button").on("click", function() {
	// 체크된 체크박스
	data-empno = "<%= evo.getEmpno()%>"
	let empnos = [];
	$("tbody :checkbox:checked").each(function(i, element) {
		
		// Dom 탐색
		// empno = element.parentElement.nextElementSibling.innerText
		let empno = $(element).data("empno");
		empnos.push(empno);
	})
	location.href = "ex01_ok.jsp?empnos" + empnos.join("/");
}) --%>
</script>
<script>
$("tfoot button").on("click", function() {

	
	let empnos = [];
	$("tbody :checkbox:checked").each(function(i, element) {
		
		// Dom 탐색
		// empno = element.parentElement.nextElementSibling.innerText
		let empno = $(element).data("empno");
		empnos.push(empno);
	})
	location.href = "ex01_ok_02.jsp?empnos" + empnos.join("&empno=");
}) 
</script>
</html>