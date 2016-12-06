<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, javax.swing.* ,sypt.*,javax.servlet.jsp.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mem" scope="session" class="sypt.Member" />
<jsp:setProperty name="mem" property="*" />
<jsp:useBean id="DAO" scope="session" class="sypt.MemberDAO" />
<jsp:setProperty name="DAO" property="*" />
<%
	int flag = 0;
	String action = request.getParameter("action");

	if (action.equals("login")) { //로그인은 loginCheck에서 하고 바로 main으로
		if (session.getAttribute("UID") == null) {
			pageContext.forward("login.jsp");
			//response.sendRedirect("login.jsp");
		} else {
			pageContext.forward("main.jsp");
			//response.sendRedirect("main.jsp");
		}
	} else if (action.equals("loginCheck")) {
		String ID = request.getParameter("id_mem");
		String password = request.getParameter("password");

		int check = DAO.login(ID, password);
		if (check == 1) {
			session.setAttribute("UID", ID);
			response.sendRedirect("controller.jsp?action=main");
		} else {
			flag++;
			out.println("<script>alert('아이디와 비밀번호를 확인하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}


	} else if (action.equals("idcheck")) {
		pageContext.forward("idcheck.jsp");
	} else if (action.equals("join")) { //회원 가입
		pageContext.forward("join.jsp");
	} else if (action.equals("sendMail")) { //회원 가입-이메일 전송
		pageContext.forward("sendMail.jsp");
	} else if (action.equals("joinCheck")) {
		String id_mem = request.getParameter("id_mem");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String name_mem = request.getParameter("name_mem");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");

		Member newDB = new Member();
		newDB.setId_mem(id_mem);
		newDB.setPassword(password);
		newDB.setName_mem(name_mem);
		newDB.setGender(gender);
		newDB.setBirthday(birthday);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		newDB.setRdate(format1.format(cal.getTime()));
		newDB.setUuid(UUID.randomUUID().toString().substring(0, 19));

		if (DAO.insertMemInfo(newDB)) {
			//url에 메일주소 다 드러나니까ㅠㅜㅜ수정 필요 forward-setAttribute ㄴㄴ
			//response.sendRedirect("sendMail.jsp?toEmail=" + id_mem);
			request.setAttribute("toEmail", id_mem);
			pageContext.forward("sendMail.jsp");

		} else {
			System.out.println("sendMail.jsp 이동 실패...");
		}

	} else if (action.equals("joinComplete")) {
		String uuid = request.getParameter("uuid");
		Member member = new Member();
		member.setUuid(uuid);
		if (DAO.checkAuthentication(member)) {
			System.out.println("auth_state=1 변환 완료");
			pageContext.forward("joinComplete.jsp");
		} else {
			System.out.println("UUID 인증 실패");
		}


	} else if (action.equals("main")) {
		if (session.getAttribute("UID") == null) {
			pageContext.forward("login.jsp");
			//response.sendRedirect("login.jsp");
		} else {
			pageContext.forward("main.jsp");
			//response.sendRedirect("main.jsp");
		}
		//pageContext.forward("main.jsp");
	} else if (action.equals("kernel")) { //커널 분석
		pageContext.forward("kernel.jsp");
	} else if (action.equals("mypage")) { //마이페이지
		pageContext.forward("mypage.jsp");
	
	} else if(action.equals("pwcheck")){
		String ID = session.getAttribute("UID").toString();
		String oldPW = request.getParameter("oldPW");
		String newPW = request.getParameter("newPW");
		int result = DAO.changeMemPassword(newPW, ID, oldPW);
		System.out.println("Change PW result: " + result);
		if(result == 1){			
			out.println("<script>alert('비밀번호 변경이 완료되었습니다.');</script>");
			response.sendRedirect("controller.jsp?action=logout");
		} else {
			flag++;
			out.println("<script>alert('비밀번호 변경을 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
	
	} else if (action.equals("changePW")){
		pageContext.forward("changePW.jsp");
	} else if (action.equals("logout")) {
	
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
%>