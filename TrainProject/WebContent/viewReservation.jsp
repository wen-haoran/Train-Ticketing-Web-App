<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Reservations</title>
<link href="./zCss/viewReservation.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id = "button2Wrapper">
		<%
		String viewAllQuestions = "<form method=\"get\" action=\"./index.jsp\"><button type=\"submit\" id=\"button2\">BACK</button></form>";
		out.print(viewAllQuestions);
		%>
	</div>	
	<div id = "wrapper">
		<div id = "top">
			<div id = "heading">My Reservations</div>
			<div id = "buttonWrapper">
				<% 
				//make search question option
				String searchQuestion = "<form method=\"get\" action=\"./makeReservation.jsp\"><button type=\"submit\" id=\"button\">Create Reservation</button></form>";
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
				//get primary key
				String userPK = (String)session.getAttribute("user");
				
				//current 
				java.util.Date utilDate = new java.util.Date();
				// Convert it to java.sql.Date
				java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
				PreparedStatement pst = conn.prepareStatement("SELECT reservation_num, one_way_or_round_trip, reservation_date from Reservation where username=? AND reservation_date>=?");
				pst.setString(1, userPK);
				pst.setDate(2, sqlDate);
				ResultSet rs = pst.executeQuery();
				
				out.print("<h3 id=\"heading3\">UPCOMING RESERVATIONS</h3>");
				out.print("<table id=\"table\">");
				
		
				out.print("<tr>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Type</b>");
				out.print("</td>");
				
				out.print("<td id=\"D1\">");
				out.print("<b>Reservation Date</b>");
				out.print("</td>");
				
				out.print("<td id=\"A1\">");
				out.print("");
				out.print("</td>");
				
				out.print("</tr>");
				
				
				while (rs.next()) {
					out.print("<tr>");
					String reservationNum = rs.getString("reservation_num");
					
					out.print("<td id=\"Q\">");
					out.print(rs.getString("one_way_or_round_trip"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("reservation_date"));
					out.print("</td>");
					
					String deleteBtn = "<form method=\"get\" action=\"./deleteReservation.jsp\"><button type=\"submit\" value=\""+reservationNum+"\" name=\"del\" id=\"button3\">Delete</button></form>";
					
					out.print("<td id=\"A\">");
					out.print(deleteBtn);
					out.print("</td>");
					
					out.print("</tr>");
					
				}
				
				out.print("</table>");
				out.print("<br>");
				
				
				//PAST RESERVATIONS
				pst = conn.prepareStatement("SELECT reservation_num, one_way_or_round_trip, reservation_date from Reservation where username=? AND reservation_date<?");
				pst.setString(1, userPK);
				pst.setDate(2, sqlDate);
				rs = pst.executeQuery();
				
				out.print("<h3 id=\"heading3\">PAST RESERVATIONS</h3>");
				out.print("<table id=\"table\">");
				
		
				out.print("<tr>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Type</b>");
				out.print("</td>");
				
				out.print("<td id=\"D1\">");
				out.print("<b>Reservation Date</b>");
				out.print("</td>");
				
				out.print("<td id=\"A1\">");
				out.print("");
				out.print("</td>");
				
				out.print("</tr>");
				
				
				while (rs.next()) {
					out.print("<tr>");
					String reservationNum = rs.getString("reservation_num");
					
					out.print("<td id=\"Q\">");
					out.print(rs.getString("one_way_or_round_trip"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("reservation_date"));
					out.print("</td>");
					
					String deleteBtn = "<form method=\"get\" action=\"./deleteReservation.jsp\"><button type=\"submit\" value=\""+reservationNum+"\" name=\"del\" id=\"button3\">Delete</button></form>";
	
					out.print("<td id=\"A\">");
					out.print(deleteBtn);
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