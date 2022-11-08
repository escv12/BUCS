<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sign_up</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        $("#header").load("login_header.html");
        $("#footer").load("login_footer.html");
    });
    
    </script>
    <link rel="stylesheet" href="loginPage.css">
</head>
<body>
    <div class="container">
        <div id="header"></div>
        <div class="form">
            <div class="user_info">
            <form action = "write.jsp" name = "sgin" method = "post">
                <div class="input_text">이메일</div>
                <div class="input_form" id="email"><input type="email" required class="id" placeholder="이메일"></div>
                <div class="input_text">닉네임</div>
                <div class="input_form" id="nickname"><input class="pass" required placeholder="닉네임"></div>
                <div class="input_text">아이디</div>
                <div class="input_form" id="id"><input class="id" required placeholder="아이디"></div>
                <div class="input_text">비밀번호</div>
                <div class="input_form" id="password"><input type = "password" required class="pass" name = "pw" placeholder="비밀번호" type="password"></div>
                <div class="input_text">비밀번호 확인</div>
                <div class="input_form" id="password_confirm"><input type = "password" required class="id" name = "passwdRe" placeholder="비밀번호 확인" type="password"></div>           
            <input class="sign_up_btn" type="submit" value = "가입하기">
          </form></div>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>