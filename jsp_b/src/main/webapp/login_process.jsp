<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<%@ include file = "connect.jsp" %>
<%
PreparedStatement ptmt = null;
ResultSet rs = null;
request.setCharacterEncoding("UTF-8");

try{
	String id = request.getParameter("userID");
	String pw = request.getParameter("userPWD");
	
	String  sql = "select * from user";
	ptmt = conn.prepareStatement(sql);
	
	rs = ptmt.executeQuery();
	
	while(rs.next()){
		if(id.equals(rs.getString("userid")) && pw.equals(rs.getString("userpwd"))){
			out.println("로그인 성공!");
		}
	}

}catch(Exception e){
	out.println(e);
}



%>