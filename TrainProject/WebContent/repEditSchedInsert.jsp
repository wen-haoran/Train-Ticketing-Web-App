<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Train Schedule</title>
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
			<%int j = Integer.parseInt(request.getParameter("i"));
			String[] originalTime = new String[j];%>
			<%
		    try{
		    	ApplicationDB db = new ApplicationDB();
				Connection conn = db.getConnection();
		      	PreparedStatement ps;
		      	int i = 0;
		      	for( ; i < j ; i++){
		      		
			      	ps = conn.prepareStatement("UPDATE Schedule_Stop SET t_time = ? WHERE line_name = ? AND train_id = ? AND starting_time = ? AND schedule_date = ? AND station_id = ?");

					ps.setString(1, request.getParameter("time"+i));
					ps.setString(2, request.getParameter("lineS"));
					ps.setString(3, request.getParameter("trainS"));
					ps.setString(4, request.getParameter("startS"));
					ps.setString(5, request.getParameter("travelS"));
					ps.setString(6, request.getParameter("station"+i));
					int result = ps.executeUpdate();
		      	}
				out.print("<div id=\"alert\">Schedule Edited!</div>");
				String s = "<form method=\"get\" action=\"./repIndex.jsp\"><button type=\"submit\" id=\"button\">Home</button></form>";
				out.println(s);
		    
			%>
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
