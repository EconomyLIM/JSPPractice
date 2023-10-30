<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	Enumeration<String> en = request.getParameterNames();
	while(en.hasMoreElements()){
		String cookieName = en.nextElement();
		String cookieValue = request.getParameter(cookieName);
		
		Cookie c = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8") );
		c.setMaxAge(-1); // -1== 브라우저를 닫으면 자동으로 쿠키는 제거하겠다.
		response.addCookie(c);
	}//while
	
	String location = "ex06_03.jsp";
	response.sendRedirect(location);
	

%>