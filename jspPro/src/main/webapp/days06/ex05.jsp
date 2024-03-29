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
  		[JSTL (JSP Standard Tag Libarary)]
  		-JSP 표준 태그 라이브러리
  		- 많은 개발자가 필요에 의해서 사용자 정의하는 태그 만들어서 사용(커스텀 태그)
  		- 표준화한 태그
  		1. JSTL 태그의 5가지 종류
  			1) 코어 - c 		: 변수 선언, 제어문, URL 처리
			2) 국제화 - fmt 	: 숫자, 날짜 형식, 지역, 메시지 출력
			3) XML - X 		: XML 처리
			4) 데이터베이스 - sql		ex05_02.jsp
			5) 함수 - fn 		: 문자열 처리, 컬렉션 처리
        </xmp>
    </div>

</body>
</html>