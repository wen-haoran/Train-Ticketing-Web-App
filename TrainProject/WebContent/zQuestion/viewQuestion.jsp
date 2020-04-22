<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question and Answers Page</title>
</head>
<body>
	<h2>Question and Answers Page</h2>
	
	<%
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		

		PreparedStatement pst = conn.prepareStatement("SELECT question_num, question, question_date, answer, username from Question");
		ResultSet rs = pst.executeQuery();
		
 		out.print("<table>");
		out.print("<tr>");
		
		out.print("<td>");
		out.print("Question");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Answer");
		out.print("</td>");
		
		out.print("<td>");
		out.print("User");
		out.print("</td>"); 
		
		out.print("</tr>");
		
		
		while (rs.next()) {
			out.print("<tr>");
 			String question_num = rs.getString("question_num");
 			
 			out.print("<td>");
			out.print(rs.getString("question"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("question_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("answer"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("username"));
			out.print("</td>");
			
			out.print("</tr>");
		}
		
		out.print("</table>");
		
		
		//make new question option
		String sendQuestion = "<form method=\"get\" action=\"./sendQuestion.jsp\"><button type=\"submit\">Want to ask a question?</button></form>";
		out.print(sendQuestion);
		
		//make search question option
		String searchQuestion = "<form method=\"get\" action=\"./searchQuestion.jsp\"><button type=\"submit\">Search for Question</button></form>";
		out.print(searchQuestion);
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>