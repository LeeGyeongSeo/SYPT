<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, javax.activation.*, javax.mail.*, javax.mail.internet.*, java.util.Properties"%>
<jsp:useBean id="mem" scope="session" class="sypt.Member" />
<jsp:useBean id="DAO" scope="session" class="sypt.MemberDAO" />
<jsp:setProperty name="mem" property="*" />
<jsp:setProperty name="DAO" property="*" />


<!--
	String smtpHost = "smtp.gmail.com";
	String toEmail = request.getParameter("toEmail");
	String fromEmail = "admin@sypt.com";

	
	//String url = "http://localhost:8080/SYPT2/errorless/controller.jsp?action=joinComplete&uuid="+DAO.findUuid(toEmail);
	String url = "http://sypt-web.ap-northeast-2.elasticbeanstalk.com/controller.jsp?action=joinComplete&uuid="+DAO.findUuid(toEmail);
	
	
	try {
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.host", smtpHost);
		props.put("mail.smtp.starttls.enable","true");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class",
	                     "javax.net.ssl.SSLSocketFactory");

		// 메일 인증

		Session sess = Session.getInstance(props);
		sess.setDebug(true);
		//Transport transport = sess.getTransport();
		
		Message msg = new MimeMessage(sess);
		msg.setFrom(new InternetAddress(fromEmail)); 
		msg.setSubject("SYPT email authentication test");
		msg.setContent("링크로 접속하면 SYPT 가입이 완료됩니다.\n" + url, "text/html;charset=utf-8");
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
		//transport.connect();
		//transport.sendMessage(msg, msg.getRecipients(Message.RecipientType.TO));
		//transport.close();
		Transport.send(msg);

	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>");
		return;
	} 

	pageContext.forward("login.jsp");
 -->
 
<%

    // Supply your SMTP credentials below. Note that your SMTP credentials are different from your AWS credentials.
    String SMTP_USERNAME = "AKIAIVPWIWRUW7CHAHMQ";  // Replace with your SMTP username.
    String SMTP_PASSWORD = "AnKPCe11SKID8iHDpTTSRUQCZwo4v06zPFmYfSOOhrIY";  // Replace with your SMTP password.
    
    String HOST = "email-smtp.us-east-1.amazonaws.com";    
    String FROM = "avoir93@gmail.com";
    //String TO = request.getParameter("toEmail");
	String TO = (String)request.getAttribute("toEmail");
    String url = "http://syptweb.ap-northeast-2.elasticbeanstalk.com/controller.jsp?action=joinComplete&uuid="+DAO.findUuid(TO);
    
    try
    {
        // Create a Properties object to contain connection configuration information.
    	Properties props = System.getProperties();
    	props.put("mail.transport.protocol", "smtp");
    	props.put("mail.smtp.port", 465); 
    	props.put("mail.smtp.auth", "true");
    	props.put("mail.smtp.starttls.enable", "true");
    	props.put("mail.smtp.starttls.required", "true");

        // Create a Session object to represent a mail session with the specified properties. 
    	Session sess = Session.getDefaultInstance(props);

        // Create a message with the specified information. 
        MimeMessage msg = new MimeMessage(sess);
        msg.setFrom(new InternetAddress(FROM));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
        msg.setSubject("SYPT test mail");
        msg.setContent("If you clicke the url, authentication success!", "text/plain");
            
        // Create a transport.        
        Transport transport = sess.getTransport();
        transport.sendMessage(msg, msg.getAllRecipients());
    } catch (Exception ex) {
    	System.out.println("Error message: " + ex.getMessage());
    } finally {
    	out.println("<script>alert('메일이 전송되었습니다.\\n이메일 확인 후 가입이 완료됩니다.');<script>");
    }
    
   pageContext.forward("login.jsp");
%>