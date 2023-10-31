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
    	<a href="/jspPro/board/list.do">/board/list.do</a>
    	<a href="/jspPro/board/write.do">/board/write.do</a>
        <xmp class="code">
        	JSP 모델2구조의 MVC패턴 구현
  			[ MVC 패턴 ]
  			- 자바 개발자라면 반드시 습득해야 할 기본 기법
  			- MVC 패턴 이해
  			- MVC패턴은 모델2 구조에 해당
  			
  			[모델1 구조와 모델2 구조 이해]
  			-JSP 웹 애플리케이션의 구조는 모델1 구조와 모델2 구조로 나눈다
  			1) 모델 1구조
  				[list.jsp] -> 요청 -> list.jsp
  							<- 응답 <- 
  			2) 모델 2구조
  				[list.jsp] -> 요청 -> 서블릿 응답 결과물 생성
  								  -> 출력 담당 list.jsp
  							<- 응답 <-
  			[MVC 패턴]				
  			모델 (Model) : 비즈니스 영역( 로직 처리 )
  			뷰 (View): 프리젠테이션 영역( 화면 담당 )
  			컨트롤러 (Controller): 요청-> 응답 컨트롤 담당
  			
  			[MVC 패턴 처리 과정]									핸들러 -> 서비스 호출 - > DAO 호출 -> DB처리
  			A[write.htm] 요청									커맨드
  			B[write.htm] 요청 -> [ 컨트롤러(C) ] -> 요청 로직 처리 -> 모델(M)
  			C[logon.htm] 요청		w,l,l 등등					결과물(모델)
  									요청분석
  				: 
  									결과물(모델) -> 뷰(Write.jsp)
  									출력담당 파악
  						<- 응답 <- 
  			[실습] 모델 2구조 이지만 MVC 패턴은 아니다.
  			1. 게시판: days04.board 폴더
  				ㄴ delete.jsp
  				ㄴ edit.jsp
  				ㄴ list.jsp
  				ㄴ view.jsp
  				ㄴ write.jsp
  			2. days04.board패키지	: 서블릿(List.java, Write.java) 
  				days04.board.domain패키지 : VO, DTO
  				days04.board.persistence패키지 : DAO
  			
  			위의 실습을 MVC 패턴으로 수정
  			1) write.htm 모든 요청은 컨트롤러(하나의 서블릿)에서 요청을 받는다.
  			
  			2) list.htm, write.htm, delete.htm 모든 요청 -> 하나의 서블릿 처리
  				url-pattern ? 		/						서블릿
  				url-pattern ? 		*.do					서블릿
  				list.do write.do edit.do delete do
  				
  			3) 컨트롤러(하나의 서블릿) 이름: DispatcherServlet.java
  				(1) 모든 요청 -> 모델(핸들러) 처리 파악(매핑)
  					파일 선언 - commandHandler.properties
  					요청URL 처리 모델 매핑
  					list.do = ListHandler
  					write.do = ListHandler
  				(2) 결과물 저장 
  				(3) 리다이렉트, 포워딩 결정
  				
  			4) 모델( 커맨드 핸들러 )
  					인터페이스 CommandHandler
  				ListHandler im CommandHandler
  				WriteHandler im CommandHandler
  				:
  			5) DAO, DTO 복사 사용
  			6) Service 패키지 만들어서 추가
  			7) JSP 패키지 복사 사용
        </xmp>
    </div>

</body>
</html>