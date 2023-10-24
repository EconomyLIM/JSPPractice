<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// jsp 스크립트 - 스크립트 릿 (자바 코딩)
	// http://localhost/jspPro/days01/ex03_ok.jsp?title=b&author=b
	// name 속성값이 있어야 파라미터로 전송된다.
	// jsp 내장 객체 11가지 request
	String title = request.getParameter("title");
	String author = request.getParameter("author");
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
    <h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
    <div>
        <xmp class="code">
  		
        </xmp>
        책제목: <%= title %> <br>
        책저자: <%= author %> <br>
        <a href="ex03.html"><button> 돌아가기</button></a> 
    </div>

</body>
</html>