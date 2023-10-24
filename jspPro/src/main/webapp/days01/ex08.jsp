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
  			1. 서블릿 (Servlet)?
  				-자바 웹 기술
  			2. 서블릿 구현 방법(과정)
  				(1) [서블릿 규약]을 따르는 자바 클래스 선언
  					ㄱ. 접근 지정자 public
  					ㄴ. javax.servlet.http.HttpServlet 클래스 상속
  					ㄷ. service(), get(), post() 메서드를 오버라이드
  				(2) 컴파일 -> ???.class (클래스 파일)
  				(3) /WEB-INF/classes 폴더 안에 반드시 클래스 파일 넣어둔다.
  				(4) 요청 URL 정하고 		URL 매핑
  						ㄱ. web.xml 서블릿 등록/ URL 매핑
  						ㄴ. 서블릿 3.0~~  @WebServlet 어노테이션으로 처리 가능
  				(5) 브라우저 -> 요청 URL -> 등록된 서블릿이 응답
  			3. 실습 예제
  				1) [서블릿 규약]을 따르는 자바 클래스 선언
  					days01.Now.java
  				2) URL 패턴 설정하는 방법
  				<url-pattern>/jspPro/days01/Now.html</url-pattern>
  					ㄱ. /  ( 아무것도 없이 / 하나 들어갈 수 있다. 주로 MVC패턴 처리 )
  															웹 애플리케이션 [기본 서블릿]으로 등록, 매핑
  					ㄴ. *.확장자
  					ㄷ. /경로명/경로명/.../* : 이렇게 되는 모든 요청은 어떻게 하겠습니다.
  					ㄹ. 위의 3가지를 제외한 나머지 하나는 정확한 URL 패턴 경로 경로 지정
        </xmp>
        <a href="/jspPro/days01/Now.html">Now.html서블릿 요청</a>
        <br>
        <a href="/jspPro/days01/Now">Now서블릿 요청</a>
        <br>
        <a href="/jspPro/days01/Now.ss">Now.ss 서블릿 요청</a>
    </div>

</body>
</html>