<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="util.SHA256"%>
<%@ include file = "connect.jsp" %>

<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	RequestDispatcher rd = request.getRequestDispatcher("./sign_up.jsp");
	PreparedStatement ptmt = null;
	String userID = null;
	String userPWD = null;
	String EMAIL = null;
	String emailHash = null;
	int emailCheck = 0;
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
		String  sql = "INSERT INTO user(userid,userpwd,EMAIL,userEmailHash,emailCheck) VALUES(?,?,?,?,?)";
		ptmt = conn.prepareStatement(sql);
		
		ptmt.setString(1, userID);
		ptmt.setString(2, userPWD);
		ptmt.setString(3, EMAIL);
		emailHash = SHA256.getSHA256(EMAIL);
		ptmt.setString(4, emailHash);
		ptmt.setInt(5, emailCheck);
		ptmt.executeUpdate();
		
		session.setAttribute("tempID", userID);    // ID 등록
		session.setAttribute("EMAIL", EMAIL);
		session.setAttribute("emailHash", emailHash);
		session.setAttribute("emailCheck", emailCheck);
		PrintWriter script = response.getWriter();
		
		script.println("<script>location.href = './sendMail.jsp'</script>"); // 이메일 인증
		script.close();

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