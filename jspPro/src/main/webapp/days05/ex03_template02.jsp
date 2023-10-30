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
<%@ include file="/layout/top.jsp" %>
    <h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
    <div>
        <xmp class="code">
  		include 지시자 사용
        </xmp>
        <table>
        	<tr>
        		<td>
        		<%@ include file="/days05/layout/left.jsp" %>
        		</td>
        		<td>
        		회원관리 Content 부분 <br />
        		회원관리 Content 부분 <br />
        		회원관리 Content 부분 <br />
        		회원관리 Content 부분 <br />
        		회원관리 Content 부분 <br />
        		</td>
        		<td>
        		<%@ include file="/days05/layout/right.jsp" %>
        		</td>	
        	</tr>
        </table>
    </div>
<%@ include file="/layout/bottom.jsp" %>
</body>
</html>