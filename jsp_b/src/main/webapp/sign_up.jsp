<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="./css/loginPage.css">
</head>
<body>
    <div class="container">
        <%@ include file="./login_header.jsp" %>
        
        <%
        	String msg = null;
        
	        if(session!=null || !request.isRequestedSessionIdValid())
	        {
	        	msg = (String)session.getAttribute ("msg");
	        	session.invalidate();
	        }
	        	
	        if(msg == null)
	        	msg = "";
	        
        %>
        
        
        
        <div class="form">
            <div class="user_info">
	            <form action = "./sign_up_process.jsp" name = "sgin" method = "post">
	                <div class="input_text">이메일</div>
	                <div class="input_form" id="email"><input maxlength='40' type="email" required class="id" name = "EMAIL" placeholder="이메일"></div>        
	                <div class="input_text">아이디</div>
	                <div class="input_form" id="id"><input maxlength='20' class="userid" name = "userID" required placeholder="아이디"></div>
	                <div class="input_text">비밀번호</div>
	                <div class="input_form" id="password"><input maxlength='20' type = "password" required class="pass" name = "userPWD" placeholder="비밀번호" type="password"></div>
	                <div class="input_text">비밀번호 확인</div>
	                <div class="input_form" id="password_confirm"><input maxlength='20' type = "password" required class="pass" name = "userPWD" placeholder="비밀번호 확인" type="password"></div>           
	            	<p class="warning"><%= msg %></p>
	            	<input class="sign_up_btn" type="submit" value = "가입하기">
	          </form>
          </div>
        </div>
        
        
        <%@ include file="./login_footer.jsp" %>
    </div>
</body>
</html>