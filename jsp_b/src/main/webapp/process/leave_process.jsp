<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "./connect.jsp" %>

<%
PreparedStatement ptmt = null;
ResultSet rs = null;
request.setCharacterEncoding("UTF-8");

try{
	String id = (String)session.getAttribute("userid");
	
	String sql = "delete from user where userid='" + id + "';";
	
	ptmt = conn.prepareStatement(sql);
	ptmt.executeUpdate(); 
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('탈퇴하였습니다'); location.href='./logout_process.jsp';");
	script.println("</script>");
	script.close();
	}catch(Exception e){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된 접근입니다'); location.href='../index.jsp';");
		script.println("</script>");
		script.close();
		
	}

%>