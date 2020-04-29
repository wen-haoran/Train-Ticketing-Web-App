<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success!</title>
<link href="./zCss/deleteReservation.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id = "alertSquare">
		<div id = "alertText">
			<%try{
				//connect to db
				ApplicationDB db = new ApplicationDB();	
				Connection conn = db.getConnection();		
				//get primary key
				
				PreparedStatement ps = conn.prepareStatement("UPDATE Reservation SET line_name = ?, train_id = ?, departure_time = ?, schedule_date = ?, origin_station_id = ?, destination_station_id = ?, reservation_date = ?, trip = ?, class = ?, discount = ?, fee = ?, seat_number = ?, ssn = ?, username = ? WHERE reservation_num = ?");
				ps.setString(1, request.getParameter("line"));
				ps.setString(2, request.getParameter("train"));
				ps.setString(3, request.getParameter("departTime"));
				ps.setString(4, request.getParameter("travelDate"));
				ps.setString(5, request.getParameter("originId"));
				ps.setString(6, request.getParameter("destinationId"));
				ps.setString(7, request.getParameter("reserveDate"));
				ps.setString(8, request.getParameter("trip"));
				ps.setString(9, request.getParameter("class"));
				ps.setString(10, request.getParameter("discount"));
				ps.setString(11, request.getParameter("fee"));
				ps.setString(12, request.getParameter("seatNum"));
				ps.setString(13, request.getParameter("employee"));
				ps.setString(14, request.getParameter("username"));
				ps.setString(15, request.getParameter("reservationId"));
				int result = ps.executeUpdate();
				out.print("<div id=\"alert\">Reservation successfully edited!</div>");
				%>
				<div>
					<img src="./ACtrain.gif" id = "gif">
				</div>
				<div id = "buttonWrapper">
					<% 	
					String backHome = "<form method=\"get\" action=\"./index.jsp\"><button type=\"submit\" id=\"button\">Back to Homepage</button></form>";
					out.print(backHome);
					%>
				</div>
				
				<% 
				
				//close connection
				conn.close();
			} catch(Exception e){
				out.print(e);
			}
			
			%>
		</div>
	</div>
	
</body>
</html>