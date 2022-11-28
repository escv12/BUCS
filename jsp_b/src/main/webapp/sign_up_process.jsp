<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<%@ include file = "connect.jsp" %>

<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPWD = null;
	String EMAIL = null;

	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
	}

	if (request.getParameter("userPWD") != null) {
		userPWD = (String) request.getParameter("userPWD");
	}
	
	if (request.getParameter("EMAIL") != null) {
		EMAIL = (String) request.getParameter("EMAIL");
	}
	if (userID == null || userPWD == null || EMAIL == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("</script>");
		script.close();
		return;
	}
	
	PreparedStatement ptmt = null;
	
	try{
		String  sql = "INSERT INTO user(userid, userpwd, EMAIL) VALUES(?,?,?)";
		ptmt = conn.prepareStatement(sql);
		
		ptmt.setString(1, userID);
		ptmt.setString(2, userPWD);
		ptmt.setString(3, EMAIL);
		
		ptmt.executeUpdate();

	}catch(Exception e){
		out.println(e);
	}
	
%>