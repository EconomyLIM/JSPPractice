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
  			3. 예외처리의 우선 순위
  				1) page 지시자의 errorPage 속성으로 지정한 에러페이지 처리
  				2) 예외 타입별 처리 - web.xml
  				3) 예외 코드별 처리 - web.xml
  				4) 웹 컨테이너가 제공하는 기본 에러 페이지
        </xmp>
        
        <%
        	//? name이 없기때문에 nullPointException
        	String name = null;
  			try{
  				name = request.getParameter("name");
  	        	name = name.toUpperCase();
  			}catch(NullPointerException e){
  				name = "";
  			}catch(Exception e){
  				
  			}
        %>
        
        name 파라미터값 : <%= name %><br>
        <a href="ex1000.jsp">ex1000.jsp</a>
        
    </div>

</body>
</html>