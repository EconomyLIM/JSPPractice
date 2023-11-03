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
    	<a href="/jspPro/days09/replyboard/list.do"> 게시글 목록 보기 </a>
        <xmp class="code">
  			[답변형 계층형 게시판]
  			1. 로직이해
  			[DB]
  			글번호	제목			작성자	...
  			1		첫번째 게시글	홍길동(새글)	...
  			2		두번째 게시글	신기범(새글)	...
  			3		세번째 게시글	신기범(새글)	...
  			4		2-1답글		이상문(답글)
  			5		2-1-1 답글	임경재(답글)
  			6		네번째 게시글	신기범(새글)	...
  			
  			[화면 출력]
  			ORDER BY 글번호 DESC
  			글번호	제목			작성자	...
  			6		네번째 게시글	신기범(새글)	...
  			3		세번째 게시글	신기범(새글)	...
  			2		두번째 게시글	신기범(새글)	...
  			4		2-1답글		이상문(답글)
  			5		2-1-1 답글	임경재(답글)
  			1		첫번째 게시글	홍길동	...
  			
  			[해결방안] 컬럼 추가 (3개, 2개)
  			깊이(deptp)		: 새, 답, 답답답
  							0	1	3
  			글 그룹 (group=ref) :
  			그룹 안 순번(step)		:
  			
  			-- 3개 컬럼 추가
  			[DB]
  			글번호 	제목			작성자... 	그룹(REF) 	순서(STEP) 	깊이(depth)
  			1		첫번째게시글	홍길동(새글)		1			1			0
  			2 		두번째 게시글	서영학(새글)		2			1			0
  			3		세번째 게시글	정창기(새글)		3			1			0
  			4		2-1답글		정창기(답글)		2			4			1
  			5		2-2답글		정창기(답글)		2			3			1
  			6		2-3답글		정창기(답글)		2			2			1
  			[화면 출력]
  			ORDER BY 글번호 DESC
  			글번호 	제목			작성자... 	그룹(REF) 	순서(STEP) 	깊이(depth)
  			3		세번째 게시글	정창기(새글)		3			1			0
  			2 		두번째 게시글	서영학(새글)		2			1			0
  			6		2-3답글		정창기(답글)		2			2			1
  			5		2-2답글		정창기			2			3			1
  			4		2-1답글		정창기(답글)		2			2			1
  			1		첫번째게시글	홍길동(새글)		1			1			0
  			
  			[설명]
  			1. 새글이 작성될 때는 글번호(pk) -> 글 그룹(depth) 순서(step 1 ) 깊이(depth 0)
  			2. 답글이 작성될 때는 글번호(pk) 글 그룹(deptp) == 부모의 글 그룹
  			
  							*** 같은 글 그룹내에서 부모 순서
  								순서(step) == 부모의 순서 + 1
  			3. MVC 패턴 - 컨트롤러 추가
  				1) --properties
  				2) .java
  				3)  web.xml
  				
  			[4] DTO
  				DAO
  				SERVICE
  			[5] CommandHandler
  				ListHandelr.java
  			
  			목록처리
  				ㄴ 이모티콘
  			새글/ 답글 등등
  			보기 처리
        </xmp>
    </div>

</body>
</html>