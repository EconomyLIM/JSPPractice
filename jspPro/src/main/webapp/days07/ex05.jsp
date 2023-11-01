<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<span class="material-symbols-outlined">view_list</span> jsp days07
	</h3>
	<div>
		<xmp class="code"> [ex05] js ajax ex05_ajax_info.txt </xmp>
		서버 요청 시간<%=new Date().toLocaleString()%>
		<br> <input type="button" value="js ajax" name="" id=""
			onclick="load('ex05_ajax_info.txt');">
		<p id="demo"></p>
	</div>

</body>
<script>
let httpRequest; // XMLHttpRequest 객체


function getXMLHttpRequest(){
	if( window.ActiveXObject ){   // IE
        try{
           return new ActiveXObject("Msxml2.XMLHTTP");   // 
        }catch(e){
           try{
             return new ActiveXObject("Microsoft.XMLHTTP");
           }catch(e){
              return null;
           }
        }
  }else if( window.XMLHttpRequest ){
         return new XMLHttpRequest();
  }else{
     return null;
}
	
function load( url ) {
	
	httpRequest = getXMLHttpRequest();
	// 1. XMLHttpRequest 객체 선언
	
	// 2.
	httpRequest.onreadystatechange = callback;
	
	// 3. open() 요총
	httpRequest.open("GET", url, true)
	// 4. send()
	httpRequest.send();
	function callback(){ 
		if(httpRequest.readyState == 4){ 
			if(httpRequest.status==200){
				var rtext = httpRequest.responseText;
				let names = rtext.split(",");
				for(let name of names){
					$("#demo").append($("<li></li>"));
				}
			}
		}
		} //if
	} //function
</script>

</html>