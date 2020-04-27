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
				
		PreparedStatement pst = conn.prepareStatement("SELECT reservation_num, reservation_date, username from Reservation WHERE line_name = ? AND train_id = ? and reservation_date>=?");
		pst.setString(1, request.getParameter("trainLine"));
		pst.setString(2, request.getParameter("trainNum"));
		pst.setDate(3, sqlDate);
		ResultSet rs = pst.executeQuery();

		out.print("<h3>CURRENT AND UPCOMING RESERVATIONS</h3>");
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
		
		out.print("</tr>");
		
		
		while (rs.next()) {
			out.print("<tr>");
			
			out.print("<td>");
			out.print(rs.getString("reservation_num"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("reservation_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("username"));
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
		
		
		pst = conn.prepareStatement("SELECT reservation_num, reservation_date, username from Reservation WHERE line_name = ? AND train_id = ? and reservation_date<?");
		pst.setString(1, request.getParameter("trainLine"));
		pst.setString(2, request.getParameter("trainNum"));
		pst.setDate(3, sqlDate);
		rs = pst.executeQuery();
		
		out.print("<h3>Past RESERVATIONS</h3>");
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
		
		out.print("</tr>");
		
		
		while (rs.next()) {
			out.print("<tr>");
			
			out.print("<td>");
			out.print(rs.getString("reservation_num"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("reservation_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("username"));
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