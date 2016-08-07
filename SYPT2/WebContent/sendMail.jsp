<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, javax.activation.*, javax.mail.*, javax.mail.internet.*, java.util.Properties"%>
<jsp:useBean id="mem" scope="session" class="sypt.Member" />
<jsp:useBean id="DAO" scope="session" class="sypt.MemberDAO" />
<jsp:setProperty name="mem" property="*" />
<jsp:setProperty name="DAO" property="*" />


<%

    // Supply your SMTP credentials below. Note that your SMTP credentials are different from your AWS credentials.
    String SMTP_USERNAME = "AKIAIVPWIWRUW7CHAHMQ";
    String SMTP_PASSWORD = "AnKPCe11SKID8iHDpTTSRUQCZwo4v06zPFmYfSOOhrIY";
    
    String HOST = "email-smtp.us-east-1.amazonaws.com";    
    String FROM = "avoir93@gmail.com";

	String TO = (String)request.getAttribute("toEmail");
    String url = "http://syptweb.ap-northeast-2.elasticbeanstalk.com/controller.jsp?action=joinComplete&uuid="+DAO.findUuid(TO);
    
    try
    {
        // Create a Properties object to contain connection configuration information.
    	Properties props = System.getProperties();
    	props.put("mail.transport.protocol", "smtps");
    	props.put("mail.smtp.port", 465); 
    	props.put("mail.smtp.auth", "true");
    	props.put("mail.smtp.starttls.enable", "true");
    	props.put("mail.smtp.starttls.required", "true");
    	props.put("mail.smtp.ssl.enable", "true");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class",
	                     "javax.net.ssl.SSLSocketFactory");

        // Create a Session object to represent a mail session with the specified properties. 
    	Session sess = Session.getDefaultInstance(props);

        // Create a message with the specified information. 
        MimeMessage msg = new MimeMessage(sess);
        msg.setFrom(new InternetAddress(FROM));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
        msg.setSubject("SYPT email authentication");
        msg.setContent("If you enter the link, authentication success! "+url, "text/plain");
            
        // Create a transport.        
        Transport transport = sess.getTransport();
        transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
        transport.sendMessage(msg, msg.getAllRecipients());
        
        transport.close();
    } catch (Exception ex) {
    	System.out.println("Error message: " + ex.getMessage());
		out.println("<script>alert('이메일 전송을 실패했습니다.');");
		out.println("history.go(-1);");
		out.println("</script>");
		//return;
    }
	
    out.println("<script>alert('메일이 전송되었습니다.\\n이메일 확인 후 가입이 완료됩니다.');");
	out.println("</script>");
	
	pageContext.forward("login.jsp");
%>