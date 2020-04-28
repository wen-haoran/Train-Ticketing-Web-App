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
		
				PreparedStatement pst = conn.prepareStatement("SELECT reservation_num, trip, class, fee, origin_station_id,destination_station_id,line_name,train_id,schedule_date,departure_time,seat_number,reservation_date from Reservation where username=? AND schedule_date>=?");
				pst.setString(1, userPK);
				pst.setDate(2, sqlDate);
				ResultSet rs = pst.executeQuery();
				
				out.print("<h3 id=\"heading3\">UPCOMING RESERVATIONS</h3>");
				out.print("<table id=\"table\">");
				
		
				out.print("<tr>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Type</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Class</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Price</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>From Station</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>To Station</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Line</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Train</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Seat</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Departure Time</b>");
				out.print("</td>");
				
				out.print("<td id=\"D1\">");
				out.print("<b>Travel Date</b>");
				out.print("</td>");
				
				out.print("<td id=\"A1\">");
				out.print("");
				out.print("</td>");
				
				out.print("</tr>");
				
				
				while (rs.next()) {
					out.print("<tr>");
					String reservationNum = rs.getString("reservation_num");
					
					out.print("<td id=\"Q\">");
					out.print(rs.getString("trip"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("class"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("fee"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("origin_station_id"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("destination_station_id"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("line_name"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("train_id"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("seat_number"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("departure_time"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("schedule_date"));
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
				pst = conn.prepareStatement("SELECT reservation_num, trip, class, fee, origin_station_id,destination_station_id,line_name,train_id,schedule_date,departure_time,seat_number,reservation_date from Reservation where username=? AND schedule_date<?"); 
				pst.setString(1, userPK);
				pst.setDate(2, sqlDate);
				rs = pst.executeQuery();
				
				out.print("<h3 id=\"heading3\">PAST RESERVATIONS</h3>");
				out.print("<table id=\"table\">");
				
		
				out.print("<tr>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Type</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Class</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Price</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>From Station</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>To Station</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Line</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Train</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Seat</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Departure Time</b>");
				out.print("</td>");
				
				out.print("<td id=\"D1\">");
				out.print("<b>Travel Date</b>");
				out.print("</td>");
				
				out.print("<td id=\"A1\">");
				out.print("");
				out.print("</td>");
				
				out.print("</tr>");
				
				
				while (rs.next()) {
					out.print("<tr>");
					String reservationNum = rs.getString("reservation_num");
					
					out.print("<td id=\"Q\">");
					out.print(rs.getString("trip"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("class"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("fee"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("origin_station_id"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("destination_station_id"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("line_name"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("train_id"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("seat_number"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("departure_time"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("schedule_date"));
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