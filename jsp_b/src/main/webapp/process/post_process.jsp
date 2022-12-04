<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
	request.setCharacterEncoding("UTF-8");
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	

	String POSTTITLE = (String) request.getParameter("title");
	int category = 0;
	
	if(request.getParameter("category") == null)
		category = 0;
	else
		category = Integer.parseInt(request.getParameter("category"));	
	
	String POSTcontent = (String) request.getParameter("content");
	
	boolean isAdmin = false;
	int latestNum = 0;
	
	if(session.getAttribute("isAdmin") == null)
		isAdmin = false;
	else
		isAdmin = (boolean) session.getAttribute("isAdmin");

	
	PreparedStatement ptmt = null;
	ResultSet rs = null;
	String sql;
	
	if(!isAdmin){
		PrintWriter script = response.getWriter();
	    script.println("<script>alert('관리자 로그인 후 글쓰기가 가능합니다'); location.href ='../board.jsp'</script>");
		script.close();
		return;
	}
	
	try{
		try{
			sql = "SELECT * FROM post ORDER BY postnum DESC LIMIT 1;";
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next()){
				latestNum = rs.getInt("postnum");
			}
		}catch(Exception e){
			out.println(String.format("%s %d",e, latestNum));
		}
		
		sql = "INSERT INTO post(postnum,POSTcontent,POSTTITLE,writeday,catenum) VALUES(?,?,?,?,?);";
		ptmt = conn.prepareStatement(sql);
		
		ptmt.setInt(1, latestNum + 1);
		ptmt.setString(2, POSTcontent);
		ptmt.setString(3, POSTTITLE);
		ptmt.setString(4, sf.format(nowTime));
		ptmt.setInt(5, category);
		
		ptmt.executeUpdate();
		
		PrintWriter script = response.getWriter();
		script.println("<script>location.href = '../index.jsp'</script>"); // 이메일 인증
		script.close();
		return;
	}catch(Exception e){
		session.setAttribute("msg", e);
		out.println(e);
		return;
	}
	
	
	
%>