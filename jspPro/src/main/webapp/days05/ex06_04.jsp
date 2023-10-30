<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String [] delCookieNames = request.getParameterValues("ckbCookie");
	for(int i =0 ;i < delCookieNames.length ; i++){
		// js 쿠키 삭제: 똑같은 쿠키이름으로 만료시점ㅇ르 과거로 해서 쿠키 삭제
		// jsp 쿠키 삭제: 만료시점을 과거로 해서 쿠키 생성
		String cookieName = delCookieNames[i];
		Cookie c = new Cookie(cookieName, "");
		c.setMaxAge(0); // 쿠키는삭제
		response.addCookie(c);
	}// for
	// alert 쿠키 삭제 알리고 
	// 쿠키를 확인 하는 페이지 이동 ex06_03.jsp
	/* // response.sendRedirect(location); //이걸로 명령을 하면 중간에 경고창을 띄울 수 없다. */
%>
<script>
alert("쿠키 삭제 완료");
location.href ="ex06_03.jsp";
</script>