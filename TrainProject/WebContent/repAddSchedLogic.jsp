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
		        PreparedStatement ps = conn.prepareStatement("INSERT INTO Train_Schedule(line_name, train_id, starting_time, schedule_date, travel_time) VALUES (?,?,?,?,?)");
				ps.setString(1, request.getParameter("line"));
				ps.setString(2, request.getParameter("train"));
				ps.setString(3, request.getParameter("startTime"));
				ps.setString(4, request.getParameter("travelDate"));
				ps.setString(5, request.getParameter("travelTime"));
				int result = ps.executeUpdate();
				out.print("<div id=\"alert\">Train Schedule added</div>");
				ps = conn.prepareStatement("SELECT s.station_id FROM Stops_At s, Line l WHERE l.line_name = ? AND s.line_name = l.line_name");
				ps.setString(1, request.getParameter("line"));
				ResultSet rs = ps.executeQuery();
				int i = 0;
				%>
				<form action="./repAddSchedInsert.jsp" class="addSched">
				<input type="hidden" type="text" name="lineS" id="lineS" value = "<%=request.getParameter("line")%>">
				<input type="hidden" type="text" name="trainS" id="trainS" value = "<%=request.getParameter("train")%>">
				<input type="hidden" type="time" name="startS" id="startS" value = "<%=request.getParameter("startTime")%>">
				<input type="hidden" type="date" name="travelS" id="travelS" value = "<%=request.getParameter("travelDate")%>">
				<table border='1' id="table">
					<tr>
						<th>Stops</th>
						<th>Time</th>
					</tr>
					<%while (rs.next()) {%>
						<tr>
							<td>
								<%=rs.getString("s.station_id")%><input type="hidden" id = "input" type="text" name=<%="station"+i %> id=<%="station"+i%> value=<%=rs.getString("s.station_id") %>>
								
							</td>
							<td>
								<input id = "input" type="time" name=<%="time"+i %> id=<%="time"+i %> onblur="validate()" required>
							</td>
						</tr>
					<%i++;}%>
				</table>
				<input type="hidden" name="i" id="i" value = "<%=i%>">
				<button type="submit" id = "button" >Add Schedule</button>
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
