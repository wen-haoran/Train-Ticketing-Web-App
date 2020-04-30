<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation for Train Page</title>
</head>
<body>
	<h2>My Reservation Page</h2>
	
	<%
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		//current 
			java.util.Date utilDate = new java.util.Date();
			// Convert it to java.sql.Date
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
				
		PreparedStatement pst = conn.prepareStatement("SELECT reservation_num, reservation_date, username, fee, origin_station_id, destination_station_id, line_name, train_id, schedule_date, departure_time, seat_number from Reservation WHERE line_name = ? AND train_id = ? and schedule_date>=?");
		pst.setString(1, request.getParameter("trainLine"));
		pst.setString(2, request.getParameter("trainNum"));
		pst.setDate(3, sqlDate);
		ResultSet rs = pst.executeQuery();

		out.print("<h3>CURRENT AND UPCOMING RESERVATIONS/h3>");
		out.print("<table>");
		
		out.print("<tr>");
		
		out.print("<td>");
		out.print("Reservation Number");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Reservation Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Username");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Fee");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Orign Station ID");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Destination Station ID");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Line Name");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Train ID");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Schedule Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Departime Time");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Seat Number");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		while (rs.next()) {
			out.print("<tr>");
			
			out.print("<td>");
			out.print(rs.getString("reservation_num") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("reservation_date") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("username") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getFloat("fee") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("origin_station_id") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("destination_station_id") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("line_name") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("train_id") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getDate("schedule_date") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getTime("departure_time") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getInt("seat_number"));
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
		
		
		pst = conn.prepareStatement("SELECT reservation_num, reservation_date, username, fee, origin_station_id, destination_station_id, line_name, train_id, schedule_date, seat_number from Reservation WHERE line_name = ? AND train_id = ? and schedule_date<?");
		pst.setString(1, request.getParameter("trainLine"));
		pst.setString(2, request.getParameter("trainNum"));
		pst.setDate(3, sqlDate);
		rs = pst.executeQuery();
		
		out.print("<h3>PAST RESERVATIONS</h3>");
out.print("<table>");
		
		out.print("<tr>");
		
		out.print("<td>");
		out.print("Reservation Number");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Reservation Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Username");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Fee");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Orign Station ID");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Destination Station ID");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Line Name");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Train ID");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Schedule Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Departime Time");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Seat Number");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		while (rs.next()) {
			out.print("<tr>");
			
			out.print("<td>");
			out.print(rs.getString("reservation_num") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("reservation_date") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("username") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getFloat("fee") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("origin_station_id") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("destination_station_id") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("line_name") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("train_id") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getDate("schedule_date") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getTime("departure_time") + " ");
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getInt("seat_number"));
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
		
		
		
		//make reservation option
		String returnBtn = "<form method=\"get\" action=\"./admin.jsp\"><button type=\"submit\">Go back</button></form>";
		out.print(returnBtn);
		
		
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html> 