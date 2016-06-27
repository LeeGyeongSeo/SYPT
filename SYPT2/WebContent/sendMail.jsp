<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, javax.activation.*, javax.mail.*, javax.mail.internet.*"%>
<jsp:useBean id="mem" scope="session" class="sypt.Member" />
<jsp:useBean id="DAO" scope="session" class="sypt.MemberDAO" />
<jsp:setProperty name="mem" property="*" />
<jsp:setProperty name="DAO" property="*" />
<%!public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기
		PasswordAuthentication pa;

		public MyAuthentication() {
			///////////gmail 주소랑 비번!!!!!이거 테스트하려면 보안 수준이 낮은 앱에서 접근 허용해줘야함!!!!!!!!!!!!!!!
			//https://security.google.com/settings/security/secureaccount?ft=2&continue=https://security.google.com/settings/security/activity?rfn%3D28%26rfnc%3D1%26asae%3D2
			pa = new PasswordAuthentication("avoir93@gmail.com", "dkaemfhdlem!");
		}

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}
	
%>
<%!
public String randNum(){
	StringBuffer buffer = new StringBuffer();
	for(int i=0; i<6; i++){
		int n = (int)(Math.random() * 10);
		buffer.append(n);
	}
	return buffer.toString();
}
%>

<%
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
		Authenticator myauth = new MyAuthentication();
		Session sess = Session.getInstance(props, myauth);
		sess.setDebug(true);
		//Transport transport = sess.getTransport();
		
		Message msg = new MimeMessage(sess);
		msg.setFrom(new InternetAddress(fromEmail));
		msg.setSubject("SYPT email authentication test");
		msg.setContent("링크로 접속하면 SYPT 가입이 완료됩니다.\n" + url, "text/html;charset=utf-8");
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
		/* transport.connect();
		transport.sendMessage(msg, msg.getRecipients(Message.RecipientType.TO));
		transport.close();
		 */
		Transport.send(msg);

	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>");
		return;
	} finally{
		out.println("<script>alert('메일이 전송되었습니다.\\n이메일 확인 후 가입이 완료됩니다.');<script>");		
	}

	pageContext.forward("login.jsp");
%>