<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  			[jsp 기본 내장 객체 - request 객체]
  			1. 웹 브라우저 -> 요청 -> 서버
  						[request]
  						파라미터
  			2. 요청 정보 객체
  			3. 클라이언트 전송한 파라미터, 쿠키, 헤더 등등 얻어올 수 있다.
  			4. 서버와 관련된 정보 얻어올 수 있다.
        </xmp>
       ***1. contextPath(컨텍스트 루트):<%=request.getContextPath() %><br>
       ***2. 클라이언트 IP주소 :<%=request.getRemoteAddr() %><br>
       ***3. 요청 전송 방식: <%=request.getMethod() %><br>
       ***4. 요청 URL: <%=request.getRequestURL() %><br>
       ***5. 요청 URI: <%=request.getRequestURI() %><br>
    </div>

</body>
</html>