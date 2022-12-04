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
    <title>게시판 - 퀴즈 게시판</title>
    <link rel="stylesheet" href="./css/quiz_board.css">
</head>


<body>
    <%@ include file="./header_footer/index_header.jsp" %>
    
    
    
    
    
    <div class="quiz_board_wrap">
    	<div class="quiz_h_title">
    	<h3>BUCS 코딩 퀴즈</h3>
    	<p>프로그래밍 문제를 풀고 서로 답을 공유할 수 있습니다</p>
	    </div>
    
        <div class="quiz_board">
            <div class="board_top">
                <div><a href="./board.jsp?catenum=0">퀴즈 문제</a></div>
                <div><a href="./board.jsp?catenum=1">정답</a></div>
                <%-- <% if(userid != null) {%>	
		        <!-- 로그인전 화면 -->
		          <div><a href="./write.jsp">글쓰기</a></div>
		        <%}%> --%>
            </div>
            <div class="quiz_board_mid">
                <div class="search_wrap">
                    <select class="search_method">
                        <option value="1">제목+내용</option>
                        <option value="2">제목</option>
                        <option value="3">내용</option>
                        <option value="4">번호</option>
                    </select>
                    <div class="search"><input placeholder="검색어를 입력해주세요"></div>
                    <button class="search_btn">검색</button>
                </div>
                
                <table class="quiz_board_table">
                    <thead>
                        <tr>
                            <th id="number">번호</th>
                            <th id="title">제목</th>
                            <th id="date">등록일자</th>
                        </tr>
                    </thead>
                    <tbody id="quiz_contents">
                        <tr>
                            <td id="quiz_number">9999</td>
                            <td id="quiz_title"><a href="#">테스트용 입니다</a></td>
                            <td id="quiz_date">2022-10-12</td>
                        </tr>
                    </tbody>
                </table>

            </div>
            <div class="quiz_board_bot">
                <ul id="change_page">
                    <li><a href="#">1</a></li>
                </ul>
            </div>
        </div>
    </div>
    
        <%@ include file="./header_footer/footer.jsp" %>
</body>
</html>