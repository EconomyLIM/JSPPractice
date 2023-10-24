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
        정수 : <input type="text" name="num" id="num"><br>
        <p id="demo"></p>
    </div>

</body>
<script>
/*
    $("#num").keydown(function () {
        let o = $("#num").val();
        let sum = 0;
        if(event.which == 13) {
            for (let i = 0; i <= o; i++) {
                sum += i;
            } // for
            $("#demo").html(sum);
        }
    })
*/
$(function() {
    $(":text[name=num]")
        .css("text-align", "center")
        .keyup(function(event) {
            if(event.which == 13) {
                $("#demo").html("");

                let n = $(this).val();
                let sum = 0;
                for (var i = 1; i <= n; i++) {
                    sum += i;
                    $("#demo").html(function(index, oldhtml) {
                        return oldhtml + i + (i==n ? "" : "+");
                    })
                }

                $("#demo").html(function(index, oldhtml) {
                    return oldhtml + "=" + sum;
                })

                $(this).select();
            }
        });
})
</script>
</html>