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
			      	ps = conn.prepareStatement("SELECT s.t_time FROM Schedule_Stop s WHERE s.line_name = ? AND s.train_id = ? AND s.starting_time = ? AND s.schedule_date = ? AND s.station_id = ?");
					ps.setString(1, request.getParameter("lineS"));
					ps.setString(2, request.getParameter("trainS"));
					ps.setString(3, request.getParameter("startS"));
					ps.setString(4, request.getParameter("travelS"));
					ps.setString(5, request.getParameter("station"+i));
					ResultSet rs = ps.executeQuery();
						originalTime[i] = rs.getString("s.t_time");
		      		
			      	ps = conn.prepareStatement("UPDATE Schedule_Stop SET t_time = ? WHERE line_name = ? AND train_id = ? AND starting_time = ? AND schedule_date = ? AND station_id = ?");

					ps.setString(1, request.getParameter("time"+i));
					ps.setString(2, request.getParameter("lineS"));
					ps.setString(3, request.getParameter("trainS"));
					ps.setString(4, request.getParameter("startS"));
					ps.setString(5, request.getParameter("travelS"));
					ps.setString(6, request.getParameter("station"+i));
					int result = ps.executeUpdate();
					
					if(originalTime[i].compareTo(request.getParameter("time"+i))<0)
					{
				      	ps = conn.prepareStatement("UPDATE Reservation SET isDelay = 1 WHERE line_name = ? AND train_id = ? AND starting_time = ? AND schedule_date = ? AND origin_station_id = ?");
						ps.setString(1, request.getParameter("lineS"));
						ps.setString(2, request.getParameter("trainS"));
						ps.setString(3, request.getParameter("startS"));
						ps.setString(4, request.getParameter("travelS"));
						ps.setString(5, request.getParameter("station"+i));
					}
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