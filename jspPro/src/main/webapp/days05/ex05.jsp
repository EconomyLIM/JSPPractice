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
  			[자바빈(Java Bean)과 jsp:useBean 액션태그]
  				1. 자바빈(Bean) == 자바 빈즈(Java Beans)
  				=> JSP 기반 웹 어플리케이션에서 정보를 표현(저장, 출력)할 때 사용하는 객체
  				
  				스프링 빈
  				2. VO, DTO
  				3. 자바빈 규약
  					1) private 필드 선언
  					2) getter, setter 선언
  					3) 직렬화가 가능한 클래스 선언
  				4. 자바빈은 
  					속성(데이터), 변경 이벤트, 객체 직렬화하기 위한 표준이다.
  				5. 실습
  					days05패키지
  					ㄴ MemberInfo.java
  					
  					ex05_02.jsp
        </xmp>
    </div>

</body>
</html>