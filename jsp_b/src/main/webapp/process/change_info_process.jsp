<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file = "connect.jsp" %>

<%
PreparedStatement ptmt = null;
ResultSet rs = null;
request.setCharacterEncoding("UTF-8");

try{
	String pw = request.getParameter("password");
	String cpw = request.getParameter("cPassword");
	String cpw2 = request.getParameter("cPassword2");
	String id = (String) session.getAttribute("userid");
	String tmpPw = null;
	
	try{
		String  sql = "select * from user where userid ='" + id + "' limit 1;";
		ptmt = conn.prepareStatement(sql);
		rs = ptmt.executeQuery();
		while(rs.next())
			tmpPw = (String) rs.getString("userpwd");
	}catch(Exception e){
		PrintWriter script = response.getWriter();
	    script.println("<script>alert('아이디 또는 비밀번호를 확인해주세요'); location.href ='../login.jsp'</script>");
		script.close();
		return;
	}
		
	
	if(!pw.equals(tmpPw)){
		PrintWriter script = response.getWriter();
	    script.println("<script>alert('비밀번호를 확인해주세요'); location.href ='../change_info.jsp'</script>");
		script.close();
		return;
	}
	
	if(!cpw.equals(cpw2)){
		PrintWriter script = response.getWriter();
	    script.println("<script>alert('비밀번호가 서로 일치 하지 않습니다'); location.href ='../change_info.jsp'</script>");
		script.close();
		return;
	}

	
	String sql = "select * from user where userpwd ='" + pw + "' limit 1;";
	ptmt = conn.prepareStatement(sql);
	rs = ptmt.executeQuery();
	
	while(rs.next()){
		if(rs.getInt("emailCheck") != 1){
		    PrintWriter script = response.getWriter();
		    script.println("<script>alert('이메일 인증이 되지 않은 사용자 입니다. 이메일이 오지 않았다면 스팸메일함을 확인해주세요'); location.href ='../index.jsp'</script>");
			script.close();
			return;
		}
		
		sql = "UPDATE user set userpwd = '" + cpw + "' where userid='" + id + "' limit 1;";
		ptmt = conn.prepareStatement(sql);
		ptmt.executeUpdate();
		PrintWriter script = response.getWriter();
	    script.println("<script>alert('변경되었습니다.'); location.href ='../index.jsp'</script>");
		script.close();
		return;
	}
	

}catch(Exception e){
	out.println(e);
	
	
	/* PrintWriter script = response.getWriter();
    script.println("<script>alert('아이디 또는 비밀번호를 확인해주세요'); location.href ='../login.jsp'</script>");
	script.close();
	return; */
}

%>