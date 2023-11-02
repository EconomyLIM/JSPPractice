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
  			days08.ex01.jsp
  			ex01_cd_catalog.xml
        </xmp>
        <button type="button" onclick="loadXml()">Get my CD Collection</button>
        <br>
        <br>
        <table id="tbl"></table>
    </div>

</body>
<script>
	function loadXml() {
		// 1. xhr = XMLHttpRequest 객체
		let xhr = getXMLHttpRequest()
		// 2. xhr.on[readystatechange] = callback
		xhr.onreadystatechange = function() {
			if(this.readyState == 4 && this.status == 200){
				// responseText;
				var xmlDoc = this.responseXML;
				/*  alert( xmlDoc );  */ // [object XMLDocument]
				// XML DOM
				let cdList = xmlDoc.getElementsByTagName("CD");
				/* alert(cdList.length); */ // 26
				let title, artist;
				
				let tblContent = "<tr><th>TITLE</th><th>ARTIST</th></tr>"
				
				for (var i = 0; i < cdList.length; i++) {
					title = cdList[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue;
					artist = cdList[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue;
					/* console.log(title+" / " + artist); */
					tblContent += `<tr><th>\${title}</th><th>\${artist}</th></tr>`
				} //for
				
				document.getElementById("tbl").innerHTML = tblContent;
				
			}//if
		} // function
		// 3. xhr.open()
		xhr.open("GET", "ex01_cd_catalog.xml", true);
		// 4. xhr.send()
		xhr.send();
	} // loadXml
	
	function getXMLHttpRequest(){
		   if(window.ActiveXObject){  // IE          6
		      try {
		         return new ActiveXObject("Msxml2.XMLHTTP");
		      } catch (e) {
		         try {
		            return new ActivXObject("Microsoft.XMLHTTP");
		         } catch (e) {
		            return null;
		         }

		      }
		   }else if(window.XMLHttpRequest){
		      return new XMLHttpRequest();       
		   }else {
		      return null;
		   }
		}
</script>
</html>