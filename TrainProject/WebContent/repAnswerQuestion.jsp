<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A </title>
</head>
<body>
	<div id = "button2Wrapper">
		<%
		String viewAllQuestions = "<form method=\"get\" action=\"../repIndex.jsp\"><button type=\"submit\" id=\"button2\">BACK</button></form>";
		out.print(viewAllQuestions);
		%>
	</div>
	<div id = "wrapper">
		<div id = "top">
			<div id = "heading">Questions & Answers</div>
			<div id = "buttonWrapper">
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
				
				out.print("<td id=\"U1\">");
				out.print("<b>Answer Question</b>");
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
					out.print(rs.getString("username").toLowerCase());
					out.print("</td>");
					%>
					<td id = "D">
					<form method="get" action="./repAnswerQuestionLogic.jsp">
						<button type="submit" value="<%=question_num%>" name="quest" id = "button3">Answer</button>
					</form>
					</td>
					<%
					
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
	
			<%
			try {
				//connect to database
				ApplicationDB db = new ApplicationDB();
				Connection conn = db.getConnection();
				String userPK = (String)session.getAttribute("user");
				
				//fetch all reservations from this user that is delayed
		      	PreparedStatement ps = conn.prepareStatement("SELECT reservation_num FROM Reservation WHERE username = ? AND isDelay = true");
				ps.setString(1, userPK);
		      	ResultSet rs = ps.executeQuery();
		      	
		      	//send alert
		      	while(rs.next()){
		      	%>
					<script>
						alert("Reservation #" + <%=rs.getString("reservation_num")%> + " has been delayed.");
					</script>
				<%
		      	}
		      	
		      	//change it back to not delayed
		      	PreparedStatement ps1 = conn.prepareStatement("UPDATE Reservation SET isDelay = 0 WHERE username = ?");
				ps1.setString(1, userPK);
		      	int rs1 = ps1.executeUpdate(); 
		      	
				//close connection
				conn.close();
			} catch(Exception e){
				out.print(e);
			}
		%>
</body>
</html>