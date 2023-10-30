<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 String contextPath = request.getContextPath();
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
			<li><a href="<%= contextPath %>/cstvsboard/list.htm">게시판</a></li>
		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span> jsp days00
	</h3>
	<div>
		<xmp class="code"> 
		[ex05_05.jsp]
		</xmp>
		<%

        %>
        <jsp:useBean id="mi" class="days05.MemberInfo" scope="page"></jsp:useBean> <!-- == 객체생성 --> 
        <jsp:setProperty property="*" name="mi"/> <!-- 모든 칼럼(*)을 받아서 mi 객체에 넣겠다 -->
        <jsp:setProperty property="registerDate" name="mi" value="<%= new Date() %>"/> <!-- 모든 칼럼(*)을 받아서 mi 객체에 넣겠다 -->
        <!-- 입력태그의 name속성과 자바빈 객체의 필드명하고 똑같아야 * 사용가능 -->
        아이디: <jsp:getProperty property="id" name="mi"/> <br>
        이름: <%= mi.getName() %><br>
		비밀번호 : <%= mi.getPasswd() %><br>
		등록일 : <%= mi.getRegisterDate() %><br>
		이메일 : <%= mi.getEmail() %>
		
	</div>

</body>
</html>