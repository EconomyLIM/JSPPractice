<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>
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
  			[페이지 모듈화] 
  			하나의 웹 사이트( 애플리케이션 )을 구성하는 페이지 상단(TOP), 하단(Bottom)등 모든 웹 페이지의 
  			공통적인 부분을 모듈화 시켜서 모드의 중복 제거, 유지/보수/ 확장 용이
  			모든 웹 사이트 : 상단(Top), 하단(Bottom)
  				ㄴ webapp 폴더
  					ㄴ layout 폴더
  						ㄴ top.jsp
  							bootom.jsp
  			일정 관리 부분: 공통모듈 좌측, 우측
  			[모듈화 처리]
  			1) include 지시자
  			2) jsp: 접두어가 붙은 태그를 액션태그 
  				(jsp:include 액션태그)
  			-> include 지시자 / jsp:include 액션태그 차이점
  			ex03_template 기준: 액션 태그는 서블릿 클래스가 5개 만들어진다
  			include는 코드가 그대로 와서 하나의 jsp에서 컴파일 된다.
  			
  			WEB-INF 
  				inc 폴더추가
  					include.jspf
        </xmp>
    </div>

</body>
</html>