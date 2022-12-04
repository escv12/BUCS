<%@page import="java.io.Console"%>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./connect.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement ptmt = null;
	ResultSet rs = null;
	int searchNum;
	String search = (String) request.getParameter("search");
	
	if(request.getParameter("catenum") == null)
		searchNum = 0;
	else
		searchNum = Integer.parseInt(request.getParameter("search_cate"));
	

	
	String sql = null;
	
	if(searchNum == 1){	//제목
		sql = "SELECT * FROM qna WHERE TITLE LIKE '%" + search + "%'";
	}else if(searchNum == 2){ //제목+내용
		sql = "SELECT * FROM qna where catenum=4 ORDER BY qnanum DESC;";
	}else if(searchNum == 3){ //작성자
		sql = "SELECT * FROM qna where catenum=1 ORDER BY qnanum DESC;";
	}else if(searchNum == 4){ //해시태그
		sql = "SELECT * FROM qna where catenum=2 ORDER BY qnanum DESC;";
	}

	ptmt = conn.prepareStatement(sql);
	rs = ptmt.executeQuery();
	

%>        
<body>

</body>
</html>