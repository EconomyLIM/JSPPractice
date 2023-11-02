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
        <h3><%= new Date().toLocaleString() %></h3>
        <br>
        <input type="button" id="btnEmpnoCheck" value="ex05" />
        <br />
		<p id="demo"></p>
    </div>

</body>
<script>
	$(function() {
		$("#btnEmpnoCheck").on("click", function() {
			/* alert(params); */ //deptno=10&empno=7369&ename=&job=
			$.ajax({
				/* url:"ex05_empjson.jsp" */
				url:"ex05_empjson_lib.jsp"
				, dataType:"json" // text, json, xml등등 도 된다.
				, cache:false
				, success:function(data, textStatus, jqXHR){
					//alert(data.emp); // 자바스크립트의 배열을 갖고온다(js array)
					$(data.emp).each(function(i, element) {
						$("#demo").append(`<li>\${element.empno} : \${element.ename}</li>`)
					})
				} // success
				,error: function(){
					alert(error);	
				}
			});
		});
	});
</script>
</html>