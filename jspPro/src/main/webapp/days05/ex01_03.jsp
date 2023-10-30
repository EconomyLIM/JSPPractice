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
  			[jsp 예외처리 방법]
  			1. try ~ catch ~ finally 문 사용
  			2. 예외 처리하는 예외 페이지를 지정할 수도 있다.
  				ㄴ /WEB-INF 폴더 안 << 외부에서 접근할수 없는 파일들은 여기다 집어 넣는다.
  					ㄴ error폴더 생성
  						ㄴ viewErrorMessage.jsp
  				ex01_02.jsp 페이지에서 예외가 발생하면 viewErrorMessage.jsp (예외페이지)로 이동해서
  				클라이언트에 응답된다.
  			3. [ WEB-INF 폴더 안에 설정파일 - web.xml] << 톰캣이 항상 시작할때 설정파일을 읽고 실행한다.
  				1) 응답 상태 코드별로 예외 페이지 지정
  				ex01.jsp
  					ㄴ a  href="ex1000.jsp"
  					ㄴ web.xml 404-> 404.jsp 설정 코딩 추가
  					[응답 상태 코드]
  					404: 요청 URL을 처리하기 위한 자원이 존재하지 않음
  					500: 서버 내부 에러가 발생(자바코딩 문제)
  					200: 요청을 정상적으로 처리
  					401: 접근을 허용하지 않을때 
  					400: 클라이언트의 요청이 잘못된 구문으로 구성.
  					403: PUT 요청 X
  					등등
  					
  				2) 예외 타입별로 예외 페이지 지정
  					[예외 타입별]
  					NullPointException
  					~~Exception << web.xml 수정
  					ex01_03.jsp
        </xmp>
        
        <%
        	//? name이 없기때문에 nullPointException
        	String name = null;
  			name = request.getParameter("name");
  	        name = name.toUpperCase();

        %>
        
        name 파라미터값 : <%= name %><br>
        
        
    </div>

</body>
</html>