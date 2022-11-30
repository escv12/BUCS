<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>write</title>
    <link rel="stylesheet" href="./css/write.css">
</head>
<body>
    <%@ include file="./header_footer/index_header.jsp" %>
    
        <div class="container">
        <!-- 제목, 등록일 -->
        <div class="content_header">
            <p id="date">등록일  |  <span class="content_date"></span></p>
            <p id="title">회차/제목  |  <span class="content_title"></span></p>
        </div>
        <!-- 내용 -->
        <div class="content">
        	<textarea></textarea>

        </div>
        <!-- 댓글 -->
        <table class="reply_wrap">
            <tbody id="content_reply">
                <tr class="reply">
                    <td>잘모루겠오</td>
                </tr>
                <tr class="reply">
                    <td>zzzz</td>
                </tr>
                <tr class="reply">
                    <td>sss</td>
                </tr>
                <tr class="reply">
                    <td>ddd</td>
                </tr>
                <tr class="alert">
                    <td>질문을 작성하려면 <a class="login_link" href="./login.jsp">로그인</a> 하세요</td>
                </tr>
            </tbody>
        </table>
        <!-- 버튼 -->
        <div class="button_wrap">
            <button class="index" value="./board.jsp">목록</button>
        </div>
    </div> 
</body>
</html>