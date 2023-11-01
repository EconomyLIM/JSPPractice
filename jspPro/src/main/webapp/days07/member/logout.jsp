<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// session.removeAttribute("auth"); //removeAttribute은 하나만 지우는것이다.
	session.invalidate();
	
	String location = "/jspPro/days07/ex03.jsp";
	response.sendRedirect(location);
%>
