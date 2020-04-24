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
			<%
			try{
				//connect to db
				ApplicationDB db = new ApplicationDB();	
				Connection conn = db.getConnection();		
				//get primary key
				String reservationNumStr = request.getParameter("del");
				int reservationNum = Integer.parseInt(reservationNumStr);
				
				PreparedStatement pst = conn.prepareStatement("DELETE FROM Reservation WHERE reservation_num=?");
				pst.setInt(1, reservationNum);
				int result = pst.executeUpdate();
				out.print("<div id=\"alert\">Reservation successfully deleted!</div>");
				
				%>
				<div>
					<img src="./ACtrain.gif" id = "gif">
				</div>
				<div id = "buttonWrapper">
					<div id = "firstButton">
						<% 
						String viewQuestions = "<form method=\"get\" action=\"./viewReservation.jsp\"><button type=\"submit\" id=\"button\">View My Reservations</button></form>";
						out.print(viewQuestions);
						%>
					</div>
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