<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUCS 로그인</title>
    <link rel="stylesheet" href="./css/loginPage.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <div class="container">
        <%@ include file="./login_header.jsp" %>
        
        
        <form  class="form" action = "./login_process.jsp" name = "login" method = "post">
            <div class="id_pw">
                <div class="input_form" id="id_form">
                	<span class="material-symbols-outlined">account_circle</span>
                	<input maxlength='20' name="userID" class="id" required placeholder="아이디">
                </div>
                <div class="input_form" id="pw_form">
                	<span class="material-symbols-outlined">lock</span>
                	<input maxlength='20' name="userPWD" class="pass" required placeholder="비밀번호" type="password">
                </div>
            </div>
            <button class="login_btn" type="submit">로그인</button>
        </form>
        
        
        <%@ include file="./login_footer.jsp" %>
    </div> 
</body>
</html>