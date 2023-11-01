<%@page import="java.util.Date"%>
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
    <script src="httpRequest.js"></script>
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
        처음 ex07.jsp 요청한 시간: <%= new Date().toLocaleString() %>
        <br>
        <br>
        <input type="button" value="emp sal top5" onclick="getTop5();"/>
        <br />
        <p id="demo"></p>
    </div>

</body>
<script>
let timer = null;
function getTop5() {
	sendRequest("ex07_top5.jsp", null, callback, "GET");
	/* timer = setTimeout(getTop5,1000); */
}
function callback(){ 
	if(httpRequest.readyState == 4) { 
		if(httpRequest.status==200) {
			$("#demo").html( httpRequest.responseText);
		} else{
			alert("에이작스 실패 : " + httpRequest.status);
		}
	} //if
}//callback
</script>
</html>