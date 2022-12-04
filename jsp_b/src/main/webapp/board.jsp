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
    <title>게시판</title>
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
	
	int catenum = 0;
	int selectedNum = 0;
	
	if(request.getParameter("catenum") == null)
		catenum = 0;
	else
		catenum = Integer.parseInt(request.getParameter("catenum"));

	
	int hitCount = 0;
	
	String sql = null;
	
	if(catenum == 0){
		sql = "SELECT * FROM qna ORDER BY qnanum DESC;"; 
	}else if(catenum == 4){ //공지
		sql = "SELECT * FROM qna where catenum=4 ORDER BY qnanum DESC;";
	}else if(catenum == 1){ //자유
		sql = "SELECT * FROM qna where catenum=1 ORDER BY qnanum DESC;";
	}else if(catenum == 2){ //질문
		sql = "SELECT * FROM qna where catenum=2 ORDER BY qnanum DESC;";
	}else if(catenum == 3){ //건의
		sql = "SELECT * FROM qna where catenum=3 ORDER BY qnanum DESC;";
	}else if(catenum == 5){ //나의 질문글
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
	};
	

	function changeFn(){
		var search_cate  = document.getElementById("search_cate");
		var search_cate = (city.options[city.selectedIndex].value);
	};
	
</script>
                
<body>
	<%@ include file="./header_footer/index_header.jsp" %>


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
                <form  class="board_search_wrap">
		            <select class="board_search_select" id="search_cate" onchange="changeFn()">
			            <option value="1" selected="selected">제목</option>
			            <option value="2">제목+내용</option>
			            <option value="3">작성자</option>
			            <option value="4">해시태그</option>
		            </select>
		            <div class="search" id="board_search"><input placeholder="검색어를 입력해주세요" name="search"></div>
		            <button class="search_btn" id="board_search_btn">검색</button>
                </form>

                <table class="board_table">
                    <tbody id="board_contents">
                        <% 
                        while(rs.next()){
                    		qnanum = rs.getInt("qnanum");
                    		title = rs.getString("TITLE");
                    		int cateNum= rs.getInt("catenum");
                    		String cataName = null;
                    		
                    		if(cateNum == 4){ //공지
                    			cataName = "공지";
                    		}else if(cateNum == 1){ //자유
                    			cataName = "자유";
                    		}else if(cateNum == 2){ //질문
                    			cataName = "질문";
                    		}else if(cateNum == 3){ //건의
                    			cataName = "건의";
                    		}
                    		
                    		writeday = rs.getString("writeday");
                    		hitCount = rs.getInt("hitCount");
                    		writer = rs.getString("userid");
         
                    	%>
	                    	<tr>
	                    		<td id='img'><img src="./image/document.png"></td>
	                            <td id='content'>
	                            	<div class="contents">
		                            	<div class="categoryIcon"><%= cataName %></div>
			                            <a class="content_href" href='javascript:clickContent(<%= qnanum %>);'><%= title %></a>
			                        </div>
			                        <div class="contentBottom"><%= writer %> · <%= writeday %> · <img class='eye' src='./image/eye.png'> <%= hitCount %></div>                    	
	                            </td>
	                        </tr>
                    	<%}%>
                    </tbody>
                </table>
            </div>

            <div class="board_bot">
                <ul id="change_page">
                    <li><a href="#">1</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <%@ include file="./header_footer/footer.jsp" %>
</body>
</html>