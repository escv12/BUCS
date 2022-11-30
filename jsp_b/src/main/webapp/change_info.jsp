<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "./process/connect.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
    <link rel="stylesheet" href="./css/loginPage.css">
</head>

<body>
	<div class="container">
		<%@ include file="./header_footer/login_header.jsp" %>

		
		<form class="form" action="./process/change_info_process.jsp" name="change_info" method = "post">
			<div class="id_pw"> 
			    <div class="input_form" id="email_form"><input type="password" required class="find_id_email" name="password" placeholder="현재 비밀번호를 입력하세요"></div>
			    <div class="input_form" id="email_form"><input type="password" required class="find_id_email" name="cPassword" placeholder="바꾸실 비밀번호를 입력하세요"></div>
			    <div class="input_form" id="email_form"><input type="password" required class="find_id_email" name="cPassword2" placeholder="바꾸실 비밀번호를 입력하세요"></div>
			</div>
			<input class="find_id_btn" type="submit" value = "다음">
		</form>
		
		
        
        <%@ include file="./header_footer/login_footer.jsp" %>
	
	</div>
</body>
</html>