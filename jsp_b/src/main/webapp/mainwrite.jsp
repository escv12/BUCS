<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./process/connect.jsp" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mainwrite</title>
<link rel="stylesheet" href="./css/index.css">
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

          <div class="study">
            <p id="study_title">강의</p>
            <ul class="category">
              <li class="category_item">
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">파이썬</a></p>
                  <li class="sub_category_item"><a href="#">서브 카테고리 1</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 2</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 3</a></li>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">자바</a></p>
                  <li class="sub_category_item"><a href="#">서브 카테고리 1</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 2</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 3</a></li>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">HTML</a></p>
                  <li class="sub_category_item"><a href="#">서브 카테고리 1</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 2</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 3</a></li>
                </ul>
              </li>
            </ul>
          </div>
          
          <% if(userid != null) {%>	

          <div class="study">
            <p id="study_title">회원</p>
            <ul class="category">
              <li class="category_item">
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">최근 방문 게시글</a></p>
                  <% 
                  
                  ArrayList<String> list = (ArrayList<String>)session.getAttribute("visitedList");
                 
                  if(list != null){
                 for(int i = 0; i < list.size(); i++) {%>
                  <li class="sub_category_item"><%= list.get(i) %></li>
                  <%}} %>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">내 정보</a></p>
                  <li class="sub_category_item"><a href="#">나의 질문글</a></li>
                  <li class="sub_category_item"><a href="#">회원 정보 수정</a></li>
                  <li class="sub_category_item"><a href="#">회원 탈퇴</a></li>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">메인 카테고리 3</a></p>
                  <li class="sub_category_item"><a href="#">서브 카테고리 1</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 2</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 3</a></li>
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
   	PreparedStatement ptmt = null;
   	ResultSet rs = null;
   	
   	
   	String sql = "SELECT * FROM post ORDER BY postnum DESC Limit 1;";
	ptmt = conn.prepareStatement(sql);
	rs = ptmt.executeQuery();
	
	int postNum = 1;
   	String title = null;
   	String category = null;
   	String content = null;
   	String writeDay = null;
	%>  

      
      <div class ="mainwrite_right" style="width: 70%;float: right;">
      	<div class ="post">
      		<% while(rs.next()){ 
      			postNum = rs.getInt("postnum");
      			title = rs.getString("POSTTITLE");
      			category = rs.getString("catenum");
      			content = rs.getString("POSTcontent");
      			writeDay = rs.getString("writeday");
      		%>
      		
	      		<h3 ><%=category %></h3> <!-- catagory -->
	      		<hr style = "width : 22cm">
	      		<p> <%=title %></p> <!-- title -->
	      		<p><%=content %></p><br> <!-- content -->
	      		<p><%=writeDay %></p><br> <!-- 작성일 -->
      
			<% } %>
      		</div>
      		</div>
      		</div>
      		</div>	


          
</body>
</html>