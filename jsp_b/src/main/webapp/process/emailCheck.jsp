<!-- 사용자가 Email 인증 버튼을 눌렀을 때 처리해주는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>


<%
	PreparedStatement ptmt = null;



	request.setCharacterEncoding("UTF-8");
	String code = null;
	if(request.getParameter("code") != null){
		code = request.getParameter("code");
	}
	
	String tempID = null;
	
	if(session.getAttribute("tempID") != null){
		tempID = (String) session.getAttribute("tempID");
	}
	
	// hash 처리한 결과를 비교해 결과 값 반환
	String userEmail = (String) session.getAttribute("EMAIL");
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	if(isRight == true){
		try{
			String sql = "UPDATE user SET emailCheck=(?) WHERE userid=(?) LIMIT 1;";
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, 1);
			ptmt.setString(2, tempID);
			ptmt.executeUpdate();
		}catch(Exception e){
			session.setAttribute("msg", e);
			out.println(e);
			return;
		}
		PrintWriter script = response.getWriter();
		script.println("<script>alert('인증에 성공했습니다.'); location.href='../index.jsp'</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>alert('잘못된 이메일 주소입니다.'); location.href = '../index.jsp'</script>");
		script.close();
	}

%>