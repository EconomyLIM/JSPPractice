<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
        <%
        	// ㄴ
        	String saveDirectory = pageContext.getServletContext().getRealPath("/days08/upload");
        	System.out.println(saveDirectory);
        	
        	File f = new File(saveDirectory);
        	if( !f.exists() ) f.mkdirs();
        	// ㄷ
        	int maxPostSize = 5 * 1024 * 1024; // 기본 단위 = byte
        	
        	// ㄹ
        	String encoding = "UTF-8";
        	
        	// ㅁ
        	FileRenamePolicy policy = new DefaultFileRenamePolicy();
        	
        	MultipartRequest multiRequest = new MultipartRequest(
        			request
        			,saveDirectory
        			, maxPostSize
        			, encoding
        			, policy
        			);
        	// 벌써 첨부 파일들은 upload 폴더에 저장완료 !!
        %>
        > 전송된 메시지 = <%= multiRequest.getParameter("msg") %>
        <br>
        <%
        Enumeration en = multiRequest.getFileNames();
        while(en.hasMoreElements()){
        	String inputNameArr = (String)en.nextElement(); //file1, file2
        	File attachFile = multiRequest.getFile(inputNameArr);
        	if(attachFile != null){
        		String fileName = attachFile.getName();
        		String originalFileName = multiRequest.getOriginalFileName(inputNameArr);
        		String fileSystemName = multiRequest.getFilesystemName(inputNameArr);
        	
        %>
        <hr />
        > 첨부된 파일명: <%= fileName %><br>
        > 첨부된 파일크기: <%= fileName.length() %><br>
        > 원래 파일명 : <%=  originalFileName%>
        > 실제 저장된 파일명: <%= fileSystemName %>
        <%
        	}
        }
        %>
    </div>

</body>
</html>