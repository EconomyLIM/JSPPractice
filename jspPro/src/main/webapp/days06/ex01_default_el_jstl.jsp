<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/session_auth.jspf"%>
<%
String contextPath = request.getContextPath();
// 쿠키 사용해서 로그인(인증) 처리할 예정
// 로그인 성공(인증처리)하면 auth 쿠키이름
// 으로 로그인 ID 쿠키값으로 저장
String cname = "auth"; // 쿠키이름
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
			<li><a href="<%=contextPath%>/cstvsboard/list.htm">게시판</a></li>
		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span> jsp days00
	</h3>
	<div>
		<xmp class="code"> [ex01_default.jsp] </xmp>

		<c:choose>
			<c:when test="${empty logonId }">
				<div id="logon">
					<form action="ex01_logon.jsp">
						아이디 : <input type="text" name="id" value="admin" /><br> 비밀번호
						: <input type="password" name="passwd" value="1234" /><br> <input
							type="submit" value="로그인" /> <input type="button" value="회원가입" />
						<span style="color: red; display: none">로그인 실패했습니다.</span>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div id="logout">
					[<%=logonID%>]님 환영합니다<br> <a href="ex01_logout.jsp">로그아웃</a>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- 인증 X -->
		<a href="/jspPro/cstvsboard/list.htm">게시판</a><br> <a href="#">공지사항</a><br>

		<!-- 인증 O -->
		<c:if test="${not empty logonID}">
			<a href="#">자료실</a>
			<br>
			<a href="#">일정관리</a>
			<br>
		</c:if>

		<c:if test='${not empty logonID && logonID eq "admin" }'>
			<a href="#">급여관리</a>
			<br>
			<a href="#">인사관리</a>
			<br>
		</c:if>
	</div>

</body>
<script>
// 로그인 실패하고 다시 ex07_default.jsp?logon=fail 이동
		if (${param.logon eq "fail"}) {
			$("#logon span").fadeIn().fadeOut(3000);
		}
</script>
</html>