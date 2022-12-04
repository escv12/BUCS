<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../process/connect.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>


<% 
	request.setCharacterEncoding("UTF-8");
	int qnanum = Integer.parseInt(request.getParameter("qnanum"));
	int hitCount = 0;
	String title = null;
	String writer = null;
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
    	writer = rs.getString("userid");
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

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= title %></title>
    <link rel="stylesheet" href="./css/content.css">
</head>


<body>
    <%@ include file="./header_footer/index_header.jsp" %>
    
        <div class="container">
        <!-- 제목, 등록일 -->
        <div class="content_header">
        	<p id="title"><%= title %></p>
        	<p id="date"><%= writer %> · <%= writeday %> · <img class='eye' src='./image/eye.png'> <%= hitCount %></p>
        </div>
        <!-- 내용 -->
		<div class="content" style="white-space:pre;">
		<c:set var="content" value="<%= content %>" />
		<c:out value="${content}"/>
		</div>
        <!-- 댓글 -->
        <table class="reply_wrap">
            <tbody id="content_reply">
            	<tr class="reply" >
                    <td  colspan="4" style="font-size:20px;">댓글</td>
                </tr>
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
	                <td colspan="4">
		                <%if(session.getAttribute("userid") == null) {%>
		                    댓글을 작성하려면 <a class="login_link" href="./login.jsp">로그인</a> 하세요
		                <%} else {%>
			                <form action="./process/writeComment_process.jsp" method="post">
			                	<input type="hidden" name="postNum" value=<%= qnanum %>>
						    	<textarea maxlength='200' name="comment" class="comment" placeholder="댓글을 입력해주세요"></textarea>
						    	<button class="commentSubmit" type="submit" style="cursor: pointer;">등록</button>
					        </form>
		                <% } %>
	                </td>
                </tr>
            </tbody>
        </table>
        <!-- 버튼 -->
        <div class="button_wrap">
            <a class="index" href="./board.jsp">목록</a>
        </div>
    </div> 
    
    <%@ include file="./header_footer/footer.jsp" %>
</body>
</html>