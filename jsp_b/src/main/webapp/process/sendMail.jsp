<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="util.SHA256"%>
<%@ page import="util.Gmail"%>
<%@ page import="java.io.PrintWriter"%>

<%
	String tempID = null;
	if(session.getAttribute("tempID") != null){
		tempID = (String) session.getAttribute("tempID");
	}
	
	int emailCheck = (int)session.getAttribute("emailCheck");
	
	if(emailCheck >= 1){
		PrintWriter script = response.getWriter();
		script.println("<script>alert('이미 인증이 완료된 회원입니다.'); location.href ='../index.jsp'</script>");
		script.close();
		return;
	} 
	
	// 사용자 인증 이메일 발송 내용
	String host = "http://localhost:9000/jsp_b/process/";
	String from = "bucsRoot@gmail.com";
	String to =  (String)session.getAttribute("EMAIL");
	String subject = "BUCS 이메일 인증 메일"; 
	String content = "링크에 접속해 이메일 인증을 진행해주세요." +
		"<a href='" + host + "emailCheck.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
	
	// 이메일 전송 : SMTP 이용을 위함
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com"); // google SMTP 주소
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	p.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
	p.put("mail.smtp.ssl.enable", "true");  // 추가된 코드

	try{
		Authenticator auth = new Gmail();
	    Session ses = Session.getInstance(p, auth);
	    ses.setDebug(true);
	    MimeMessage msg = new MimeMessage(ses); 
	    msg.setSubject(subject);		// 메일 제목
	    Address fromAddr = new InternetAddress(from); 	// 보내는 사람 정보
	    msg.setFrom(fromAddr);
	    Address toAddr = new InternetAddress(to);		// 받는 사람 정보
	    msg.addRecipient(Message.RecipientType.TO, toAddr);
	    msg.setContent(content, "text/html;charset=UTF-8");
	    Transport.send(msg); // 메세지 전송
	    PrintWriter script = response.getWriter();
	    script.println("<script>alert('메일을 확인해 주세요.'); location.href ='../index.jsp'</script>");
		script.close();
	}catch(Exception e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>alert('메일 전송 중 오류가 발생했습니다.'); history.back(); </script>");
		script.close();
	}
	
	p.put("mail.smtp.ssl.protocols", "TLSv1.2");
	p.put("mail.smtp.ssl.enable", "true");
%>
