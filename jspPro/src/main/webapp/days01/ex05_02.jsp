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
  			js or jquery 사용해서 정수를 입력후 엔터치면
  			결과물이 demo 출력
        </xmp>
        
        
       <%--  <form action="">
                정수 : <input type="text" name="num" id="num" value="0" autofocus><br>
        <input type="submit">
        </form>

		<%
            String s = request.getParameter("num");
			if(s.equals("")) { s = "";}
        	int n = Integer.parseInt(s) ;
            int sum = 0;
            for (int i = 0; i <= n; i++) {
                out.print(i+"+");
                sum += i;
            }
            out.print("="+ sum);
        %>  
        
        <p id="demo"></p>  --%>
        
        정수 : <input type="text" name="num" id="num" autofocus><br>
        <p id="demo"></p>
        <%
        	String num = request.getParameter("num");
        	int n;
        	int sum =0;
        	if(num!= null && !num.equals("")){
        		 n = Integer.parseInt(num) ;
        		 for (int i = 0; i <= n; i++) {
        %><%=i%>+<%
        		sum+=i;
                 }//for
        		 %>=<%= sum %><% 
        	} //if
        %>
        
    </div>

</body>
<script>
$(function() {
	$(":text[name=num]")
		.css("text-align", "center")
		<%-- .val( '<%= num==null?"":num %>' ) --%>
		.val('${param.num}')
		.keyup(function(event) {
			if(event.which == 13) {
				let num = $(this).val();
				
				location.href = "ex05_02.jsp?num=" + num
			}
		});
})
</script>
</html>