<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>postwrite</title>
<link rel="stylesheet" href="./css/write.css">
</head>
<body>
<div class="container">
    <%@ include file="./header_footer/index_header.jsp" %> 
        <div class="write_wrap">
        <form class="write" action="./process/write_process.jsp" name="write" method="post">
            <div class="write_text">제목</div>
            <div class=" write_title">
            <input maxlength='50' name="title" id="title" placeholder="제목을 입력해주세요">
            </div>
            <div class="write_text">카테고리</div>
            <select name="category" class="write_category" id="write">
                <option value="1" selected>JAVA</option>
                <option value="2">HTML</option>
                <option value="3">PYTHON</option>
            </select>
            <div class="write_text">내용</div>
            <textarea maxlength='2000' name="content" class="write_content"></textarea>
	        <div class="write_btn_wrap">
	            <button class="write_btn" id="cancel">취소</button>
	            <button class="write_btn" id="write">글쓰기</button>
        	</div>
        </form>
        </div>
        </div>   
</body>
</html>