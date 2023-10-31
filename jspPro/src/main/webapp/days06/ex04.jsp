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
  			[표현언어 (Expression Language) == EL(3.0)]
  			1. 다른 형태의 스크립트 언어
  			2. 스크립트 요소 중에 하나
  			3. 표현식보다 간결하고 편리하다.
  			4. JSP2.0에서부터 EL 포함
  			5. EL 기능
  				1) JSP 4가지 기본 영역
  											EL 내장 객체
  					page Scope			=> pageContext
  					request Scope		=> requestScope
  					session Scope		=> sessionScope
  					application Scope	=> applicationScope
  				2) EL 연산자
  					== ,eq , !=, ne, not, empty
  					등등
  				3) 자바 클래스의 메서드 호출 가능***
  				4) 람다식 사용(EL3.0)
  				5) 쿠키, jsp 기본 내장 객체
  				6) 스트림 API 정적 메서드 실행
  				
  			6. EL 형식
  			<%-- ${ expression } --%>
  			
  			7. JSP 기본 내장 객체: 9가지
  				EL 기본 내장 객체
  				1) param == request.getParameters()
  					list.jsp?age=10
  					<%-- ${ param.age} --%>
  					
  					list.jsp?name=aaa&name=bbb
  					String [] =  request.getParameterValues("name")
  					<!-- ${paramValues } -->
  				2) pageConext = page 객체 동일
  				3) pageScope, requestScope, sessionScope, applicationScope
  				4) header = request.getHeader()
  					headerValues = request.getHeader()
  				5) cookie 
  				6) initParam == application.getInitParameter
        </xmp>
    </div>

</body>
</html>