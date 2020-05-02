<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Browse Train Schedules</title>
</head>
<body>
	<%
		//get date
		java.util.Date utilDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	%>
	<form method="get" action="./repIndex.jsp">
		<button type="submit">Home</button>
	</form>
	<div id = "wrapper">
		<div id = "trainASquare">
			<div id = "trainAText">
				<h1>Pick Line and Date</h1>
				<!--drop down select current origins/destinations in db-->
				<%
				    try{
						ApplicationDB db = new ApplicationDB();
						Connection conn = db.getConnection();
						PreparedStatement line = conn.prepareStatement("SELECT line_name FROM Line");
						ResultSet lines = line.executeQuery();
				%>
				<form action="./trainAdminShow.jsp" class="trainA">
					<div class = "trainA">
					    Line: <select name="lineName">
						    <%  while(lines.next()){ %>
						        <option><%= lines.getString(1)%></option>
						    <% } %>
					    </select>
						<br>
						Date of Travel:
						<%
							String todayDate = "<input type=\"date\" value=\""+sqlDate+"\" name=\"traveldate\" required>";
							out.print(todayDate);
						%>
						<br>
					</div>
					<br>
					<button type="submit" id = "button" >View Schedule</button>
				</form>
				<%}
			        catch(Exception e)
					{
			               out.println(e);
			          }
			  	%>
			</div>
		</div>
	</div>

</body>
</html>
