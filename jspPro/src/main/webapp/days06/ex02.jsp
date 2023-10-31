<%@ page trimDirectiveWhitespaces="true" session="true" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file ="/WEB-INF/inc/include.jspf" %>
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
  		JSP 에서 세션을 사용하는 방법: session 기본 내장 객체 
  		서블릿에서 세션을 사용하는 방법
  		페이지 지시자에 sesson="true"(기본값)이라서 사용가능하나 false로 설정하면 설정 X
  		trimDirectiveWhitespaces="true" << 팀플할때 고정값 True 
  			ㄴ 페이지 소스 보기 할때 지시자가 있던자리에 공백 사라짐
  		
        </xmp>
        
        <a href=" <%= contextPath %>/days06/session.htm">서블릿+세션 방법</a>
    </div>

</body>
</html>