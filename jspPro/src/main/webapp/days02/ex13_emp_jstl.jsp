<%@page import="java.util.Iterator"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
    <div>
        <xmp class="code">
  		
        </xmp>
        <h2>emp list</h2>
		<table>
			<thead>
				<tr>
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
				EmpVO vo = null;
				while (it.hasNext()) {
					vo = it.next();
				%>
				<tr>
					
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
					<td colspan="8"><%= list == null ? 0 : list.size()%>명. 
					<a href="javascript:history.back()">뒤로가기</a>
					</td>
				</tr>
			</tfoot>
		</table>
    </div>

</body>
</html>