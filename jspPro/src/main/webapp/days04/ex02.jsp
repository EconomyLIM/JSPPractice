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
  		[jsp 웹 어플리케이션 4가지 영역(scope)]
  		1. page scope(영역): 하나의 페이지에서 사용되는 영역
  							pageContext 기본객체
  		2. request scope: 하나의 요청에서 사용되는 영역
  							request 기본객체
  		3. session scope: 하나의 웹 브라우저에서 사용되는 영역
  							session 기본 객체
  		4. application scope: 하나의 웹 어플리케이션에서 사용되는 영역
  							application 기본 객체
  		ex02_02.jsp
  		이름/나이/주소/연락처
  		ex02_03.jsp
  		이름/나이/주소/연락처
  		ex02_04.jsp
  		이름/나이/주소/연락처
  		
  		setAttribute()
  		getAttribute()
  		removeAttribute()
  		getAttributeNames()
        </xmp>
    </div>

</body>
</html>