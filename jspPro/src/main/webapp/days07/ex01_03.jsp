<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
  		
        </xmp>
        <%
        	int [] m = {3,5,2,4,1};
        %>
        <c:set var="arr" value="<%= m %>"></c:set>
        <c:forEach items ="${arr }" var = "n" varStatus="s">
        	<li>m[${s.index }] = ${n }</li>
        </c:forEach>
        
        <hr />
        <!-- Map+c:forEach -->
        <%
        	Map<String, String> map = new HashMap<>();
        	map.put("id", "admin");
        	map.put("name", "관리자");
        	map.put("age", "20");
        %>
        <c:set var="minfo" value="<%=map %>"></c:set>
        id: ${minfo.id }<br>
        name : ${minfo.name }<br>
        age:  ${minfo.age }<br>
        
        <hr />
        <ol>
        	<c:forEach items="${minfo }" var="entry">
        		<li>${entry.key } - ${entry.value }</li>
        	</c:forEach>
        </ol>
        <hr />
        <c:set var="names" value="임경재,신종혁,박정호,주강민"></c:set>
        <c:forTokens items="${names }" delims="," var="name">
         ${name } <br />
        </c:forTokens>
        
        <%
        	String msg = "<h3>Hello World</h3><br />홍길동<br />";
        	// c:out 태그
        	// JSPWriter에 출력할때 사용하는 태그
        	// 출력할 값은 value 속성
        	// escapeXml = "true" 기본값
        	// 			<	&lt; 변환
        	//			>	&gt; 변환
        	//			&	&amp; 변환
        %>
        <p id="demo">
        	<%=msg %>
        	<br>
        	<c:out value="<%=msg %>" escapeXml="true"></c:out>
        </p>
       
    </div>

</body>
</html>