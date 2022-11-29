<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find_pw</title>
    <script type="text/javascript">
    function checkid(){
    var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    var id = form.id.value
    if (!regExpId.test(id)){
    	alert("아이디는 문자로 해주세요.");
    	form.id.select();
    	return;
    }
}
    form.submit();
    </script>
    <link rel="stylesheet" href="./css/loginPage.css">
</head>
<body>
    <div class="container">
        <%@ include file="./login_header.jsp" %>
        
        
        <div class="form">
            <div class="id_pw">
            <form action = "write.jsp" name = "find" method = "post">
                <div class="input_form" id="id_form"><input type = "email" required class="find_pw_email" placeholder="이메일를 입력하세요"></div>
				<div class="input_form" id="pw_form"><input class="find_pw_id" name = "id" required placeholder="아이디를 입력하세요"></div>           
            <input class="find_pw_btn" type="submit" value = "다음" onClick = "checkid"></form></div>
        </div>
        
        
        <%@ include file="./login_footer.jsp" %>
    </div>
    
</body>
</html>