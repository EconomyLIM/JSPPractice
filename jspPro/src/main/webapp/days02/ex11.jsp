<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ok = request.getParameter("ok"); // 인증성공
	String name = request.getParameter("name");
	String error = request.getParameter("error");
	
	if(error != null && error.equals("")){
		%>
		<script >
			alert("로그인실패")
		</script>
		<%
	}
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
		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span> jsp days00
	</h3>
	<div>
		<xmp class="code"> 
		
		 			ex11.jsp	id/passwd->로그인
  					ex11_ok.jsp	
  				로그인 성공 ex11.jsp?ok&name=로그인이름
  				로그인 실패 ex11.jsp?error
  				</xmp>
		<div id="logon">
			<form action="ex11_ok.jsp">
				아이디: <input type="text" name="id" value="admin" /> 비밀번호: <input
					type="password" name="passwd" value="1234" /> <input type="submit"
					value="logon" />
			</form>
		</div>
		<div id="logout">
			<%=name %>님 로그인 하셨습니다.<br>
			<button>로그아웃</button>
		</div>
		<a href="#">설문조사</a><br>
		<!-- 반드시 로그인해야만 사용할 수 있는 메뉴 -->
		<%
		if(ok !=null){
		%>
		<a href="#">일정관리</a><br>
		<a href="#">게시판</a><br>
		
		<script>
		$(function () {
			alert("로그인 성공");
			$("#logon").hide();
			$("#logout").show();
		});
		</script>
		
		
		<% 	
		}
		%>
		
	</div>

</body>
<script>
$("#logout").hide();
</script>
</html>