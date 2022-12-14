<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
    <link rel="stylesheet" href="./css/write.css">
</head>
<script type="text/javascript">
	function goBack(){
		window.history.back();
	}
</script>

<body>
    <%@ include file="./header_footer/index_header.jsp" %>
    
    <div class="write_wrap">
        <form class="write" action="./process/write_process.jsp" name="write" method="post">
            <div class="write_text">제목</div>
            <div class=" write_title">
            <input maxlength='50' name="title" id="title" placeholder="제목을 입력해주세요">
            </div>
            <div class="write_text">카테고리</div>
            <select name="category" class="write_category" id="write">
                <option value="1" selected>자유</option>
                <option value="2">질문</option>
                <option value="3">건의</option>
                <% if((boolean) session.getAttribute("isAdmin")){ %>
                <option value="4">공지</option>
                <%} %>
            </select>
            <div class="write_text">내용</div>
            <textarea maxlength='5000' name="content" class="write_content" placeholder="내용을 입력해주세요"></textarea>
            <div class="write_text">해쉬태그</div>
            <div class=" hash_tag">
            <input maxlength='50' name="hash_tag" id="hash_tag" placeholder="해쉬태그를 입력해주세요 콤마(,)로 구분">
            </div>
	        <div class="write_btn_wrap">
	            <button type="button" class="write_btn" id="cancel" onclick='goBack();'>취소</button>
	            <button class="write_btn" id="write">글쓰기</button>
        	</div>
        </form>
        
    </div> 
    
        <%@ include file="./header_footer/footer.jsp" %>
</body>
</html>