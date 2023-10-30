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
  		p114
  		[jsp 기본 내장 객체 9가지 + 영역 scope]
  		1. request: HttpServletRequest 
  		2. reponse: HttpServletResponse
  		3. out: JspWriter
  		4. exception: Trowable
  		5. session : HttpSession
  		6. application : [ServerContext]
  			웹 애플리케이션에 정보 저장.
  			ex04_03.jsp
  		7. pageContext : PageContext JSP 페이지 대한 정보를 저장하는 객체
  			ex04_02.jsp 
  		8. page : Object JSP 페이지를 구현한 자바 클래스 인스턴스
  		
  		9. config: ServletConfig 설정 정보 저장.
        </xmp>
    </div>

</body>
</html>