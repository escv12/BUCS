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
	
	String  sql = "delete * from user";
	ptmt = conn.prepareStatement(sql);
	rs = ptmt.executeQuery();
	
	while(rs.next()){
		if(id.equals(rs.getString("userid")) && pw.equals(rs.getString("userpwd"))){
			if(rs.getInt("emailCheck") != 1){
			    PrintWriter script = response.getWriter();
			    script.println("<script>");
			    script.println("if(confirm('이동하시려면 예를 누르시고 이동을 하지 않으시려면 아니오를 눌러주세요')){location.href='http://cdmanii.tistory.com';}");
			    script.println("else{alert('아니오를 누르셨습니다');}");
			    script.println("</script>");
			    
			    
			    if(confirm('이동하시려면 예를 누르시고 이동을 하지 않으시려면 아니오를 눌러주세요')){location.href='http://cdmanii.tistory.com';}
			    
			    
			    script.println("<script>alert('이메일 인증이 되지 않은 사용자 입니다. 이메일이 오지 않았다면 스팸메일함을 확인해주세요'); location.href ='../index.jsp'</script>");
				script.close();
				return;
			}
			    
			session.setAttribute("userid", rs.getString("userid"));
			session.setAttribute("EMAIL", rs.getString("EMAIL"));	
			response.sendRedirect("../index.jsp");
			break;
		}
	}
	
	PrintWriter script = response.getWriter();
    script.println("<script>alert('아이디 또는 비밀번호를 확인해주세요'); location.href ='../login.jsp'</script>");
	script.close();
	return;

}catch(Exception e){
	out.println(e);
}

%>