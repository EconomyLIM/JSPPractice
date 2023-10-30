<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 String contextPath = request.getContextPath();
%>
<%
String cname = "auth"; // 쿠키이름
String logonID = null; // 쿠키값

Cookies cookies = new Cookies(request);
if (cookies.exists(cname)) {
	logonID = cookies.getValue(cname);
} //if
%>
<%
	// 쿠키 삭제
	Cookie c = Cookies.createCookie("auth","","/",0);
	response.addCookie(c);
%>
<script>
	alert("<%= logonID%>님 로그아웃 했다")
	location.href ="ex07_default.jsp";
</script>
