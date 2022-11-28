<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#header").load("login_header.html");
            $("#footer").load("login_footer.html");
        });
    </script>
    <link rel="stylesheet" href="loginPage.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>
    <div class="container">
        <div id="header"></div>
        <form  action = "./login_process.jsp" name = "login" method = "post">
            <div class="id_pw">
                <div class="input_form" id="id_form"><span class="material-symbols-outlined">account_circle</span><input name="userID" class="id" required placeholder="아이디"></div>
                <div class="input_form" id="pw_form"><span class="material-symbols-outlined">lock</span><input  name="userPWD" class="pass" required placeholder="비밀번호" type="password"></div>
            </div>
            <button class="login_btn" type="submit">로그인</button>
        </form>
        <div id="footer"></div>
    </div> 
</body>
</html>