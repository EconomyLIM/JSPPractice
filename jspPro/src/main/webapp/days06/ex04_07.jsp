<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  			[EL에서 객체의 메서드 호출]
  			[EL에서 객체의 정적메서드 호출]
  				ㄴ days06.FormatUtil 클래스 추가
        </xmp>
        <%
        	long price = 22345;
        %>
        price(표현식) = <%= price %> <br>
        <!-- 세자리마다 콤마 찍어서 출력 -->
        price(표현식) = <%= String.format("%,d", price) %>
        <%
        	String pattern = "##,###";
        	DecimalFormat df = new DecimalFormat(pattern);
        %>
        <hr />
        <%
        	request.setAttribute("price", price);
        %>
        price(EL) = ${ price }<br>
        price(EL) = <fmt:formatNumber pattern="#,###" value="${price }"/><br />
        
    </div>

</body>
</html>