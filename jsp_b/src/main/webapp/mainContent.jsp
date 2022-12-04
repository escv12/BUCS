<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./process/connect.jsp" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mainwrite</title>
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/content.css">
</head>
<script type="text/javascript">
	$(document).ready(function(){
		  $('.slider').slider();
		});
</script>



<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = (String)session.getAttribute("userid");
	String email = (String)session.getAttribute("EMAIL");
	
	boolean isAdmin;
	if(session.getAttribute("isAdmin") == null){
		isAdmin = false;
	}else{
		isAdmin = (boolean) session.getAttribute("isAdmin");
	}
%>  


<div class="container">
    <%@ include file="./header_footer/index_header.jsp" %>

    <div class="content">
      <!------------------------왼쪽 메뉴-------------------------------->
      <div class="content_left">
        <div class="account">
        <% if(userid == null) {%>	
        <!-- 로그인전 화면 -->
          <a class="login_btn" href="./login.jsp">로그인</a>
          <div class="sub_area">
            <a href="./find_id.jsp">아이디 | </a>
            <a href="./find_pw.jsp">비밀번호 찾기 | </a>
            <a href="./sign_up.jsp">회원가입</a>
          </div>
          <%}else{ %>
          <!-- 로그인후 화면 -->
          	<img src="./image/character.png">
	          <div class="user_area">
	            <p><%= userid %>님</p>
	            <p><%= email %></p>
	            <a href="./process/logout_process.jsp">로그아웃  |   </a>
	            <a href="./change_info.jsp">회원정보 수정</a>
	          </div>
          <%} %>
        </div>
        
       <% 
		   	PreparedStatement ptmt = null;
		   	ResultSet rs = null;
		   	
		   	String sql = "SELECT * FROM post ORDER BY postnum DESC limit 9";
		   	
			ptmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = ptmt.executeQuery();
		%>  
        
          <div class="study">
            <p id="study_title">강의</p>
            <ul class="category">
              <li class="category_item">
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="./mainContent.jsp?catenum=1">자바</a></p>
                  <%while(rs.next()){ %>
                  <%if(rs.getInt("catenum") == 1){ %>
                  <li class="sub_category_item"><a href="./mainContent.jsp?catenum=1&&postNum=<%= rs.getInt("postnum") %>"><%= rs.getString("POSTTITLE") %></a></li>
                  <%}} rs.beforeFirst();%>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="./mainContent.jsp?catenum=2">HTML</a></p>
                  <%while(rs.next()){ %>
                  <%if(rs.getInt("catenum") == 2){ %>
                  <li class="sub_category_item"><a href="./mainContent.jsp?catenum=2&&postNum=<%= rs.getInt("postnum") %>"><%= rs.getString("POSTTITLE") %></a></li>
                  <%}} rs.beforeFirst();%>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="./mainContent.jsp?catenum=3">파이썬</a></p>
                  <%while(rs.next()){ %>
                  <%if(rs.getInt("catenum") == 3){ %>
                  <li class="sub_category_item"><a href="./mainContent.jsp?catenum=3&&postNum=<%= rs.getInt("postnum") %>"><%= rs.getString("POSTTITLE") %></a></li>
                  <%}} %>
                </ul>
              </li>
            </ul>
          </div>
          
          <% if(userid != null && !isAdmin) {%>	

          <div class="study">
            <p id="study_title">회원</p>
            <ul class="category">
              <li class="category_item">
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">최근 방문 게시글</a></p>
                  <%  ArrayList<String> list = (ArrayList<String>)session.getAttribute("visitedList");
                 
                  if(list != null){
                 for(int i = 0; i < list.size(); i++) {%>
                  <li class="sub_category_item"><%= list.get(i) %></li>
                  <%}} %>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">내 정보</a></p>
                  <li class="sub_category_item"><a href="./board.jsp?catenum=5">나의 질문글</a></li>
                  <li class="sub_category_item"><a href="./process/leave_process.jsp">회원 탈퇴</a></li>
                </ul>
              </li>
            </ul>
          </div>
          <%} else if (userid != null && isAdmin){ %>
          <div class="study">
            <p id="study_title">관리자</p>
            <ul class="category">
              <li class="category_item">
                <ul class="sub_category">
                  <p class="sub_category_title">관리자 기능</p>
                  <li class="sub_category_item"><a href="#">회원 관리</a></li>
                  <li class="sub_category_item"><a href="./postwrite.jsp">강의 작성</a></li>
                  <li class="sub_category_item"><a href="./quiz_write.jsp">퀴즈 작성</a></li>
                </ul>
              </li>
            </ul>
          </div>
          <%} %>
      </div>
      <!------------------------왼쪽 메뉴 끝-------------------------------->
      <!------------------------오른쪽 메뉴 -------------------------------->
      <%
		request.setCharacterEncoding("UTF-8");
	   	ptmt = null;
	   	rs = null;
	   	
	   	int catenum = 0;
	   	
    	if(request.getParameter("catenum") != null)
    		catenum = Integer.parseInt(request.getParameter("catenum"));
    	
    	int postNum = 0;
    	if(request.getParameter("postNum") != null)
    		postNum = Integer.parseInt(request.getParameter("postNum"));
    	
    	if(postNum == 0){
    		if(catenum == 1){
        		sql = "SELECT * FROM post where catenum=1 ORDER BY postnum DESC Limit 1;";
        	}else if(catenum == 2){ //공지
        		sql = "SELECT * FROM post where catenum=2 ORDER BY postnum DESC Limit 1;";
        	}else if(catenum == 3){ //공지
        		sql = "SELECT * FROM post where catenum=3 ORDER BY postnum DESC Limit 1;";
        	}
    	}else{
    		if(catenum == 1){
        		sql = "SELECT * FROM post where catenum=1 AND postnum="+postNum+" ORDER BY postnum DESC Limit 1;";
        	}else if(catenum == 2){ //공지
        		sql = "SELECT * FROM post where catenum=2 AND postnum="+postNum+" ORDER BY postnum DESC Limit 1;";
        	}else if(catenum == 3){ //공지
        		sql = "SELECT * FROM post where catenum=3 AND postnum="+postNum+" ORDER BY postnum DESC Limit 1;";
        	}
    	}

    	ptmt = conn.prepareStatement(sql);
    	rs = ptmt.executeQuery();
    	
    	String pTitle = null;
    	String pContent = null;
    	String pWriteday = null;
		
	%>  
      <div class ="mainwrite_right" style="width: 70%;float: right;">
      	<% while(rs.next()){ 
      		pTitle = (String) rs.getString("POSTTITLE");
      		pContent = (String) rs.getString("POSTcontent");
      		pWriteday = (String) rs.getString("writeday");
      	%>
      		
      	
      	
      		<!-- 제목, 등록일 -->
	        <div class="content_header">
	        	<p id="title"><%= pTitle %></p>
	        	<p id="date"><%= pWriteday %></p>
	        </div>
	        <!-- 내용 -->
			<div class="content" style="white-space:pre;">
			<c:set var="content" value="<%= pContent %>" />
			<c:out value="${content}"/>
			</div>
		<%} %>

        <!-- 버튼 -->
        <div class="button_wrap">
            <a class="index" href="./board.jsp">목록</a>
        </div>
     </div>
</body>
</html>