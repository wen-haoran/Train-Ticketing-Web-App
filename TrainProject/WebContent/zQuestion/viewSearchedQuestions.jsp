<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searched Questions Page</title>
</head>
<body>
	<h2>Searched Questions Page</h2>
	
	<%
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();
		
		//get search key
 		String searchKey = request.getParameter("searchKey"); 

		PreparedStatement pst = conn.prepareStatement("SELECT question, question_date, answer, username from Question WHERE question LIKE ? OR question LIKE ? OR question LIKE ? ");
 		pst.setString(1, "%" + searchKey + "%");
 		pst.setString(2, searchKey + "%"); 
 		pst.setString(3, "%" + searchKey); 

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
		
		
		//make return to all questions option
		String viewAllQuestions = "<form method=\"get\" action=\"./viewQuestion.jsp\"><button type=\"submit\">View All Questions</button></form>";
		out.print(viewAllQuestions);
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>