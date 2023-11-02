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
  			xml -> json 형식을 ajax 더 많이 사용한다.
  			[json]
  			1.
  			2. 가벼운 데이터 교환 형식
        </xmp>
        <button onclick="getPersonJson()"> 로컬 저장소의 personjson 사용 </button>
    </div>
	
	<p id="demo"></p>
</body>
<script>
	//1. js Object
	var person = {
			name:"john"
			,age : 20
			, city : "Seoul"
	};
	// 2. person js Object -> json 변환
	let personJson = JSON.stringify(person);
	/* console.log("personJson : " + personJson)  */// personjson : {"name":"john","age":20,"city":"Seoul"}
	
	// 3. 로컬 저장소 저장
	localStorage.setItem("personJson", personJson);
	
	
</script>
<script>
	function getPersonJson() {
		let personJson = localStorage.getItem("personJson");
		// json -> js Object 변환 : JSON.parse()
		
		let person = JSON.parse(personJson);
		
		$("#demo").html( person.name + " / "+ person.age );
		
		/* localStorage.removeItem("personJson"); */
		
		/* localStorage.clear(); */
		
	} // getPersonJson
</script>
</html>