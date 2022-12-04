<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../process/connect.jsp" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>write</title>
    <link rel="stylesheet" href="./css/content.css">
</head>

<% 
	request.setCharacterEncoding("UTF-8");
	int qnanum = Integer.parseInt(request.getParameter("qnanum"));
	int hitCount = 0;
	String title = null;
	String writeday = null;
	String content = null;
	String userid = null;
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("visitedList");
	
	
	
	PreparedStatement ptmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM qna where qnanum='" + qnanum + "' LIMIT 1;";
	ptmt = conn.prepareStatement(sql);
	rs = ptmt.executeQuery();

    while(rs.next()){
		title = rs.getString("TITLE");
		content = rs.getString("content");
		writeday = rs.getString("writeday");
		hitCount = rs.getInt("hitCount") + 1;
    }
    
    if(list == null) {
        list = new ArrayList<String>();
        session.setAttribute("visitedList", list);
    }
    
    
   	for(int i = 0; i < 5; i++){
   		try{
   			if(list.get(i).equals(title))
   				break;
   			if(i >= 4){
   	   			list.set(i, title);
   	   	   		break;
   			}
   		}catch(Exception e){
   			list.add(title);
   			break;	
   	   	}		
   	}
   	
   	session.setAttribute("visitedList", list);
    
    sql = "UPDATE qna set hitCount = '" + hitCount + "' where qnanum='" + qnanum + "' limit 1;";
	ptmt = conn.prepareStatement(sql);
	ptmt.executeUpdate();
    
%>


<body>
    <%@ include file="./header_footer/index_header.jsp" %>
    
        <div class="container">
        <!-- 제목, 등록일 -->
        <div class="content_header">
            <p id="date">등록일  |  <span class="content_date"><%= writeday %></span></p>
            <p id="title">제목  |  <span class="content_title"><%= title %></span></p>
        </div>
        <!-- 내용 -->
        <textarea class="content" readonly="readonly">
        <%= content %>
        </textarea>
        <!-- 댓글 -->
        <table class="reply_wrap">
            <tbody id="content_reply">
            	<% 
            	sql = "SELECT * FROM comment where postNo='" + qnanum + "' ORDER BY commentNo DESC;";
            	ptmt = conn.prepareStatement(sql);
            	rs = ptmt.executeQuery();
            	
            	while(rs.next()){
                	String comment = rs.getString("content");
                	String userID = rs.getString("userID");
                	String writeDay = rs.getString("writeDay");
                %>
            
                <tr class="reply">
                    <td id="userID"><%= userID %></td>
                    <td id="comment"><%= comment %></td>
                    <td id="writeDay">작성일 <%= writeDay %></td>
                </tr>
                
                <% } %>
                
                <tr class="alert">
                <%if(session.getAttribute("userid") == null) {%>
                    <td colspan="4">댓글을 작성하려면 <a class="login_link" href="./login.jsp">로그인</a> 하세요</td>
                <%} else {%>
                <td colspan="4">
	                <form action="./process/writeComment_process.jsp" method="post">
	                	<input type="hidden" name="postNum" value=<%= qnanum %>>
				    	<textarea maxlength='200' name="comment" class="comment" placeholder="댓글을 입력해주세요"></textarea>
				    	<button class="index" id="write">글쓰기</button>
			        </form>
		        </td>
                <% } %>
                </tr>
            </tbody>
        </table>
        <!-- 버튼 -->
        <div class="button_wrap">
            <a class="index" href="./board.jsp">목록</a>
        </div>
    </div> 
</body>
</html>