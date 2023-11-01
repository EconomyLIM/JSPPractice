<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//days07.AuthInfo 여기다 인증받은 정보를 객체로 저장
	// DB 연동 id/passwd/authrotiy < 이건 안하고 바로 처리
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// DB연동해서 실패하면 로그인 화면 누르도록 해야하지만 그냥 id로 저장
	// 나중에는 AuthInfo 객체로 저장하면된다
	
	session.setAttribute("auth", id); // 인증 정보 저장
	
	String location = "/jspPro/days07/ex03.jsp";
	String referer = (String)session.getAttribute("referer");
	if(referer != null){
		location = referer;
		session.removeAttribute("session");
	} // if
	response.sendRedirect(location);
	
	
%>