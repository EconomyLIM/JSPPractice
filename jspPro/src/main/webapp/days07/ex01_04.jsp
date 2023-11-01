<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  			JSTL
  			1) 코어 c
  			3) 국제화 fmt
  				- 특정 지역에 따라 알맞은 메세지 출력할때 사용하는 태그 \ $ 엔
  				- 주로 사용: 숫자, 날짜 포맷팅
  				formatNumber
  				formatDate
  				parseNumber
  				parseDate
        </xmp>
        <%
        	Date now = new Date();
        %>
        now = <%= now %><br> <!-- //Wed Nov 01 10:48:20 KST 2023 -->
        <c:set var="now" value="<%= now %>"></c:set>
        <li> <fmt:formatDate value="${now }"/> </li>
        <li> <fmt:formatDate value="${now }" type="date"/> </li> <!-- 2023. 11. 1. -->
        <li> <fmt:formatDate value="${now }" type="time"/> </li> <!-- 오전 11:02:58 -->
        <li> <fmt:formatDate value="${now }" type="both"/> </li> <!-- 2023. 11. 1. 오전 11:03:54 -->
        <li> <fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일"/> </li> <!-- 2023년 03월 01일 -->
        <br>
        <hr>
        <li> <fmt:formatDate value="${now }" dateStyle="default"/> </li> 
        <li> <fmt:formatDate value="${now }" dateStyle="full"/> </li> 
        <li> <fmt:formatDate value="${now }" dateStyle="short"/> </li> 
        <li> <fmt:formatDate value="${now }" dateStyle="medium"/> </li> 
        <li> <fmt:formatDate value="${now }" dateStyle="long"/> </li> 
        <hr>
		<%
			long price = 22345;
			request.setAttribute("price", price);
		%>        
		1) price : ${price} <br>
		2) <fmt:formatNumber value="${price }" type="number" pattern="##,###.00" var="fmtprice"></fmt:formatNumber> <br>
		3) price : ${fmtprice } <br>
		4) <fmt:formatNumber value="${price }" type="currency" currencySymbol="\\"></fmt:formatNumber> <br>
		5) price : ${price} <br>
		6) <fmt:formatNumber value="${price }" type="percent"></fmt:formatNumber> <br>
		
    </div>
	<div>
	<%
		String strPrice = "1,200.34";
		//String -> double 형변환
		strPrice = strPrice.replaceAll(",", "");
		double dprice = Double.parseDouble(strPrice);
	%>
	price: <%=dprice %>
	<fmt:parseNumber value="<%= strPrice%>" pattern="0,000.00" var="dprice"></fmt:parseNumber>
	price: ${dprice }<br>
	<hr />
	<%
		String strNow = "2023년 11월 01일";
		//String -> Date 형변환
		// 1) year, month, day
		// Date now = new Date(2023-1900, 11-1, 1);
		//2)

		/*
		String pattern = "yyyy년 MM월 dd일";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date now = sdf.parse(strNow);
		*/
		
		//3)

		/*
		String pattern = "yyyy년 MM월 dd일";
		DateTimeFormatter df = DateTimeFormatter.ofPattern(pattern);
		LocalDate now = LocalDate.parse(strNow, df);
		*/
	%>
	1) <fmt:parseDate value ="<%= strNow %>" pattern="yyyy년 MM월 dd일" var="pnow"></fmt:parseDate> <br>
	2) now: ${pnow }<br>
	</div>
</body>
</html>