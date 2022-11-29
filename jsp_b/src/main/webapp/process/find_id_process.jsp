<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>


<%
RequestDispatcher rd = request.getRequestDispatcher("../found.jsp");
PreparedStatement ptmt = null;
ResultSet rs = null;
request.setCharacterEncoding("UTF-8");

try{
	String email = request.getParameter("email");
	
	String  sql = "select * from user";
	
	ptmt = conn.prepareStatement(sql);
	
	rs = ptmt.executeQuery();
	
	while(rs.next()){
		if(email.equals(rs.getString("EMAIL"))){
			session.setAttribute("userID", rs.getString("userid"));
			rd.forward(request, response);
			return;
		}
	}
	
	PrintWriter script = response.getWriter();
	script.println("<script>alert('아이디가 존재하지 않습니다.'); location.href='../find_id.jsp';</script>");
	script.close();
	return;
	
}catch(Exception e){
	out.println(e);
}
%>