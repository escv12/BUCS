<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>

<%

	String title = null;
	String category = null;
	String content = null;
	String hash_tag = null;
	
	request.setCharacterEncoding("UTF-8");
	RequestDispatcher rd = request.getRequestDispatcher("./sign_up.jsp");
	PreparedStatement ptmt = null;
	
	title = (String) request.getParameter("title");
	category = (String) request.getParameter("category");
	content = (String) request.getParameter("content");
	hash_tag = (String) request.getParameter("hash_tag");

	
%>