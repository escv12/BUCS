<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../css/loginPage.css">
</head>


<body>
	<%
		String userID = null;
		
		if(session!=null || !request.isRequestedSessionIdValid())
		{
			userID = (String)session.getAttribute ("userID");
			session.invalidate();
		}
			
		if(userID == null)
			userID = "";
	%>
	
	<div class="container">
		<form class="form" action = "../index.jsp" method = "post">
			<p> 회원님의 정보와 일치하는 아이디입니다.</p>
			<div class="input_text"><%= userID %></div>
			
			<input class="find_id_btn" type="submit" value = "확인">
		</form>
	</div>
</body>
</html>