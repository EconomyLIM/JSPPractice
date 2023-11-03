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
  			회원가입 페이지
  			jquery ajax 함수: json/js/xml 등등 
  			- get 방식: getJSON(), getScript(), get()
  			- post방식: post()
  			
  			get/post : load() [$.ajax]
        </xmp>
        <form action="" method="get">
    		deptno : <input type="text" name="deptno" value="10" /><br>
    		empno(id) : <input type="text" name="empno" value="7369" />
    		<input type="button" id="btnEmpnoCheck" value="empno 중복체크 - jquery ajax" />
    		<p id="notice"></p>
    		<br>
    		ename : <input type="text" name="ename" value="" /><br>
    		job : <input type="text" name="job" value="" /><br>
    		<input type="submit" value="회원(emp) 가입" />
 		</form>
    </div>
<script>
	$(function() {
		$("#btnEmpnoCheck").on("click", function() {
			/* ?empno=7369 이렇게 가져가야함*/
			let params = $("form").serialize(); // < 이게 파라미터 자동으로 만들어주는 함수
			/* alert(params); */ //deptno=10&empno=7369&ename=&job=
			$.ajax({
				url:"ex04_idcheck.jsp"
				, dataType:"json" // text, json, xml등등 도 된다.
				, type:"GET"
				, data:params
				, cache:false
				, success:function(data, textStatus, jqXHR){
					/* alert(data.count); */
					if (data.count == 1) {
						$("#notice").css("color","red").text("이미 사용중인 아이디 입니다.");
					} else {
						$("#notice").css("color","blue").text("사용 가능한 ID 입니다.");
					}
				}
				,error: function(){
					alert(error);	
				}
			});
		});
	});
</script>
</body>
</html>