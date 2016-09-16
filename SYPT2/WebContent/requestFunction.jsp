<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, javax.swing.*, javax.servlet.jsp.*, sypt.*"%>
<jsp:useBean id="FDAO" scope="session" class="sypt.FunctionDAO" />
<jsp:setProperty name="FDAO" property="*" />
<jsp:useBean id="Input" scope="session" class="sypt.SearchInput" />
<jsp:setProperty name="Input" property="*" />
<%	
	String param = request.getParameter("param");
	Input.setInput(param);
	ArrayList<Function> funs = new ArrayList<Function>();
	funs = FDAO.searchFunction(Input.getInput());
	//String[] result = new String[funs.size()];
	for (int i = 0; i < funs.size(); i++) {%>
<%=funs.get(i).getName_func()%><% }%>