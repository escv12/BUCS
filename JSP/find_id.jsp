<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find_id</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        $("#header").load("login_header.html");
        $("#footer").load("login_footer.html");
    });
    </script>
</head>
<body>
<div class="container">
<div id="header"></div>
<div class="form">
    <div class="id_pw">
        <div class="input_form" id="email_form"><input class="find_id_email" placeholder="이메일를 입력하세요"></div>
    </div>
    <button class="find_id_btn" type="submit">다음</button>
</div>
<div id="footer"></div>
</div>
</body>
</html>