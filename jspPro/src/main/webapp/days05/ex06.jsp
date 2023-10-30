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
  		[JS 쿠키] document.cookie 속성
  		[jsp 쿠키]
  		- 쿠키?
  		클라이언트(브라우저)에 텍스트 형식의 저장된 파일
  		- [클] -> 요청 -> [서]
  				쿠키 함께 서버에 전송
  		- 상태 관리
  		- [JSP 쿠키 생성 + 처리 과정 이해]
  			1) [클] -> 요청(쿠키) -> [서]
  									쿠키 생성
  					<- 응답
  				[클]
  				X 쿠키 저장
  				[클] -> 요청(쿠키) -> 서버 요청
  				<- 응답
  				[클]
  				X 쿠키 삭제, 수정
  		- JS 쿠키: document.cookie 속성 생성 확장 삭제 수정
  		- JSP 쿠키:
  			1) Cookie 클래스 -> 쿠키 생성
  			2) 응답 (클)
  				reponse.addCookie(생성된 쿠키)
  		- 쿠키 구성
  			1) "쿠키이름= 쿠키 값: 만료시점 도메인 = localhost;_경로"
  			만료시점 =[-1] 브라우저 닫을 때 자동 쿠키 제거 
  			별도의 만료 시점을 설정하지 않으면 브라우저가 종료될 때 쿠키 제거
  			
        </xmp>
        
        <a href="ex06_02.jsp">ex06_02.jsp 쿠키 생성</a>
        <a href="ex06_03.jsp">ex06_02.jsp 쿠키 확인</a>
    </div>

</body>
</html>