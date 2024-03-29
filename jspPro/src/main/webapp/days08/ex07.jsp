<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
  			[파일 업로드]
  			1. 업로드 [클]-> [서]
  			회원가입: 가입자 사진 등록
  			쇼핑 사이트: 상품사진 등록(여러개)
  			자료실 : 게시글 + 첨부파일
  			등등
  			다운로드: [서] -> [클]
  			
  			2. (꼭 기억) 실제 파일 업로드 할 때..
  				1) 스트림 기반의 전송 방식인 method = "post" 설정
  				2) 기본 인코딩 enctype="application/x-www-form-urlencoded" 으로 설정되어 있는데
  					인코딩 설정: enctype="multipart/form-data"
  					
  			3. 실습
				1) upload 폴더 추가
				2) ex08.jsp
					ex08_ok.jsp
				  			
  			4. 파일 업로드
  				1) 개발자가 직접 구현 X
  					request.getInputStream();
  				2) 외부 라이브러리 사용 **
  					ㄱ.
  					ㄴ. 
  					ㄷ. request 객체 name upload 파라미터 값 null x
  						 cos.jar 파일에서 제공하는 [MultipartRequest]클래스 제공
  						 							ㄴ 객체 생성해서 파라미터 값 첨부파일 처리
						MultipartRequest mrequest = new MultipartRequest(ㄱ,ㄴ,ㄷ,ㄹ,ㅁ)
						ㄱ - request 객체
						ㄴ - 서버에 저장될 위치(경로)
						ㄷ - 최대 파일 크기
						ㄹ - 파일의 인코딩 방식
						ㅁ - 파일 중복 처리 위한 인자(클래스, 제공);
  				3) 서블릿 3.0 또는 3.1에서 제공하는 라이브러리
  					1) HttpServletReqeust request 의 [getPart()]를 이용해서 업로드된 데이터(파일) 접근할 수 있는 [Part 객체]
                        .getName() : 파라미터 이름
                        .getContentType() : Content Type 
                        .getSize() : 업로드한 파일 크기
                        .getSubmittedFileName() : 업로드한 파일명 
                        .getInputStream()  
                        .write() : Part의 업로드 데이터를 파일명이 지정한 파일에 복사.
                        .delete() : 생성된 임시 파일을 삭제.
                        .getHeader() : 해당 Part에서 지정한 이름의 헤더 값을 얻어온다.
                        
                 2) 서블릿이 [multipart 데이터]를 처리할 수 있도록
                      -  web.xml 설정
                      - @MultipartConfig 어노테이션을 사용해서 설정
                      예) web.xml 복사 + 붙이기 -> web_days11_replyboard.xml
                            ex03.jsp 복사 + 붙이기 -> ex04.jsp
                            jspPro/days12/upload ->  UploadServlet.java 서블릿 추가
                       
                       에러 : java.lang.IllegalStateException: 어떤 [multi-part 설정]도 제공되지 않았기 때문에, part들을 처리할 수 없습니다.
  				
        </xmp>
        <%
        
        %>
        <form action="" enctype="multipart/form-"></form>
    </div>

</body>
</html>