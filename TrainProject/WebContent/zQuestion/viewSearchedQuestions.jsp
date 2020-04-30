<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search for Questions </title>
<link href="../zCss/viewSearchedQuestions.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id = "button2Wrapper">
		<%
		//make return to all questions option
		String viewAllQuestions = "<form method=\"get\" action=\"./viewQuestion.jsp\"><button type=\"submit\" id=\"button2\">BACK</button></form>";
		out.print(viewAllQuestions);
		%>
	</div>
	<div id = "wrapper">
		<div id = "top">
			<div id = "heading">Searched Questions</div>
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
		
				//get search key
		 		String searchKey = request.getParameter("searchKey"); 

				PreparedStatement pst = conn.prepareStatement("SELECT question, question_date, answer, username from Question WHERE question LIKE ? OR question LIKE ? OR question LIKE ? OR answer LIKE ? OR answer LIKE ? OR answer LIKE ?");
		 		pst.setString(1, "%" + searchKey + "%");
		 		pst.setString(2, searchKey + "%"); 
		 		pst.setString(3, "%" + searchKey);
		 		pst.setString(4, "%" + searchKey + "%");
		 		pst.setString(5, searchKey + "%"); 
		 		pst.setString(6, "%" + searchKey); 
		 		
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