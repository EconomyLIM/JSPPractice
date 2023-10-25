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
  			[JSP 기본 내장 객체(9가지)]
  			1. request
  			2. reponse - 웹 브라우저에 보내는 응답 정보를 담는 객체
  				1) 헤드 정보 입력
  				2) 리다이렉트(redirect) / 포워딩 차이
  				- 페이지 이동하는 기능
  				- 사전적의미 : 다른 방향으로 다시 전송하다. (보내다)
  				예)[] => a.jsp요청 
  					<= 했는데 만약 없어서 
  				[b.jsp]=> b.jsp 요청
  					<=
  					
  					ex09.jsp -> ex09_ok.jsp ->ex09_main.jsp
  					아이디		인증 성공		-> ex09_main.jsp
  					비밀번호		DB id/pwd
  					[로그인]		인증 실패		-> ex09.jsp?error
  					
  				예) forward 
  				[a.jsp] => a.jsp요청
  							서버에서 b.jsp 처리
  						<= b.jsp
  			3.
        </xmp>
        <a href="ex10.jsp">ex10.jsp</a> <br>
        <a href="ex10.jsp?error">ex10.jsp?error</a> <Br>
        <a href="ex10.jsp?error=1001">ex10.jsp?error=1001</a><br>
    </div>

</body>
</html>