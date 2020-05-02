<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a Train Schedule</title>
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
		        PreparedStatement ps;
		        ps = conn.prepareStatement("DELETE FROM Schedule_Stop WHERE line_name = ? AND train_id = ? AND starting_time = ? AND schedule_date = ?");
				ps.setString(1, request.getParameter("line"));
				ps.setString(2, request.getParameter("train"));
				ps.setString(3, request.getParameter("startTime"));
				ps.setString(4, request.getParameter("travelDate"));
				int del = ps.executeUpdate();
				
		        ps = conn.prepareStatement("DELETE FROM Train_Schedule WHERE line_name = ? AND train_id = ? AND starting_time = ? AND schedule_date = ?");
				ps.setString(1, request.getParameter("line"));
				ps.setString(2, request.getParameter("train"));
				ps.setString(3, request.getParameter("startTime"));
				ps.setString(4, request.getParameter("travelDate"));
				int result = ps.executeUpdate();
				
				out.print("<div id=\"alert\">Train Schedule Deleted</div>");
				%>
				<form action = "./repIndex.jsp">
				<button type="submit" id = "button" >View Schedule</button>
				</form>
		    
				<%//close connection
				conn.close();
			} catch(Exception e){
				out.print(e);
			}
			%>
		</div>
	</div>
	
</body>
</html>
