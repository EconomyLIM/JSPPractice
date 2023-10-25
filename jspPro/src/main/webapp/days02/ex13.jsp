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
  			[ MVC 패턴으로 프로젝트 ]
  			1. 포워딩하는 작업 무조건 해야한다.
  			2. 로직처리 XXX.jsp-> 서블릿
  			
  			1) URL매핑 - /jspPro/scott/dept
  			2) 서블릿클래스 days02.Dept.java
  					  (로직처리+포워딩)
  			ex) ex13_dept.jsp
        </xmp>
        <a href="/jspPro/scott/dept">부서 정보 조회</a>
    </div>

</body>
</html>