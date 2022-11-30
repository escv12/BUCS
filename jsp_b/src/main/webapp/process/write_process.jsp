<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");

	String title = null;
	String category = null;
	String content = null;
	String hash_tag = null;
	String userID = null;
	ResultSet rs = null;
	String sql;
	int latestNum = 0;
	
	request.setCharacterEncoding("UTF-8");
	PreparedStatement ptmt = null;
	
	title = (String) request.getParameter("title");
	category = (String) request.getParameter("category");
	content = (String) request.getParameter("content");
	hash_tag = (String) request.getParameter("hash_tag");
	userID = (String) session.getAttribute("userid");
	
	if(userID == null){
		PrintWriter script = response.getWriter();
	    script.println("<script>alert('로그인 후 글쓰기가 가능합니다'); location.href ='../board.jsp'</script>");
		script.close();
		return;
	}
	
	try{
		try{
			sql = "SELECT * FROM qna ORDER BY qnanum DESC LIMIT 1;";
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next())
				latestNum = rs.getInt("qnanum");
		}catch(Exception e){
			PrintWriter script = response.getWriter();
		    script.println("<script>alert('글쓰기중 오류가 발생했습니다'); location.href ='../board.jsp'</script>");
			script.close();
			return;
		}
		
		sql = "INSERT INTO qna(qnanum,content,TITLE,HASHTAG,userid,writeday) VALUES(?,?,?,?,?,?);";
		ptmt = conn.prepareStatement(sql);
		
		ptmt.setInt(1, latestNum + 1);
		ptmt.setString(2, content);
		ptmt.setString(3, title);
		ptmt.setString(4, hash_tag);
		ptmt.setString(5, userID);
		ptmt.setString(6, sf.format(nowTime));
		
		ptmt.executeUpdate();
		
		PrintWriter script = response.getWriter();
		script.println("<script>location.href = '../board.jsp'</script>"); // 이메일 인증
		script.close();
		return;

	}catch(Exception e){
		session.setAttribute("msg", e);
		out.println(e);
		return;
	}
	
%>