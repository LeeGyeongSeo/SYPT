<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.*, org.json.simple.*, org.json.simple.parser.*"%>

<%JSONParser parser = new JSONParser();
try {
	JSONObject str = (JSONObject) parser.parse(new FileReader("./file.json"));
    String receive = (String) str.get("sendString");%>
<%=receive%>
<%
} catch (FileNotFoundException e) {
	e.printStackTrace();
} catch (IOException e) {
	e.printStackTrace();
} catch (ParseException e) {
	e.printStackTrace();
}%>