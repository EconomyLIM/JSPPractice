<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<DeptVO> list = (ArrayList<DeptVO>)request.getAttribute("list");
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
        <xmp class="code">
  			[ex13_dept.jsp] 
        </xmp>
        <select name="deptno" id="deptno">
			<option selected disabled>선택하세요.</option>
			
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
/* $("#deptno").change(function(event) {
	let deptno = $(this).val(); // 10,20,30,40
	location.href = `ex13_emp.jsp?deptno=\${deptno}`;
}); */
$("#deptno")
	.wrap("<form></form>") //form태그안에 select태그가 감싸진다.
	.change(function() {
		$(this)
		.parent() //form 태그가 된다
			.attr({
				method:"get"
				,action:"/jspPro/scott/emp"
			})
			.submit();
	});
</script>
</html>