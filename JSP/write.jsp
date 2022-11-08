<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>write</title>
    <link rel="stylesheet" href="css/write.css">
</head>
<body>
    <div class="test_header">게시판 테스트</div>
    <div class="write_wrap">
        <div class="write">
            <div class="write_text">제목</div>
            <div class=" write_title"><input id="title" placeholder="제목을 입력해주세요"></div>
            <div class="write_text">카테고리</div>
            <select class="write_category" id="write">
                <option value="1" selected>자유</option>
                <option value="2">질문</option>
                <option value="3">건의</option>
            </select>
            <div class="write_text">내용</div>
            <textarea class="write_content">test</textarea>
            <div class="write_text">언어</div>
            <select class="write_category" id="code">
                <option value="1" selected>JAVA</option>
                <option value="2">PYTHON</option>
                <option value="3">HTML</option>
            </select>

            <div class="write_btn_wrap">
                <button class="write_btn" id="cancel">취소</button>
                <button class="write_btn" id="write">글쓰기</button>
            </div>
        </div>
    </div> 
</body>
</html>