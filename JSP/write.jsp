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
    <div class="test_header">�Խ��� �׽�Ʈ</div>
    <div class="write_wrap">
        <div class="write">
            <div class="write_text">����</div>
            <div class=" write_title"><input id="title" placeholder="������ �Է����ּ���"></div>
            <div class="write_text">ī�װ�</div>
            <select class="write_category" id="write">
                <option value="1" selected>����</option>
                <option value="2">����</option>
                <option value="3">����</option>
            </select>
            <div class="write_text">����</div>
            <textarea class="write_content">test</textarea>
            <div class="write_text">���</div>
            <select class="write_category" id="code">
                <option value="1" selected>JAVA</option>
                <option value="2">PYTHON</option>
                <option value="3">HTML</option>
            </select>

            <div class="write_btn_wrap">
                <button class="write_btn" id="cancel">���</button>
                <button class="write_btn" id="write">�۾���</button>
            </div>
        </div>
    </div> 
</body>
</html>