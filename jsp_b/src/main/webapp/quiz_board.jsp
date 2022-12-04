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
                <div><a href="./quiz_board.jsp?catenum=0">퀴즈 문제</a></div>
                <div><a href="./quiz_board.jsp?catenum=1">정답</a></div>
                <div><a href="./quiz_write.jsp?isAnswer=1">정답 작성</a></div>
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
                
                <%
                	request.setCharacterEncoding("UTF-8");
                
                	int catenum = 0;
                	if(request.getParameter("catenum") != null)
                		catenum = Integer.parseInt(request.getParameter("catenum"));
                
	            	PreparedStatement ptmt = null;
	            	ResultSet rs = null;
	            	String sql = null;
	            	
	            	
	            	if(catenum == 0){
	            		sql = "SELECT * FROM quiz where isAnswer=0 ORDER BY quizNum DESC;";
	            	}else if(catenum == 1){ //공지
	            		sql = "SELECT * FROM quiz where isAnswer=1 ORDER BY quizNum DESC;";
	            	}

	            	ptmt = conn.prepareStatement(sql);
	            	rs = ptmt.executeQuery();
	            	
	            	String title = null;
	            	String content = null;
	            	String writeday = null;
	            	int quizNum = 0;
	            	
                %>
                
                <table class="quiz_board_table">
                    <thead>
                        <tr>
                            <th id="number">번호</th>
                            <th id="title">제목</th>
                            <th id="date">등록일자</th>
                        </tr>
                    </thead>
                    <tbody id="quiz_contents">
                    	<%while(rs.next()){
		            		title = rs.getString("quizTitle");
		            		content = rs.getString("quizContent");
		            		writeday = rs.getString("writeday");
		            		quizNum = rs.getInt("quizNum");
	            		%>
                        <tr>
                            <td id="quiz_number"><%=quizNum %></td>
                            <td id="quiz_title"><a href='./quiz_content.jsp?qnanum=<%= quizNum %>'><%=title %></a> <%if(rs.isFirst() && rs.getInt("isAnswer") == 0){ %><span class="proceeding">진행중</span><%} %></td>
                            <td id="quiz_date"><%=writeday %></td>
                        </tr>
                        <%} %>
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