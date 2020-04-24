<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A </title>
<link href="../zCss/viewQuestion.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id = "button2Wrapper">
		<%
		String viewAllQuestions = "<form method=\"get\" action=\"../index.jsp\"><button type=\"submit\" id=\"button2\">BACK</button></form>";
		out.print(viewAllQuestions);
		%>
	</div>
	<div id = "wrapper">
		<div id = "top">
			<div id = "heading">Questions & Answers</div>
			<div id = "buttonWrapper">
				<div id = "firstButton">
					<% 
					//make new question option
					String sendQuestion = "<form method=\"get\" action=\"./sendQuestion.jsp\"><button type=\"submit\" id=\"button\">Want to ask a question?</button></form>";
					out.print(sendQuestion);
					%>
				</div>
				
				<% 
				//make search question option
				String searchQuestion = "<form method=\"get\" action=\"./searchQuestion.jsp\"><button type=\"submit\" id=\"button\">Search for Questions</button></form>";
				out.print(searchQuestion);
				%>
			</div>
		</div>
	
		<div id = "tableSquare">
			<div id = "tableText">			
			<%
			try{
				//connect to db
				ApplicationDB db = new ApplicationDB();	
				Connection conn = db.getConnection();		
		
				PreparedStatement pst = conn.prepareStatement("SELECT question_num, question, question_date, answer, username from Question");
				ResultSet rs = pst.executeQuery();
				
		 		out.print("<table id=\"table\">");
				out.print("<tr>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Question</b>");
				out.print("</td>");
				
				out.print("<td id=\"D1\">");
				out.print("<b>Date</b>");
				out.print("</td>");
				
				out.print("<td id=\"A1\">");
				out.print("<b>Answer</b>");
				out.print("</td>");
				
				out.print("<td id=\"U1\">");
				out.print("<b>User</b>");
				out.print("</td>"); 
				
				out.print("</tr>");
					
				while (rs.next()) {
					out.print("<tr>");
		 			String question_num = rs.getString("question_num");
		 			
		 			out.print("<td id=\"Q\">");
					out.print(rs.getString("question"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("question_date"));
					out.print("</td>");
					
					out.print("<td id=\"A\">");
					if(rs.getString("answer") == null)
						out.print("<div id=\"notAnswered\">(no answer)</div>");
					else
						out.print(rs.getString("answer"));
					out.print("</td>");
					
					out.print("<td id=\"U\">");
					out.print(rs.getString("username"));
					out.print("</td>");
					
					out.print("</tr>");
				}
				
				out.print("</table>");
				%> 
			</div>
		</div>
	</div>
	
	<%	
	//close connection
	conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>