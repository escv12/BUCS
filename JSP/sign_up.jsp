<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    <link rel="stylesheet" href="css/loginPage.css">
</head>
<body>
    <div class="container">
        <div id="header"></div>
        <div class="form">
            <div class="user_info">
                <div class="input_text">이메일</div>
                <div class="input_form" id="email"><input class="id" placeholder="이메일"></div>
                <div class="input_text">닉네임</div>
                <div class="input_form" id="nickname"><input class="pass" placeholder="닉네임"></div>
                <div class="input_text">아이디</div>
                <div class="input_form" id="id"><input class="id" placeholder="아이디"></div>
                <div class="input_text">비밀번호</div>
                <div class="input_form" id="password"><input class="pass" placeholder="비밀번호" type="password"></div>
                <div class="input_text">비밀번호 확인</div>
                <div class="input_form" id="password_confirm"><input class="id" placeholder="비밀번호 확인" type="password"></div>
            </div>
            <button class="sign_up_btn" type="submit">회원가입</button>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>