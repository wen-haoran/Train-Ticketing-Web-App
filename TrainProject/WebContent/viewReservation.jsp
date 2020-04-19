<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Page</title>
</head>
<body>
	<h2>My Reservation Page</h2>
	
	<%
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		//get primary key
		String userPK = (String)session.getAttribute("user");
		
		PreparedStatement pst = conn.prepareStatement("SELECT reservation_num, one_way_or_round_trip, reservation_date from Reservation where username=?");
		pst.setString(1, userPK);
		ResultSet rs = pst.executeQuery();
		
		
		out.print("<table>");
		

		out.print("<tr>");
		out.print("<td>");
		out.print("Reservation Number");
		out.print("</td>");
		out.print("<td>");
		out.print("One Way or Round Trip");
		out.print("</td>");
		out.print("<td>");
		out.print("Reservation Date");
		out.print("</td>");
		out.print("</tr>");
		
		
		while (rs.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getString("reservation_num"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("one_way_or_round_trip"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("reservation_date"));
			out.print("</td>");
			out.print("</tr>");
			

		}
		
		out.print("</table>");
		
		
		String makeReserveBtn = "<form method=\"get\" action=\"./search.jsp\"><button type=\"submit\">Search and >Make Reservations</button></form>";
		out.print(makeReserveBtn);
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>