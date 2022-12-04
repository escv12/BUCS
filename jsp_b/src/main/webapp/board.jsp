<%@page import="java.io.Console"%>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./process/connect.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board</title>
    <link rel="stylesheet" href="./css/loginPage.css">
    <link rel="stylesheet" href="./css/board.css">
</head>
<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement ptmt = null;
	ResultSet rs = null;
	
	String userid = (String)session.getAttribute("userid");
	
	int qnanum = 0;
	String title = null;
	String writeday = null;
	String writer = null;
	String catenum = (String) request.getParameter("catenum");
	if(catenum == null){
		catenum = "0";
	}
	int num = Integer.parseInt(catenum);
	int hitCount = 0;
	
	String sql = null;
	
	if(num == 0){
		sql = "SELECT * FROM qna ORDER BY qnanum DESC;"; 
	}else if(num == 4){ //공지
		sql = "SELECT * FROM qna where catenum=4 ORDER BY qnanum DESC;";
	}else if(num == 1){ //자유
		sql = "SELECT * FROM qna where catenum=1 ORDER BY qnanum DESC;";
	}else if(num == 2){ //질문
		sql = "SELECT * FROM qna where catenum=2 ORDER BY qnanum DESC;";
	}else if(num == 3){ //건의
		sql = "SELECT * FROM qna where catenum=3 ORDER BY qnanum DESC;";
	}else if(num == 5){ //나의 질문글
		sql = "SELECT * FROM qna where catenum=2 AND userid='" + userid + "' ORDER BY qnanum DESC;";
	}

	ptmt = conn.prepareStatement(sql);
	rs = ptmt.executeQuery();
	

%>

<script type="text/javascript">
	function clickContent(qnanum) {
		var form1 = document.createElement("form");
        form1.setAttribute("charset", "UTF-8");
        form1.setAttribute("method", "Post");  //Post 방식
        form1.setAttribute("action", "./content.jsp"); //요청 보낼 주소
        
        document.body.appendChild(form1);
       
		var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "qnanum");
        hiddenField.setAttribute("id", "qnanum");
        hiddenField.setAttribute("value", qnanum);
        form1.appendChild(hiddenField);
        
        form1.submit();
	}
</script>
                
<body>

    <div class="board_wrap">
        <div class="board">
            <div class="board_top">
                <div><a href="./board.jsp?catenum=0">전체</a></div>
                <div><a href="./board.jsp?catenum=4">공지</a></div>
                <div><a href="./board.jsp?catenum=1">자유</a></div>
                <div><a href="./board.jsp?catenum=2">질문</a></div>
                <div><a href="./board.jsp?catenum=3">건의</a></div>
                <% if(userid != null) {%>	
		        <!-- 로그인전 화면 -->
		          <div><a href="./write.jsp">글쓰기</a></div>
		        <%}%>
            </div>
            <div class="board_mid">
                <div class="board_search_wrap">
                    <select class="board_search_select">
                        <option value="1">제목+내용</option>
                        <option value="2">제목</option>
                        <option value="3">내용</option>
                        <option value="4">글쓴이</option>
                    </select>
                    <div class="search" id="board_search"><input placeholder="검색어를 입력해주세요"></div>
                    <button class="search_btn" id="board_search_btn">검색</button>
                </div>

                <table class="board_table">
                    <thead>
                        <tr>
                            <th id="number">번호</th>
                            <th id="title">제목</th>
                            <th id="date">등록일자</th>
                            <th id="count">조회수</th>
                            <th id="writer">작성자</th>
                        </tr>
                    </thead>
                    <tbody id="board_contents">
                        <% 
                        while(rs.next()){
                    		qnanum = rs.getInt("qnanum");
                    		title = rs.getString("TITLE");
                    		writeday = rs.getString("writeday");
                    		hitCount = rs.getInt("hitCount");
                    		writer = rs.getString("userid");
         
                    	%>
                    	<%if(rs.getInt("catenum") == 4){ %>
                    		<tr class="info">
	                            <td><%= qnanum %></td>
	                            <td><a href='javascript:clickContent(<%= qnanum %>);'><%= title %></a></td>
	                            <td><%= writeday %></td>
	                            <td><%= hitCount %></td>
	                            <td>관리자</td>
                        	</tr>
                        <%}else {%>
	                    	<tr>
	                            <td><%= qnanum %></td>
	                            <td><a href='javascript:clickContent(<%= qnanum %>);'><%= title %></a></td>
	                            <td><%= writeday %></td>
	                            <td><%= hitCount %></td>
	                            <td><%= writer %></td>
	                        </tr>
                    	<%}}%>
                    </tbody>
                </table>
            </div>

            <div class="board_bot">
                <ul id="change_page">
                    <li><a href="#">◀</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">▶</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>