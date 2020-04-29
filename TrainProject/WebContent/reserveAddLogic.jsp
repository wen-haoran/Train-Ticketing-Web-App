<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link href="./zCss/registerLogic.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		//get date
		java.util.Date utilDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	%>
	<div id = "alertSquare">
		<div id = "alertText">
			<%
		    try{
		    	ApplicationDB db = new ApplicationDB();
				Connection conn = db.getConnection();
		      	PreparedStatement ps = conn.prepareStatement("INSERT INTO Reservation(line_name, train_id, departure_time, schedule_date, origin_station_id, destination_station_id, reservation_date, trip, class, discount, fee, seat_number, ssn, username) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
				int result = ps.executeUpdate();
				out.print("<div id=\"alert\">Reservation successful!</div>");
				String s = "<form method=\"get\" action=\"./repIndex.jsp\"><button type=\"submit\" id=\"button\">Log In</button></form>";
				out.println(s);
		    
			%>
			<div>
				<img src="./ACtrain.gif" id = "gif">
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
