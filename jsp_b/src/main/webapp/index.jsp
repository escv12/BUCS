<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./process/connect.jsp" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUCS</title>
<link rel="stylesheet" href="./css/index.css">
</head>
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
	};
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
			
		   	int postNum = 0;
		   	String postTitle = null;
		   	int cateNum = 0;
		%>  
        
          <div class="study">
            <p id="study_title">강의</p>
            <ul class="category">
              <li class="category_item">
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">자바</a></p>
                  <%while(rs.next()){ %>
                  <%if(rs.getInt("catenum") == 1){ %>
                  <li class="sub_category_item"><a href="#"><%= rs.getString("POSTTITLE") %></a></li>
                  <%}} rs.beforeFirst();%>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">HTML</a></p>
                  <%while(rs.next()){ %>
                  <%if(rs.getInt("catenum") == 2){ %>
                  <li class="sub_category_item"><a href=""><%= rs.getString("POSTTITLE") %></a></li>
                  <%}} rs.beforeFirst();%>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">파이썬</a></p>
                  <%while(rs.next()){ %>
                  <%if(rs.getInt("catenum") == 3){ %>
                  <li class="sub_category_item"><a href=""><%= rs.getString("POSTTITLE") %></a></li>
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
      <!------------------------오른쪽 메뉴-------------------------------->
      <div class="content_right">
        <div class="addiv">
          <img src="./image/background.jpg">
        </div>
        
        <%
		   	
		   	sql = "SELECT * FROM qna where catenum=4 ORDER BY qnanum DESC limit 3";
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			
		   	String title = null;
		   	String writeDay = null;
		   	int qnaNum = 0;
		%>  

        <div class="study">
          <p id="study_title">공지사항</p>
          <ul class="category">
             <% while(rs.next()){ 
      			qnaNum = rs.getInt("qnanum");
      			title = rs.getString("TITLE");
      			writeDay = rs.getString("writeday");
      			%>
      		
	      		<li class="category_note">
	              <span class="note">[공지]</span>
	              <a href='javascript:clickContent(<%= qnaNum %>);'><%= title %></a>
	              <span class="date"><%= writeDay %></span>
	            </li>
      
				<% } %>
          </ul>
        </div>
        
        
         <% 
	        request.setCharacterEncoding("UTF-8");
		   	
		   	String qna = "SELECT * FROM qna where catenum=2 ORDER BY qnanum DESC limit 2";
		   	
			ptmt = conn.prepareStatement(qna);
			rs = ptmt.executeQuery();
			
		   	String qnaTitle = null;
		   	String qnaContent = null;
		   	String qnaUserId = null;
		   	int qnaHitCount = 0;
		   	int qnaPostNum = 0;
		   	
		   	PreparedStatement qptmt = null;
		   	ResultSet qrs = null;
		   	
		   	
			String quiz = "SELECT * FROM quiz where isAnswer=0 ORDER BY quizNum DESC limit 2";
			
			qptmt = conn.prepareStatement(quiz);
			qrs = qptmt.executeQuery();
			
	        String quizTitle = null;
			String quizContent = null;
			int quizPostNum = 0;
			   	
				
		%>  

        <div class="contents_quiz">
          <h3>게시판</h3>
          <div class="row">
            <div class="col_1">
              <div class="widget-box">
                <div class="widget_header"><h4>Question board</h4></div>
                <% while(rs.next()){ 
                	qnaTitle = rs.getString("TITLE");
                	qnaUserId = rs.getString("userid");
                	qnaHitCount = rs.getInt("hitCount");
                	qnaPostNum = rs.getInt("qnanum");
                	qnaContent = rs.getString("content");
                	
                	String comment = "SELECT * FROM comment where postNo="+qnaPostNum+";";
                	
                	int amount = 0;
                			
                	Statement commentP = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                	ResultSet commentrs = commentP.executeQuery(comment);
                	
                	commentrs.last();
                	amount = commentrs.getRow(); 
                	commentrs.beforeFirst();
      			%>
                <div class="widget_body">
                  <div class="widget_main">
                    <div class="row">
                      <div class="col_3">
                        <div class="img_wrap">
                          <img src="image/character.png">
                          <p class="user_id"><%= qnaUserId %></p>
                        </div>

                      </div>
                      <div class="col_4">
                        <div class="widget_text">
                          <p class="widget_text_title">
                            <a href='javascript:clickContent(<%= qnaPostNum %>);'><%= qnaTitle %></a>
                          </p>
                          <p class="widget_text_content">
                            <a href='javascript:clickContent(<%= qnaPostNum %>);'><%= qnaContent %></a>
                          </p>
                        </div>
                      </div>

                    </div>
                  </div>
                  <div class="widget_info">
                    <div class="info_wrap">
                      <span>조회수</span>
                      <span class="pop"><%= qnaHitCount %></span>
                    </div>
                    <div class="info_wrap">
                      <span>댓글 </span>
                      <span class="talk"><%= amount %></span>
                    </div>
                  </div>
                </div>  
                
                <%} %>   
                </div>
              </div>
              <div class="col_2">
                <div class="widget-box">
                  <div class="widget_header"><h4>Quiz board</h4></div>
                  <% while(qrs.next()){ 
                	quizTitle = qrs.getString("quizTitle");
                	quizPostNum = qrs.getInt("quizNum");
                	quizContent = qrs.getString("quizContent");
      			%>
                <div class="widget_body">
                  <div class="widget_main">
                    <div class="row">
                      <div class="col_3">
                        <div class="img_wrap">
                          <img src="image/character.png">
                          <p class="user_id">관리자</p>
                        </div>

                      </div>
                      <div class="col_4">
                        <div class="widget_text">
                          <p class="widget_text_title">
                            <a href='./quiz_content.jsp?qnanum=<%= quizPostNum %>'><%= quizTitle %></a>
                          </p>
                          <p class="widget_text_content">
                            <a href='./quiz_content.jsp?qnanum=<%= quizPostNum %>'><%= quizContent %></a>
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>  
                <%} %>
                </div>
            </div>
            </div>
          </div>
          <%@ include file="./header_footer/footer.jsp" %>
      </div>
      <!------------------------오른쪽 메뉴 끝-------------------------------->
    </div>
  </div>
  
  
</body>
</html>