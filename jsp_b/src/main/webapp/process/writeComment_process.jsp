<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	request.setCharacterEncoding("UTF-8");
	PreparedStatement ptmt = null;
	ResultSet rs = null;
	int postNum;
	if(request.getParameter("postNum") == null){
		postNum = 1;
	}else{
		postNum = Integer.parseInt(request.getParameter("postNum"));
	}
	
	 
	String comment =  (String) request.getParameter("comment");
	String userID = (String) session.getAttribute("userid");;
	int parentCoNo;
	
	if(userID == null){
		PrintWriter script = response.getWriter();
	    script.println("<script>alert('잘못된 접근입니다'); location.href ='../content.jsp?qnanum=" + postNum + "';</script>");
		script.close();
		return;
	}
	
	if(comment == null || comment.equals("")){
		PrintWriter script = response.getWriter();
	    script.println("<script>alert('내용을 입력해주세요'); location.href ='../content.jsp?qnanum=" + postNum + "';</script>");
		script.close();
		return;
	}
	
	try{
		String sql = "INSERT INTO comment(postNo,content,userID,writeDay) VALUES(?,?,?,?);";
		ptmt = conn.prepareStatement(sql);
		
		ptmt.setInt(1, postNum);
		ptmt.setString(2, comment);
		ptmt.setString(3, userID);
		ptmt.setString(4, sf.format(nowTime));
		
		ptmt.executeUpdate();
		
		PrintWriter script = response.getWriter();
	    script.println("<script>location.href ='../content.jsp?qnanum=" + postNum + "';</script>");
		script.close();
		return;

	}catch(Exception e){
		session.setAttribute("msg", e);
		out.println(e);
		return;
	}
	
%>