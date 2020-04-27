<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer's Reservations</title>
</head>
<body>
	<h2>Customer's Reservations</h2>
	<%
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		
		//current 
		java.util.Date utilDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		PreparedStatement pst = conn.prepareStatement("SELECT reservation_date, line_name, train_id from Reservation where username=? AND reservation_date>=?");
		pst.setString(1, request.getParameter("customerName"));
		pst.setDate(2, sqlDate);
		ResultSet rs = pst.executeQuery();
		
		out.print("<h3>CURRENT AND UPCOMING RESERVATION</h3>");
		out.print("<table>");
		
		out.print("<tr>");
		
		out.print("<td>");
		out.print("Reservation Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Transit Line");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Train Number");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		while (rs.next()) {
			out.print("<tr>");
			
			out.print("<td>");
			out.print(rs.getString("reservation_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("line_name"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("train_id"));
			out.print("</td>");
			

			out.print("</tr>");
			
		}
		out.print("</table>");
		
		
		//PAST RESERVATIONS
		pst = conn.prepareStatement("SELECT reservation_date, line_name, train_id from Reservation where username=? AND reservation_date<?");
		pst.setString(1, request.getParameter("customerName"));
		pst.setDate(2, sqlDate);
		rs = pst.executeQuery();
		
		out.print("<h3>PAST RESERVATION</h3>");
		out.print("<table>");
		
		out.print("<tr>");
		
		out.print("<td>");
		out.print("Reservation Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Transit Line");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Train Number");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		while (rs.next()) {
			out.print("<tr>");
		
			out.print("<td>");
			out.print(rs.getString("reservation_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("line_name"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("train_id"));
			out.print("</td>");
			

			out.print("</tr>");
			
		}
		out.print("</table>");
		
		String returnBtn = "<form method=\"get\" action=\"./admin.jsp\"><button type=\"submit\">Go back</button></form>";
		out.print(returnBtn);
		
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>