<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find_id</title>
    <link rel="stylesheet" href="loginPage.css">
</head>
<body>
<div class="container">
<div id="header"></div>
<div class="form">
    
    <form action = "write.jsp" name = "fe" method = "post">
    <div class="id_pw"> 
        <div class="input_form" id="email_form"><input type="email" required class =  "find_id_email" name = "email" placeholder="�̸��ϸ� �Է��ϼ���"></div>
    </div>
    <input class="find_id_btn" type="submit" value = "����">
    </form>
<div id="footer"></div></div>
</div>
</body>
</html>