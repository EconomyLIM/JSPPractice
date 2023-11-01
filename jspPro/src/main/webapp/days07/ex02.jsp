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
  			1. MVC 패턴
  			2. 세션 - 인증처리, 권한 처리, 장바구니
  			3. 페이징 모듈화
  			4. [필터(filter)]
  				1) httml 요청 - 자원 접근 권한
  								파라미터유무
  								사전에 체크할 수 있다.
  							// 요청 취소
  						응답 - xml -> json
  							암호화 처리
  			5. 처리 과정
  			[클] -> list.do -> 1) 필터 u-p -> 2) 필터 u-p -> 3) 필터 u-p ->[서버] 처리 // 필터가 연결된것을 필터 체이닝라고 부름
  				<- 응답 <- 2) 암호화필터	<- 1) 필터(xml->json 변환)
  			6. 필터 구현시 핵심 3개 타입
  				1) javax.servelt.Filter 인터페이스 구현
  					(1) init() 필터 초기화 메서드 오버라이딩
  					(2) destroy 
  					(3) *** doFilter() ***: 필터링할 작업. 코딩
  						암호화, 인증, 권한 체크
  						-> 다음 이동 chain.doFilter()
  				2) ServletRequestWrapper 요청을 포장(변경)한 결과를 저장하는 객체
  				3) ServletRequestWrapper 응답을 포장(변경)한 결과를 저장하는 객체
  			7. 필터 클래스를 사용하려면 lib 폴더 안에 servlet-api.jar파일 추가
  				ㄴ 하지만 이클립스는 추가할 필요 X
  			8. 필터 클래스선언 
  				필터 클래스 1)web.xml 등록
  						2) @WebFilter 어노테이션

  			
        </xmp>
    </div>

</body>
</html>