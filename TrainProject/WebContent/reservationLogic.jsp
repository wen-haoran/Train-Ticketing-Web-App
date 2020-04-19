<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationLogic</title>
</head>
<body>

	<% 
	

	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		//get username and password
		String userPK = (String)session.getAttribute("user");
		String type = request.getParameter("type");
		
		//get date
		java.util.Date utilDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

		//query the db with input data
		PreparedStatement pst = conn.prepareStatement("INSERT INTO TrainWebApp1.Reservation(one_way_or_round_trip,reservation_date,username) VALUES (?,?,?)");
		pst.setString(1, type);
		pst.setDate(2, sqlDate);
		pst.setString(3, userPK);
		//execute the sql query
		int result = pst.executeUpdate();
		out.print("Reservation table updated.");
			
		String makeReserveBtn = "<form method=\"get\" action=\"./index.jsp\"><button type=\"submit\">Search and >Back to Home</button></form>";
		out.print(makeReserveBtn);
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>