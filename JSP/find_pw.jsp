<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find_pw</title>
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
            <div class="id_pw">
                <div class="input_form" id="id_form"><input class="find_pw_email" placeholder="�̸��ϸ� �Է��ϼ���"></div>
                <div class="input_form" id="pw_form"><input class="find_pw_id" placeholder="���̵� �Է��ϼ���"></div>
            </div>
            <button class="find_pw_btn" type="submit">����</button>
        </div>
        <div id="footer"></div>
    </div>
    
</body>
</html>