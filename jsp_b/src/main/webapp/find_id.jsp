<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="./css/loginPage.css">
</head>

<body>
	<div class="container">
		<%@ include file="./header_footer/login_header.jsp" %>
		
		
		<form class="form" action = "./process/find_id_process.jsp" name = "find_id" method = "post">
			<div class="id_pw"> 
			    <div class="input_form" id="email_form"><input type="email" required class =  "find_id_email" name = "email" placeholder="이메일를 입력하세요"></div>
			</div>
			<input class="find_id_btn" type="submit" value = "다음">
		</form>
		
		
        
        <%@ include file="./header_footer/login_footer.jsp" %>
	
	</div>
</body>
</html>