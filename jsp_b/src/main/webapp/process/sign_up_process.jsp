<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>

<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	RequestDispatcher rd = request.getRequestDispatcher("./sign_up.jsp");
	PreparedStatement ptmt = null;
	String userID = null;
	String userPWD = null;
	String EMAIL = null;
	ResultSet rs = null;
	
	userID = (String) request.getParameter("userID");
	userPWD = (String) request.getParameter("userPWD");
	EMAIL = (String) request.getParameter("EMAIL");
	
	if (userID == null || userPWD == null || EMAIL == null) {
		session.setAttribute("msg", "입력되지 않은 사항이 있습니다.");
		rd.forward(request, response);
		return;
	}
	
	try{
		String  sql = "INSERT INTO user(userid, userpwd, EMAIL) VALUES(?,?,?)";
		ptmt = conn.prepareStatement(sql);
		
		ptmt.setString(1, userID);
		ptmt.setString(2, userPWD);
		ptmt.setString(3, EMAIL);
		ptmt.executeUpdate();
		
		response.sendRedirect("./index.jsp");

	}catch(SQLIntegrityConstraintViolationException e){
		session.setAttribute("msg", "이미 존재하는 아이디 입니다.");
		rd.forward(request, response);
		return;

	}catch(Exception e){
		session.setAttribute("msg", e);
		out.println(e);
		return;
	}
	
%>