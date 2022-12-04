<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>강의 글쓰기</title>
	<link rel="stylesheet" href="./css/write.css">
</head>

<script type="text/javascript">
	function goBack(){
		window.history.back();
	}
</script>

<body>
	<%@ include file="./header_footer/index_header.jsp" %> 
	
	<%
		int isAnswer = 0;
		if(request.getParameter("isAnswer") != null)
			isAnswer = Integer.parseInt(request.getParameter("isAnswer"));
	%>
	
	
	<div class="container">
        <div class="write_wrap">
	        <form class="write" action="./process/quiz_write_process.jsp" name="write" method="post">
	        	<input type="hidden" name="isAnswer" value=<%=isAnswer %>>
	            <div class="write_text">제목</div>
	            <div class="write_title"><input maxlength='500' name="title" id="title" placeholder="제목을 입력해주세요"></div>
	            <div class="write_text">내용</div>
	            <textarea maxlength='10000' name="content" class="write_content"></textarea>
		        <div class="write_btn_wrap">
		            <button type="button" class="write_btn" id="cancel" onclick='goBack();'>취소</button>
		            <button class="write_btn" id="write">작성</button>
	        	</div>
	        </form>
        </div>
	</div>   
	
	
	<%@ include file="./header_footer/footer.jsp" %> 
</body>
</html>