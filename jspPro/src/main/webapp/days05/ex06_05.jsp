<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.net.URLDecoder"%>
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
        <form action="ex06_05_ok.jsp">
        <%! 
        	// 선언문
        	public String getCookieValue(String cname,HttpServletRequest request){
        	Cookie [] cookieArr= request.getCookies();
        	for( Cookie c : cookieArr){
        		if( c.getName().equals(cname)){
        			try{
        				return URLDecoder.decode(c.getValue(), "UTF-8");
        			}catch(UnsupportedEncodingException e){
        				
        			} //catch
        		} //if
        	}//for
        	return null;
        } // getCookieValue
        %>
        <%
        	String [] updCookieNames = request.getParameterValues("ckbCookie");
        	for(int i =0 ; i < updCookieNames.length ; i++){
        		String cname = updCookieNames[i];
        		String cvalue = getCookieValue(cname, request);
        %>
        <li> <%=cname %> : <input type="text" name="<%= cname %>" value="<%= cvalue %>"/> </li>
        <%
        	}
        %>
        <input type="submit" value="제출"/>
        </form>
    </div>

</body>
</html>