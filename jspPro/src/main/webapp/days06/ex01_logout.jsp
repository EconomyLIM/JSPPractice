<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/session_auth.jspf" %>
<%
	// 세션 삭제(제거)
	// 1) 강제 : 즉시 강제 종료
		session.invalidate();
	// 2) 자동: 요청이 없을 경우 20분 저옫 지나면 자동으로 세션종료
%>
<script>
	alert("<%= logonID%>님 로그아웃 했다")
	location.href ="ex01_default.jsp";
</script>
