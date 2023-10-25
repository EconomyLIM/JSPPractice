<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        </ul>
    </header>
    <h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
    <div>
        <xmp class="code">
  		
        </xmp>
        <%
        	request.setCharacterEncoding("UTF-8");
        	String name = request.getParameter("name");
        	String gender = request.getParameter("gender");
        	String pets[] = request.getParameterValues("pet");
        %>
        이름: <%=name %><br>
        이름(EL): ${ param.name } <br>
        성별: <%= gender.equals("m")?"남자":"여자" %> <br>
        좋아하는 동물:<%= Arrays.toString(pets) %> <br>
        <h3> 요청 파라미터명</h3>
        <%
        	/* request.getParameterMap() name = 홍길동 */
        	Enumeration<String> en = request.getParameterNames();
        	while(en.hasMoreElements()){
        		String pname = en.nextElement();
        		%><li><%=pname %></li> <% 
        	} // while
        %>
    </div>

</body>
</html>