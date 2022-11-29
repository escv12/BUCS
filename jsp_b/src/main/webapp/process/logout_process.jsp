<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>

<%
	if (session != null || !request.isRequestedSessionIdValid())
	    session.invalidate();
		response.sendRedirect("../index.jsp");
%>