<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String title = null;
String category = null;
String content = null;
String adminID = null;
ResultSet rs = null;
String sql;
int latestNum = 0;

request.setCharacterEncoding("UTF-8");
PreparedStatement ptmt = null;

title = (String) request.getParameter("title");
category = (String) request.getParameter("category");
content = (String) request.getParameter("content");
adminID = (String) session.getAttribute("adminid");

if(adminID == null){
	PrintWriter script = response.getWriter();
    script.println("<script>alert('로그인 후 글쓰기가 가능합니다'); location.href ='../board.jsp'</script>");
	script.close();
	return;
}

try{
		sql = "SELECT * FROM post ORDER BY postnum DESC LIMIT 1;";
		ptmt = conn.prepareStatement(sql);
		rs = ptmt.executeQuery();
		while(rs.next())
			latestNum = rs.getInt("postnum");
	}catch(Exception e){
		PrintWriter script = response.getWriter();
	    script.println("<script>alert('글쓰기중 오류가 발생했습니다'); location.href ='../postwrite.jsp'</script>");
		script.close();
		return;
	}



%>