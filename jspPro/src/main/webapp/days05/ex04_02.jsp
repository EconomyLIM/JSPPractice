<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <li><a href="<%= contextPath %>/cstvsboard/list.htm">게시판</a></li>
        </ul>
    </header>
    <h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
    <div>
        <xmp class="code">
  			ex04_02.jsp
  			pageContext	저장 객체 == pageScope(영역)
        </xmp>
        <%
        	// pageContext.getAttribute(name);
        	// pageContext.setAttribute(name, value);
        	
        	// [pageContext로 기본 내장 객체 얻어올 수 있다.]
        			// 사용자 정의 태그(커스텀 태그)를 구현할때
        	// pageContext.getRequest() == request
        	// pageContext.getResponse() == response
        	// pageContext.getOut() ==out
        	// pageContext.getServletConfig() == config
        	// pageContext.getServletContext() == applcation
        	
        	
        %>
    </div>

</body>
</html>