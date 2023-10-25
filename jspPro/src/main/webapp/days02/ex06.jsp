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
        <form action="ex06_02.jsp" method="get">
        이름: <input type="text" name="name" value="홍길동" placeholder="이름을 입력하세요."/><br>
        성별: <input type="radio" name="gender" value="m" checked="checked"/>남자
        <input type="radio" name="gender" value="f" checked="checked"/>여자 <br>
        
        좋아하는 동물:
        <input type="checkbox" name="pet" value="dog" checked="checked"/>개
        <input type="checkbox" name="pet" value="cat" checked="checked"/>고양이 
        <input type="checkbox" name="pet" value="pig" checked="checked"/>돼지
        <br>
        <button type="submit">제출하기</button>
        </form>
    </div>

</body>
</html>